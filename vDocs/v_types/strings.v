// strings shouldn't surprise too much. For the most part I think they work
// the same as Go
mut name := 'Bob'
assert name.len == 3
// this is kinda builtin testing with assert
assert name[0] == u8(66)
// interesting this is saying that 'B' == u8(66)
println(u8(66))
println(name[0]) // indexing returns a byte, not a char.
assert name[1..3] == 'ob'
// slicing returns a string. [1..3] slicing range in v
println(name[1..3])

// escape codes
windows_newline := '\r\n' // escape special chars like in c and Go with \
println(windows_newline.len)

// arbitrary bytes can be directly specified using '\x##' notation where '#' is
// a hex digit
aardvark_str := '\x61ardvark'
println(aardvark_str)
println('\x61')
println('\xc0'[0])
println(u8(0xc0))

// or using octal escapes as well. \### where # is an octal digit
aardvark_str2 := '\141ardvark'
println(aardvark_str2)

// Unicode can be specified directly as '\u####' where # is a hex degit
// and will be converted internally to its utf-8 representation
star_str := '\u2605'
println(star_str)
assert star_str == '\xe2\x98\x85'
// or this way

// A v string is a read-only array of bytes. All unicode chars are encoded in UTF-8
mut s := 'hello \u2620'
println(s)
println(s.len)

arr := s.bytes() // convert 'string' to byte array []u8
println(arr.len)
println(arr)

s2 := arr.bytestr() // convert a byte array to a string
println(s2)

// String values are immutable so they can't be changed in place, just like Go
mut str := 'hello' // even explicitly
// s[0] = 'H' // we get a 's' is immutable error
println(str)

// NOTE that indexing a string will produce a u8 (byte), not a rune nor another string.
// Indexes correspond to bytes in string, not Unicode code points. If you want to convert
// u8 (byte) to a string, we need to use .ascii_str() method on the byte. Similar to
// Go, but the conversion is different I believe.
country := 'Netherlands'
println(country[0])
println(country[0].ascii_str()) // this way I get the 'N'. But is it a string or rune?
println(typeof(country[0].ascii_str()).name) // And the winner is .... a string.

// Both single and double quotes can be used to denote strings, which is different
// from Go, and I think better. For consistency though, vfmt converts double quotes
// to single quotes. (that I never noticed), unless the string contains a single
// quote character.

// For raw strings, prepend 'r'. Escape handling is not needed for raw strings.
s = r'hello\nworld' // the \n will be preserved as 2 chars since this is a raw str
println(s)

// strings can also be easily converted into integers
s = '42'
n := s.int()
println(typeof(s).name)
println(typeof(n).name)

// all int literals are supported
println('0xc3'.int())
println('0o10'.int())
println('0b1111_0000_1010'.int())
println('-0b1111_0000_1010'.int())

// More advanced string processing is available with the vlib/strconv module.

// String Interpolation - pretty simple. Using ${} in a string with '' or ""
name = 'Bob'
println('Hello, ${name}!')

// it also with struct fields and more complex expressions as expected.
// NOTE: Format specifiers are available without a special printF type function
// should be used in the following pattern, which I'll need to come back to
// ${varname:[flags][width][.precision][type]}
// flags: may be zero or more of the following: - to left align, 0 to use 0 as the
// padding char instead of the default space.
// width: may be an integer value describing the minimum width of total field to output
// precision: an integer value peceded by a . will guarantee that many digits after
// the decimal point without any insignificant trailing zeros. If displaying
// insignificant zero's is desired, append a f specifier to the precision value
// Applies only to float variables and is ignored for integers
// type: f and F specify the input is float and should be redered as such, e and E
// specify the input is a float and should be rendered as an exponent, g and G
// specify the input is a float and should be rendered with floating point for
// small values and exponent for large ones. d specifies the input is an integer
// and should be rendered in base-10 digits, x and X require an integer and will
// render as hex digits, o requires an integer and will render as octal digits,
// and b requires an integer and will render as binary digits, and s requires
// a string (almost never used)

// Typically its best to leave format type as it is. Default will be g for floats
// d for integers and s is almost always redundant. But there are 3 cases in which
// I will want to use formatting
// 1. format strings are parsed at compile time, so specifying a type can help detect errors
// 2. format strings default to using lowercase letters for hex and the e in exponents.
//    Use a uppercase type to force the use of uppercase hex digits and an uppercase E
// 3. format strings are the most convenient way to get hex, binary or octal strings
//    from a integer.

x := 123.4567
println('[${x:.2}]') // keeping 2 places after the decimal rounding
println('[${x:10}]') // right-align with spaces on the left, default, so we just put width
println('[${int(x):-10}]') // left-align with space on the right. here we need the -
println('[${int(x):010}]') // right-align padded with 0s
println('[${int(x):b}]') // binary
println('[${int(x):o}]') // octal
println('[${int(x):X}]') // hex - forcing capital
println('[${10.0000:.2}]') // remove insignificant 0s at the end 
println('[${10.0000:.2f}]') // do show the 0s at the end, even though they don't change anything

// the r and R switches, will repeat the string the specified times
println('[${'abc':3r}]') // repeat 3 times
println('[${'abc':3R}]') // force capitals


// String operators - pretty standard. All operators in v must have the same type on 
// both sides, except for the exceptions already mentioned with number promotions. So
// you can't concatenate an integer to a string without an explicit conversion
name = 'Bob'
bobby:=name+'by' // + is used to concatenate
println(bobby)
s = 'hello'
s+=' world' // += does as expected, appending to a string
println(s)

// println('age = ' + 47) // won't compile
println('age = ' + 47.str())  // I didn't think that would work, NICE!
println('age = ${47}') // or with interpolation

// we can see all the string methods in 'strings' and 'strconv' libraries.


