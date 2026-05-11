#!/bin/bash
set -eo pipefail

if [ -z "$1" ]; then
  echo "Usage: $0 <iterations>"
  exit 1
fi

# jq filter to extract streaming text from assistant messages
stream_text='select(.type == "assistant").message.content[]? | select(.type == "text").text // empty | gsub("\n"; "\r\n") | . + "\r\n\n"'

# jq filter to extract final result
final_result='select(.type == "result").result // empty'

# Compute container name using code-container's naming convention:
# container-<basename>-<first 8 chars of sha1(absolute_path)>
project_dir=$(git rev-parse --show-toplevel)
project_name=$(basename "$project_dir")
path_hash=$(echo -n "${project_dir%/}" | sha1sum | cut -c1-8)
container_name="container-${project_name}-${path_hash}"

# Ensure the container is running (start existing or create new)
if ! docker ps --format '{{.Names}}' | grep -qx "$container_name"; then
  if docker ps -a --format '{{.Names}}' | grep -qx "$container_name"; then
    echo "Starting existing container $container_name..."
    docker start "$container_name"
  else
    echo "Creating container $container_name..."
    docker run -d --name "$container_name" \
      -v "${project_dir}:/root/${project_name}" \
      -v "$HOME/.code-container/configs/.claude:/root/.claude" \
      -v "$HOME/.code-container/configs/.claude.json:/root/.claude.json" \
      -v "$HOME/.code-container/configs/.local/share:/root/.local/share" \
      -v "$HOME/.code-container/configs/.local/state:/root/.local/state" \
      -v "$HOME/.gitconfig:/root/.gitconfig:ro" \
      -w "/root/${project_name}" \
      code-container-user \
      sleep infinity
  fi
fi

for ((i=1; i<=$1; i++)); do
  tmpfile=$(mktemp)
  trap "rm -f $tmpfile" EXIT

  commits=$(git log -n 5 --format="%H%n%ad%n%B---" --date=short 2>/dev/null || echo "No commits found")
  issues=$(gh issue list --state open --json number,title,body,comments)
  prompt=$(cat ralph/prompt.md)

  docker exec "$container_name" \
    claude \
    --verbose \
    --print \
    --output-format stream-json \
    "Previous commits: $commits $issues $prompt" \
  | grep --line-buffered '^{' \
  | tee "$tmpfile" \
  | jq --unbuffered -rj "$stream_text"

  result=$(jq -r "$final_result" "$tmpfile")

  if [[ "$result" == *"<promise>NO MORE TASKS</promise>"* ]]; then
    echo "Ralph complete after $i iterations."
    exit 0
  fi
done
