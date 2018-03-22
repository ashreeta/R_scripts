library(ggplot2)
library(Hmisc)
attach(Comparison_Elasticity_data)
p <- ggplot(Comparison_Elasticity_data, aes(x=elasticity,y=reorder(region, type)))
p + geom_point()
p + aes(shape = factor(type1)) +
  geom_point(aes(colour = factor(type1)), size = 4) +
  geom_point(colour="grey90", size = 1.5) + scale_x_continuous(name="Elasticity/Incentive elasticity)") + theme(axis.title.y = element_blank())

coplot(region ~ elasticity | type1, 
       data=Comparison_Elasticity_data,col=factor(Comparison_Elasticity_data$type1), rows=1)

dotplot(region ~ elasticity, data = Comparison_Elasticity_data, groups = type1,pch=15,cex=1,
        main = "Elasticity and Incentive elasticity by Region")

qplot(elasticity, region, data = Comparison_Elasticity_data, colour = factor(type1), size = factor(price_level), xlab= "Elasticity/Incentive elasticity", ylab="")

qplot(factor(type), elasticity, data = Comparison_Elasticity_data, geom="boxplot")
qplot(factor(type1), elasticity, data = Comparison_Elasticity_data, geom="boxplot")

dotchart2(elasticity, region, groups=type1, pch=16, dotsize=1.3, col= type1, 
          xlab='Elasticity/Incentive elasticity', ylab='')




