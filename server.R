#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
library(viridis)
library(RColorBrewer)
library(BasketballAnalyzeR)
library(markdown)
library(hrbrthemes)
library(nbapalettes)
library(treemap)
library(d3treeR)
library(graphics)
library(yarrr)
library(fmsb)
dataplayerpoints <- read.csv("~/Documents/players+points.csv")
dataplayerpoints
Embiid2 <- read.csv("~/Documents/Embiid Shot Chart 18/Embiid2.csv")
Embiid2
Teamscorerbreakdown <- read.csv("~/Documents/17/18 top scorer team breakdown.csv", header=FALSE)
Teamscorerbreakdown
twoteamfactors <- read.csv("~/Documents/four factors 20/twoteamfactors.csv")
twoteamfactors


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$distPlot <- renderPlot({ggplot(dataplayerpoints, aes(x=Player, y=Points, fill=Player)) + ggtitle(input$caption) + geom_boxplot(width=input$boxsize) + geom_violin(alpha=input$opacity) + scale_fill_brewer(palette = input$pal) + theme_ipsum()  + theme(plot.title = element_text(size = input$size))})  
   
    output$tree <- renderD3tree({d3tree(treemap(Teamscorerbreakdown, index = c("V1", "V2"), vSize = "V3", type = "index", palette = input$col1), rootname = input$treecap)})
    
    output$shot <- renderPlot({(ggplot(Embiid2, aes(x=X.Point, y=Y.Point, color=X, shape=X)) + geom_point(size=input$pointsize)) + scale_shape_manual(values = c(input$pointshape1, input$pointshape2)) + scale_colour_manual(values = c(input$makecolor,input$misscolor)) + ggtitle(input$shotchartcap) + theme_ipsum()})
    
    output$radar <- renderPlot({radarchart(twoteamfactors, vlcex = input$labelsize, plty= input$linetype, title= input$radartitle, pcol = c("#00A9E0", "#BA0C2F", "#003DA5"), pfcol = yarrr::transparent(c("#582C83", "#FFC72C", "#E35205"), trans.val = input$trans), seg = input$seg)})

    

})
