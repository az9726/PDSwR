##########
setwd("D:/Documents/GIT/zmPDSwR/Custdata")

custdata<-read.table("custdata.tsv",sep='\t',header = T)
summary(custdata)

summary(custdata[is.na(custdata$housing.type), c("recent.move","num.vehicles")]) 
#针对housing.type,统计"recent.move","num.vehicles"的空值情况
# > summary(custdata[is.na(custdata$housing.type), c("recent.move","num.vehicles")])
# recent.move     num.vehicles
# Mode:logical   Min.   : NA  
# NA's:56        1st Qu.: NA  
#                 Median : NA  
#                 Mean   :NaN  
#                 3rd Qu.: NA  
#                 Max.   : NA  
#                 NA's   :56   
#这三列都在同样的56行数据中出现空值。

custdata$is.employed.fix <- ifelse(is.na(custdata$is.employed), #标识空为missing 
                                   "missing",                    	
                                   ifelse(custdata$is.employed==T, 	
                                          "employed",
                                          "not employed"))  #标识雇佣和没雇佣 
######增加新列，为了保持原始数据的完整。
summary(as.factor(custdata$is.employed.fix))

# > summary(as.factor(custdata$is.employed.fix)) 
# employed      missing not employed 
# 599          328           73 

summary(is.na(custdata$income))

##这个例子与书上给的原始数据不符，权且观看
summary(custdata$Income)

##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.    NA's
##       0   25000   45000   66200   82000  615000     328

##用均值来填补空值
meanIncome <- mean(custdata$Income, na.rm=T) 	# na.rm=T 很重要
Income.fix <- ifelse(is.na(custdata$Income),
                     meanIncome,
                     custdata$Income)
summary(Income.fix)

##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
##       0   35000   66200   66200   66200  615000


##分段，把连续变量变成离散变量
##使用cut()命令
breaks <-c(0, 10000, 50000, 100000, 250000, 1000000)  #

Income.groups <- cut(custdata$income, breaks=breaks, include.lowest=T) 
# include.lowest=T包含"0"

# 不包含最小值“0”时，会将0处理为缺失
# custdata$income[is.na(cut(custdata$income, breaks=breaks, include.lowest=F))]
#
# [1]     0     0     0     0     0     0     0     0     0     0     0
# [12]     0     0     0     0     0     0     0     0     0     0     0
# [23]     0     0     0     0     0     0     0     0     0     0     0
# [34]     0     0     0     0     0     0     0     0     0     0     0
# [45]     0     0     0     0     0     0     0     0     0     0     0
# [56]     0 -8700     0     0     0     0     0     0     0     0     0
# [67]     0     0     0     0     0     0     0     0     0     0     0
# [78]     0     0

summary(Income.groups)                                        	# Note: 3 

# [0,1e+04]   (1e+04,5e+04]   (5e+04,1e+05] (1e+05,2.5e+05] 
# 184             469             215             105 
# (2.5e+05,1e+06]            NA's 
# 26                          1 

custdata$income[is.na(Income.groups)]
#  [1] -8700   #不在分组内





Income.groups <- as.character(Income.groups)                   	# Note: 4 

Income.groups <- ifelse(is.na(Income.groups),                  	# Note: 5 
                        "no income", Income.groups)

summary(as.factor(Income.groups))

#####另一种方法是将缺失的改为0
missingIncome <- is.na(custdata$Income)  	
Income.fix <- ifelse(is.na(custdata$Income), 0, custdata$Income) 




medianincome <- aggregate(income~state.of.res,custdata,FUN=median)
colnames(medianincome) <- c('State','Median.Income')
summary(medianincome) 

custdata <- merge(custdata, medianincome,
                  by.x="state.of.res", by.y="State")  	# Note: 2 
