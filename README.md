
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
#> Rows: 49,156
#> Columns: 8
#> $ data                <date> 2021-10-22, 2021-10-22, 2021-10-22, 2021-10-22, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 28.1, 39.1, 49.0, 47.6, 82.5, 40.9, 61.2, 28.2, 39…
#> $ volume_variacao     <dbl> -0.1, 0.1, 0.4, -0.3, 0.5, 0.1, 0.8, 0.0, 0.2, 0.5…
#> $ volume_operacional  <dbl> 276.40709, 218.98293, 83.85083, 7.85575, 92.54109,…
#> $ pluviometria_dia    <dbl> 0.0, 0.1, 0.0, 0.0, 0.2, 0.2, 0.0, 0.0, 0.3, 0.0, …
#> $ pluviometria_mensal <dbl> 102.9, 72.4, 67.0, 57.6, 74.4, 94.2, 116.6, 102.9,…
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
| 2021-10-22 | Cantareira   |                28.1 |            \-0.1 |           276.40709 |               0.0 |                102.9 |              122.3 |
| 2021-10-22 | Alto Tietê   |                39.1 |              0.1 |           218.98293 |               0.1 |                 72.4 |              110.3 |
| 2021-10-22 | Guarapiranga |                49.0 |              0.4 |            83.85083 |               0.0 |                 67.0 |              113.9 |
| 2021-10-22 | Cotia        |                47.6 |            \-0.3 |             7.85575 |               0.0 |                 57.6 |              114.0 |
| 2021-10-22 | Rio Grande   |                82.5 |              0.5 |            92.54109 |               0.2 |                 74.4 |              133.0 |
| 2021-10-22 | Rio Claro    |                40.9 |              0.1 |             5.58579 |               0.2 |                 94.2 |              174.7 |
| 2021-10-22 | São Lourenço |                61.2 |              0.8 |            54.36992 |               0.0 |                116.6 |              140.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
