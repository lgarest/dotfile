#!/usr/bin/env bash

# Fish Shell Startup Profiling Script
# This script helps analyze and optimize fish shell startup time

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Fish Shell Startup Profiler ===${NC}\n"

# Function to measure startup time
measure_startup() {
    /usr/bin/time -p fish -i -c exit 2>&1 | grep -E "real|user|sys"
}

# 1. Basic startup time
echo -e "${YELLOW}1. Current startup time:${NC}"
measure_startup
echo

# 2. Detailed profile
echo -e "${YELLOW}2. Generating detailed profile...${NC}"
fish --profile-startup=/tmp/fish-startup-profile.txt -i -c exit
echo "Profile saved to /tmp/fish-startup-profile.txt"
echo

# 3. Top 10 slowest operations
echo -e "${YELLOW}3. Top 10 slowest operations:${NC}"
sort -nr /tmp/fish-startup-profile.txt | head -11 | tail -10
echo

# 4. Check for common bottlenecks
echo -e "${YELLOW}4. Checking for common bottlenecks:${NC}"

# Check brew operations
BREW_TIME=$(grep -E "brew|homebrew" /tmp/fish-startup-profile.txt | awk '{sum += $1} END {print sum}')
echo -e "  Homebrew operations: ${RED}${BREW_TIME:-0}μs${NC}"

# Check git operations
GIT_TIME=$(grep -E "git|__git" /tmp/fish-startup-profile.txt | awk '{sum += $1} END {print sum}')
echo -e "  Git operations: ${RED}${GIT_TIME:-0}μs${NC}"

# Check theme operations
THEME_TIME=$(grep -E "theme|pure|prompt" /tmp/fish-startup-profile.txt | awk '{sum += $1} END {print sum}')
echo -e "  Theme operations: ${RED}${THEME_TIME:-0}μs${NC}"

# Check OMF operations
OMF_TIME=$(grep -E "omf|OMF" /tmp/fish-startup-profile.txt | awk '{sum += $1} END {print sum}')
echo -e "  OMF operations: ${RED}${OMF_TIME:-0}μs${NC}"

echo

# 5. Count total abbreviations
echo -e "${YELLOW}5. Abbreviations count:${NC}"
ABBR_COUNT=$(fish -c "abbr --list | wc -l" | tr -d ' ')
echo -e "  Total abbreviations: ${ABBR_COUNT}"
echo

# 6. List conf.d files
echo -e "${YELLOW}6. Configuration files loaded from conf.d:${NC}"
ls -la ~/.config/fish/conf.d/ 2>/dev/null || echo "  No conf.d directory found"
echo

# 7. Startup time comparison (without config)
echo -e "${YELLOW}7. Startup time without user config:${NC}"
time fish --no-config -i -c exit 2>&1 | grep -E "real|user|sys"
echo

# 8. Suggestions
echo -e "${YELLOW}8. Optimization suggestions:${NC}"

if [[ ${BREW_TIME:-0} -gt 10000 ]]; then
    echo -e "  ${RED}!${NC} Homebrew detection is slow. Consider using the brew cache optimization."
fi

if [[ ${GIT_TIME:-0} -gt 5000 ]]; then
    echo -e "  ${RED}!${NC} Git operations are slow. Consider reducing git abbreviations."
fi

if [[ ${ABBR_COUNT:-0} -gt 100 ]]; then
    echo -e "  ${RED}!${NC} You have ${ABBR_COUNT} abbreviations. Consider reducing to only frequently used ones."
fi

if [[ ${OMF_TIME:-0} -gt 20000 ]]; then
    echo -e "  ${RED}!${NC} OMF is taking significant time. Consider migrating to Fisher for faster plugin management."
fi

echo -e "\n${GREEN}Profile complete!${NC}"
echo -e "For detailed analysis, examine: ${BLUE}/tmp/fish-startup-profile.txt${NC}"
