
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
#> Rows: 48,946
#> Columns: 8
#> $ data                <date> 2021-09-22, 2021-09-22, 2021-09-22, 2021-09-22, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 32.4, 41.4, 46.5, 52.5, 74.4, 38.9, 53.0, 32.6, 41…
#> $ volume_variacao     <dbl> -0.2, -0.2, -0.2, -0.3, 0.1, 1.8, -0.3, -0.2, -0.1…
#> $ volume_operacional  <dbl> 317.94524, 232.02355, 79.58506, 8.65996, 83.47406,…
#> $ pluviometria_dia    <dbl> 0.2, 1.2, 0.0, 0.8, 4.4, 31.8, 2.8, 0.0, 0.0, 0.0,…
#> $ pluviometria_mensal <dbl> 25.6, 15.2, 6.4, 12.4, 15.8, 56.4, 34.8, 25.4, 14.…
#> $ pluviometria_hist   <dbl> 83.2, 78.3, 77.0, 81.3, 93.9, 140.6, 114.0, 83.2, …
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
| 2021-09-22 | Cantareira   |                32.4 |            \-0.2 |           317.94524 |               0.2 |                 25.6 |               83.2 |
| 2021-09-22 | Alto Tietê   |                41.4 |            \-0.2 |           232.02355 |               1.2 |                 15.2 |               78.3 |
| 2021-09-22 | Guarapiranga |                46.5 |            \-0.2 |            79.58506 |               0.0 |                  6.4 |               77.0 |
| 2021-09-22 | Cotia        |                52.5 |            \-0.3 |             8.65996 |               0.8 |                 12.4 |               81.3 |
| 2021-09-22 | Rio Grande   |                74.4 |              0.1 |            83.47406 |               4.4 |                 15.8 |               93.9 |
| 2021-09-22 | Rio Claro    |                38.9 |              1.8 |             5.31579 |              31.8 |                 56.4 |              140.6 |
| 2021-09-22 | São Lourenço |                53.0 |            \-0.3 |            47.04123 |               2.8 |                 34.8 |              114.0 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
