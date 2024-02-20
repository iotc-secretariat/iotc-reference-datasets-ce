library(httr)
library(iotc.base.common.data)

RAW.EF = EF.raw()
usethis::use_data(RAW.EF, overwrite = TRUE, compress = "gzip")

RAW.CA = CA.raw()
usethis::use_data(RAW.CA, overwrite = TRUE, compress = "gzip")

RAW.CE = CE.raw()
usethis::use_data(RAW.CE, overwrite = TRUE, compress = "gzip")

RSD.CA = CA.raised()
usethis::use_data(RSD.CA, overwrite = TRUE, compress = "gzip")

LAST_UPDATE = Sys.Date()

METADATA = list(
  RAW.EF = list(
    DATA = nrow(RAW.EF),
    LAST_UPDATE = LAST_UPDATE
  ),
  RAW.CA = list(
    DATA = nrow(RAW.CA),
    LAST_UPDATE = LAST_UPDATE
  ),
  RAW.CE = list(
    DATA = nrow(RAW.CE),
    LAST_UPDATE = LAST_UPDATE
  ),
  RSD.CA = list(
    DATA = nrow(RSD.CA),
    LAST_UPDATE = LAST_UPDATE
  )
)
usethis::use_data(METADATA, overwrite = TRUE, compress = "gzip")

BITBUCKET_REPO_URL = "https://api.bitbucket.org/2.0/repositories/iotc-ws/iotc-reference-datasets-ce/downloads"

for(file in list.files("../data", pattern = "*.rda")) {
  log_info(paste0("Uploading '", file, "' to BitBucket repository under ", BITBUCKET_REPO_URL))

  upload_response =
    POST(BITBUCKET_REPO_URL,
         body = list(files = upload_file(paste0("../data/", file))),
         add_headers(
           Authorization = paste0("Bearer ", Sys.getenv("BITBUCKET_UPLOAD_CE_DATASET_TOKEN"))
         )
    )

  log_info(paste0("Upload response: ", upload_response))
}
