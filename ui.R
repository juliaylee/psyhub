
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

# Define UI for data download app ----
ui <- navbarPage("Welcome!",
             
  # Download tab ----
  tabPanel("Downloading Data",
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Choose dataset ----
      selectInput("dataset", "Choose a dataset:",
                  choices = c("rock", "pressure", "cars")),
      
      # Button
      downloadButton("downloadData", "Download")
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",
                  tabPanel("Summary", verbatimTextOutput("summary")),
                  tabPanel("Table", tableOutput("table"))
      
      )
   )
  )
),
  # Upload tab ----
  tabPanel("Uploading Datasets",
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
             
    # Sidebar panel for inputs ----
    sidebarPanel(
               
      # Input: Select a file ----
      fileInput("file1", "Choose CSV File",
               multiple = TRUE,
               accept = c("text/csv",
                "text/comma-separated-values,text/plain",
                ".csv")),
               
      # Horizontal line ----
      tags$hr(),
               
      # Input: Checkbox if file has header ----
      #checkboxInput("header", "Header", TRUE),
               
      # Input: Select separator ----
      #radioButtons("sep", "Separator",
      #            choices = c(Comma = ",",
      #                        Semicolon = ";",
      #                        Tab = "\t"),
      #            selected = ","),
               
      # Input: Select quotes ----
      #radioButtons("quote", "Quote",
      #            choices = c(None = "",
      #                        "Double Quote" = '"',
      #                        "Single Quote" = "'"),
      #            selected = '"'),
               
      # Horizontal line ----
      #tags$hr(),
               
      # Input: Select number of rows to display ----
      #radioButtons("disp", "Display",
      #            choices = c(Head = "head",
      #                        All = "all"),
      #            selected = "head"),
     
      # Input: Name of Dataset
      textInput("dataset_name", h5("Unique Name for Your Dataset"), 
                value = "Enter text..."), 
    
      # Input: # of Participants
      numericInput("num_part", 
                  h5("Number of Participants"), 
                  value = 100),
    
      # Input: Column Contents
    
      # Input: Correlation Type
      selectInput("correlation_type", h5("Type of correlation used"), 
                  choices = list("polychoric" = 1, "polyserial" = 2,
                                "Pearson" = 3), selected = 1)
    ),
    
      # Submit
      #actionButton("submit", label = "Submit"),
    
     # Main panel for displaying outputs ----
    mainPanel(
    
    # Output: Tabset w/ README and contents ----
    tabsetPanel(type = "tabs",
                tabPanel("README", verbatimTextOutput("dataset_name"), verbatimTextOutput("num_part")),
                tabPanel("Contents", tableOutput("contents"))
                
    )           
    )
             
  )          
)
)

