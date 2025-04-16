#!/bin/bash

# gitsed.sh <sed-expression> [grep-pattern]
# Examples:
#   ./gitsed.sh 's/foo/bar/g'              # sed all git-tracked files
#   ./gitsed.sh 's/foo/bar/g' green        # grep for "green", then sed those files

if [ "$#" -eq 0 ]; then
  echo "Usage:"
  echo "  $0 's/foo/bar/g'                 # run sed on all git-tracked files"
  echo "  $0 's/foo/bar/g' pattern         # grep for pattern, then run sed"
  exit 1
fi

SED_EXPR="$1"
GREP_PATTERN="$2"

if [ -n "$GREP_PATTERN" ]; then
  git grep -lZ "$GREP_PATTERN"
else
  git ls-files -z
fi | while IFS= read -r -d '' file; do
  [ -f "$file" ] && sed -i "$SED_EXPR" "$file"
done
