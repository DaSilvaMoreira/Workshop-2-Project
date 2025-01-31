#' Generate a small dataset
#'
#' This function returns a small data frame of random numbers.
#'
#' @param n The number of rows to generate.
#' @return A data.frame with two columns of random normal data.
#' @export
generate_data <- function(n = 5) {
  set.seed(123)  # for reproducibility
  df <- data.frame(
    colA = rnorm(n),
    colB = rnorm(n)
  )
  return(df)
}

#' Transform data
#'
#' Takes a data.frame and returns a new data.frame with an extra column colC = colA + colB.
#'
#' @param df Data frame with at least two numeric columns colA and colB.
#' @return A data.frame with a new column colC.
#' @export
transform_data <- function(df) {
  df$colC <- df$colA + df$colB
  return(df)
}

#' Save data to CSV
#'
#' Writes a data.frame to 'results.csv' (default).
#'
#' @param df A data frame.
#' @param filepath Path to write the CSV file (default: "results.csv").
#' @export
save_data <- function(df, filepath = "results.csv") {
  write.csv(df, file = filepath, row.names = FALSE)
}
