#Ruby中的类是永不关闭的，可以随时打开一个类并添加新的方法。Object#extend方法将其参数中的方法添加到调用该方法的接收者中,也可以创建一个虚拟类。obj.extend(Mod)基本和下面的等价。
#class <<obj
#	include Mod
#end

a = "hello"
b = a.dup
class <<a
	def to_s
		"the value is '#{self}'"
	end
	def two_times
		self + self
	end
end

puts a.to_s
puts a.two_times
puts b.to_s
#也可以改写为:
a = "hello"
b = a.dup
def a.to_s
	"the value is '#{self}'"
end
def a.two_times
	self + self
end

puts a.to_s
puts a.two_times
puts b.to_s

#扩展对象
#可以使用Object#extend将一个模块混合到对象中
module Humor
	def tickle
		"hee, hee!"
	end
end
a = "Grouchy"
a.extend Humor
a.tickle	#=>"hee, hee!"

#如果在一个类定义中使用他，模块方法会变为类方法。因为调用extend和self.extend是等价的，在类中定义是添加到类本身
module Humor
	def tickle
		"hee, hee!"
	end
end
class Grouchy
	include Humor
	extend Humor
end
Grouchy.tickle		#=> "hee, hee!"
a = Grouchy.new
a.tickle			#=> "hee, hee!"



