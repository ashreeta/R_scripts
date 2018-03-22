attach(PT_FIT_2)

x <- PT_FIT_2[]
y <- PT_FIT_2[order(type),]
x$type <- factor(x$type)
x$color[x$type =="ESFIT All households"] <- "red"
x$color[x$type =="PT"] <- "blue"
x$color[x$type =="ESFIT Opt In"] <- "darkgreen"
dotchart(elasticity,labels=region,cex=1,
         groups = (x$type), pch =15,
         color = x$color,
         xlab ="Price Elasticity or Incentive elasticity (negative)")
detach(PT_FIT)
