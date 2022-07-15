
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
#> Rows: 51,011
#> Columns: 8
#> $ data                <date> 2022-07-14, 2022-07-14, 2022-07-14, 2022-07-14, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 38.2, 57.8, 71.6, 78.2, 95.1, 42.5, 84.7, 38.3, 57…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.3, -0.4, -0.2, -0.3, -0.2, -0.1, -0…
#> $ volume_operacional  <dbl> 374.78977, 323.86883, 122.60698, 12.90289, 106.732…
#> $ pluviometria_dia    <dbl> 0.2, 0.2, 0.0, 0.0, 0.0, 0.4, 1.2, 0.1, 0.0, 0.0, …
#> $ pluviometria_mensal <dbl> 0.6, 2.1, 0.2, 3.0, 1.4, 5.6, 6.8, 0.4, 1.9, 0.2, …
#> $ pluviometria_hist   <dbl> 46.5, 46.9, 41.5, 51.3, 54.2, 91.3, 77.7, 46.5, 46…
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
| 2022-07-14 | Cantareira   |                38.2 |            \-0.1 |           374.78977 |               0.2 |                  0.6 |               46.5 |
| 2022-07-14 | Alto Tietê   |                57.8 |            \-0.1 |           323.86883 |               0.2 |                  2.1 |               46.9 |
| 2022-07-14 | Guarapiranga |                71.6 |            \-0.3 |           122.60698 |               0.0 |                  0.2 |               41.5 |
| 2022-07-14 | Cotia        |                78.2 |            \-0.4 |            12.90289 |               0.0 |                  3.0 |               51.3 |
| 2022-07-14 | Rio Grande   |                95.1 |            \-0.2 |           106.73263 |               0.0 |                  1.4 |               54.2 |
| 2022-07-14 | Rio Claro    |                42.5 |            \-0.3 |             5.81318 |               0.4 |                  5.6 |               91.3 |
| 2022-07-14 | São Lourenço |                84.7 |            \-0.2 |            75.20310 |               1.2 |                  6.8 |               77.7 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
