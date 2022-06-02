
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
#> Rows: 50,710
#> Columns: 8
#> $ data                <date> 2022-06-01, 2022-06-01, 2022-06-01, 2022-06-01, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 41.7, 62.3, 79.4, 84.9, 99.5, 44.8, 91.5, 41.6, 62…
#> $ volume_variacao     <dbl> 0.1, 0.0, 0.3, 0.3, 0.3, 1.0, 1.1, 0.1, 0.2, 0.6, …
#> $ volume_operacional  <dbl> 409.15207, 349.34249, 135.91830, 13.99833, 111.610…
#> $ pluviometria_dia    <dbl> 11.3, 1.5, 0.4, 3.8, 2.0, 7.6, 14.8, 24.6, 21.4, 2…
#> $ pluviometria_mensal <dbl> 11.3, 1.5, 0.4, 3.8, 2.0, 7.6, 14.8, 56.2, 53.4, 2…
#> $ pluviometria_hist   <dbl> 59.1, 55.9, 54.0, 59.0, 61.6, 98.5, 76.3, 74.8, 69…
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
| 2022-06-01 | Cantareira   |                41.7 |              0.1 |           409.15207 |              11.3 |                 11.3 |               59.1 |
| 2022-06-01 | Alto Tietê   |                62.3 |              0.0 |           349.34249 |               1.5 |                  1.5 |               55.9 |
| 2022-06-01 | Guarapiranga |                79.4 |              0.3 |           135.91830 |               0.4 |                  0.4 |               54.0 |
| 2022-06-01 | Cotia        |                84.9 |              0.3 |            13.99833 |               3.8 |                  3.8 |               59.0 |
| 2022-06-01 | Rio Grande   |                99.5 |              0.3 |           111.61083 |               2.0 |                  2.0 |               61.6 |
| 2022-06-01 | Rio Claro    |                44.8 |              1.0 |             6.12332 |               7.6 |                  7.6 |               98.5 |
| 2022-06-01 | São Lourenço |                91.5 |              1.1 |            81.27747 |              14.8 |                 14.8 |               76.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
