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

TOKEN = Sys.getenv("BITBUCKET_UPLOAD_CE_DATASET_TOKEN")

if(TOKEN == "") {
  stop("No 'BITBUCKET_UPLOAD_CE_DATASET_TOKEN' value found in system environment: cannot upload artifacts!")
} else {
  BITBUCKET_REPO_URL = "https://api.bitbucket.org/2.0/repositories/iotc-ws/iotc-reference-datasets-ce/downloads"

  FILES = list.files("../data", pattern = "*.rda")

  if(length(FILES) == 0) {
    stop("No .RDA files found: check that these have been produced and that you are running this script from the right directory (its container folder)")
  }

  for(file in FILES) {
    log_info(paste0("Uploading '", file, "' to BitBucket repository under ", BITBUCKET_REPO_URL))

    upload_response =
      POST(BITBUCKET_REPO_URL,
           body = list(files = upload_file(paste0("../data/", file))),
           add_headers(
             Authorization = paste0("Bearer ", TOKEN)
           )
      )

    log_info(paste0("Upload response: [", status_code(upload_response), "] / ", content(upload_response)))
  }
}
