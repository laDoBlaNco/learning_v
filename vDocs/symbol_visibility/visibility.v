// Functions are all private (not exported) by default. To allow other modules
// to use them, we must mark them as public with 'pub'. Its different from Go's
// capital letter controversy. The same applies to structs, constants, and types.

// NOTE: 'pub' can only be used from a named module

fn main(){
	public_function()
	private_function()
}


pub fn public_function(){
	println("I'm a public function")
}

fn private_function(){
	println("I'm a private function") 
}