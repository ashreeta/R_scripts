attach(PT_FIT)
plot(elasticity,price_level,
     xlim = 0.29,
     xlab="Elasticity/Incentive elasticity", ylab="Price Level (USD/MWh)",
     pch=18, col="blue")
text(elasticity,price_level,
     region,
     cex=0.6, pos=1, col="black")
detach(PT_FIT)