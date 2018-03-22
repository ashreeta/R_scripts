library(networkD3)
library(htmlwidgets)
library(htmltools)
library(readxl)

Sankey_source_target_2016_carbon <- read_excel("~/WORK_PROJECTS/Iwb/IWB/Results_Final/R_data/Sankey_carbon/Sankey_source_target_2016_carbon.xlsx")
View(Sankey_source_target_2016_carbon)

# Data carbon
Nodes<-data.frame(Sankey_nodes_2016)
links<-data.frame(Sankey_source_target_2016_carbon)

Nodes1<-data.frame(Sankey_nodes_2020)
links1<-data.frame(Sankey_source_target_2020_carbon)

Nodes2<-data.frame(Sankey_nodes_2035)
links2<-data.frame(Sankey_source_target_2035_carbon)

Nodes3<-data.frame(Sankey_nodes_2050)
links3<-data.frame(Sankey_source_target_2050_carbon)


# Data cost
Nodes<-data.frame(Sankey_nodes_2016)
links<-data.frame(Sankey_source_target_2016_carbon)

Nodes1<-data.frame(Sankey_nodes_2020)
links1<-data.frame(Sankey_source_target_2020_cost)

Nodes2<-data.frame(Sankey_nodes_2035_cost)
links2<-data.frame(Sankey_source_target_2035_cost)

Nodes3<-data.frame(Sankey_nodes_2050_cost)
links3<-data.frame(Sankey_source_target_2050_cost)



#plot


sankeyNetwork(Links = links, Nodes = Nodes, 
              Source = "source", Target = "target",
              Value = "value", NodeID = "Name", units = "GWh", nodeWidth = 30,
              fontSize = 16)  

sankeyNetwork(Links = links1, Nodes = Nodes1, 
              Source = "source", Target = "target",
              Value = "value", NodeID = "Name", units = "GWh", nodeWidth = 30,
              fontSize = 16)  

sankeyNetwork(Links = links2, Nodes = Nodes2, 
              Source = "source", Target = "target",
              Value = "value", NodeID = "Name", units = "GWh", nodeWidth = 30,
              fontSize = 16)  

sankeyNetwork(Links = links3, Nodes = Nodes3, 
              Source = "source", Target = "target",
              Value = "value", NodeID = "Name", units = "GWh", nodeWidth = 30,
              fontSize = 16) 

#html

browsable(
    tagList(
      tags$h1("2016 Energy flow diagram"),
      sankeyNetwork(Links = links, Nodes = Nodes, Source = "source",
                    Target = "target", Value = "value", NodeID = "Name",colourScale= my_color, NodeGroup="group",
                    units = "GWh", fontSize = 16, nodeWidth = 50),
      tags$h1("2020 Energy flow diagram"),
      sankeyNetwork(Links = links1, Nodes = Nodes1, Source = "source",
                  Target = "target", Value = "value", NodeID = "Name",colourScale= my_color, NodeGroup="group",
                  units = "GWh", fontSize = 16, nodeWidth = 50),
      tags$h1("2035 Energy flow diagram"),
      sankeyNetwork(Links = links2, Nodes = Nodes2, Source = "source",
                  Target = "target", Value = "value", NodeID = "Name",colourScale= my_color, NodeGroup="group",
                   units = "GWh", fontSize = 16, nodeWidth = 50),
      tags$h1("2050 Energy flow diagram"),
      sankeyNetwork(Links = links3, Nodes = Nodes3, Source = "source",
                    Target = "target", Value = "value", NodeID = "Name",colourScale= my_color, NodeGroup="group",
                    units = "GWh", fontSize = 16, nodeWidth = 50)
))
    


#my_color <- 'd3.scaleOrdinal() .domain(["1", "2","3"]) .range(["blue", "grey", "green"])'

#colors test
sankeyNetwork(Links = links, Nodes = Nodes, 
              Source = "source", Target = "target",
              Value = "value", NodeID = "Name", colourScale=my_color#, NodeGroup="group"
              , units = "GWh", nodeWidth = 30,
              fontSize = 16,iterations = 0) 
