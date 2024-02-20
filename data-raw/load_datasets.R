library(httr)
library(iotc.base.common.data)

LAST_UPDATE = Sys.Date()
usethis::use_data(LAST_UPDATE, overwrite = TRUE)

RAW.EF = EF.raw(factorize_results = FALSE)
usethis::use_data(RAW.EF, overwrite = TRUE)

RAW.CA = CA.raw(factorize_results = FALSE)
usethis::use_data(RAW.CA, overwrite = TRUE)

RAW.CE = CE.raw(factorize_results = FALSE)
usethis::use_data(RAW.CE, overwrite = TRUE)

RSD.CA = CA.raised(factorize_results = FALSE)
usethis::use_data(RSD.CA, overwrite = TRUE)

BITBUCKET_REPO_URL = paste0("https://api.bitbucket.org/2.0/repositories/iotc-ws/iotc-reference-datasets-ce/downloads")

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
