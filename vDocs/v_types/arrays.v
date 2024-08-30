// an array is a collection of data elements of the same type. an array literal
// is a list of expressions surrounded by square brackets. an individual element
// can be accessed using an index expression starting from 0. So pretty normal stuff
mut nums := [1, 2, 3]
println(nums)
println(nums[0])
println(nums[1])

nums[1] = 5 // sinces we marked as mutable, we can change/set elements
println(nums)

// an element can be appended to the end of an array using the push operator '<<'
// It can also append an entire array.
nums = [1, 2, 3]
nums << 4
println(nums)

nums << [5, 6, 7]
println(nums)

mut names := ['John']
names << 'Peter'
names << 'Sam'
println(names)
println(typeof(names).name)
// names<<10  // cannot append 'int literal' to '[]string'

// 'val in array' returns 'true' if the array contains the val. 
println('Alex' in names)
println('Peter' in names)

// Array Fields - there are 2 fields that control the size of an array
// len - the number of per-allocated and intialized elements in the array
// cap - the amount of memory space which has been reserved for elements, but not
// 			 initialized or counted as elements (just like Go). The array can grow up
//       to this size without being reallocated. Usually, V takes care of this field
//       automatically but there are cases where the user may want to do optimizations
nums=[1,2,3]
println(nums.len)
println(nums.cap)
nums=[]
println(nums.len)

// data - is a field (of type voidptr) with the address of the first element. This is
//        unsafe code.
// NOTE fields are read-only and can't be modified


// Array initialization
// the type of array is determined by the first element
println(typeof([1,2,3]).name)
println(typeof(['a','b','c']).name)

// we can also explicitly specify the type for the first element if needed
println(typeof([u8(16),32,64,128]).name)

// for larger or unknown arrays we may want to use this second method of initialization
mut a:=[]int{len:10000,cap:30000,init:3}
println(a)
// The parameters are optional. len defaults to 0 and init to the default initialzation
// of the element type (0 for numberical, '' for string, false for bool, etc)
// Even if a smaller value is specified explicitly, the runtime system makes sure
// that the capacity is not smaller than len
arr:=[]int{len:5,init:-1}
println(arr)
println(arr.cap)

println([]int{}) // an empty array

// setting the cap will improve the performance of pushing elements to the array
// as reallocations can be ovoided.
mut numbers:=[]int{cap:1000}
println(numbers.len)
for i in 0..1000{
	numbers<<i
}
println(numbers)

// we can also initialize an array by accessing the index var which gives the index
// as shown here
count:=[]int{len:4,init:index} // 'index' is the actual variable
println(count)

// this allows us to do some pretty clever stuff
square:=[]int{len:6,init:index*index}
println(square)

