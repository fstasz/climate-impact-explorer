# Annual Temperature Increases Across the U.S.

## Description
This app illustrates average annual temperature increases across the United States from 1963 to 2023. Information on calculation methods and usage can be viewed in the description below the map in the app.

## Data
- **Data Source:** [NOAA Global Summary of the Year](https://www.ncei.noaa.gov/access/search/data-search/global-summary-of-the-year)
- **Data Dictionary:** [Documentation](https://www.ncei.noaa.gov/data/global-summary-of-the-year/doc/GSOY_documentation.pdf)

## Components
- R [Shiny](https://shiny.posit.co/) app development framework was leveraged for developing and deploying the app modules.
- [Leaflet](https://leafletjs.com/) library was leveraged for interactive map visualization, map features, and interactions.
- [dplyr](https://dplyr.tidyverse.org/) library was leveraged for data processing.
- [ColorBrewer](https://colorbrewer2.org/) was leveraged for choosing a colorblind safe color palette.

## Limitations
For some year combinations, temperature data from weather stations was not available. In these cases, the corresponding points on the map are rendered in blue.

## Viewing the App
You can view the live app running [here](https://fstasz.shinyapps.io/tempChange/).

## License
Licensed under the [Apache License 2.0](LICENSE) – See [LICENSE](LICENSE) for details.

Special thanks to [NOAA](https://www.noaa.gov/) for providing the temperature data used in this app.