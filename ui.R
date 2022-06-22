#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
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

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Some Visualizations"),
  
  # Sidebar with a slider input for number of bins
  navbarPage("Visualization",
             tabPanel("Violin",
                      sidebarLayout(
                        sidebarPanel(
                          textInput('caption', 'Change Title', value = 'Top 5 Scorers 17/18 NBA Season'),    
                          numericInput('size', 'Change Size of Title', 15, min = 8, max =25, step = 1 ),
                          selectInput('pal', 'Choose Violin Colors', 
                                      choices = c('Dark2', "Accent",'Pastel1', 'Pastel2', 'Set1', 'Paired')),
                          numericInput('opacity', 'Change the Opacity of the Violin', .5 , min = .1, max = 1, step = .1
                          ), 
                          numericInput('boxsize', 'Width of Boxplot', .25, min = .1, max = .5, step = .05),
                          
                          
                        ),
                        
                        # Show a plot of the generated distribution
                        mainPanel(HTML("<h1></h1>"),
                                  plotOutput("distPlot")
                        )
                      )
             ), 
             tabPanel("Tree Map",
                      sidebarLayout(
                        sidebarPanel(
                          textInput('treecap', "Change Header", value = "17/18 NBA Team Scoring Breakdown"),
                          selectInput('col1', 'Choose Tree Colors', 
                                      choices = c('Accent', 'Dark2','Pastel1', 'Pastel2', 'Set1', 'Paired'))
                        ),
                        
                        mainPanel= d3tree2Output("tree")
                        
                        
                      )),
             tabPanel("Shot Chart",
                      sidebarLayout(
                        sidebarPanel(
                          textInput('shotchartcap', 'Change Title', value = 'Joel Embiid 17/18 Opening Night Shot Chart'),
                          numericInput('pointshape1', 'Make Shape', 16, min=0, max=25, step=1), 
                          numericInput('pointshape2', 'Miss Shape', 4, min = 0, max = 25, step = 1),
                          selectInput('makecolor', 'Make Color', choices = c('green', 'red', 'blue', 'purple', 'black' )),
                          selectInput('misscolor', 'Miss Color', choices = c('red', 'green', 'blue', 'purple', 'black')),
                          numericInput('pointsize', 'Point Size', 4, min = 1, max = 8, step = 1)
                        ),
                        
                        mainPanel(HTML("<h1></h1>"),
                                  plotOutput("shot")))),
             
             tabPanel("Radar Chart",
                      
                      sidebarLayout(
                        sidebarPanel(
                          textInput('radartitle', "Change Title", value = 'Jazz, Rockets, and Knicks 20/21 Four Factors'),
                          numericInput('labelsize', 'Factor Label Size', 1, min=.6, max=1.2, step=.1),
                          numericInput('trans', 'Transparency of Plot Color', .7, min=.1, max = 1, step = .1),
                          numericInput('linetype', 'Line Type of Plot', 1, min = 1, max = 6, step = 1),
                          numericInput('seg', 'Number of Segments', 6, min = 4, max=12, step = 1)),
                        
                        mainPanel = (
                          plotOutput("radar")
                        )))
             
  )))