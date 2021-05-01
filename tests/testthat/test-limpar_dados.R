test_that("funcao limpar dados funciona", {

  # Executar a funcao uma vez
  dados_limpos <- mananciais:::obter_dia("2020-09-26") %>%
    mananciais:::limpar_dados()

  # Testar a classe
  expect_s3_class(dados_limpos, "tbl_df")

  # Testar numero de colunas
  expect_equal(ncol(dados_limpos), 8)

  # Testar numero de linhas
  expect_equal(nrow(dados_limpos), 7)


  # Testar classe das variaveis
  expect_equal(class(dados_limpos$data), "Date")
  expect_equal(class(dados_limpos$sistema), "character")
  expect_equal(class(dados_limpos$volume_porcentagem), "numeric")
  expect_equal(class(dados_limpos$volume_variacao), "numeric")
  expect_equal(class(dados_limpos$volume_operacional), "numeric")
  expect_equal(class(dados_limpos$pluviometria_dia), "numeric")
  expect_equal(class(dados_limpos$pluviometria_mensal), "numeric")
  expect_equal(class(dados_limpos$pluviometria_hist), "numeric")

})
