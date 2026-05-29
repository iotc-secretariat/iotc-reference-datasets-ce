library(httr)
library(iotc.core.utils.misc)

# Load the data on the GitHub repository ####
source("./data-raw/01_load_datasets.R")

# Generate the datasets ####
source("./data-raw/02_export_datasets.R")

# TO DO - create converters between legacy and new formats
# View [Miguel].[dbo].[1NC_WebPageFILE]: RAW | "Z:/Public datasets/2025-01-14/IOTC-DATASETS-2025-01-14-NC-ALL_1950-2023.xlsx"
# Table [IOTDB].[dbo].[est_NCdissag]: SCI | "Z:/Public datasets/2025-01-14/IOTC-DATASETS-2025-01-14-NC-SCI_1950-2023.xlsx"

# Generate dataset description ###
setwd("./data-raw/")
source("03_export_metadata.R")
setwd("..")

## Prior to disaggregation ####

### Raw dataset ####
render("./rmd/01_CA_metadata.Rmd",
       output_dir = paste0("./outputs/html/", as.character(Sys.Date())),
       output_file = paste0("CA_metadata.html")
)

### Factorised dataset ####

# Only the main species and gears are considered and all the rest is aggregated under 'UNCL'
# The factorisation is required to use the IOTC colour palettes (retricted to )
render("./rmd/02_EF_metadata.Rmd",
       output_dir = paste0("./outputs/html/", as.character(Sys.Date())),
       output_file = paste0("EF_metadata.html")
)

## Best scientific estimates ####s
render("./rmd/03_CE_metadata.Rmd",
       output_dir = paste0("./outputs/html/", as.character(Sys.Date())),
       output_file = paste0("CE_metadata.html")
)

# Export datasets to Zenodo with Geoflow ####
# To develop as part of SWIOP
