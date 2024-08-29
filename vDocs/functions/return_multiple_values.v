// Returning multiple values works just like Go from what I can tell. so no
// magic here

fn main() {
	a, b := foo()
	println(a)
	println(b)

	// we can also throw away certain returned values with _
	c,_ := foo()
	println(c)
}

fn foo() (int, int) {
	return 6, 6
}
