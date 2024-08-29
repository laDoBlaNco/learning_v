// In dev mode the compiler will warn us when we haven't used a variable
// "unused variable". I've seen that already a couple of times. In production
// mode (passing -prod to v 'v -prod foo.v') it will not compile at all (like in Go)

fn main() {
	a := 10
	println(a) // if I don't use 'a' I get the warning.

	// I can throwaway the var or simply disregard the value with _
	_ := 10 // this compiles just fine.

	c, _ := foo() // here we throw away a 2nd return value we don't need to use.
	println(c)

	// unlike in most languages, variable shadowing isn't allowed for safety.
	// Declaring a var with a name that is already used in a parent scope will cause
	// a compilation error.
	if true {
		// a:=20 // error: redefinition of 'a'
	}

	// While variable shadowing is not allowed, field shadowing IS
	test := Test{}
	println('${test.width} ${test.height} ${test.Dimension.width}')
}

fn foo() (int, int) {
	return 2, 3
}

// first look at structs in v, very similar to Go except the use of the pub kw
pub struct Dimension {
	width  int = -1
	height int = -1
}

pub struct Test {
	Dimension // I remember this from Go. Embedding and composition
	width int = 100 // this width shadows the Dimension.width
	// height int
}
