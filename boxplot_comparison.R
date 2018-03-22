library(ggplot2)
library(Hmisc)
library(wesanderson)

# Compare PT and FIT with box plots
attach(Comparison_Elasticity_data1)
p <- ggplot(Comparison_Elasticity_data1, aes(factor(Tariff,levels=c("PT","FIT")),elasticity))

p + geom_boxplot(aes(fill = Tariff))+ geom_jitter()+ guides(fill=FALSE)+labs(x = "Tariff type", y="Price elasticity or Incentive Elasticity")+scale_y_continuous(trans = "reverse")

# Compare PT, FIT and FIT opt in groups by tariff
attach(Comparison_Elasticity_data)

p <- ggplot(Comparison_Elasticity_data, aes(factor(Tariff,levels=c("PT","ESFIT","ESFIT Opt-in")),elasticity))
p <-p + geom_boxplot(aes(fill = Tariff))+ guides(fill=FALSE)+labs(x = "Tariff type", y="Price elasticity(blue) or Incentive Elasticity(red,green)")+scale_y_continuous(trans = "reverse")
p+theme_bw((base_size = 14))+theme( axis.text.x=element_text(angle=30,hjust=1,size=13))

# Compare PT, FIT and FIT opt in groups by country
attach(Comparison_Elasticity_data3)
p <- ggplot(Comparison_Elasticity_data3, aes(factor(Type),elasticity))
z <-p + geom_boxplot(aes(fill = Tariff))+ guides(fill=FALSE)+labs(x = "Tariff type by Country", y="Price elasticity or Incentive Elasticity")+scale_y_continuous(trans = "reverse")
z+theme_bw((base_size = 14))+theme( axis.text.x=element_text(angle=30,hjust=1,size=13))

# Compare PT, FIT by country
attach(Comparison_Elasticity_data2)
p <- ggplot(Comparison_Elasticity_data2, aes(factor(Type),elasticity))

y<-p + geom_boxplot(aes(fill = Tariff))+ guides(fill=FALSE)+labs(x = "Country and Tariff type", y="Price elasticity(blue) or Incentive Elasticity(red)")+ scale_y_continuous(trans = "reverse")
y+theme_bw((base_size = 14))+theme( axis.text.x=element_text(angle=30,hjust=1,size=13))

# Compare PT, FIT by country trial
attach(Comparison_Elasticity_data2)
q <- ggplot(Comparison_Elasticity_data2, aes(factor(Country),elasticity))

y<-q + geom_boxplot(aes(fill = Tariff))+ guides(fill=FALSE)+labs(x = "Country and Tariff type", y="Incentive Elasticity (red) and Price elasticity (blue)")+ scale_y_continuous(trans = "reverse")
y<-y+theme_bw((base_size = 14))+theme( axis.text.x=element_text(angle=30,hjust=1,size=13))
y

#scale_fill_manual(values=wes_palette(n=2, name="Moonrise2"))

# Compare PT, FIT opt in  by country
attach(Comparison_Elasticity_data3)
p <- ggplot(Comparison_Elasticity_data3, aes(factor(Type),elasticity))
p <- p + geom_boxplot(aes(fill = Country))+ geom_jitter()+ guides(fill=FALSE)+labs(x = "Country and Tariff type", y="Price elasticity or Incentive Elasticity")
p <- p+theme_bw((base_size = 14))+theme( axis.text.x=element_text(angle=30,hjust=1,size=13))
p

# Compare PT, FIT opt in  by country trail
attach(Comparison_Elasticity_data4)
p <- ggplot(Comparison_Elasticity_data4, aes(factor(Type),elasticity))
p <- p + geom_boxplot(aes(fill = Tariff))+ guides(fill=FALSE)+labs(x = "Country and Tariff type", y="Price elasticity (blue) and Incentive Elasticity (red, green)")+theme_bw((base_size = 14))+theme( axis.text.x=element_text(angle=30,hjust=1,size=13))+ scale_y_continuous(trans = "reverse")
p
