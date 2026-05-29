# Datasets ####

## Prior to disaggregation ####
EF <- RAW.EF[, .(EFFORT = sum(EFFORT)), keyby = .(YEAR, QUARTER, MONTH_START, MONTH_END, FISHING_GROUND_CODE, FISHING_GROUND, FLEET_CODE, FLEET, FISHERY_TYPE_CODE, FISHERY_TYPE, FISHERY_GROUP_CODE, FISHERY_GROUP, FISHERY_CODE, FISHERY, GEAR_CODE, GEAR, SCHOOL_TYPE_CODE, EFFORT_UNIT_CODE)]

CA <- RAW.CA[, .(CATCH = sum(CATCH)), keyby = .(YEAR, QUARTER, MONTH_START, MONTH_END, FISHING_GROUND_CODE, FISHING_GROUND, FLEET_CODE, FLEET, FISHERY_TYPE_CODE, FISHERY_TYPE, FISHERY_GROUP_CODE, FISHERY_GROUP, FISHERY_CODE, FISHERY, GEAR_CODE, GEAR, CATCH_SCHOOL_TYPE_CODE, SPECIES_CATEGORY_CODE, SPECIES_CATEGORY, SPECIES_CODE, SPECIES, SPECIES_SCIENTIFIC, CATCH_UNIT_CODE )]

## Best scientific estimates ####
CE <- RAW.CE[, .(CATCH = sum(CATCH)), keyby = .(YEAR, QUARTER, MONTH_START, MONTH_END,  FISHING_GROUND_CODE, FISHING_GROUND, FLEET_CODE, FLEET, FISHERY_TYPE_CODE, FISHERY_TYPE, FISHERY_GROUP_CODE, FISHERY_GROUP, FISHERY_CODE, FISHERY, GEAR_CODE, GEAR, EFFORT_SCHOOL_TYPE_CODE, CATCH_SCHOOL_TYPE_CODE, EFFORT, EFFORT_UNIT_CODE, SPECIES_CATEGORY_CODE, SPECIES_CATEGORY, SPECIES_CODE, SPECIES, SPECIES_SCIENTIFIC, CATCH_UNIT_CODE, FATE_TYPE_CODE, FATE_TYPE, FATE_CODE, FATE)]

# Function to export as CSV and zip
dataset_export = function(DataSet, PathName, rmcsv = FALSE){
  write.csv(DataSet, paste0(PathName, ".csv"), row.names = FALSE)
  csvsizekb = round(file.size(paste0(PathName, ".csv"))/1e3)
  zip::zip(paste0(PathName, ".zip"), paste0(PathName, ".csv"), include_directories = FALSE, mode = "cherry-pick"); zipsizekb = round(file.size(paste0(PathName, ".zip"))/1e3)

  if (rmcsv) unlink(paste0(PathName, ".csv"))

  return(list(csvFileSizeKB = csvsizekb, zipFileSizeKB = zipsizekb))
}

# Export the files ####
IDENTIFIER <- "IOTC-DATASETS"

datasetPath <- paste0("./outputs/datasets/", as.character(Sys.Date()))

if (!exists(datasetPath)) dir.create(path = datasetPath, showWarnings = FALSE)

CA_FILES_SIZE <- dataset_export(CA, paste0(datasetPath, "/", IDENTIFIER, "-CA-", min(RAW.CA$YEAR), "-", max(RAW.CA$YEAR)), rmcsv = TRUE)

EF_FILES_SIZE <- dataset_export(EF, paste0(datasetPath, "/", IDENTIFIER, "-EF-", min(RAW.EF$YEAR), "-", max(RAW.EF$YEAR)), rmcsv = TRUE)

CE_FILES_SIZE <- dataset_export(CE, paste0(datasetPath, "/", IDENTIFIER, "-CE-", min(RAW.CE$YEAR), "-", max(RAW.CE$YEAR)), rmcsv = TRUE)

