[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

# UK postcodes to NUTS statistical regions

## Info
The code converts postcodes units (e.g. TS25 5ND) to postcodes areas (e.g. TS). It then assigns postcodes to Nomenclature of Territorial Units for Statistics (NUTS) codes of the United Kingdom (UK).

The 3 levels of NUTS are:

| Level  | Corresponding subdivisions                                             | #   |
|--------|------------------------------------------------------------------------|-----|
| NUTS 1 | Wales,                                                                 | 12  |
|        | Scotland,                                                              |     |
|        | Northern Ireland,                                                      |     |
|        | 9 statistical regions in England                                       |     |
| NUTS 2 | Northern Ireland,                                                      | 40  |
|        | counties in England (most grouped),                                    |     |
|        | groups of districts in Greater London,                                 |     |
|        | groups of unitary authorities in Wales,                                |     |
|        | groups of council areas in Scotland                                    |     |
| NUTS 3 | counties, unitary authorities, or districts in England (some grouped), | 174 |
|        | groups of unitary authorities in Wales,                                |     |
|        | groups of council areas in Scotland,                                   |     |
|        | groups of districts in Northern Ireland                                |     |

## Contents
- `input`  : input `.csv` files for conversion
- `output` : output `.csv` converted table

## Cite
> Galanakis, Y. (2021). Converting UK postcodes to NUTS regions (Version 1.0) [Computer software]. https://github.com/ygalanak/UKpc2NUTS


## Feedback
Communicate any feedback, [here](mailto:galanakis.gian@gmail.com)
