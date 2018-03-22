library(plotly)
library(Hmisc)
library(reshape2)
library(ggplot2)
library(plyr)
library(wesanderson)
library(RColorBrewer)
library(readxl)

Cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Cost.xlsx")
Cost_relative <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Cost_relative1.xlsx")
data<- Cost
data<- Cost_relative

df <-melt(as.data.frame(data),c("Year"))

df$cat <- ''

df[df$variable == 'Carbon I' | df$variable =='Carbon Op',]$cat <- "BC Carbon"
df[df$variable == 'Cost I' | df$variable =='Cost Op',]$cat <- "BC Cost"
df[df$variable == 'C1 Cost I' | df$variable =='C1 Cost Op',]$cat <- "C1 Cost"
df[df$variable == 'C1 Carbon I' | df$variable =='C1 Carbon Op',]$cat <- "C1 Carbon"
df[df$variable == 'C2 Cost I' | df$variable =='C2 Cost Op',]$cat <- "C2 Cost"
df[df$variable == 'C3 Cost I' | df$variable =='C3 Cost Op',]$cat <- "C3 Cost"

p4<-ggplot(data=df, aes(x = cat, y = value, fill=variable,width = .6)) + 
  geom_bar(stat = 'identity',position = 'stack') + facet_grid(. ~Year )+
  labs(x="",y="%") +scale_x_discrete(limits = c("BC Carbon","C1 Carbon","BC Cost","C1 Cost","C2 Cost","C3 Cost"))+
  theme_light() + theme(legend.title=element_blank())+theme(text = element_text(size = 12))+
  theme(axis.text.x = element_text(angle = 50, hjust = 1))+ scale_fill_brewer(palette="Paired")
p4


p4<-ggplot(data=df, aes(x = cat, y = value, fill=variable,width = .6)) + 
  geom_bar(stat = 'identity',position = 'stack') + facet_grid(. ~Year )+
  labs(x="",y="mill. CHF/y") +scale_x_discrete(limits = c("BC Carbon","C1 Carbon","BC Cost","C1 Cost","C2 Cost","C3 Cost"))+
  theme_light() + theme(legend.title=element_blank())+theme(text = element_text(size = 12))+
  theme(axis.text.x = element_text(angle = 50, hjust = 1))+ scale_fill_brewer(palette="Paired")
p4
