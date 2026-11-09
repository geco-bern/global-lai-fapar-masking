# GLC_FCS30D v2

The workflow uses the original 30 m GLC_FCS30D version 2 archives from Zenodo record [15063683](https://doi.org/10.5281/zenodo.15063683).

## Download

The record contains 36 ZIP archives (approximately 135.8 GB). The archives belong directly in `data-raw/GLC_FCS30D/`. ZIP files are ignored by Git.

## Local aggregation

Each nominal 5-degree tile contains three bands for 1985, 1990, and 1995 and 23 annual bands for 2000--2022. The workflow aggregates the native tiles to 0.05° categorical and grass-fraction products. Generated tiles are stored under `data/frac/glc_tiles_0p05/`, global maps under `data/frac/glc_maps_0p05/`, and time stacks under `data/frac/glc_frac_0p05/`.

```bash
make
```
