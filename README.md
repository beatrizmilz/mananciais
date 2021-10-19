
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
#> Rows: 49,128
#> Columns: 8
#> $ data                <date> 2021-10-18, 2021-10-18, 2021-10-18, 2021-10-18, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 28.1, 38.4, 47.1, 47.6, 79.1, 37.1, 56.1, 28.2, 38…
#> $ volume_variacao     <dbl> -0.1, 0.1, 0.6, 0.0, 0.6, 0.5, 0.9, 0.0, -0.1, 0.1…
#> $ volume_operacional  <dbl> 276.15284, 215.06936, 80.70048, 7.85575, 88.68270,…
#> $ pluviometria_dia    <dbl> 9.7, 11.8, 5.4, 1.4, 7.6, 10.2, 11.2, 4.5, 0.2, 0.…
#> $ pluviometria_mensal <dbl> 89.6, 61.8, 58.8, 52.0, 59.6, 70.4, 101.8, 79.9, 5…
#> $ pluviometria_hist   <dbl> 122.3, 110.3, 113.9, 114.0, 133.0, 174.7, 140.5, 1…
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
| 2021-10-18 | Cantareira   |                28.1 |            \-0.1 |           276.15284 |               9.7 |                 89.6 |              122.3 |
| 2021-10-18 | Alto Tietê   |                38.4 |              0.1 |           215.06936 |              11.8 |                 61.8 |              110.3 |
| 2021-10-18 | Guarapiranga |                47.1 |              0.6 |            80.70048 |               5.4 |                 58.8 |              113.9 |
| 2021-10-18 | Cotia        |                47.6 |              0.0 |             7.85575 |               1.4 |                 52.0 |              114.0 |
| 2021-10-18 | Rio Grande   |                79.1 |              0.6 |            88.68270 |               7.6 |                 59.6 |              133.0 |
| 2021-10-18 | Rio Claro    |                37.1 |              0.5 |             5.07453 |              10.2 |                 70.4 |              174.7 |
| 2021-10-18 | São Lourenço |                56.1 |              0.9 |            49.80974 |              11.2 |                101.8 |              140.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
