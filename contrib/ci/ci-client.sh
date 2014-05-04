#!/bin/bash
set -e
IFS='' # Preserves whitespace when reading line by line
echo $TRAVIS_COMMIT | nc ci.peas.io 7000 | while read -r line; do
    echo "$line"
    if echo "$line" | grep -q "INTEGRATION TESTS FAILED"; then
      exit 1
    fi
done
