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
        .groups = 'drop'
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
        color = ~ifelse(is.na(increase), 'gray', getColor(increase)),
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
        pal = colorNumeric(palette = c('#FFEDA0', '#800026'), domain = c(filteredData()$increase, NA), na.color = 'gray'),
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
  
  # Define a function to get color for the map over range to illustrate cooler to warmer temps.
  getColor <- function(d) {
    ifelse(d > 10, '#800026',
           ifelse(d > 5, '#BD0026',
                  ifelse(d > 2, '#E31A1C',
                         ifelse(d > 0, '#FC4E2A', '#FFEDA0'))))
  }
}