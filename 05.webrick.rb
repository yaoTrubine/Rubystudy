require 'webrick'
include WEBrick
s = HTTPServer.new(
    :Port => 2000,
    :DocumentRoot => Dir.pwd
)
trap("INT") {s.shutdown}    #遇到中断信号时，可以完整的关闭
s.start
