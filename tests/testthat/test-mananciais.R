test_that("Funcao dados_mananciais esta funcionando corretamente", {

  # Executar a funcao uma vez
  mananciais <- dados_mananciais()

  # Testar a classe
  expect_s3_class(mananciais, "tbl_df")

  # Testar numero de colunas
  expect_equal(ncol(mananciais), 8)

  # Testar numero de linhas
  expect_gt(nrow(mananciais), 47000)
  expect_false(ncol(mananciais) == 9)
})
