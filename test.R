library(plotly)
library(Hmisc)
library(reshape2)
library(ggplot2)
library(plyr)
library(wesanderson)
library(RColorBrewer)

#ggplot only

#electricity
df <-melt(as.data.frame(Production),c("Months"))
g<- subset(df,df$variable %in% c("PV", "Hydroelectricity BS","Hydroelectricity CH","CHP","Grid Import"))
f<- subset(df,df$variable %in% c("PV", "Hydroelectricity BS","Hydroelectricity CH","CHP"))
h<- subset(df,df$variable %in% c("Demand", "Demand + HPs"))
i<- subset(df,df$variable %in% c("Demand + HPs"))

p4 <- ggplot(data=df, aes(x=Months, y=value)) + 
  geom_bar(data=g,stat="identity", aes(fill=factor(variable,levels=c("Grid Import","Hydroelectricity CH","Hydroelectricity BS","CHP","PV")))) +
  geom_line(data=h, aes(x=Months, y=value,linetype=variable), size=0.8) +
  scale_linetype_manual(values=c("dotdash","solid")) +
  scale_x_continuous(breaks=seq(1,12,1)) + 
  scale_fill_brewer(palette="Paired")+
  labs(x="Months",y="GWh/month") +
  theme_minimal() + theme(legend.title=element_blank())
p4          

#w/o grid import
p4 <- ggplot(data=df, aes(x=Months, y=value)) + 
  geom_bar(data=f,stat="identity", aes(fill=factor(variable,levels=c("Hydroelectricity CH","Hydroelectricity BS","CHP","PV")), label=variable, label2= value)) +
  geom_line(data=i, aes(x=Months, y=value,linetype=variable, label=variable, lable2= value), size=0.8) +
  scale_x_continuous(breaks=seq(1,12,1)) + 
  scale_fill_brewer(palette="Paired")+
  labs(x="Months",y="GWh/month") +
  theme_minimal() + theme(legend.title=element_blank())
p4  



#heat
df <-melt(as.data.frame(Production),c("Months"))






p4<-ggplotly(p4, tooltip = c(y))
p4


  scale_fill_brewer(palette="RdBu") 

#only plotly
data <-Production
p <- plot_ly(data, x = data$Months, y = data$CHP, type = 'bar', name = 'CHP', colors = 'Set3') %>%
  add_trace(y = data$`Hydroelectricity BS`, name = 'Hydroelectricity BS') %>%
  add_trace(y = data$`Hydroelectricity CH`, name = 'Hydroelectricity CH') %>%
  add_trace(y = data$`Grid Import`, name = 'Grid Import') %>%
  add_trace(y = Demands$Demand, type = 'scatter', mode = 'lines', name = 'Electricity Demand',line = list(color = 'black'),
            hoverinfo = "text",
            text = ~paste(Demands$Demand, 'GWh/month')) %>%
  add_trace(y = Demands$`Demand + HPs`, type = 'scatter', mode = 'lines', name = 'Electricity Demand + HPs',line = list(color = 'grey'),
            hoverinfo = "text",
            text = ~paste(Demands$`Demand + HPs`, 'GWh/month')) %>%
  layout(yaxis = list(title = 'GWh/month'), barmode = 'stack', xaxis=list(title="Months"))

p



brewer.pal(n=5, name="Paired")
