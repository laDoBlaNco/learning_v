// Mutable Variables
// To change the value of the var use '='. in V, variables are immutable by default
// to be able to change them we need to explicitly mark them as 'mut'

// This is that rust safety stuff in play.

// age := 20  // won't allow me to change. I get an error, 'age' is immutable
mut age := 20
println(age)

age = 21
println(age)
