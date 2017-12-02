library(plyr)
Train <- rename(Train, c("X1stFlrSF"="FirstFlrSF", "X2ndFlrSF"="SecondFlrSF","X3SsnPorch"="ThreeSsnPorch"))
names(Train)
