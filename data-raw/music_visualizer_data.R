## code to prepare `music_visualizer` dataset goes here

library(dplyr)
library(spotifyr)
library(plotly)
library(ggplot2)

id <- 'd0f427dc24ea4235a017135aaa1cd5ba'
secret <- '4866b1333932467cb761e1abd0d669bf'
Sys.setenv(SPOTIFY_CLIENT_ID = id)
Sys.setenv(SPOTIFY_CLIENT_SECRET = secret)
access_token <- get_spotify_access_token()


## now we can get data using spotifyr:
usethis::use_data(music_visualizer_data)

##: existed error when we run this code is "music_visualizer is not an R package".