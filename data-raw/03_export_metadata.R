# Define Data Fields ####

DATA_FIELDS <- data.table::fread("https://github.com/iotc-secretariat/iotc-glossaries/raw/refs/heads/master/inputs/iotc-dataset-fields.csv")

## Geo-referenced Catches ####

CA_FIELDS <- DATA_FIELDS[DATASET == "CA" & CONTEXT == "GENERAL"]

CA_FIELDS[!is.na(`CODE LIST NAME`), `CODE LIST` := paste0("<a href=\"", `CODE LIST URL`, "\">", `CODE LIST NAME`, "</a>")]

CA_FIELDS <- CA_FIELDS[, -c("CODE LIST NAME", "CODE LIST URL")]

## Geo-referenced Efforts ####

EF_FIELDS <- DATA_FIELDS[DATASET == "EF" & CONTEXT == "GENERAL"]

EF_FIELDS[!is.na(`CODE LIST NAME`), `CODE LIST` := paste0("<a href=\"", `CODE LIST URL`, "\">", `CODE LIST NAME`, "</a>")]

EF_FIELDS <- EF_FIELDS[, -c("CODE LIST NAME", "CODE LIST URL")]

## Geo-referenced Catch and Efforts ####
#CE_FIELDS <- fread("./data/CE_FIELDS.csv")[FIELD %in% names(CA), .(FIELD, DEFINITION, `CODE LIST NAME`, `CODE LIST URL`)]

#CE_FIELDS[!is.na(`CODE LIST NAME`), `CODE LIST` := paste0("<a href=\"", `CODE LIST URL`, "\">", `CODE LIST NAME`, "</a>")]

CE_FIELDS <- CE_FIELDS[, -c("CODE LIST NAME", "CODE LIST URL")]
