attach(PT)
summary(FIT)
dotchart(elasticity,labels=region, cex=.7, pch= 8,
         main="Price elasticity according to region",
         xlab="Price elasticity (negative)")

x <- PT[]
y <- PT[order(type),]
x$type <- factor(x$type)
x$color[x$type =="Canada"] <- "red"
x$color[x$type =="California"] <- "blue"
x$color[x$type =="China"] <- "darkgreen"
x$color[x$type =="Japan"] <- "dodgerblue4"
x$color[x$type =="Germany"] <- "deeppink1"
x$color[x$type =="Switzerland"] <- "gray50"

dotchart(elasticity,labels=region,cex=0.85,
         groups = (x$type), pch =17,
         color = x$color,
         xlab ="Elasticity")