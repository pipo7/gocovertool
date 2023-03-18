## Coverage by go cover

generate the cover.out file using go test
``` go test ./... -coverprofile cover.out ```
Note: Here you can provide the changed packages ...

Next generate the coverage text report
``` go tool cover -func cover.out | tee coverage.txt ```

Now the results are in coverage.txt and can be read by program/script.