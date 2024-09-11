# Load the static text config.
source("textConfig.R")

# server.R
server <- function(input, output, session) {
  
  filteredData <- reactive({
    startYear <- input$DATE[1]
    endYear <- input$DATE[2]
    
    # Filter data to include only selected years.
    selectedDateRange <- data %>%
      filter(DATE %in% c(startYear, endYear))
    
    # Calculate percent increase and handle missing values by adding NA (Not Available).
    percentIncrease <- selectedDateRange %>%
      group_by(NAME, LONGITUDE, LATITUDE) %>%
      summarize(
        startTemp = ifelse(any(DATE == startYear & !is.na(TAVG)), TAVG[DATE == startYear], NA),
        endTemp = ifelse(any(DATE == endYear & !is.na(TAVG)), TAVG[DATE == endYear], NA),
        increase = ifelse(is.na(startTemp) | is.na(endTemp), NA, (endTemp - startTemp) / startTemp * 100),
        .groups = "drop"
      )
    
    percentIncrease
  })

  # HTML for the title.
  titleHtml <- textContent$server$titleHtml
  
  output$tempMap <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      setView(lng = -92, lat = 41, zoom = 5) %>%
      addControl(html = titleHtml, position = "topright")
  })
  
  # Use leafletProxy for adding the circle markers, legend, and title on the map.
  observe({
    leafletProxy("tempMap", data = filteredData()) %>%
      clearMarkers() %>%
      addCircleMarkers(
        ~LONGITUDE, 
        ~LATITUDE,
        weight = 3,
        color = ~ifelse(is.na(increase), textContent$server$naColor, getColor(increase)),
        radius = ~ifelse(is.na(increase), 5, increase / 2),
        popup = ~ifelse(
          is.na(increase),
          sprintf(textContent$server$popupDataUnavailable, NAME),
          sprintf(textContent$server$popupIncrease, NAME, round(increase, 2))
        )
      ) %>%
      clearControls() %>%
      addLegend(
        "bottomright", 
        pal = colorNumeric(palette = c('#fee5d9', '#cb181d'), domain = c(filteredData()$increase, NA), na.color = textContent$server$naColor),
        values = ~increase,
        labFormat = labelFormat(prefix = "", suffix = "%", between = " to "),
        title = textContent$server$legendTitle,
        na.label = textContent$server$legendNaLabel,
        opacity = 1
      ) %>%
      addControl(
        html = titleHtml,
        position = "topright"
      )
  })
  
  # Helper functions.
  
  # Get color for the map over range to illustrate cooler to warmer temps.
  getColor <- function(d) {
    ifelse(d > 10, '#cb181d',
           ifelse(d > 5, '#fb6a4a',
                  ifelse(d > 2, '#fcae91',
                         ifelse(d > 0, '#fee5d9', '#fee5d9'))))
  }
}