
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Pacote Mananciais <img src="man/figures/hexlogo.png" align="right" width = "120px"/>

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
[![R build
status](https://github.com/beatrizmilz/mananciais/workflows/R-CMD-check/badge.svg)](https://github.com/beatrizmilz/mananciais/actions)
[![update-data](https://github.com/beatrizmilz/mananciais/actions/workflows/2-update_data.yaml/badge.svg)](https://github.com/beatrizmilz/mananciais/actions/workflows/2-update_data.yaml)
[![Codecov test
coverage](https://codecov.io/gh/beatrizmilz/mananciais/branch/master/graph/badge.svg)](https://codecov.io/gh/beatrizmilz/mananciais?branch=master)
<!-- badges: end -->

O objetivo deste pacote é disponibilizar a base de dados sobre o volume
operacional em mananciais de abastecimento público na Região
Metropolitana de São Paulo (SP - Brasil). O pacote é atualizado
diariamente através de um workflow com [GitHub
Actions](https://github.com/beatrizmilz/mananciais/actions).

Os dados foram obtidos no [Portal dos
Mananciais](http://mananciais.sabesp.com.br/Situacao) da
[SABESP](http://site.sabesp.com.br/site/Default.aspx).

Este pacote foi derivado de um código web scraping desenvolvido pela
equipe da [Curso-R](https://www.curso-r.com/), em uma
[live](https://youtu.be/jvZIxrMmOcQ), e o código original está
disponível [neste
link](https://github.com/curso-r/lives/blob/master/drafts/20200730_scraper_sabesp.R).

Este pacote foi criado no âmbito da [pesquisa de doutorado de Beatriz
Milz](https://beatrizmilz.github.io/tese/).

**Caso você não utilize R**, é possível **fazer download da base de
dados** através dos seguintes links:

  - [Arquivo
    `.csv`](https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv)
  - [Arquivo
    `.xlsx`](https://github.com/beatrizmilz/mananciais/blob/master/inst/extdata/mananciais.xlsx?raw=true)

Os arquivos foram salvos com encoding UTF-8, e separados por
ponto-e-vírgula.

## Instalação

Este pacote pode ser instalado através do [GitHub](https://github.com/)
utilizando o seguinte código em `R`:

``` r
# install.packages("devtools")
devtools::install_github("beatrizmilz/mananciais")
library(mananciais)
```

## Como usar?

Caso você tenha conexão à internet, é possível buscar a base atualizada
usando a função `dados_mananciais()`:

``` r
mananciais <- mananciais::dados_mananciais() 
```

Caso você não tenha conexão à internet, você pode utilizar a base
disponível no pacote. Porém as mesmas estarão atualizadas até a data em
que você instalou (ou atualizou) o pacote.

Abaixo segue um exemplo da base disponível:

``` r
dplyr::glimpse(mananciais)
#> Rows: 50,794
#> Columns: 8
#> $ data                <date> 2022-06-13, 2022-06-13, 2022-06-13, 2022-06-13, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 41.3, 61.9, 79.1, 85.7, 100.0, 46.3, 96.6, 41.4, 6…
#> $ volume_variacao     <dbl> -0.1, -0.1, 0.0, -0.2, 0.0, -0.5, -0.1, 0.0, 0.0, …
#> $ volume_operacional  <dbl> 405.59995, 347.03996, 135.40103, 14.13465, 112.182…
#> $ pluviometria_dia    <dbl> 0.0, 0.1, 0.0, 0.0, 0.0, 0.2, 0.0, 0.1, 1.2, 0.6, …
#> $ pluviometria_mensal <dbl> 29.2, 17.3, 15.6, 26.0, 32.0, 41.0, 57.0, 29.2, 17…
#> $ pluviometria_hist   <dbl> 59.1, 55.9, 54.0, 59.0, 61.6, 98.5, 76.3, 59.1, 55…
```

Caso queira saber o significado de cada variável, leia a [documentação
da base de
dados](https://beatrizmilz.github.io/mananciais/reference/mananciais.html)
ou utilize a seguinte função:

``` r
?mananciais::mananciais
```

### Exemplo de tabela

``` r
library(magrittr)
mananciais %>% 
  dplyr::arrange(desc(data)) %>% 
  head(7) %>%
  knitr::kable()
```

| data       | sistema      | volume\_porcentagem | volume\_variacao | volume\_operacional | pluviometria\_dia | pluviometria\_mensal | pluviometria\_hist |
| :--------- | :----------- | ------------------: | ---------------: | ------------------: | ----------------: | -------------------: | -----------------: |
| 2022-06-13 | Cantareira   |                41.3 |            \-0.1 |           405.59995 |               0.0 |                 29.2 |               59.1 |
| 2022-06-13 | Alto Tietê   |                61.9 |            \-0.1 |           347.03996 |               0.1 |                 17.3 |               55.9 |
| 2022-06-13 | Guarapiranga |                79.1 |              0.0 |           135.40103 |               0.0 |                 15.6 |               54.0 |
| 2022-06-13 | Cotia        |                85.7 |            \-0.2 |            14.13465 |               0.0 |                 26.0 |               59.0 |
| 2022-06-13 | Rio Grande   |               100.0 |              0.0 |           112.18231 |               0.0 |                 32.0 |               61.6 |
| 2022-06-13 | Rio Claro    |                46.3 |            \-0.5 |             6.32188 |               0.2 |                 41.0 |               98.5 |
| 2022-06-13 | São Lourenço |                96.6 |            \-0.1 |            85.78591 |               0.0 |                 57.0 |               76.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
