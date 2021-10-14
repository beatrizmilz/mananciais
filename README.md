
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
#> Rows: 49,093
#> Columns: 8
#> $ data                <date> 2021-10-13, 2021-10-13, 2021-10-13, 2021-10-13, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 28.6, 38.6, 46.0, 47.3, 77.9, 36.1, 53.8, 28.6, 38…
#> $ volume_variacao     <dbl> 0.0, -0.1, 0.2, -0.3, 0.3, -0.2, 0.1, -0.1, -0.1, …
#> $ volume_operacional  <dbl> 280.44887, 216.12247, 78.69646, 7.80693, 87.36326,…
#> $ pluviometria_dia    <dbl> 6.1, 0.0, 2.0, 0.0, 0.0, 0.2, 0.0, 5.3, 3.7, 2.6, …
#> $ pluviometria_mensal <dbl> 57.0, 29.0, 29.8, 30.2, 32.4, 42.4, 69.2, 50.9, 29…
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
| 2021-10-13 | Cantareira   |                28.6 |              0.0 |           280.44887 |               6.1 |                 57.0 |              122.3 |
| 2021-10-13 | Alto Tietê   |                38.6 |            \-0.1 |           216.12247 |               0.0 |                 29.0 |              110.3 |
| 2021-10-13 | Guarapiranga |                46.0 |              0.2 |            78.69646 |               2.0 |                 29.8 |              113.9 |
| 2021-10-13 | Cotia        |                47.3 |            \-0.3 |             7.80693 |               0.0 |                 30.2 |              114.0 |
| 2021-10-13 | Rio Grande   |                77.9 |              0.3 |            87.36326 |               0.0 |                 32.4 |              133.0 |
| 2021-10-13 | Rio Claro    |                36.1 |            \-0.2 |             4.93929 |               0.2 |                 42.4 |              174.7 |
| 2021-10-13 | São Lourenço |                53.8 |              0.1 |            47.75154 |               0.0 |                 69.2 |              140.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
