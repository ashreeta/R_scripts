attach(PT)
plot(elasticity,Price.index,pch =22,col=(1:24),
     xlab="Elasticity (-ve)", ylab="Price Index (%)")
legend(locator(1),legend=region, pch=22, cex=0.6,ncol=3, col=(1:24))


text(locator(1),region, cex= 0.7, col= "black")

attach(FIT)
plot(elasticity,price_level,pch =(1:9),col=(1:9),
     xlab="Elasticity (-ve)", ylab="Price Level (USD/MWh)")
legend(locator(1),legend=region, pch=(1:9), cex=0.6,ncol=3, col=(1:9))