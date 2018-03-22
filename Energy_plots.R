library(plotly)
library(Hmisc)
library(reshape2)
library(ggplot2)
library(plyr)
library(wesanderson)
library(RColorBrewer)

#ggplot only

#electricity
#insert data file name here
data<- Production_electricity_2050_cost

df <-melt(as.data.frame(data),c("Months"))
g<- subset(df,df$variable %in% c("PV", "Hydroelectricity BS","Hydroelectricity CH","CHP","Grid Import", "micro-CHP"))
f<- subset(df,df$variable %in% c("PV", "Hydroelectricity BS","Hydroelectricity CH","CHP"))
h<- subset(df,df$variable %in% c("2014", "Demand + HPs + E-Mobility"))
i<- subset(df,df$variable %in% c("Demand + HPs"))

cols <- c("Grid Import" = "#4393C3", "CHP" = "#D6604D", "Hydroelectricity CH" = "#E0E0E0",
          "Hydroelectricity BS" = "#878787","PV"="#4D4D4D", "micro-CHP"="coral4")


p4 <- ggplot(data=df, aes(x=Months, y=value)) + 
  geom_bar(data=g,stat="identity", aes(fill=factor(variable, levels=c("Grid Import","Hydroelectricity CH",
                                                                      "Hydroelectricity BS","CHP","micro-CHP", "PV")))) +
  geom_line(data=h, aes(x=Months, y=value,linetype=variable), size=0.8) +
  scale_linetype_manual(values=c("dotdash","solid")) +
  scale_x_continuous(breaks=seq(1,12,1)) + 
  scale_fill_manual(values=cols)+
  labs(x="Months",y="GWh/month") +
  theme_minimal() + theme(legend.title=element_blank())+ ggtitle("2050: Monthly electricity production and demand")
p4          


data<- Production_electricity_2016_carbon

df <-melt(as.data.frame(data),c("Months"))
g<- subset(df,df$variable %in% c("PV", "Hydroelectricity BS","Hydroelectricity CH","CHP","Grid Import"))
f<- subset(df,df$variable %in% c("PV", "Hydroelectricity BS","Hydroelectricity CH","CHP"))
h<- subset(df,df$variable %in% c("2014"))
i<- subset(df,df$variable %in% c("Demand + HPs"))

cols <- c("Grid Import" = "#4393C3", "CHP" = "#D6604D", "Hydroelectricity CH" = "#E0E0E0", "Hydroelectricity BS" = "#878787","PV"="#4D4D4D")


p4 <- ggplot(data=df, aes(x=Months, y=value)) + 
  geom_bar(data=g,stat="identity", aes(fill=factor(variable, levels=c("Grid Import","Hydroelectricity CH","Hydroelectricity BS","CHP", "PV")))) +
  geom_line(data=i, aes(x=Months, y=value,linetype=variable), size=0.8) +
  scale_linetype_manual(values=c("solid")) +
  scale_x_continuous(breaks=seq(1,12,1)) + 
  scale_fill_manual(values=cols)+
  labs(x="Months",y="GWh/month") +
  theme_minimal() + theme(legend.title=element_blank())+ ggtitle("2016: Monthly electricity production and demand")
p4  


#w/o grid import, only 2016
p4 <- ggplot(data=df, aes(x=Months, y=value)) + 
  geom_bar(data=f,stat="identity", aes(fill=factor(variable, levels=c("Hydroelectricity CH","Hydroelectricity BS","CHP", "PV")))) +
  geom_line(data=i, aes(x=Months, y=value,linetype=variable), size=0.8) +
  scale_x_continuous(breaks=seq(1,12,1)) + scale_fill_manual(values=cols)+
  labs(x="Months",y="GWh/month") +
  theme_minimal() + theme(legend.title=element_blank())+ ggtitle("2016: Monthly electricity production and demand")
p4  



#heat
#insert data file name here
data<- Production_heat_2050_cost

df <-melt(as.data.frame(data),c("Months"))

df1 <-subset(df,df$variable %in% c("Months","DH gas", "DH wood", "DH Waste", "DH HP"))

df2 <-subset(df,df$variable %in% c("Months","Oil boilers","Gas boilers","Wood boilers","Waste boilers","HPs", "ST", "DH","Gas HPs", "micro-CHP"))
df5 <-subset(df,df$variable %in% c("Heat demand"))

#cols <- c("Oil boilers" = "#A6CEE3", "Gas boilers" = "#1F78B4", "Wood boilers" = "#B2DF8A", 
#          "Waste boilers" = "#33A02C","HPs"="#FB9A99","ST"="#E31A1C","DH"="#FDBF6F" )

cols <- c("Oil boilers" = "#A6CEE3", "Gas boilers" = "#1F78B4", "Wood boilers" = "#B2DF8A", 
          "Waste boilers" = "#33A02C","HPs"="#FB9A99","ST"="#E31A1C","DH"="#FDBF6F","Gas HPs"="#FF7F00","micro-CHP"= "#CAB2D6")

#"#A6CEE3" "#1F78B4" "#B2DF8A" "#33A02C" "#FB9A99" "#E31A1C" "#FDBF6F" "#FF7F00" "#CAB2D6"



p4 <- ggplot(data=df2, aes(x=Months, y=value)) + 
  geom_bar(data=df2,stat="identity", aes(fill=factor(variable, levels=c("Oil boilers","Gas boilers","Wood boilers","Waste boilers","HPs", "Gas HPs","micro-CHP","DH", "ST")))) +
  geom_line(data=df5, aes(x=Months, y=value,linetype=variable), size=0.8) +
  scale_linetype_manual(values=c("solid"))+
  scale_x_continuous(breaks=seq(1,12,1)) + 
  scale_fill_manual(values=cols) +
  labs(x="Months",y="GWh/month") +
  theme_minimal() + theme(legend.title=element_blank())+ ggtitle("2050: Monthly heat production and demand")
p4



data<- Production_heat_2050_cost

df <-melt(as.data.frame(data),c("Months"))

df1 <-subset(df,df$variable %in% c("Months","DH gas", "DH wood", "DH Waste", "DH HP"))

df2 <-subset(df,df$variable %in% c("Months","Oil boilers","Gas boilers","Wood boilers","Waste boilers","HPs","micro-CHP", "ST", "DH"))
df5 <-subset(df,df$variable %in% c("Heat demand"))



p4 <- ggplot(data=df2, aes(x=Months, y=value)) + 
  geom_bar(data=df2,stat="identity", aes(fill=factor(variable, levels=c("Oil boilers","Gas boilers","Wood boilers","Waste boilers","HPs", "micro-CHP", "DH", "ST")))) +
  geom_line(data=df5, aes(x=Months, y=value,linetype=variable), size=0.8) +
  scale_linetype_manual(values=c("solid"))+
  scale_x_continuous(breaks=seq(1,12,1)) + 
  scale_fill_brewer(palette="Spectral") +
  labs(x="Months",y="GWh/month") +
  theme_minimal() + theme(legend.title=element_blank())+ ggtitle("2050: Monthly heat production and demand")
p4




+facet_grid(.~group )


#heat
#insert data file name here

# other stuff 
drops <- c("H")
df[ , !(names(DF) %in% drops)]

#other stuff
df3<-rbind(df1,df2) 
df3
cols_heat <- c("Oil boilers"="#D73027","Gas boilers"="#F46D43","Wood boilers"="#FDAE61","Waste boilers"="#FEE08B","HPs"="#D9EF8B","DH"="#A6D96A","ST"="#66BD63")
cols_heat_1<-c("DH gas"="#FFF5F0", "DH wood"="#FEE0D2", "DH Waste"="#FCBBA1", "DH HP"="#FC9272")

#other stuff
myColors<-brewer.pal(n=5, name="Paired")

myColors <- brewer.pal(8,"RdGy")
myColors


data<- Production_heat_2020_carbon
df <-melt(as.data.frame(data),c("Months","DH gas", "DH wood", "DH Waste", "DH HP"))
df1 <-subset(df,df$variable %in% c("Months","DH gas", "DH wood", "DH Waste", "DH HP"))
df1$group<-"DH"
df2 <-subset(df,df$variable %in% c("Months","Oil boilers","Gas boilers","Wood boilers","Waste boilers","HPs", "ST"))
df2$group<-"Individual"

df3<-rbind(df1,df2) 

p4 <- ggplot(data=df2, aes(x=Months, y=value)) + 
  geom_bar(data=df2,stat="identity", aes(fill=variable, levels=c("DH gas", "DH wood", "DH Waste", "DH HP"))) +
  scale_x_continuous(breaks=seq(1,12,1)) + 
  scale_fill_manual(values=cols_heat_1) +
  labs(x="Months",y="GWh/month") +
  theme_minimal() + theme(legend.title=element_blank())
p4



