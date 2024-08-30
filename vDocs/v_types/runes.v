// A rune reps a single Unicode character and is an alias for u32, just like in
// Go. To denote them, use `` (backticks)

// A rune can be converted to utf-8 by using the .bytes() method
rocket := `🚀`
println(rocket.bytes())

// Hex, Unicode, and Octal escape seqs also work in a rune literal
println(`\x61`) 
println(`\141`)
println(`\u0061`)

// multibyte literals work as well
println(`\u2605`)
println(`\u2605`.bytes())
println(`\xe2\x98\x85`.bytes())
println(`\342\230\205`.bytes())

// Also note that rune literals use the same escape syntax as strings, but they can
// only hold one unicode character. Therefore if your code does not specify a single
// Unicode char, you will receive an error at compile time.
rocket_string:='🚀'
println(rocket_string[0])
println('aloha!'[0])

// a string can be converted to runes with the runes.() method
hello:= 'Hello World 🌎'
hello_runes:=hello.runes()
println(hello_runes)
