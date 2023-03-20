#!/usr/bin/env bash 

# Assumes the filename is cover.out
# mode is SET " checks that each statement ran"
go test ./... -covermode=set -coverprofile cover.out

# Sets up new_coverage.out file
echo "mode: set" > new_coverage.out 
# falgs used :
# --no-ext-diff Disallow external diff drivers.
# --unified=<n> Generate diffs with <n> lines of context instead of the usual three. Implies --patch
# --no-prefix Do not show any source or destination prefix.
# -a treat all files as text
# --exit-code Make the program exit with codes similar to diff(1). That is, it exits with 1 if there were differences and 0 means no differences.
git diff HEAD --no-ext-diff --unified=0 --exit-code -a --no-prefix cover.out | egrep "^\+" | tail -n +2 | cut -c2- >> new_coverage.out 

# Generate new_coverage report
go tool cover -func new_coverage.out | tee new_coverage.txt 

# New Coverage html file
go tool cover -html new_coverage.out -o coverage.html