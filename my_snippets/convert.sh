#!/usr/bin/env bash

npm i -g convert-snippets

# converts to ultisnippets format to json format

cat testing.snippets react.snippets javascript.snippets  > _javascript.snippets \
  && convert-snippets _javascript.snippets typescript.json \
  && rm _javascript.snippets
