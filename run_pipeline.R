#!/usr/bin/env Rscript

# Ensure devtools & testthat are installed
if (!requireNamespace("devtools", quietly = TRUE)) {
  install.packages("devtools", repos = "https://cloud.r-project.org")
}
if (!requireNamespace("testthat", quietly = TRUE)) {
  install.packages("testthat", repos = "https://cloud.r-project.org")
}

library(devtools)
library(testthat)

# Install dependencies from DESCRIPTION (including testthat)
devtools::install_deps(dependencies = TRUE)

# Load your functions (if not installed as package, we can just source them):
source("R/my_functions.R")

# Run tests
cat("Running tests...\n")
test_dir("tests/testthat", stop_on_failure = TRUE)
cat("All tests passed.\n")

# The pipeline
cat("Generating data...\n")
df <- generate_data(n = 5)

cat("Transforming data...\n")
df2 <- transform_data(df)

cat("Saving data to 'results.csv'...\n")
save_data(df2, "results.csv")

cat("Pipeline finished. See 'results.csv'.\n")
