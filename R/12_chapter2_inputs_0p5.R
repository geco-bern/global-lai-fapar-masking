# Chapter 2: fixed retained-area weights for the masked fAPAR from script 11.

suppressPackageStartupMessages({
  library(here)
  library(terra)
})

terraOptions(progress = 0, memfrac = 0.25)

ref005 <- rast(here("src", "ref_0p05.nc"))
area005 <- rast(here("src", "area_0p05_km2.nc"))
cci005 <- rast(
  here(
    "output",
    "alpha_0.1",
    "masks",
    "mask_cci",
    "mask_used_frac_fused_alpha0p10_k3_1992-2022_0p05.tif"
  )
)
pasture005 <- rast(
  here(
    "output",
    "alpha_0.1",
    "masks",
    "mask_luh_overlap",
    "mask_luh_overlap_CCI_Gmin0p10_Pmin0p10_beta0p50_1992-2015_0p05_rep.tif"
  )
)
nonveg005 <- rast(
  here(
    "output",
    "alpha_0.1",
    "masks",
    "mask_nonvegetated",
    "mask_nonvegetated_CCI_2007_alphaW0p05_alphaI0p05_0p05.tif"
  )
)

for (r in list(area005, cci005, pasture005, nonveg005)) {
  compareGeom(r, ref005, stopOnError = TRUE)
}

# Use the same fixed exclusions as the masked fAPAR. NA adds no exclusion.
mask005 <- ifel(is.na(cci005), FALSE, cci005 >= 1) |
  ifel(is.na(pasture005), FALSE, pasture005 >= 1) |
  ifel(is.na(nonveg005), FALSE, nonveg005 >= 1)

# Sum retained 0.05-degree areas to 0.5 degrees and convert km2 to m2.
retained_area050 <- aggregate(
  ifel(mask005, 0, area005),
  fact = 10,
  fun = "sum",
  na.rm = TRUE
) * 1e6

names(retained_area050) <- "retained_area_m2"
units(retained_area050) <- "m2"

out_dir <- here("output", "chapter2")
dir.create(out_dir, recursive = TRUE, showWarnings = FALSE)

area_file <- file.path(out_dir, "retained_area_CCI_alpha0p10_pasture_0p5_m2.tif")
writeRaster(retained_area050,
            area_file,
            overwrite = TRUE,
            datatype = "FLT8S")
message("Wrote ", area_file)
