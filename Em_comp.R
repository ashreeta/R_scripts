library(plotly)
library(Hmisc)
library(reshape2)
library(ggplot2)
library(plyr)
library(wesanderson)
library(RColorBrewer)
library(readxl)

#emissions cost
Em_carb_cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Em_carb_cost.xlsx")

data<- Em_carb_cost

df <-melt(as.data.frame(data),c("Year"))

p4<-ggplot(data=df, aes(x = variable, y = value, fill=variable, width = .6)) + 
  geom_bar(stat="identity") + facet_grid(. ~Year )+
  labs(x="",y="t CO2") + theme_light()+
   theme(legend.title=element_blank())+theme(text = element_text(size = 12))+ 
  theme(axis.text.x = element_text(angle = 50, hjust = 1))+ scale_fill_brewer(palette="Paired")
p4

#emissions per inhabitant cost

Empp_carb_cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Empp_carb_cost.xlsx")
data<- Empp_carb_cost

df <-melt(as.data.frame(data),c("Year"))

p4<-ggplot(data=df, aes(x = variable, y = value, fill=variable, width = .6)) + 
  geom_bar(stat="identity") + facet_grid(. ~Year )+
  labs(x="",y="t CO2/inhabitant") +  theme_light() +
  theme(legend.title=element_blank())+theme(text = element_text(size = 12))+
  theme(axis.text.x = element_text(angle = 50, hjust = 1))+ scale_fill_brewer(palette="Paired")
p4




#emissions cost
Em_comp_cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Em_comp_cost.xlsx")

data<- Em_comp_cost

df <-melt(as.data.frame(data),c("Year"))

p4<-ggplot(data=df, aes(x = variable, y = value, fill=variable, width = .6)) + 
  geom_bar(stat="identity") + facet_grid(. ~Year )+
  labs(x="",y="t CO2") +
  theme_minimal() + theme(legend.title=element_blank())+theme(text = element_text(size = 12))
p4

#emissions per inhabitant cost

Empp_comp_cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Empp_comp_cost.xlsx")
data<- Empp_comp_cost

df <-melt(as.data.frame(data),c("Year"))

p4<-ggplot(data=df, aes(x = variable, y = value, fill=variable, width = .6)) + 
  geom_bar(stat="identity") + facet_grid(. ~Year )+
  labs(x="",y="t CO2/inhabitant") +
  theme_minimal() + theme(legend.title=element_blank())+theme(text = element_text(size = 12))
p4

#emissions carbon
Em_comp_carb <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Em_comp_carb.xlsx")

data<- Em_comp_carb

df <-melt(as.data.frame(data),c("Year"))

p4<-ggplot(data=df, aes(x = variable, y = value, fill=variable, width = .6)) + 
  geom_bar(stat="identity") + facet_grid(. ~Year )+
  labs(x="",y="t CO2") +
  theme_minimal() + theme(legend.title=element_blank())+theme(text = element_text(size = 12))
p4

#emissions per inhabitant carbon

Empp_comp_carb <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Empp_comp_carb.xlsx")
data<- Empp_comp_carb

df <-melt(as.data.frame(data),c("Year"))

p4<-ggplot(data=df, aes(x = variable, y = value, fill=variable, width = .6)) + 
  geom_bar(stat="identity") + facet_grid(. ~Year )+
  labs(x="",y="t CO2/inhabitant") +
  theme_minimal() + theme(legend.title=element_blank())+theme(text = element_text(size = 12))
p4
