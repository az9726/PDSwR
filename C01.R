uciCar<-read.table(
        'http://www.win-vector.com/dfiles/car.data.csv',
        sep=',',
        header=T
)

class(uciCar)

summary(uciCar)
