3.times do
    print "Ho"
end

0.upto(9) do |x|
    print x," "
end

0.step(12,3) {|x| print x," "}

File.open("ordinal").grep(/d$/) do |line|
    puts line
end

i = 0
loop do
    i += 1
    next if i < 3
    print i
    break if i > 4
end