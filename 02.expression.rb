# 每次求解总体表达式时就会求解起点和终点表达式的值。
# 利用$.包含当前行号，显示1到3行位于/eig/和/nin/之间的行
# File.foreach("ordinal") do |line|
#     if (($.==1)||line =~ /eig/) .. (($. == 3)||line =~ /nin/)
#         print line
#     Eend
# end

print "hello\n"  while false
begin
    print "goodbye"
rescue => exception
    
end while false