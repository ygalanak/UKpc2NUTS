#---
# Postcodes to NUTS 1, 2 and 3 CONVERSION
# Yannis Galanakis; <i.galanakis@kent.ac.uk> | <galanakis.gian@gmail.com>
# March 2021
#---

# Libraries
packages <- c('tidyverse', 'stringr')
pkg_notinstall <-  packages[!(packages %in% installed.packages()[,"Package"])]

lapply(pkg_notinstall, install.packages, dependencies = TRUE)
lapply(packages, library, character.only = TRUE)

# Read data of postcode unit and NUTS3
pcNUTS3 <- read.csv("input/pc2020_UK_NUTS-2021_v.3.0.csv", sep=";")

# Replace all except letters, numbers, & blank space with "":
pcNUTS3$CODE  <- gsub("([^A-Za-z0-9 ])+", "",pcNUTS3$CODE)
pcNUTS3$NUTS3 <- gsub("([^A-Za-z0-9 ])+", "",pcNUTS3$NUTS3)

# Rename variables
pcNUTS3 <- pcNUTS3 %>% rename (postcodeUnit = CODE)
pcNUTS3 <- pcNUTS3 %>% rename (NUTS318CD    = NUTS3)

# Read data NUTS3
NUTS3 <- read.csv("input/NUTS3.csv")
NUTS3 <- NUTS3[-c(3)] # drop FID
NUTS3 <- NUTS3 %>% rename(NUTS318CD = ï..NUTS318CD)

# Merge name of NUTS3
pcNUTS3 <- merge(pcNUTS3, NUTS3, by="NUTS318CD")

# generate other forms of postcode
pcNUTS3$postcodeArea <- sub("^([[:alpha:]]*).*", "\\1", pcNUTS3$postcodeUnit)

# Read data NUTS2 and NUTS1
NUTS1_2 <- read.csv("input/NUTS2_1.csv")
NUTS1_2 <- NUTS1_2 %>% rename (NUTS218CD = ï..NUTS218CD)
# Generate NUTS218CD in NUTS3 file to merge
pcNUTS3$NUTS218CD <- str_sub(pcNUTS3$NUTS318CD, end=-2)

# Final merge
pcNUTS <- merge(pcNUTS3, NUTS1_2, by="NUTS218CD")
write.csv(pcNUTS, "output/UKpc2NUTS.csv", row.names = F)
