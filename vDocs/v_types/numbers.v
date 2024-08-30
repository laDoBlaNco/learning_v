// we can assign integer literals to vars by hex, binary, and octal and they will
// have have the type int
a := 123
b := 0x7b
c := 0b01111011
d := 0o173
println(typeof(a).name)
println(typeof(b).name)
println(typeof(c).name)
println(typeof(d).name)

// we can also  write numbers with the _ separator
num := 1_000_000 // same as 1000000
three := 0b0_11
float_num := 3_122.55
hexa := 0xf_f
oct := 0o17_3
println(num)
println(three)
println(float_num)
println(hexa)
println(oct)

// we can also use casting to get a different type
println(typeof(i64(123)).name)
println(typeof(u8(42)).name)
println(typeof(i16(12345)).name)

// assigning floats works the same way
f := 1.0 // default f64
f1 := f64(3.14)
f2 := f32(3.14)
println(typeof(f).name)
println(typeof(f1).name)
println(typeof(f2).name)

// we can also declare float literals as power of ten
println(42e1)
println(123e-2)
println(456e+2)
