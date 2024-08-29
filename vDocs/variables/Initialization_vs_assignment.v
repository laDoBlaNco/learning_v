// There is an important different between := and =. := is used for declaring AND
// initialization. While = is just for assigning.

fn main() {
	// age = 21 // this will not compile. I get an 'undefined ident' error
	age := 21
	println(age)

	// The values of multiple vars can be changed in one line. In this way their values
	// can be swapped without an intermediary var. This is pretty normal nowadays
	mut a := 0
	mut b := 1
	println('${a}, ${b}') // interpolation is pretty simple. No need for backticks
	a,b=b,a 
	println("${a}, ${b}") // even works with ""
}

// is this the same as swizzling, I don't think so, at least not evidently.
// maybe under the hood in a way it is, as swizzling has to do with the movement
// of pointer references, etc, which in a way we are doing here.
