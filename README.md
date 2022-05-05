
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
#> Rows: 50,514
#> Columns: 8
#> $ data                <date> 2022-05-04, 2022-05-04, 2022-05-04, 2022-05-04, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 43.8, 64.0, 87.3, 90.5, 103.6, 47.0, 95.1, 43.8, 6…
#> $ volume_variacao     <dbl> 0.0, 0.1, -0.3, -0.5, -0.7, -0.1, 0.0, -0.1, 0.4, …
#> $ volume_operacional  <dbl> 429.81401, 358.70283, 149.48695, 14.93361, 116.233…
#> $ pluviometria_dia    <dbl> 0.9, 0.4, 0.4, 0.4, 0.0, 0.8, 0.8, 3.1, 12.3, 0.0,…
#> $ pluviometria_mensal <dbl> 5.4, 21.1, 0.4, 0.6, 0.8, 14.6, 4.4, 4.5, 20.7, 0.…
#> $ pluviometria_hist   <dbl> 74.8, 69.4, 59.6, 64.6, 79.9, 132.6, 88.9, 74.8, 6…
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
| 2022-05-04 | Cantareira   |                43.8 |              0.0 |           429.81401 |               0.9 |                  5.4 |               74.8 |
| 2022-05-04 | Alto Tietê   |                64.0 |              0.1 |           358.70283 |               0.4 |                 21.1 |               69.4 |
| 2022-05-04 | Guarapiranga |                87.3 |            \-0.3 |           149.48695 |               0.4 |                  0.4 |               59.6 |
| 2022-05-04 | Cotia        |                90.5 |            \-0.5 |            14.93361 |               0.4 |                  0.6 |               64.6 |
| 2022-05-04 | Rio Grande   |               103.6 |            \-0.7 |           116.23326 |               0.0 |                  0.8 |               79.9 |
| 2022-05-04 | Rio Claro    |                47.0 |            \-0.1 |             6.42293 |               0.8 |                 14.6 |              132.6 |
| 2022-05-04 | São Lourenço |                95.1 |              0.0 |            84.45395 |               0.8 |                  4.4 |               88.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
