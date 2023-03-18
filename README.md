## Legacy Coverage by go test and go cover

generate the cover.out file using go test and calculate the Legacy code coverage
``` go test ./... -coverprofile cover.out ```
Note: Here you can provide the packages to be tested for coverage or explcitly give relative paths here ...

Check-in the cover.out file for LEGACY code coverage.

## New Code coverage to test new / changed files coverage.
generate the cover.out file using go test and calculate the Legacy code coverage
``` go test ./... -coverprofile cover.out ```
Now based on NEW changes in cover.out identify the differences from existing checked-in cover.out and create a new file called "new_cover.out"

``` git diff HEAD --no-ext-diff --unified=0 --exit-code -a --no-prefix cover.out | egrep "^\+" | tail -n +2 ```

Push the CHANGED lines data into new_cover.out
``` echo "mode: set" > new_cover.out ```
``` git diff HEAD --no-ext-diff --unified=0 --exit-code -a --no-prefix cover.out | egrep "^\+" | tail -n +2 | cut -c2- >> new_cover.out ```

Next generate the coverage text report for NEW COVERAGE based on new coverage in new_cover.out
``` go tool cover -func new_cover.out | tee new_coverage.txt ```

Now the coverage results for NEW/Changed CODE are in new_coverage.txt and can be read by program/script.
