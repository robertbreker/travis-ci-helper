#!/bin/bash

script_name="python/check-pep8.sh"

autopep8_result=$(autopep8 -r --diff . | grep "^+++ fixed/" | sed 's/^+++ fixed\///g')

if [ -z "$autopep8_result" ]; then
    echo "$script_name success"
    exit 0
else
    >&2 echo "$script_name error - invalid format detected in the following files:"
    for filename in $autopep8_result; do
        >&2 echo "  - $filename"
    done
    >&2 echo "Please run \"autopep8 -r -i .\" before committing."
    exit 1
fi
