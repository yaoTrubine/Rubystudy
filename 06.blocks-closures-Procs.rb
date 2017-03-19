#block是closure；他能记住其被定义时的上下文，并在被调用时使用该上下文。
#上下文包含self的值、常量、类变量、局部变量和任何被截获的block。
class Holder
	CONST = 100
	def call_back
		yield
	end
end



class Creator
	const = 0
	def create_block
		a = 1
		@a = 2
		@@a = 3
		proc do
			puts "a = #{a}"
			puts "@a = #@a"
			puts "@@a = #@@a"
			puts yield
		end
	end
end

block = Creator.new.create_block {"original"}
Holder.new.call_back(&block)

#无论在哪种block内，next语句将退出block。block的值是传递给next的值，如果没有值传递给next，则为nil
def meth
	res = yield
	puts "The block returns #{res}"
end
meth {next 99}
pr = Proc.new {next 99}
puts pr.call
pr = lambda {next 99}
puts pr.call
