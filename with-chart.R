##字符串相关处理

##nchar/length

#  nchar--字符串中字符个数；length--向量的个数

x <- c("Hellow", "World", "!")
nchar(x)
# [1] 6 5 1
length(x)
# [1] 3


length("")
# [1] 1
nchar("")
# [1] 0

##tolower/toupper/chartr

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



