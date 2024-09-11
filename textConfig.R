textContent <- list(
  ui = list(
    descriptionTitle = "Description",
    descriptionText = "Given a selected date range, the percentage increase in average annual temperature between each year is displayed. Selecting a point in the map displays the Station name and percent increase in temperature at that location.",
    dataSourceLabel = "Data source:",
    dataSource = "National Centers for Environmental Information (NOAA). Source:",
    dataSourceLink = "https://www.ncei.noaa.gov/access/search/data-search/global-summary-of-the-year",
    unitMeasurementLabel = "Unit of measurement:",
    unitMeasurement = "Average Annual Temperature (TAVG). Computed by adding the unrounded annual maximum (TMAX) and minimum (TMIN) temperatures and dividing by 2. Source:",
    unitMeasurementLink = "https://www.ncei.noaa.gov/data/global-summary-of-the-year/doc/GSOY_documentation.pdf",
    percentIncreaseCalculationLabel = "Percent increase calculation:",
    percentIncreaseCalculation = "Computed by subtracting the unrounded annual average temperature (TAVG) of the previous year from that of the current year, dividing by the previous year’s unrounded TAVG, and multiplying by 100.",
    limitations = "Weather stations did not report temperature for specific years in some cases. When this has occurred, points are rendered gray on the map.",
    limitationsLabel = "Limitations:",
    sliderLabel = "Select Date Range",
    link = "Link",
    sliderMin = 1963,
    sliderMax = 2023,
    mapColumnWidth = 12,
    mapColumnHeight = 700 
  ),
  server = list(
    popupDataUnavailable = "<b>Station:</b> %s<br><b>Data unavailable for the selected date range.</b>",
    popupIncrease = "<b>Station:</b> %s<br><b>Increase:</b> %.2f%%",
    legendTitle = "% Increase",
    legendNaLabel = "NA",
    titleHtml = "<div class='map-title'><h4><b>Annual Temperature Increases Across the U.S.</b></h4></div>",
    naColor = "gray"
  ),
  global = list(
    filePath = "data/part-00000-6493846c-82e3-4254-b526-69f47f978877-c000.csv"
  )
)