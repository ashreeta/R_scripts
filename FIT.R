attach(FIT_1)

x <- FIT_1[]
y <- FIT_1[order(type),]
x$type <- factor(x$type)
x$color[x$type =="Canada"] <- "red"
x$color[x$type =="United States (California)"] <- "blue"
x$color[x$type =="Japan"] <- "dodgerblue4"
x$color[x$type =="Germany (Frankfurt)"] <- "deeppink1"
x$color[x$type =="United States (San Diego)"] <- "gray50"
x$color[x$type =="Germany (Heidelberg)"] <- "cadetblue"
x$color[x$type =="Switzerland (Geneva)"] <- "darkorchid"
x$color[x$type =="Switzerland (Berne)"] <- "coral"

dotchart (elasticity,labels=region,cex=1,
         groups = (x$type),
         color = x$color, pch = 22,
         xlab ="Incentive elasticity")