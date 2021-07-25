
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
#> Rows: 48,526
#> Columns: 8
#> $ data                <date> 2021-07-24, 2021-07-24, 2021-07-24, 2021-07-24, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 42.0, 50.4, 55.6, 66.0, 64.2, 45.8, 64.6, 42.1, 50…
#> $ volume_variacao     <dbl> -0.1, -0.2, -0.3, -0.4, -0.2, -0.3, -0.3, -0.2, -0…
#> $ volume_operacional  <dbl> 412.61036, 282.41556, 95.17907, 10.89481, 71.97264…
#> $ pluviometria_dia    <dbl> 0.0, 0.2, 0.0, 0.2, 0.0, 0.2, 0.0, 0.0, 0.2, 0.0, …
#> $ pluviometria_mensal <dbl> 0.4, 7.1, 8.2, 9.0, 9.4, 8.0, 25.6, 0.4, 6.9, 8.2,…
#> $ pluviometria_hist   <dbl> 45.3, 48.4, 41.1, 51.3, 54.5, 91.3, 76.9, 45.3, 48…
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
| 2021-07-24 | Cantareira   |                42.0 |            \-0.1 |           412.61036 |               0.0 |                  0.4 |               45.3 |
| 2021-07-24 | Alto Tietê   |                50.4 |            \-0.2 |           282.41556 |               0.2 |                  7.1 |               48.4 |
| 2021-07-24 | Guarapiranga |                55.6 |            \-0.3 |            95.17907 |               0.0 |                  8.2 |               41.1 |
| 2021-07-24 | Cotia        |                66.0 |            \-0.4 |            10.89481 |               0.2 |                  9.0 |               51.3 |
| 2021-07-24 | Rio Grande   |                64.2 |            \-0.2 |            71.97264 |               0.0 |                  9.4 |               54.5 |
| 2021-07-24 | Rio Claro    |                45.8 |            \-0.3 |             6.25517 |               0.2 |                  8.0 |               91.3 |
| 2021-07-24 | São Lourenço |                64.6 |            \-0.3 |            57.35348 |               0.0 |                 25.6 |               76.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
