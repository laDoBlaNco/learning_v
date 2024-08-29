// If we have a folder with several v files in it, and oneof those files contains
// our 'main()' function, and the other files have helper functions, then they 
// must be organized by topic and compiled to one single program.

// In other langs we would use 'includes' or some build system or link them somehow.
// In v we can simply compile land run the whole folder together with v run .
// v run . --other params or args. 
// We would do the above to run with CLI args included. 
// NOTE, just like Go's run, after v will delete the executable. If we want to keep it
// we need to use v -keepc run . instead. Or just compile with 'v .' 

// Also Note that any compiler flags should be passed BEFORE the run command. 
// Everything after will be passed as an arg to the program as is.

import os

fn main(){
	println(os.args)
}

// note again here we don't use a main() fn, so its implicit. -- Actually running it
// implicitly didn't work. I had to add a main fn