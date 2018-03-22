attach(PT_FIT)

x <- PT_FIT[]
y <- PT_FIT[order(type),]
#doesnt work yet
b=ifelse(x$symbol ==15,15,22)

x$type <- factor(x$type)
x$color[x$type =="ESFIT All households"] <- "red"
x$color[x$type =="PT"] <- "blue"
dotchart(elasticity,labels=region,cex=1,
         groups = (x$type), pch = 15 , 
         color = x$color,
         xlab ="Elasticity/Incentive elasticity")
