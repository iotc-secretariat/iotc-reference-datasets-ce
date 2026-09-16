library(iotc.base.common.data)

RAW.EF = EF.raw()
RAW.EF = RAW.EF[, c("SPECIES_SCIENTIFIC", "SPECIES_FAMILY", "SPECIES_ORDER", "IS_IOTC_SPECIES", "IS_SPECIES_AGGREGATE", "IS_SSI") := NULL]
cnames = colnames(RAW.EF)
cl_cnames = cnames[endsWith(cnames, "_CODE")]
cl_to_remove = sapply(cl_cnames, function(x){unlist(strsplit(x,"_CODE"))[1]}, USE.NAMES = F)
RAW.EF = RAW.EF[,(cl_to_remove) := NULL]
usethis::use_data(RAW.EF, overwrite = TRUE, compress = "gzip")

RAW.CA = CA.raw()
RAW.CA = RAW.CA[, c("SPECIES_SCIENTIFIC", "SPECIES_FAMILY", "SPECIES_ORDER", "IS_IOTC_SPECIES", "IS_SPECIES_AGGREGATE", "IS_SSI") := NULL]
cnames = colnames(RAW.CA)
cl_cnames = cnames[endsWith(cnames, "_CODE")]
cl_to_remove = sapply(cl_cnames, function(x){unlist(strsplit(x,"_CODE"))[1]}, USE.NAMES = F)
RAW.CA = RAW.CA[,(cl_to_remove) := NULL]
usethis::use_data(RAW.CA, overwrite = TRUE, compress = "gzip")

RAW.CA_NF = CA.raw(factorize_results = FALSE)
RAW.CA_NF = RAW.CA_NF[, c("SPECIES_SCIENTIFIC", "SPECIES_FAMILY", "SPECIES_ORDER", "IS_IOTC_SPECIES", "IS_SPECIES_AGGREGATE", "IS_SSI") := NULL]
cnames = colnames(RAW.CA_NF)
cl_cnames = cnames[endsWith(cnames, "_CODE")]
cl_to_remove = sapply(cl_cnames, function(x){unlist(strsplit(x,"_CODE"))[1]}, USE.NAMES = F)
RAW.CA_NF = RAW.CA_NF[,(cl_to_remove) := NULL]
usethis::use_data(RAW.CA_NF, overwrite = TRUE, compress = "gzip")

RAW.CE = CE.raw()
RAW.CE = RAW.CE[, c("SPECIES_SCIENTIFIC", "SPECIES_FAMILY", "SPECIES_ORDER", "IS_IOTC_SPECIES", "IS_SPECIES_AGGREGATE", "IS_SSI") := NULL]
cnames = colnames(RAW.CE)
cl_cnames = cnames[endsWith(cnames, "_CODE")]
cl_to_remove = sapply(cl_cnames, function(x){unlist(strsplit(x,"_CODE"))[1]}, USE.NAMES = F)
RAW.CE = RAW.CE[,(cl_to_remove) := NULL]
usethis::use_data(RAW.CE, overwrite = TRUE, compress = "gzip")

RAW.CE_NF = CE.raw(factorize_results = FALSE)
RAW.CE_NF = RAW.CE_NF[, c("SPECIES_SCIENTIFIC", "SPECIES_FAMILY", "SPECIES_ORDER", "IS_IOTC_SPECIES", "IS_SPECIES_AGGREGATE", "IS_SSI") := NULL]
cnames = colnames(RAW.CE_NF)
cl_cnames = cnames[endsWith(cnames, "_CODE")]
cl_to_remove = sapply(cl_cnames, function(x){unlist(strsplit(x,"_CODE"))[1]}, USE.NAMES = F)
RAW.CE_NF = RAW.CE_NF[,(cl_to_remove) := NULL]
usethis::use_data(RAW.CE_NF, overwrite = TRUE, compress = "gzip")

RSD.CA = CA.raised()
RSD.CA = RSD.CA[, c("SPECIES_SCIENTIFIC", "SPECIES_FAMILY", "SPECIES_ORDER", "IS_IOTC_SPECIES", "IS_SPECIES_AGGREGATE", "IS_SSI") := NULL]
cnames = colnames(RSD.CA)
cl_cnames = cnames[endsWith(cnames, "_CODE")]
cl_to_remove = sapply(cl_cnames, function(x){unlist(strsplit(x,"_CODE"))[1]}, USE.NAMES = F)
RSD.CA = RSD.CA[,(cl_to_remove) := NULL]
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
