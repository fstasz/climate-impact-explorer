# Annual Temperature Increases Across the U.S.

## Description
This app illustrates average annual temperature increases across the United States from 1963 to 2023. Information on calculation methods and usage can be viewed in the description below the map in the app.

## Data
- **Data Source:** [NOAA Global Summary of the Year](https://www.ncei.noaa.gov/access/search/data-search/global-summary-of-the-year)
- **Data Dictionary:** [Documentation](https://www.ncei.noaa.gov/data/global-summary-of-the-year/doc/GSOY_documentation.pdf)

## Components
-	The R [Shiny](https://shiny.posit.co/) app development framework was leveraged for developing and deploying the app modules.
-	The [Leaflet](https://leafletjs.com/) library was leveraged for interactive map visualization, map features, and interactions.

## Limitations
Weather stations did not report temperature for specific years in some cases. When this has occurred, points are rendered gray on the map.

## Viewing the App
You can view the live app running [here](https://fstasz.shinyapps.io/tempChange/).

## License
Licensed under the [Apache License 2.0](LICENSE) – See [LICENSE](LICENSE) for details.

Thank you to [NOAA](https://www.noaa.gov/) for providing the temperature data used in this app.