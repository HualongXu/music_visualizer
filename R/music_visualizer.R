#' @title Retrieve metadata relevant albums of an artist
#' 
#' @description
#' Given an artist's name, this function retrieves a dataset from spotify that
#' includes relevant albums' information such as danceability, key, valence, etc.
#' 
#' @param artist_name A string character vector identifying an existing singer
#' 
#' @return A list of class 'music_visualizer' with the following fields
#' * artist_name
#' * album_images
#' * album_release_date
#' * danceability 
#' * valence
#' * track_name
#' * album_name
#' 
#' Note

music_visualizer <- function(artist_name) {
  
  x <- get_artist_audio_features(artist_name) |>
    select(artist_name, album_images, album_release_date, danceability, valence, track_name, album_name)
  x <- new_music_visualizer(x)
  x <- validate_music_visualizer(x)
  x
  
}

new_music_visualizer <- function(x) {
  
  stopifnot(is.list(x))
  
  structure(x,
            class = "music_visualizer")
  
}

validate_music_visualizer <- function(x) {
  
  required_fields <- c("artist_name", "album_images", "album_release_date", "danceability", 
                       "valence", "track_name", "album_name")
  
  if (!all(required_fields %in% names(x))) {
    difference <- setdiff(required_fields, names(x))
    stop("music visualizer object is missing the following required fields: ",
         past(difference, collapse = ", "))
  }
  
  char_fields <- c("artist_name", "album_release_date", "track_name", "album_name")
  
  for (f in char_fields) {
    if (!(is.character(x[[f]]) && length(x[[f]] == 1))) {
      stop("The ", f, "field in a music visualizer object must be a character vector of length 1")
    }
  }
  
  double_fields <- c("danceability", "valence")
  
  for (f in double_fields) {
    if (!is.double(x[[f]])) {
      stop("The", f, "field in a music visualizer object must be a double")
    }
  }
  
  return(x)
}

#' Visualize the relevant features
#' 
#' 