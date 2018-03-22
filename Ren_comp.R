library(plotly)
library(Hmisc)
library(reshape2)
library(ggplot2)
library(plyr)
library(wesanderson)
library(RColorBrewer)
library(readxl)

Renewable_energy <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/Renewable_energy.xlsx")

data<- Renewable_energy


df <-melt(as.data.frame(data), c("Energy"))



p4<-ggplot(data=df, aes(x = variable, y = value, fill=Energy, width = .6)) + 
  geom_bar(stat="identity") +
  labs(x="",y="Energy Supply in 2050 (%)") + theme_light()+
  theme(legend.title=element_blank())+theme(text = element_text(size = 12))+ 
  theme(axis.text.x = element_text(angle = 50, hjust = 1))+ scale_fill_brewer(palette="Set1")
p4

