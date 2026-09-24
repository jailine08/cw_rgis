# Coordinate Reference System

if (!require(pacman)) install.packages("pacman")

pacman::p_load(tidyverse,
               sf,
               mapview)

df_fish <- read_csv("data/data_finsync_nc.csv")

sf_site <- df_fish %>%
  distinct(site_id, lon, lat)%>%
  st_as_sf(coords = c("lon", "lat"),
           crs = 4326)

mapview(sf_site, legend = FALSE)

saveRDS(sf_site, file = "data/sf_finsync_nc.rds")


sf_ft_wgs <- sf_site %>%
  slice(c(1, 2))

sf_ft_utm <- sf_ft_wgs %>%
  st_transform(crs = 32617)

st_distance(sf_ft_utm)


# Exercise ----------------------------------------------------------------

df_quakes <- as_tibble(quakes)
print(df_quakes)

sf_quakes <- st_as_sf(
  df_quakes,
  coords = c("long", "lat"),
  crs = 4326
)
mapview(sf_quakes)

sf_ft_quakes <- sf_quakes%>%
  slice(c(1, 2))

sf_ft_quakes_proj <- st_transform(
  sf_ft_quakes,
  crs = 32760
)
saveRDS(sf_quakes, file = "data/sf_quakes.rds")