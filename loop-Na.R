#实现类似数据透视图功能，从网站上看到的帖子
#计划通过循环来完成
#主要是空值 numeric(0)的处理方式
#循环的内容也调整了好一段时间，最后想来也很简单，捏着不变的再去找变化的就行

a<-read.csv("gp.csv",stringsAsFactors =F)
a
########a<-read.csv("gp.csv")
ww<-table(a$X.date,a$stkcd);ww  #确定结果的行和列

dn<-rownames(ww);rn  #行名称 date 
sn<-colnames(ww);cn #列名称 stkcd
## 循环控制变量
i<-1
j<-1
g<-data.frame(0) #初始结果数据框
## g<-matrix(0) 
#  n<-NULL          
for (i in 1:dim(ww)[1]) {
        for (j in 1:dim(ww)[2]){
           if (length(a[which(a$X.date==dn[i]&a$stkcd==sn[j]),3])==0)
                   #没有这个值的时候，取到的是numeric(0)，
                   # numeric(0)==numeric(0) 的结果是logical(0)不能作为逻辑判断条件
                   # 通过length()==0就可以判断是否没取到值
                g[i,j]<- NaN #关于空值也弄了很长时间，空值的定义还要继续明确
                        else g[i,j]<-a[which(a$X.date==dn[i]&a$stkcd==sn[j]),3]
        }
}

#  c<-(cn[1],rn[1],a[which(a$stkcd==cn[1]&a$X.date==rn[1]),3)]
colnames(g)<-sn
rownames(g)<-dn
g

t<-tapply(a$ret,list(a$X.date,a$stkcd),sum);t #以上的操作可以用这条命令直接实现

# > a
# stkcd   X.date    ret
# 1     1 2015/1/1  0.034
# 2     1 2015/1/2  0.021
# 3     1 2015/1/3 -0.019
# 4     2 2015/1/1  0.070
# 5     2 2015/1/2  0.055
# 6     2 2015/1/3  0.001
# 7     4 2015/1/4  4.000
# > ww
# 
# 1 2 4
# 2015/1/1 1 1 0
# 2015/1/2 1 1 0
# 2015/1/3 1 1 0
# 2015/1/4 0 0 1
# > g
# 1     2   4
# 2015/1/1  0.034 0.070 NaN
# 2015/1/2  0.021 0.055 NaN
# 2015/1/3 -0.019 0.001 NaN
# 2015/1/4    NaN   NaN   4
# > t
# 1     2  4
# 2015/1/1  0.034 0.070 NA
# 2015/1/2  0.021 0.055 NA
# 2015/1/3 -0.019 0.001 NA
# 2015/1/4     NA    NA  4

# > sn
# [1] "1" "2" "4"
# > dn
# [1] "2015/1/1" "2015/1/2" "2015/1/3" "2015/1/4"
# > 