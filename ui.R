# Load the static text config.
source("textConfig.R")

# UI.
ui <- fluidPage(
  
  # Add css.
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css")
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
    column(width = 12,
           leafletOutput("tempMap", height = 700)
    )
  ),
  
  fluidRow(
    # Second row: position below map.
    column(width = 12,
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