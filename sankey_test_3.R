library(networkD3)
library(htmlwidgets)
library(htmltools)
library(readxl)
library(data.table)
#carbon data

Sankey_nodes_2016 <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sankey_carbon/Sankey_nodes_2016.xlsx", 
                                col_types = c("numeric", "text", "text", 
                                              "text", "text"))
Sankey_source_target_2016_carbon <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sankey_carbon/Sankey_source_target_2016_carbon.xlsx")

Sankey_nodes_2020 <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sankey_carbon/Sankey_nodes_2020.xlsx", 
                                col_types = c("numeric", "text", "text", 
                                              "text", "text"))
Sankey_source_target_2020_carbon <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sankey_carbon/Sankey_source_target_2020_carbon.xlsx")


Sankey_nodes_2035 <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sankey_carbon/Sankey_nodes_2035.xlsx", 
                                col_types = c("numeric", "text", "text", 
                                              "text", "text"))
Sankey_source_target_2035_carbon <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sankey_carbon/Sankey_source_target_2035_carbon.xlsx")

Sankey_nodes_2050 <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sankey_carbon/Sankey_nodes_2050.xlsx", 
                                col_types = c("numeric", "text", "text", 
                                              "text", "text"))
Sankey_source_target_2050_carbon <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sankey_carbon/Sankey_source_target_2050_carbon.xlsx")



# Data carbon
Nodes<-data.frame(Sankey_nodes_2016)
links<-data.frame(Sankey_source_target_2016_carbon)

Nodes<-data.frame(Sankey_nodes_2020)
links<-data.frame(Sankey_source_target_2020_carbon)

Nodes<-data.frame(Sankey_nodes_2035)
links<-data.frame(Sankey_source_target_2035_carbon)


Nodes<-data.frame(Sankey_nodes_2050)
links<-data.frame(Sankey_source_target_2050_carbon)

#cost data
Sankey_nodes_2020 <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sankey_carbon/Sankey_nodes_2020.xlsx", 
                                col_types = c("numeric", "text", "text", 
                                              "text", "text"))
Sankey_source_target_2020_cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sankey_cost/Sankey_source_target_2020_cost.xlsx")


Sankey_nodes_2035_cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sankey_cost/Sankey_nodes_2035_cost.xlsx", 
                                     col_types = c("numeric", "text", "text", 
                                                   "text"))
Sankey_source_target_2035_cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sankey_cost/Sankey_source_target_2035_cost.xlsx")


Sankey_nodes_2050_cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sankey_cost/Sankey_nodes_2050_cost.xlsx", 
                                     col_types = c("numeric", "text", "text", 
                                                   "text"))

Sankey_source_target_2050_cost <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sankey_cost/Sankey_source_target_2050_cost.xlsx")

# Data cost

Nodes<-data.frame(Sankey_nodes_2020)
links<-data.frame(Sankey_source_target_2020_cost)

Nodes<-data.frame(Sankey_nodes_2035_cost)
links<-data.frame(Sankey_source_target_2035_cost)


Nodes<-data.frame(Sankey_nodes_2050_cost)
links<-data.frame(Sankey_source_target_2050_cost)

#defining colors

names_only <- Sankey_nodes_2016$group
names_quoted <- paste('"',names_only,'"',sep="")
names_concat <- paste(names_quoted, collapse = ",")


colors_only <- Sankey_nodes_2016$color
colors_quoted <- paste('"',colors_only,'"',sep="")
colors_concat <- paste(colors_quoted, collapse = ",")

my_color<- paste(
    'd3.scaleOrdinal() .domain([',
    names_concat,
    ']) .range([', colors_concat,'])',
    sep="")

my_color<- "d3.scaleOrdinal().domain(['1', '2', '3', '4', '5', '6', '7', '8', '9', '10','11','12'])
.range(['#8DD3C7', '#FFFFB3', '#BEBADA', '#FB8072', '#80B1D3', '#FDB462', '#B3DE69', '#FCCDE5', '#D9D9D9', '#BC80BD', '#CCEBC5', '#d35d19']);
"
#colors test
sankeyNetwork(Links = links, Nodes = Nodes, 
              Source = "source", Target = "target",
              Value = "value", NodeID = "Name",NodeGroup="group",  colourScale=my_color,# 
               units = "GWh", nodeWidth = 50,margin = list("left"=100),
              fontSize = 16,iterations = 0) 


browsable(
  tagList(
    tags$h1("2050 Energy flow diagram"),
    sankeyNetwork(Links = links, Nodes = Nodes, 
              Source = "source", Target = "target",
              Value = "value", NodeID = "Name",  colourScale= my_color, NodeGroup="group"
              , units = "GWh", nodeWidth = 50,
              fontSize = 16,iterations = 0) ))


