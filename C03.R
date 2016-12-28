#### 探索性数据分析

setwd("D:/Documents/GIT/zmPDSwR/Custdata")

custdata<-read.table("custdata.tsv",sep='\t',header = T) #制表符分割\t

#一、查看个统计量的总体情况
summary(custdata)

# > summary(custdata)
# custid            sex     is.employed         income      
# Min.   :   2068   F:440   Mode :logical   Min.   : -8700  
# 1st Qu.: 345667   M:560   FALSE:73        1st Qu.: 14600  
# Median : 693403           TRUE :599       Median : 35000  
# Mean   : 698500           NA's :328       Mean   : 53505  
# 3rd Qu.:1044606                           3rd Qu.: 67000  
# Max.   :1414286                           Max.   :615000  
# 
# marital.stat             health.ins            housing.type
# Divorced/Separated:155   Mode :logical   Homeowner free and clear    :157  
# Married           :516   FALSE:159       Homeowner with mortgage/loan:412  
# Never Married     :233   TRUE :841       Occupied with no rent       : 11  
# Widowed           : 96   NA's :0         Rented                      :364  
#                                          NA's                        : 56  
# 
# 
# recent.move      num.vehicles        age              state.of.res
# Mode :logical   Min.   :0.000   Min.   :  0.0   California  :100  
# FALSE:820       1st Qu.:1.000   1st Qu.: 38.0   New York    : 71  
# TRUE :124       Median :2.000   Median : 50.0   Pennsylvania: 70  
# NA's :56        Mean   :1.916   Mean   : 51.7   Texas       : 56  
#                 3rd Qu.:2.000   3rd Qu.: 64.0   Michigan    : 52  
#                 Max.   :6.000   Max.   :146.7   Ohio        : 51  
#                 NA's   :56                      (Other)     :600  

#着重留意几个方面：
# 1、缺失值
# is.employed 缺失近1/3
# housing.type、recent.move、num.vehicles 都有56条缺失，是否集中到56个样本上？
#
# 
# > sum(
#                (is.na(custdata$recent.move))    &
#                (is.na(custdata$num.vehicles))   &
#                (is.na(custdata$housing.type))
#                )
# [1] 56
# > 
# 缺失都集中到相同的56个样本上

#2、极端值和无效值
# income -8700
# age 0.0/146.7
# 可能是输入错误，注意0.0可能是代表情况未知。
# 
# 3、数据范围
# income 从0到61.5万，是个大范围，可能需要注意，是否有小数点错误

#####图形部分略去###########################################################
