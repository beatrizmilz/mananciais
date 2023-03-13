
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
#> Rows: 52,698
#> Columns: 8
#> $ data                <date> 2023-03-12, 2023-03-12, 2023-03-12, 2023-03-12, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 76.3, 72.4, 86.7, 98.9, 104.3, 43.2, 100.9, 75.6, …
#> $ volume_variacao     <dbl> 0.7, 0.7, -1.1, 0.9, -0.2, 0.0, 0.6, 0.7, 0.7, 2.5…
#> $ volume_operacional  <dbl> 749.68929, 405.85644, 148.43602, 16.31059, 117.014…
#> $ pluviometria_dia    <dbl> 10.8, 15.4, 16.8, 1.4, 3.4, 11.6, 20.6, 13.6, 29.6…
#> $ pluviometria_mensal <dbl> 128.9, 95.1, 140.6, 59.4, 70.8, 72.6, 213.4, 118.1…
#> $ pluviometria_hist   <dbl> 174.3, 155.5, 155.4, 154.6, 186.7, 243.5, 196.8, 1…
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
| 2023-03-12 | Cantareira   |               76.3 |             0.7 |          749.68929 |             10.8 |               128.9 |             174.3 |
| 2023-03-12 | Alto Tietê   |               72.4 |             0.7 |          405.85644 |             15.4 |                95.1 |             155.5 |
| 2023-03-12 | Guarapiranga |               86.7 |            -1.1 |          148.43602 |             16.8 |               140.6 |             155.4 |
| 2023-03-12 | Cotia        |               98.9 |             0.9 |           16.31059 |              1.4 |                59.4 |             154.6 |
| 2023-03-12 | Rio Grande   |              104.3 |            -0.2 |          117.01496 |              3.4 |                70.8 |             186.7 |
| 2023-03-12 | Rio Claro    |               43.2 |             0.0 |            5.90815 |             11.6 |                72.6 |             243.5 |
| 2023-03-12 | São Lourenço |              100.9 |             0.6 |           89.61705 |             20.6 |               213.4 |             196.8 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
