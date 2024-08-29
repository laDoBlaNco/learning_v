/*

Very similar to Go, the primitive types in V are:

bool

string

i8	i16	int	i64			i128(soon)
u8	u16 u32	u64	    u128(soon)

rune	// represents a Unicode char (code point) just like Go

f32	f64

isize, usize 	// plateform-dependent, the size is how many bytes it takes to reference
							// any location in memory

voidptr // this one is mostly used for [c interoperabiltiy](#v-and-c) I don't think
				// this one is in Go at all.
any 	// similar to C's void* and Go's interface{} Go now has 'any' as well with generics

*/

// Unlike C and Go, int is ALWAYS a 32 bit integer. It doesn't convert depending on the
// machine.

// There is an exception to the rule that all operators in V must have values of the
// same type on both sides. A small primitive type on one side can be automatically
// promoted if it fits completely into the data range of the type on the other side
// and precision isn't lost. This is the same in Go

// for example an int can automatically be promoted to f64 ro i64 but not to u32 since
// u32 would mean loss of the sign for negative values. Promotion from int to f32,
// however, is currently done automatically (but can lead to precision loss for
// large values.)

// Literals like 123 or 4.56 (numeric constants in Go) are treated a special way.
// They do not lead to type promotions, however they default to int and f64 respectively,
// when their type has to be decided. So it sounds like they are similar to Go
// numeric constants, because its 'when their type HAS TO BE DECIDED'. Meaning at first
// they are untyped. But in Go they are promotetd to what is needed where they don't
// lose precision. In V it simply int or f64.
u := u16(12)
println(typeof(u).name)
v := 13 + u
println(typeof(v).name) // u isn't promoted, still type u16

x := f32(45.6)
println(typeof(x).name)
y := x + 3.14
println(typeof(y).name) // again x not promoted, still f32

a := 75
println(typeof(a).name) // default for int literal
println(typeof(75).name) // just for kicks if its not in a var its an int LITERAL
b := 24.7
println(typeof(b).name) // same here, default f64 (not f32)
println(typeof(24.7).name) // float LITERAL, but not f64 type

c := u + a
d := b + x
println(typeof(c).name) // here the u is promoted to the higher 'int' default of a
println(typeof(d).name) // and x is promoted to the higher 'f64' default of b

// VERY EASILY UNDERSTOOD AND IT ALL MAKES SENSE