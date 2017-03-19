#向模块和类添加基本的文档化功能。需要让doc方法作为Module的一个实例方法
class Module
	@@docs = {}
	def doc(str)
		@@docs[self.name] = self.name + ":\n" + str.gsub(/^\s+/,'')
	end
	def Module::doc(aClass)
		aClass = aClass.name if aClass.class <= Module
		@@docs[aClass] || "No documentation for #{aClass}"
	end
end

class Example
	doc "This is a sample documentation string"
end
class Another
	doc <<-edoc
		And this is a documentation string
		in a module
	edoc
end

puts Module::doc(Example)
puts Module::doc(Another)



