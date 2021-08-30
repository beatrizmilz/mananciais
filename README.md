
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
#> Rows: 48,778
#> Columns: 8
#> $ data                <date> 2021-08-29, 2021-08-29, 2021-08-29, 2021-08-29, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 37.4, 44.6, 49.2, 58.5, 70.2, 42.7, 55.2, 37.4, 44…
#> $ volume_variacao     <dbl> 0.0, -0.1, 0.7, 0.9, 1.1, 0.5, 1.1, -0.1, -0.1, 0.…
#> $ volume_operacional  <dbl> 367.36271, 250.00233, 84.30411, 9.64485, 78.75632,…
#> $ pluviometria_dia    <dbl> 16.8, 11.9, 11.4, 11.4, 12.0, 9.8, 9.2, 3.4, 3.2, …
#> $ pluviometria_mensal <dbl> 20.9, 20.3, 22.4, 37.0, 16.8, 59.0, 47.2, 4.1, 8.4…
#> $ pluviometria_hist   <dbl> 33.2, 36.1, 40.0, 37.7, 49.1, 99.5, 62.7, 33.2, 36…
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
| 2021-08-29 | Cantareira   |                37.4 |              0.0 |           367.36271 |              16.8 |                 20.9 |               33.2 |
| 2021-08-29 | Alto Tietê   |                44.6 |            \-0.1 |           250.00233 |              11.9 |                 20.3 |               36.1 |
| 2021-08-29 | Guarapiranga |                49.2 |              0.7 |            84.30411 |              11.4 |                 22.4 |               40.0 |
| 2021-08-29 | Cotia        |                58.5 |              0.9 |             9.64485 |              11.4 |                 37.0 |               37.7 |
| 2021-08-29 | Rio Grande   |                70.2 |              1.1 |            78.75632 |              12.0 |                 16.8 |               49.1 |
| 2021-08-29 | Rio Claro    |                42.7 |              0.5 |             5.83419 |               9.8 |                 59.0 |               99.5 |
| 2021-08-29 | São Lourenço |                55.2 |              1.1 |            49.00148 |               9.2 |                 47.2 |               62.7 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
