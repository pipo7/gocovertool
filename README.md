## How go test --cover works:
https://go.dev/blog/cover

## Legacy Coverage by go test and go cover

Generate the cover.out file using go test and calculate the Legacy code coverage
Use covermode as set, count or atomic as appropriate
``` go test ./... -covermode=set -coverprofile cover.out ```
Note: Here you can provide the packages to be tested for coverage or explcitly give relative paths here ...

Commit and Check-in the cover.out file to source code repository - this is Now the BASELINE for LEGACY code coverage.

## New Code coverage to test new / changed files coverage.
On a new commit now re-generate the cover.out file using go test which also has the new calculated code coverage
``` go test ./... -coverprofile cover.out ```
Now based on NEW changes in cover.out identify the differences from existing checked-in cover.out and then paste the CHANGES in a new file called "new_coverage.out"

Push the CHANGED lines data into new_cover.out
``` echo "mode: set" > new_coverage.out ```
``` git diff HEAD --no-ext-diff --unified=0 --exit-code -a --no-prefix cover.out | egrep "^\+" | tail -n +2 | cut -c2- >> new_coverage.out ```

Next generate the coverage text report for NEW COVERAGE based on new coverage in new_coverage.out
# Generate new_coverage report
go tool cover -func new_coverage.out | tee new_coverage.txt 

# New Coverage html file report - easy to visualize code.
go tool cover -html new_coverage.out -o coverage.html

Note if new_coverage is empty that means no new coverage added in that case , use :
``` go tool cover -func cover.out | tee coverage.txt ```

Now the coverage results for NEW/Changed CODE are in new_coverage.txt and can be read by program/script.


