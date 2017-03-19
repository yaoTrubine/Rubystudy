#所有内建类，以及我所定义的类，都有一个对应的全局常量，名字和我的类名相同。
#类名为常量的事实，意味着可以把类和其他ruby对象一样对待。
def factory(klass, *args)
	klass.new(*args)
end
factory(String, "Hello")
factory(Dir, ".")			

flag = true
(flag?Array:Hash) [1,2,3,4] 	#=> [1,2,3,4]
flag = false
(flag?Array:Hash) [1,2,3,4]		#=> {1=>2,3=>4}

#如果一个无名的类被赋值给一个常量，ruby将常量作为类名

var = Class.new
var.name			#=> ""
Wibble = var
var.name			#=> "Wibble"

