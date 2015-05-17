#!/bin/bash

script_name="go/check-gofmt.sh"

gofmt_result=$(gofmt -s -l .)

if [ -z "$gofmt_result" ]; then
    echo "$script_name success"
    exit 0
else
    >&2 echo "$script_name error - invalid format detected in the following files:"
    for filename in $gofmt_result; do
        >&2 echo "  - $filename"
    done
    >&2 echo "Please run \"gofmt -s -w .\" before committing."
    exit 1
fi
