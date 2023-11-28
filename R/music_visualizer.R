#' @title Display the visualization features relevant to a song
#' 
#' @description
#' Given a song's name, this function displays an object (?)
#' including relevant display features such as singer's information, lyrics, melody, etc.
#' 
#' @param song_name A string character vector identifying an existing song
#' 
#' @return A list of class 'music_visualizer' with the following fields
#' * artist_name
#' * songwriter_name
#' * song_producer_name
#' * song_background
#' * release_date
#' * lyrics
#' * melody
#' 
#' Note that many of these fields may be an empty string

music_visualizer <- function(song_name) {
  
  #where to import/get the information of a song?
  x <- list("", "", "", "", date, {}, png)
  names(x) <- c("artist_name", "songwriter_name", "song_producer_name", "song_background", "release_date", 
                "lyrics", "melody")
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
  
  required_fields <- c("artist_name", "songwriter_name", "song_producer_name", "song_background", 
                       "release_date", "lyrics", "melody")
  
  if (!all(required_fields %in% names(x))) {
    difference <- setdiff(required_fields, names(x))
    stop("music visualizer object is missing the following required fields: ",
         past(difference, collapse = ", "))
  }
  
  char_fields <- c("artist_name", "songwriter_name", "song_producer_name", "song_background")
  
  for (f in char_fields) {
    if (!(is.character(x[[f]]) && length(x[[f]] == 1))) {
      stop("The ", f, "field in a music visualizer object must be a character vector of length 1")
    }
  }
}