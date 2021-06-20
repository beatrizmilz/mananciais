
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
#> Rows: 48,281
#> Columns: 8
#> $ data                <date> 2021-06-19, 2021-06-19, 2021-06-19, 2021-06-19, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 45.9, 55.7, 62.5, 73.6, 76.1, 49.7, 71.9, 46.0, 55…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.1, -0.2, -0.3, -0.2, -0.1, -0.2, -0…
#> $ volume_operacional  <dbl> 450.62583, 312.16110, 106.93940, 12.13861, 85.4057…
#> $ pluviometria_dia    <dbl> 0.0, 0.2, 0.4, 1.2, 2.6, 1.2, 8.2, 0.0, 0.2, 0.0, …
#> $ pluviometria_mensal <dbl> 11.9, 8.7, 4.4, 10.8, 16.4, 37.4, 30.2, 11.9, 8.5,…
#> $ pluviometria_hist   <dbl> 57.1, 56.8, 53.9, 59.9, 61.6, 98.1, 76.3, 57.1, 56…
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
| 2021-06-19 | Cantareira   |                45.9 |            \-0.1 |           450.62583 |               0.0 |                 11.9 |               57.1 |
| 2021-06-19 | Alto Tietê   |                55.7 |            \-0.1 |           312.16110 |               0.2 |                  8.7 |               56.8 |
| 2021-06-19 | Guarapiranga |                62.5 |            \-0.1 |           106.93940 |               0.4 |                  4.4 |               53.9 |
| 2021-06-19 | Cotia        |                73.6 |            \-0.2 |            12.13861 |               1.2 |                 10.8 |               59.9 |
| 2021-06-19 | Rio Grande   |                76.1 |            \-0.3 |            85.40575 |               2.6 |                 16.4 |               61.6 |
| 2021-06-19 | Rio Claro    |                49.7 |            \-0.2 |             6.79194 |               1.2 |                 37.4 |               98.1 |
| 2021-06-19 | São Lourenço |                71.9 |            \-0.1 |            63.87445 |               8.2 |                 30.2 |               76.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
