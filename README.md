# Georeferenced catch and effort datasets

This R project is used to build the `iotc.data.reference.datasets.CE` R package and contains all necessary code and resources to create the catch and effort datasets from the data currently available in the IOTC databases.

It uses the `iotc.base.common.data` library to access the current data storage (`IOTDB`) but does not explicitly depends on it. This means that the final package can be used in other R projects / scripts that need any of the exported datasets, without introducing any type of dependency from the IOTC databases.

In fact, *live* access to the IOTC databases is only required when **building** the project.

## How to initialise the datasets

Simply run the `load_datasets.R` script included under the `data-raw` folder.

The script will take care of:

-   loading all current *raw* effort data (`IOTDB`.`dbo`.`V_LEGACY_EF`), *raw* catch and effort data (`IOTDB`.`dbo`.`V_LEGACY_CE`), and *raw* catch data (`IOTDB`.`dbo`.`V_LEGACY_CA`) using the IOTC data libraries
-   loading the *raised* catch data in weight and number (`WP_CE_raised`.`dbo`.`CA_RAISED`]) for the five major IOTC species, i.e., *albacore tuna*, *bigeye tuna*, *skipjack tuna*, *swordfish*, and *yellowfin tuna*
-   producing the `.rda` R data files corresponding to each of the four retained catch datasets above, eventually storing them under the `data` folder of the project

## How to build the package

Run the `build_and_upload.R` script.

This will:

-   load all necessary datasets (see above)
-   build the package
-   upload the `.rda` dataset files and the built package (as a `.tar.gz` file) onto the [*Downloads* section](https://bitbucket.org/iotc-ws/iotc-reference-datasets-ce/downloads/) of the BitBucket repository

For this to work, it is necessary to configure in advance the `BITBUCKET_UPLOAD_CE_DATASET_TOKEN` as an environment variable that should be assigned an access token created for the specific repository (with the `repository:write` OAuth 2.0 scope).

The creation of the token is generally [performed by the repository administrators](https://support.atlassian.com/bitbucket-cloud/docs/create-a-repository-access-token/) and the tokens, once created, shall be stored securely as they won't be accessible again after the creation.

See also the specific section of the [BitBucket cloud REST API](https://developer.atlassian.com/cloud/bitbucket/rest/api-group-downloads/#api-repositories-workspace-repo-slug-downloads-post).

## How to install the package

Build the package first, then from a command shell run:

```         
Rcmd.exe INSTALL --preclean --no-multiarch --with-keep.source iotc-reference-datasets-ce
```

or select `Build` / `Install package` from within R studio

## Publicly exported package content

### Datasets

1.  `RAW.EF` - *raw* georeferenced effort data
2.  `RAW.CE` - *raw* georeferenced catch and effort data
3.  `RAW.CA` - *raw* georeferenced catch data
4.  `RSD.CA` - *raised* georeferenced catch data for the five major IOTC species
5.  `LAST_UPDATE` - the date of last update / production of the datasets

## Structure of the datasets

### `RAW.EF`

-   `YEAR` \< *to be described* \>
-   `QUARTER` \< *to be described* \>
-   `MONTH_START` \< *to be described* \>
-   `MONTH_END` \< *to be described* \>
-   `FISHING_GROUND_CODE` \< *to be described* \>
-   `FISHING_GROUND` \< *to be described* \>
-   `FLEET_CODE` \< *to be described* \>
-   `FLEET` \< *to be described* \>
-   `FISHERY_TYPE_CODE` \< *to be described* \>
-   `FISHERY_TYPE` \< *to be described* \>
-   `FISHERY_GROUP_CODE` \< *to be described* \>
-   `FISHERY_GROUP` \< *to be described* \>
-   `FISHERY_CODE` \< *to be described* \>
-   `FISHERY` \< *to be described* \>
-   `GEAR_CODE` \< *to be described* \>
-   `GEAR` \< *to be described* \>
-   `SCHOOL_TYPE_CODE` \< *to be described* \>
-   `EFFORT` \< *to be described* \>
-   `EFFORT_UNIT_CODE` \< *to be described* \>

### `RAW.CE`

-   `YEAR` \< *to be described* \>
-   `QUARTER` \< *to be described* \>
-   `MONTH_START` \< *to be described* \>
-   `MONTH_END` \< *to be described* \>
-   `FISHING_GROUND_CODE` \< *to be described* \>
-   `FISHING_GROUND` \< *to be described* \>
-   `FLEET_CODE` \< *to be described* \>
-   `FLEET` \< *to be described* \>
-   `FISHERY_TYPE_CODE` \< *to be described* \>
-   `FISHERY_TYPE` \< *to be described* \>
-   `FISHERY_GROUP_CODE` \< *to be described* \>
-   `FISHERY_GROUP` \< *to be described* \>
-   `FISHERY_CODE` \< *to be described* \>
-   `FISHERY` \< *to be described* \>
-   `GEAR_CODE` \< *to be described* \>
-   `GEAR` \< *to be described* \>
-   `EFFORT_SCHOOL_TYPE_CODE` \< *to be described* \>
-   `CATCH_SCHOOL_TYPE_CODE` \< *to be described* \>
-   `EFFORT` \< *to be described* \>
-   `EFFORT_UNIT_CODE` \< *to be described* \>
-   `IUCN_STATUS_CODE` \< *to be described* \>
-   `IUCN_STATUS` \< *to be described* \>
-   `SPECIES_WP_CODE` \< *to be described* \>
-   `SPECIES_WP` \< *to be described* \>
-   `SPECIES_GROUP_CODE` \< *to be described* \>
-   `SPECIES_GROUP` \< *to be described* \>
-   `SPECIES_CATEGORY_CODE` \< *to be described* \>
-   `SPECIES_CATEGORY` \< *to be described* \>
-   `SPECIES_CODE` \< *to be described* \>
-   `SPECIES` \< *to be described* \>
-   `SPECIES_SCIENTIFIC` \< *to be described* \>
-   `SPECIES_FAMILY` \< *to be described* \>
-   `SPECIES_ORDER` \< *to be described* \>
-   `IS_IOTC_SPECIES` \< *to be described* \>
-   `IS_SPECIES_AGGREGATE` \< *to be described* \>
-   `IS_SSI` \< *to be described* \>
-   `CATCH` \< *to be described* \>
-   `CATCH_UNIT_CODE` \< *to be described* \>
-   `FATE_TYPE_CODE` \< *to be described* \>
-   `FATE_TYPE` \< *to be described* \>
-   `FATE_CODE` \< *to be described* \>
-   `FATE` \< *to be described* \>
-   `RAISING` \< *to be described* \>
-   `RAISE_CODE` \< *to be described* \>

### `RAW.CA`

-   `YEAR` \< *to be described* \>
-   `QUARTER` \< *to be described* \>
-   `MONTH_START` \< *to be described* \>
-   `MONTH_END` \< *to be described* \>
-   `FISHING_GROUND_CODE` \< *to be described* \>
-   `FISHING_GROUND` \< *to be described* \>
-   `FLEET_CODE` \< *to be described* \>
-   `FLEET` \< *to be described* \>
-   `FISHERY_TYPE_CODE` \< *to be described* \>
-   `FISHERY_TYPE` \< *to be described* \>
-   `FISHERY_GROUP_CODE` \< *to be described* \>
-   `FISHERY_GROUP` \< *to be described* \>
-   `FISHERY_CODE` \< *to be described* \>
-   `FISHERY` \< *to be described* \>
-   `GEAR_CODE` \< *to be described* \>
-   `GEAR` \< *to be described* \>
-   `CATCH_SCHOOL_TYPE_CODE` \< *to be described* \>
-   `IUCN_STATUS_CODE` \< *to be described* \>
-   `IUCN_STATUS` \< *to be described* \>
-   `SPECIES_WP_CODE` \< *to be described* \>
-   `SPECIES_WP` \< *to be described* \>
-   `SPECIES_GROUP_CODE` \< *to be described* \>
-   `SPECIES_GROUP` \< *to be described* \>
-   `SPECIES_CATEGORY_CODE` \< *to be described* \>
-   `SPECIES_CATEGORY` \< *to be described* \>
-   `SPECIES_CODE` \< *to be described* \>
-   `SPECIES` \< *to be described* \>
-   `SPECIES_SCIENTIFIC` \< *to be described* \>
-   `SPECIES_FAMILY` \< *to be described* \>
-   `SPECIES_ORDER` \< *to be described* \>
-   `IS_IOTC_SPECIES` \< *to be described* \>
-   `IS_SPECIES_AGGREGATE` \< *to be described* \>
-   `IS_SSI` \< *to be described* \>
-   `CATCH` \< *to be described* \>
-   `CATCH_UNIT_CODE` \< *to be described* \>
-   `FATE_TYPE_CODE` \< *to be described* \>
-   `FATE_TYPE` \< *to be described* \>
-   `FATE_CODE` \< *to be described* \>
-   `FATE` \< *to be described* \>
-   `RAISING` \< *to be described* \>
-   `RAISE_CODE` \< *to be described* \>

### `RSD.CA`

-   `YEAR` \< *to be described* \>
-   `QUARTER` \< *to be described* \>
-   `MONTH_START` \< *to be described* \>
-   `MONTH_END` \< *to be described* \>
-   `FISHING_GROUND_CODE` \< *to be described* \>
-   `FISHING_GROUND` \< *to be described* \>
-   `FLEET_CODE` \< *to be described* \>
-   `FLEET` \< *to be described* \>
-   `FISHERY_TYPE_CODE` \< *to be described* \>
-   `FISHERY_TYPE` \< *to be described* \>
-   `FISHERY_GROUP_CODE` \< *to be described* \>
-   `FISHERY_GROUP` \< *to be described* \>
-   `FISHERY_CODE` \< *to be described* \>
-   `FISHERY` \< *to be described* \>
-   `GEAR_CODE` \< *to be described* \>
-   `GEAR` \< *to be described* \>
-   `CATCH_SCHOOL_TYPE_CODE` \< *to be described* \>
-   `IUCN_STATUS_CODE` \< *to be described* \>
-   `IUCN_STATUS` \< *to be described* \>
-   `SPECIES_WP_CODE` \< *to be described* \>
-   `SPECIES_WP` \< *to be described* \>
-   `SPECIES_GROUP_CODE` \< *to be described* \>
-   `SPECIES_GROUP` \< *to be described* \>
-   `SPECIES_CATEGORY_CODE` \< *to be described* \>
-   `SPECIES_CATEGORY` \< *to be described* \>
-   `SPECIES_CODE` \< *to be described* \>
-   `SPECIES` \< *to be described* \>
-   `SPECIES_SCIENTIFIC` \< *to be described* \>
-   `SPECIES_FAMILY` \< *to be described* \>
-   `SPECIES_ORDER` \< *to be described* \>
-   `IS_IOTC_SPECIES` \< *to be described* \>
-   `IS_SPECIES_AGGREGATE` \< *to be described* \>
-   `IS_SSI` \< *to be described* \>
-   `CATCH` \< *to be described* \>
-   `CATCH_UNIT_CODE` \< *to be described* \>
-   `CATCH_IN_NUMBERS` \< *to be described* \>
