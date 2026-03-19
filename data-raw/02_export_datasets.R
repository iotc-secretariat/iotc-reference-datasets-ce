# Datasets ####

## Prior to disaggregation ####
RC_RAW = RAW[, .(CATCH = sum(CATCH)), keyby = .(YEAR, FISHING_GROUND_CODE, FISHING_GROUND, FLEET_CODE, FLEET, FISHERY_TYPE_CODE, FISHERY_TYPE, FISHERY_GROUP_CODE, FISHERY_GROUP, FISHERY_CODE, FISHERY, GEAR_CODE, GEAR, SPECIES_CATEGORY_CODE, SPECIES_CATEGORY, SPECIES_CODE, SPECIES, SPECIES_SCIENTIFIC, FATE_TYPE_CODE, FATE_TYPE, FATE_CODE, FATE)]

RC_RAW_NF = RAW_NF[, .(CATCH = sum(CATCH)), keyby = .(YEAR, FISHING_GROUND_CODE, FISHING_GROUND, FLEET_CODE, FLEET, FISHERY_TYPE_CODE, FISHERY_TYPE, FISHERY_GROUP_CODE, FISHERY_GROUP, FISHERY_CODE, FISHERY, GEAR_CODE, GEAR, SPECIES_CATEGORY_CODE, SPECIES_CATEGORY, SPECIES_CODE, SPECIES, SPECIES_SCIENTIFIC, FATE_TYPE_CODE, FATE_TYPE, FATE_CODE, FATE)]

## Best scientific estimates ####
RC_SCI = SCI[, .(CATCH = sum(CATCH)), keyby = .(YEAR, FISHING_GROUND_CODE, FISHING_GROUND, FLEET_CODE, FLEET, FISHERY_TYPE_CODE, FISHERY_TYPE, FISHERY_GROUP_CODE, FISHERY_GROUP, FISHERY_CODE, FISHERY, GEAR_CODE, GEAR, SPECIES_CATEGORY_CODE, SPECIES_CATEGORY, SPECIES_CODE, SPECIES, SPECIES_SCIENTIFIC, FATE_TYPE_CODE, FATE_TYPE, FATE_CODE, FATE)]

# Function to export as CSV and zip
dataset_export = function(DataSet, PathName, rmcsv = FALSE){
  write.csv(DataSet, paste0(PathName, ".csv"), row.names = FALSE)
  csvsizekb = round(file.size(paste0(PathName, ".csv"))/1e3)
  zip::zip(paste0(PathName, ".zip"), paste0(PathName, ".csv"), include_directories = FALSE, mode = "cherry-pick"); zipsizekb = round(file.size(paste0(PathName, ".zip"))/1e3)

  if (rmcsv) unlink(paste0(PathName, ".csv"))

  return(list(csvFileSizeKB = csvsizekb, zipFileSizeKB = zipsizekb))
}

# Export the files ####
IDENTIFIER = "IOTC-DATASETS"

RC_RAW_FILES_SIZE = dataset_export(RC_RAW, paste0("./outputs/datasets/", IDENTIFIER, "-", Sys.Date(), "-RC-RAW-", min(RAW$YEAR), "-", max(RAW$YEAR)), rmcsv = TRUE)

RC_RAW_NF_FILES_SIZE = dataset_export(RC_RAW_NF, paste0("./outputs/datasets/", IDENTIFIER, "-", Sys.Date(), "-RC-RAWFN-", min(RAW_NF$YEAR), "-", max(RAW_NF$YEAR)), rmcsv = TRUE)


RC_SCI_FILES_SIZE = dataset_export(RC_SCI, paste0("./outputs/datasets/", IDENTIFIER, "-", Sys.Date(), "-RC-SCI-", min(SCI$YEAR), "-", max(SCI$YEAR)), rmcsv = TRUE)

