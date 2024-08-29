// This is as usual our first official program for this series of docs.
// Using some of the most basic things in v and nothing really surprising.

fn main(){
	println('hello world')
}

// Note we aren't using packages or modules here yet and our println function
// is one of the very few built-in functions.

// We use fn instead of func (like in go) for declaring functions.Outside of that
// the syntax is very much the same as Go. Here we don't return anything so
// we don't declare a return value and we don't take any args either. 

// Also just like Go, main is the entry point. so even though we aren't running 
// main() persay, its being run automatically.
// We actually don't have to use main in v. If we don't then the entire document is
// an implicit 'main'. This is probably how we get the vsh shell version of v working.
