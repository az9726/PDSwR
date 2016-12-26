##�ַ�����ش���

##nchar/length

#  nchar--�ַ������ַ�������length--�����ĸ���

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

tolower(DNA) #תСд
#  [1] "atgctttacc"

toupper(DNA) #ת��д
#  [1] "ATGCTTTACC"

chartr("A","Q",DNA)
#[1] "QtGCtttQCC"

chartr("At","qH",DNA)
# [1] "qHGCHHHqCC"

#######  �������
chartr("At","q",DNA)
#Error in chartr("At", "q", DNA) : 'old' is longer than 'new'

chartr("A","qH",DNA)
# [1] "qtGCtttqCC"


