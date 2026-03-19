library(iotc.base.common.data)

RAW.EF = EF.raw()
usethis::use_data(RAW.EF, overwrite = TRUE, compress = "gzip")

RAW.CA = CA.raw()
usethis::use_data(RAW.CA, overwrite = TRUE, compress = "gzip")

RAW.CA_NF = CA.raw(factorize_results = FALSE)
usethis::use_data(RAW.CA_NF, overwrite = TRUE, compress = "gzip")

RAW.CE = CE.raw()
usethis::use_data(RAW.CE, overwrite = TRUE, compress = "gzip")

RAW.CE_NF = CE.raw(factorize_results = FALSE)
usethis::use_data(RAW.CE_NF, overwrite = TRUE, compress = "gzip")

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
