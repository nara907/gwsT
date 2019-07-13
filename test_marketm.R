library("testthat")

source("marketm.R")
#dissaggregate by governorate, if sell petrol, average price. sell desil, average price | do with urban rural too
#fuction will take DISAG, and the dataset as arguments

test_that("test that data types are correct", {
  marketDATA<-dataFILE
  
  expect_that(marketDATA, is_a("data.frame"))
  expect_that(marketDATA$sell_petrol, is_a('character'))
  expect_that(marketDATA$price_petrol, is_a('numeric'))
  expect_that(marketDATA$sell_diesel, is_a('character'))
  expect_that(marketDATA$price_diesel, is_a('numeric'))
})

