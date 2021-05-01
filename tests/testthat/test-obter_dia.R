test_that("funcao obter_dia funciona", {

  # Executar a funcao uma vez
  dados <- mananciais:::obter_dia("2020-09-26")

  # Testar a classe
  expect_s3_class(dados, "tbl_df")

  # Testar numero de colunas
  expect_equal(ncol(dados), 16)

  # Testar numero de linhas
  expect_equal(nrow(dados), 7)


  # Testar classe das variaveis

  expect_equal(class(dados$sistema_id), "character")
  expect_equal(class(dados$nome), "character")
  expect_equal(class(dados$volume_porcentagem_ar), "character")
  expect_equal(class(dados$volume_porcentagem), "numeric")
  expect_equal(class(dados$volume_variacao_str), "character")
  expect_equal(class(dados$volume_variacao_num), "numeric")
  expect_equal(class(dados$volume_operacional), "numeric")
  expect_equal(class(dados$image_prec_dia), "character")
  expect_equal(class(dados$prec_dia), "character")
  expect_equal(class(dados$prec_mensal), "character")
  expect_equal(class(dados$prec_hist), "character")
  expect_equal(class(dados$indicador_volume_dia), "integer")
  expect_equal(class(dados$indicador_volume), "integer")
  expect_equal(class(dados$ish), "numeric")
  expect_equal(class(dados$data_original[[1]]), "character")
  expect_equal(class(dados$data), "Date")

})
