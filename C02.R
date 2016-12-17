#2.1 
#关于list(列表)的使用
uciCar<-read.table(
        'http://www.win-vector.com/dfiles/car.data.csv',
        sep=',',
        header=T
)

class(uciCar)

summary(uciCar)

dim(uciCar)

# d <- read.table('http://archive.ics.uci.edu/ml/machine-learning-databases/statlog
#                /german/german.data',
#                stringsAsFactors=F,header=F)
 # because
 #      Error in file(file, "rt") : cannot open the connection
 #      In addition: Warning message:
 #      In file(file, "rt") : cannot open: HTTP status was '404 Not Found'
 #so

d<-read.table("D:/Documents/GIT/zmPDSwR/Statlog/german.data",
              stringsAsFactors=F, #不对列进行因子化
              header=F) #没有表头

dim(d)

colnames(d) <- c('Status.of.existing.checking.account', 'Duration.in.month',
                 'Credit.history', 'Purpose', 'Credit.amount', 'Savings.account.bonds', 
                 'Present.employment.since',
                 'Installment.rate.in.percentage.of.disposable.income',
                 'Personal.status.and.sex', 'Other.debtors.guarantors',
                 'Present.residence.since', 'Property', 'Age.in.years',
                 'Other.installment.plans', 'Housing',
                 'Number.of.existing.credits.at.this.bank', 'Job',
                 'Number.of.people.being.liable.to.provide.maintenance.for',
                 'Telephone', 'foreign.worker', 'Good.Loan')

colnames(d)


mapping <- list('A11'='... < 0 DM',
                'A12'='0 <= ... < 200 DM',
                'A13'='... >= 200 DM / salary assignments for at least 1 year',
                'A14'='no checking account',
                'A30'='no credits taken/all credits paid back duly',
                'A31'='all credits at this bank paid back duly',
                'A32'='existing credits paid back duly till now',
                'A33'='delay in paying off in the past',
                'A34'='critical account/other credits existing (not at this bank)',
                'A40'='car (new)',
                'A41'='car (used)',
                'A42'='furniture/equipment',
                'A43'='radio/television',
                'A44'='domestic appliances',
                'A45'='repairs',
                'A46'='education',
                'A47'='(vacation - does not exist?)',
                'A48'='retraining',
                'A49'='business',
                'A410'='others',
                'A61'='... < 100 DM',
                'A62'='100 <= ... < 500 DM',
                'A63'='500 <= ... < 1000 DM',
                'A64'='.. >= 1000 DM',
                'A65'='unknown/ no savings account',
                'A71'='unemployed',
                'A72'='... < 1 year',
                'A73'='1 <= ... < 4 years',
                'A74'='4 <= ... < 7 years',
                'A75'='.. >= 7 years',
                'A91'='male : divorced/separated',
                'A92'='female : divorced/separated/married',
                'A93'='male : single',
                'A94'='male : married/widowed',
                'A95'='female : single',
                'A101'='none',
                'A102'='co-applicant',
                'A103'='guarantor',
                'A121'='real estate',
                'A122'='if not A121 : building society savings agreement/life insurance',
                'A123'='if not A121/A122 : car or other, not in attribute 6',
                'A124'='unknown / no property',
                'A141'='bank',
                'A142'='stores',
                'A143'='none',
                'A151'='rent',
                'A152'='own',
                'A153'='for free',
                'A171'='unemployed/ unskilled - non-resident',
                'A172'='unskilled - resident',
                'A173'='skilled employee / official',
                'A174'='management/ self-employed/highly qualified employee/ officer',
                'A191'='none',
                'A192'='yes, registered under the customers name',
                'A201'='yes',
                'A202'='no')

mapping
dim(d)
load("GCDData.RData")
ls()


for(i in 1:(dim(d))[2]) {
        if(class(d[,i])=='character') {
                d[,i] <- as.factor(as.character(mapping[d[,i]]))
        }
} 

#到这个地方才知道列表--list的真正作用

summary(d)
summary(d$Status.of.existing.checking.account)
creditdata
head(creditdata)
table(d$Purpose,d$Good.Loan)
head(d$Good.Loan)
summary(d$Good.Loan)
map1<-list('1'='GoodLoan',
           '2'='BadLoan')
map1[d$Good.Loan]
d$Good.Loan<-as.factor(as.character(map1[d$Good.Loan]))
as.character(map1[d$Good.Loan])

#2.1 end

