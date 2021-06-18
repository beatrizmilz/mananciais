
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
#> Rows: 48,267
#> Columns: 8
#> $ data                <date> 2021-06-17, 2021-06-17, 2021-06-17, 2021-06-17, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 46.2, 56.0, 62.9, 74.0, 76.9, 49.8, 72.2, 46.2, 56…
#> $ volume_variacao     <dbl> 0.0, -0.1, -0.1, -0.2, -0.4, 0.1, -0.2, -0.2, -0.1…
#> $ volume_operacional  <dbl> 453.27514, 313.68327, 107.67228, 12.20127, 86.2182…
#> $ pluviometria_dia    <dbl> 0.0, 1.4, 0.0, 0.0, 2.6, 5.6, 0.0, 0.0, 0.0, 0.0, …
#> $ pluviometria_mensal <dbl> 11.9, 8.3, 4.0, 9.6, 13.6, 35.8, 20.8, 11.9, 6.9, …
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
| 2021-06-17 | Cantareira   |                46.2 |              0.0 |           453.27514 |               0.0 |                 11.9 |               57.1 |
| 2021-06-17 | Alto Tietê   |                56.0 |            \-0.1 |           313.68327 |               1.4 |                  8.3 |               56.8 |
| 2021-06-17 | Guarapiranga |                62.9 |            \-0.1 |           107.67228 |               0.0 |                  4.0 |               53.9 |
| 2021-06-17 | Cotia        |                74.0 |            \-0.2 |            12.20127 |               0.0 |                  9.6 |               59.9 |
| 2021-06-17 | Rio Grande   |                76.9 |            \-0.4 |            86.21823 |               2.6 |                 13.6 |               61.6 |
| 2021-06-17 | Rio Claro    |                49.8 |              0.1 |             6.80372 |               5.6 |                 35.8 |               98.1 |
| 2021-06-17 | São Lourenço |                72.2 |            \-0.2 |            64.16807 |               0.0 |                 20.8 |               76.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
