# Load the static text config.
source("textConfig.R")

# global.R
# install.packages(c("shiny", "leaflet", "dplyr"))
library(shiny)
library(leaflet)
library(dplyr)

# Load the temperature data.
data <- read.csv(textContent$global$filePath)