context("test-nrow-ncol")

setup({
  df = disk.frame:::gen_datatable_synthetic(1e3+11)
  data.table::fwrite(df, file.path(tempdir(), "tmp_pls_delete.csv"))
})

test_that("nrow ncol", {
  dff = csv_to_disk.frame(
    file.path(tempdir(), "tmp_pls_delete.csv"), 
    file.path(tempdir(), "tmp_pls_delete.df"))
  
  expect_equal(nrow(dff), 1e3+11)
  expect_equal(ncol(dff), 10)
})

teardown({
  fs::file_delete(file.path(tempdir(), "tmp_pls_delete.csv"))
  fs::dir_delete(file.path(tempdir(), "tmp_pls_delete.df"))
})