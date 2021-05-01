test_that("Funcao dados_mananciais esta funcionando corretamente", {

  # Executar a funcao uma vez
  mananciais <- dados_mananciais()

  # Testar a classe
  expect_s3_class(mananciais, "tbl_df")

  # Testar numero de colunas
  expect_equal(ncol(mananciais), 8)

  # Testar numero de linhas
  expect_gt(nrow(mananciais), 47000)

  # Testar classe das variáveis
  expect_s3_class(mananciais$data, "Date")
  expect_equal(class(mananciais$sistema), "character")
  expect_equal(class(mananciais$volume_porcentagem), "numeric")
  expect_equal(class(mananciais$volume_variacao), "numeric")
  expect_equal(class(mananciais$volume_operacional), "numeric")
  expect_equal(class(mananciais$pluviometria_dia), "numeric")
  expect_equal(class(mananciais$pluviometria_mensal), "numeric")
  expect_equal(class(mananciais$pluviometria_hist), "numeric")


})
