package math1

import "testing"

func TestAdd(t *testing.T){

    got := Add(4, 6)
    want := 10

    if got != want {
        t.Errorf("got %q, wanted %q", got, want)
    }

    got = Subtract(6, 4)
    want = 2

    if got != want {
        t.Errorf("got %q, wanted %q", got, want)
    }

    gotString := EvenOdd(6)
    wantString := "Even"

    if gotString != wantString {
        t.Errorf("got %q, wanted %q", gotString, wantString)
    }

    gotString = EvenOdd(5)
    wantString = "Odd"

    if gotString != wantString {
        t.Errorf("got %q, wanted %q", gotString, wantString)
    }
    
}