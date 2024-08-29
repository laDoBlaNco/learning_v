// Just like in Go and C, functions can't be overloaded. This makes code simple
// and improves mantainability.

// The type comes after the arg name just as when we do the long declaration of
// a var in Go

fn main() {
	println(add(77, 33))
	println(sub(100, 50))
}

// also note the return type since these fn have a return value
fn add(x int, y int) int {
	return x + y
}

// interestingly, even though I put in the legal x,y int the formatter converted it
// back to the longer version. This does help with readability and consistency
fn sub(x int, y int) int {
	return x - y
}

// Functions can be used before their declarations as we can see above they are 
// declared after 'main'. This is true for all declarations in v and eleminates the
// need for header files or thinking about the order of files and declarations. 
// I like it 