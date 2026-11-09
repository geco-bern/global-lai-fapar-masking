# Intermediate Processed Data

This folder contains generated intermediate products used by the LAI and FPAR processing pipeline.

Pipeline scripts generate these files from `data-raw/`.

## Layout

```text
data/
├── frac/
│   ├── cci_frac_0p05/
│   ├── glc_tiles_0p05/
│   ├── glc_maps_0p05/
│   └── glc_frac_0p05/
└── georef/
    ├── georef_lai_0p05/
    └── georef_fpar_0p05/
```

## Land-cover products

`frac/` contains 0.05° categorical and fractional land-cover products.

- `cci_frac_0p05/` contains CCI-based fractions used for mask construction.
- `glc_tiles_0p05/` contains aggregated GLC categorical and grass-fraction tiles.
- `glc_maps_0p05/` contains global categorical maps and grass fractions assembled from the tiles.
- `glc_frac_0p05/` contains the categorical and grass-fraction time stacks used for mask construction.

## Georeferenced LAI and FPAR

`georef/` contains monthly LAI and FPAR fields aligned to the common 0.05° project grid.

- `georef_lai_0p05/`
- `georef_fpar_0p05/`

These products are the direct inputs to masking and subsequent spatial aggregation.

## Conventions

All files use the project reference grids and are generated outputs.
