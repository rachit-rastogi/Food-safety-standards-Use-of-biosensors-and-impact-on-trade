library(plm)
mydata<-read.csv("C:/Users/rachit/animal_products_final.csv")
attach(mydata)

Y<-cbind(log(exp_ijt))
X<-cbind(log(gdp_it),log(gdp_jt), log(dist_ij), log(index_jt))

pdata<-plm.data(mydata, index=c("id", "time"))
pooling <-plm(log(exp_ijt) ~ log(gdp_it) +log(gdp_jt) + log(dist_ij) + log(index_jt), data=pdata, model="pooling")
summary(pooling)