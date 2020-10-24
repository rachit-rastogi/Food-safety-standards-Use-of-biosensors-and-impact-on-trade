install.packages("censReg")
install.packages("texreg")
library(plm)
library(texreg)
mydata<-read.csv("C:/Users/rachit/food_products_final.csv")
attach(mydata)
Y<-cbind(log(exp_ijt))
X<-cbind(log(gdp_it),log(gdp_jt), log(dist_ij), log(index_jt))

any(table(mydata$id, mydata$t)!=1)
plmFit1 <- plm(log(exp_ijt) ~ log(gdp_it) +log(gdp_jt) + log(dist_ij) + log(index_jt), data = mydata, index = c("id","time"))
plm
mydata
plmFit1 <- plm(log(exp_ijt) ~ log(gdp_it) +log(gdp_jt) + log(dist_ij) + log(index_jt), data = mydata, index = c("id","time"))
plmFit1
pdata<-plm.data(mydata, index=c("id", "time"))
pooling <-plm(log(exp_ijt) ~ log(gdp_it) +log(gdp_jt) + log(dist_ij) + log(index_jt), data=pdata, model="pooling")
htmlreg(pooling, file="pooling.docx", caption="Regression of export between India and 15 developed countries on non trade tariffs", caption.above=TRUE, digits=3)
