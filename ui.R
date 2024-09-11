# Load the static text config.
source("textConfig.R")

# UI.
ui <- fluidPage(
  
  # Add css and fetch the latest css file.
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css?v=1.1")
  ),

  # Position slider over the map.
  # TODO: Possibly expand the date range. Investigate data before 1963.
  tags$div(class = "custom-slider",
           sliderInput(
             "DATE",
             textContent$ui$sliderLabel,
             min = textContent$ui$sliderMin,
             max = textContent$ui$sliderMax,
             value = c(textContent$ui$sliderMin, textContent$ui$sliderMax),
             step = 1,
             sep = ""
           )
  ),
  
  fluidRow(
    # First row: position map on top.
    column(width = textContent$ui$mapColumnWidth,
           leafletOutput("tempMap", height = textContent$ui$mapColumnHeight)
    )
  ),
  
  fluidRow(
    # Second row: position below map.
    column(width = textContent$ui$mapColumnWidth,
           tags$div(class = "notes-card",
                    h5(strong(textContent$ui$descriptionTitle)),
                    p(textContent$ui$descriptionText),
                    p(strong(textContent$ui$dataSourceLabel), textContent$ui$dataSource, a(textContent$ui$link, href = textContent$ui$dataSourceLink)),
                    p(strong(textContent$ui$unitMeasurementLabel), textContent$ui$unitMeasurement, a(textContent$ui$link, href = textContent$ui$unitMeasurementLink)),
                    p(strong(textContent$ui$percentIncreaseCalculationLabel), textContent$ui$percentIncreaseCalculation),
                    p(strong(textContent$ui$limitationsLabel), textContent$ui$limitations)
           )
    )
  )
)