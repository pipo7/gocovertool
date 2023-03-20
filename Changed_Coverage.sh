#!/usr/bin/env bash

go test ./... -covermode=set -coverprofile cover.out

echo "mode: set" > new_coverage.out 
git diff HEAD --no-ext-diff --unified=0 --exit-code -a --no-prefix cover.out | egrep "^\+" | tail -n +2 | cut -c2- >> new_coverage.out 

go tool cover -func new_coverage.out | tee new_coverage.txt 