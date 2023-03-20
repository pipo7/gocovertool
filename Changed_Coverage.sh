#!/usr/bin/env bash 

# Assumes the filename is cover.out
# 
go test ./... -covermode=set -coverprofile cover.out

# Sets up new_coverage.out file
echo "mode: set" > new_coverage.out 
git diff HEAD --no-ext-diff --unified=0 --exit-code -a --no-prefix cover.out | egrep "^\+" | tail -n +2 | cut -c2- >> new_coverage.out 

# Generate new_coverage report
go tool cover -func new_coverage.out | tee new_coverage.txt 

# New Coverage html file
go tool cover -html new_coverage.out -o coverage.html