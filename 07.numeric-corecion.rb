#当写“1+2.3”时，ruby中基于coerce方法的强制(coercion)协议。coerce的基本操作是接收两个数字(接收者，参数）。她返回包含两个元素的数组，分别是两个数字的表示(但参数在前，后面跟着接收者)。coerce方法保证两个对象有相同的类
#1.coerce(2.3)		-> [2.3, 1.0]
#
#
#假设在编写新的类进行算数计算。为了使用强制转换，需要实现coerce方法。
class Roman
	MAX_ROMAN = 4999
	attr_reader :value
	protected :value
	
	def initialize(value)
		if value <= 0 || value > MAX_ROMAN
			fail "Roman values must be > 0 and <= #{MAX_ROMAN}"
		end
		@value = value
	end
	def coerce(other)
		if Integer === other
			[other, value]
		else
			[Float(other), Float(value)]
		end
	end
	def +(other) 			
		if Roman === other
			other = other.value
		end
		if Fixnum === other && (other + @value) < MAX_ROMAN
			Roman.new(@value + other)
		else
			x, y = other.coerce(@value)
			x + y
		end
	end
	FACTORS = [["m", 1000],["cm", 900],["d", 900],["cd", 400],
			   ["c", 100],["xc", 90],["l", 50],["xl", 40],
			   ["x", 10],["v", 5],["iv", 4],["i", 1],["ix", 9]]
	def to_s
		value = @value
		roman = ""
		for code, factor in FACTORS
			count, value = value.divmod(factor)
			roman << (code * count)
		end
		roman
	end
end

iv = Roman.new(4)
xi = Roman.new(11)
iv + 3 		#=> vii
iv + 3 + 4  #=> xi
