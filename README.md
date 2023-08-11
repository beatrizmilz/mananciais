
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
#> Rows: 53,755
#> Columns: 8
#> $ data                <date> 2023-08-10, 2023-08-10, 2023-08-10, 2023-08-10, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 77.0, 65.9, 63.6, 89.2, 95.1, 41.4, 66.1, 77.2, 65…
#> $ volume_variacao     <dbl> -0.2, 0.1, -0.2, 0.0, 0.3, 0.5, 0.7, -0.2, -0.1, -…
#> $ volume_operacional  <dbl> 755.95833, 369.19960, 108.89686, 14.72270, 106.732…
#> $ pluviometria_dia    <dbl> 0.0, 16.3, 1.4, 1.8, 3.6, 18.4, 3.8, 0.1, 4.5, 1.0…
#> $ pluviometria_mensal <dbl> 0.3, 21.9, 3.0, 5.4, 5.6, 42.8, 7.8, 0.3, 5.6, 1.6…
#> $ pluviometria_hist   <dbl> 34.1, 29.0, 39.9, 40.2, 48.7, 100.4, 61.3, 34.1, 2…
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
| 2023-08-10 | Cantareira   |               77.0 |            -0.2 |          755.95833 |              0.0 |                 0.3 |              34.1 |
| 2023-08-10 | Alto Tietê   |               65.9 |             0.1 |          369.19960 |             16.3 |                21.9 |              29.0 |
| 2023-08-10 | Guarapiranga |               63.6 |            -0.2 |          108.89686 |              1.4 |                 3.0 |              39.9 |
| 2023-08-10 | Cotia        |               89.2 |             0.0 |           14.72270 |              1.8 |                 5.4 |              40.2 |
| 2023-08-10 | Rio Grande   |               95.1 |             0.3 |          106.73263 |              3.6 |                 5.6 |              48.7 |
| 2023-08-10 | Rio Claro    |               41.4 |             0.5 |            5.65741 |             18.4 |                42.8 |             100.4 |
| 2023-08-10 | São Lourenço |               66.1 |             0.7 |           58.67550 |              3.8 |                 7.8 |              61.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
