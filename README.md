
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
#> Rows: 52,159
#> Columns: 8
#> $ data                <date> 2022-12-25, 2022-12-25, 2022-12-25, 2022-12-25, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 39.2, 47.7, 84.3, 52.0, 101.5, 48.8, 83.5, 39.0, 4…
#> $ volume_variacao     <dbl> 0.2, 0.1, 0.2, -0.2, -0.4, -1.6, -0.5, 0.2, 0.0, 0…
#> $ volume_operacional  <dbl> 384.80959, 266.99254, 144.24321, 8.58270, 113.9075…
#> $ pluviometria_dia    <dbl> 5.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.9, 0.0, 0.0, …
#> $ pluviometria_mensal <dbl> 191.1, 107.9, 146.4, 147.8, 135.6, 241.2, 303.6, 1…
#> $ pluviometria_hist   <dbl> 209.9, 189.3, 173.3, 166.2, 188.0, 258.7, 211.9, 2…
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

| data       | sistema      | volume_porcentagem | volume_variacao | volume_operacional | pluviometria_dia | pluviometria_mensal | pluviometria_hist |
|:-----------|:-------------|-------------------:|----------------:|-------------------:|-----------------:|--------------------:|------------------:|
| 2022-12-25 | Cantareira   |               39.2 |             0.2 |          384.80959 |              5.5 |               191.1 |             209.9 |
| 2022-12-25 | Alto Tietê   |               47.7 |             0.1 |          266.99254 |              0.0 |               107.9 |             189.3 |
| 2022-12-25 | Guarapiranga |               84.3 |             0.2 |          144.24321 |              0.0 |               146.4 |             173.3 |
| 2022-12-25 | Cotia        |               52.0 |            -0.2 |            8.58270 |              0.0 |               147.8 |             166.2 |
| 2022-12-25 | Rio Grande   |              101.5 |            -0.4 |          113.90757 |              0.0 |               135.6 |             188.0 |
| 2022-12-25 | Rio Claro    |               48.8 |            -1.6 |            6.66337 |              0.0 |               241.2 |             258.7 |
| 2022-12-25 | São Lourenço |               83.5 |            -0.5 |           74.15974 |              0.2 |               303.6 |             211.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
