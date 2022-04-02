
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
#> Rows: 50,283
#> Columns: 8
#> $ data                <date> 2022-04-01, 2022-04-01, 2022-04-01, 2022-04-01, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 45.3, 59.6, 91.0, 94.6, 103.4, 54.0, 97.2, 45.3, 5…
#> $ volume_variacao     <dbl> 0.0, 0.2, 0.4, 0.2, 0.3, 7.9, -0.1, 0.0, 0.0, 0.5,…
#> $ volume_operacional  <dbl> 444.47625, 334.19373, 155.81219, 15.61315, 116.038…
#> $ pluviometria_dia    <dbl> 0.9, 6.6, 2.2, 3.6, 12.2, 73.0, 12.4, 0.0, 0.0, 0.…
#> $ pluviometria_mensal <dbl> 0.9, 6.6, 2.2, 3.6, 12.2, 73.0, 12.4, 101.4, 155.8…
#> $ pluviometria_hist   <dbl> 83.2, 91.5, 72.3, 78.3, 103.1, 192.1, 110.7, 174.1…
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
| 2022-04-01 | Cantareira   |                45.3 |              0.0 |           444.47625 |               0.9 |                  0.9 |               83.2 |
| 2022-04-01 | Alto Tietê   |                59.6 |              0.2 |           334.19373 |               6.6 |                  6.6 |               91.5 |
| 2022-04-01 | Guarapiranga |                91.0 |              0.4 |           155.81219 |               2.2 |                  2.2 |               72.3 |
| 2022-04-01 | Cotia        |                94.6 |              0.2 |            15.61315 |               3.6 |                  3.6 |               78.3 |
| 2022-04-01 | Rio Grande   |               103.4 |              0.3 |           116.03834 |              12.2 |                 12.2 |              103.1 |
| 2022-04-01 | Rio Claro    |                54.0 |              7.9 |             7.37458 |              73.0 |                 73.0 |              192.1 |
| 2022-04-01 | São Lourenço |                97.2 |            \-0.1 |            86.34397 |              12.4 |                 12.4 |              110.7 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
