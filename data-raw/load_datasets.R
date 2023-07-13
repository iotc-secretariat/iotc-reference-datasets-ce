library(iotc.base.common.data)
library(lubridate)

LAST_UPDATE = today(tzone = "UTC")
usethis::use_data(LAST_UPDATE, overwrite = TRUE)

RAW.EF = EF.raw(factorize_results = FALSE)
usethis::use_data(RAW.EF, overwrite = TRUE)

RAW.CA = CA.raw(factorize_results = FALSE)
usethis::use_data(RAW.CA, overwrite = TRUE)

RAW.CE = CE.raw(factorize_results = FALSE)
usethis::use_data(RAW.CE, overwrite = TRUE)
