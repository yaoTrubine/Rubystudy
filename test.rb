a = (11..20).collect {|i| (i%4 == 0)..(i%3 == 0)?i:nil}
print a
s = (11..20).collect {|i| (i%4 == 0)...(i%3 == 0)?i:nil}
print s



