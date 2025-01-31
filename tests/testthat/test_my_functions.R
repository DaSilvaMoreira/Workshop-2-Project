library(testthat)


test_that("generate_data produces a data frame with correct dimensions", {
  df <- generate_data(n = 5)
  expect_equal(nrow(df), 5)
  expect_equal(ncol(df), 2)
})

test_that("transform_data adds column colC correctly", {
  df <- generate_data(n = 3)
  df2 <- transform_data(df)
  expect_true("colC" %in% names(df2))
  expect_equal(df2$colC, df$colA + df$colB)
})

test_that("save_data writes a CSV file", {
  df <- generate_data(3)
  tmpfile <- tempfile(fileext = ".csv")
  save_data(df, tmpfile)
  expect_true(file.exists(tmpfile))
})
