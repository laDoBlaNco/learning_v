// An array can be of the following types
/*

Number			[]int, []i64, etc

String			[]string

Rune				[]rune

Boolean			[]bool

Array				[][]int

Struct			[]MyStructName

channel			[]chan f64

Function		[]MyFunctionType []fn(int)bool

interface		[]MyInterfaceName

Sum Type		[]MySumTypeName

Generic			[]T

Map					[]map[string]f64

Enum				[]MyEnumType

Alias				[]MyAliasNaem

Thread			[]thread int

Reference		[]&f64

Shared			[]shared MyStructType

// here is some example code to create an array which can handle different types
*/

struct Point {
	x int
	y int
}

struct Line {
	p1 Point
	p2 Point
}

type ObjectSumType = Line | Point

mut object_list := []ObjectSumType{}
object_list << Point{1, 1}
object_list << Line{
	p1: Point{3, 4}
	p2: Point{4, 4}
}
dump(object_list)

// Multidimensional Arrays
// Arrays can have more than one dimension as in other langs
// 2d
mut a := [][]int{len:2,init:[]int{len:3}}
println(a)
a[0][1]=2
println(a)

// or 3d
mut b:=[][][]int{len:2,init:[][]int{len:3,init:[]int{len:2}}}
println(b)
b[0][1][1]=2
println(b)

// pretty intuitive and easy to build up matrices

// Array Methods
