##字符串相关处理

##  计数 ----nchar/length

##  nchar--字符串中字符个数；length--向量的个数

x <- c("Hellow", "World", "!")
nchar(x)
# [1] 6 5 1
length(x)
# [1] 3


length("")
# [1] 1
nchar("")
# [1] 0

##替换 ----tolower/toupper/chartr

DNA <- "AtGCtttACC"

tolower(DNA) #转小写
#  [1] "atgctttacc"

toupper(DNA) #转大写
#  [1] "ATGCTTTACC"

chartr("A","Q",DNA)
#[1] "QtGCtttQCC"

chartr("At","qH",DNA)
# [1] "qHGCHHHqCC"

#######  特殊情况
chartr("At","q",DNA)
#Error in chartr("At", "q", DNA) : 'old' is longer than 'new'

chartr("A","qH",DNA)
# [1] "qtGCtttqCC"



##粘贴、合并 paste
paste("CK", 1:6, sep = "")
## [1] "CK1" "CK2" "CK3" "CK4" "CK5" "CK6"

x <- list(a = "aaa", b = "bbb", c = "ccc")
y <- list(d = 1, e = 2)
paste(x, y, sep = "-")  #较短的向量被循环使用
## [1] "aaa-1" "bbb-2" "ccc-1"

z <- list(x, y)  #结果异常复杂，不建议使用
paste("T", z, sep = ":")
## [1] "T:list(a = \"aaa\", b = \"bbb\", c = \"ccc\")"
## [2] "T:list(d = 1, e = 2)"

paste(x, y, sep = "-", collapse = "; ") #连接成字符串
## [1] "aaa-1; bbb-2; ccc-1"
length(paste(x, y, sep = "-", collapse = "; "))
## [1] 1

length(paste(x, y, sep = "-"))
## [1] 3


####拆分##################

##正则表达式
# 正则表达式是用于描述/匹配一个文本集合的表达式：
# 
# 所有英文字母、数字和很多可显示的字符本身就是正则表达式，用于匹配它们自己。
# 比如 “a” 就是匹配字母 “a” 的正则表达式
# 一些特殊的字符在正则表达式中不在用来描述它自身，
# 它们在正则表达式中已经被“转义”，这些字符称为“元字符”。
# perl类型的正则表达式中被转义的字符有：. \ | ( ) [ ] { } ^ $ * + ?。
# 被转义的字符已经有特殊的意义，如点号 . 表示任意字符；
# 方括号表示选择方括号中的任意一个（如[a-z] 表示任意一个小写字符）；
# ^ 放在表达式开始出表示匹配文本开始位置，
# 放在方括号内开始处表示非方括号内的任一字符；
# 大括号表示前面的字符或表达式的重复次数；
# | 表示可选项，即 | 前后的表达式任选一个。
# 如果要在正则表达式中表示元字符本身，比如我就要在文本中查找问号“?”， 
# 那么就要使用引用符号（或称换码符号），一般是反斜杠 “\”。
# 需要注意的是，在R语言中得用两个反斜杠即 “\\”，如要匹配括号就要写成 “\\(\\)”
# 不同语言或应用程序（事实上很多规则都通用）
# 定义了一些特殊的元字符用于表示某类字符，
# 如 
# \d 表示数字0-9，
# \D 表示非数字，
# \s 表示空白字符（包括空格、制表符、换行符等），
# \S 表示非空白字符，
# \w 表示字（字母和数字），
# \W 表示非字，
# \$ 表示结束位置
# \< 和 \> 分别表示以空白字符开始和结束的文本。
# 正则表达式符号运算顺序：圆括号括起来的表达式最优先，
# 然后是表示重复次数的操作（即：* + {} ），
# 接下来是连接运算（其实就是几个字符放在一起，如abc），
# 最后是表示可选项的运算（|）。
# 所以 “foot|bar” 可以匹配“foot”或者“bar”，
# 但是“foot|ba{2}r”匹配的是“foot”或者“baar”。

text <- "Hello Adam!\nHello Ava!"
strsplit(text, " ")  #得到的结果是列表
## [[1]]
## [1] "Hello"        "Adam!\nHello" "Ava!"


strsplit(text, "\\s")
## [[1]]
## [1] "Hello" "Adam!" "Hello" "Ava!"

strsplit(text, "")
## [[1]]
## [1] "H"  "e"  "l"  "l"  "o"  " "  "A"  "d"  "a"  "m"  "!"  "\n" "H"
## [14] "e"  "l"  "l"  "o"  " "  "A"  "v"  "a"  "!"


text1<-c("hello world","hello you")
strsplit(text1, " ")  #得到的结果是列表

# [[1]]
# [1] "hello" "world"
# 
# [[2]]
# [1] "hello" "you"  

##grep/grepl
files <- list.files("c:/windows")
head(files)
## [1] "0"            "aaRemove.exe" "addins"       "AppCompat"   
## [5] "AppPatch"     "assembly"    

grep("\\.exe$", files) #位置
# [1]   2   8  24  26  30  32  36  47  58  59  61  76  91  92 102 106
# [17] 108

grepl("\\.exe$", files) #匹配结果
# [1] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
# [11] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
# [21] FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE
# [31] FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
# [41] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
# [51] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE
# [61]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
# [71] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
# [81] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
# [91]  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
# [101] FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE
