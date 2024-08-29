// variables are declared AND initialized with :=. THIS IS THE ONLY WAY TO DECLARE
// VARIABLES IN V. I didn't know this. So this simplifies what we do in Go. One
// way to do it, no confusion.
// The var type is inferred from the value on the right hand side. To choose a 
// different type, use type conversion: T(v)

// Unlike most other languages, v only allows defining variables in funtions. By
// default v doesn't allow global vars. Again a difference from Go, interesting.

// For consistency across code bases all variable and function names must use
// snake_case instead of PascalCase or camelCase
name := 'Bob'
age := 20
large_number := i64(9999999999) // this is a type conversion assignment
// largeNumber := large_number // using camelCase gives us an error 
println(name)
println(age)
println(large_number)
// println(largeNumber)
