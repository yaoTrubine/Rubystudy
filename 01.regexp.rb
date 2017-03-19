def show_regexp(str, regexp)
    if regexp =~ str
        "#{$`}<<#{$&}>>#{$'}"
    else
        "no match"
    end
end

p show_regexp("abscc\nasdcf",/f\Z/)
p show_regexp("this is",/\bis/)
p show_regexp("^this",/[\^]/)
p show_regexp("this [sdd]",/[^\s]/)