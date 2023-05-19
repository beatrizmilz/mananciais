
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
#> Rows: 53,167
#> Columns: 8
#> $ data                <date> 2023-05-18, 2023-05-18, 2023-05-18, 2023-05-18, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 85.3, 75.6, 84.9, 99.1, 100.2, 44.6, 95.6, 85.4, 7…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.3, -0.2, -0.1, -0.1, -0.2, -0.1, -0…
#> $ volume_operacional  <dbl> 838.07246, 423.37439, 145.28970, 16.34780, 112.373…
#> $ pluviometria_dia    <dbl> 0.0, 0.3, 0.0, 0.0, 0.0, 0.2, 0.2, 0.0, 0.3, 0.0, …
#> $ pluviometria_mensal <dbl> 7.2, 26.4, 3.8, 1.2, 7.8, 71.0, 10.2, 7.2, 26.1, 3…
#> $ pluviometria_hist   <dbl> 75.0, 57.2, 59.1, 64.2, 79.2, 131.6, 88.6, 75.0, 5…
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
| 2023-05-18 | Cantareira   |               85.3 |            -0.1 |          838.07246 |              0.0 |                 7.2 |              75.0 |
| 2023-05-18 | Alto Tietê   |               75.6 |            -0.1 |          423.37439 |              0.3 |                26.4 |              57.2 |
| 2023-05-18 | Guarapiranga |               84.9 |            -0.3 |          145.28970 |              0.0 |                 3.8 |              59.1 |
| 2023-05-18 | Cotia        |               99.1 |            -0.2 |           16.34780 |              0.0 |                 1.2 |              64.2 |
| 2023-05-18 | Rio Grande   |              100.2 |            -0.1 |          112.37321 |              0.0 |                 7.8 |              79.2 |
| 2023-05-18 | Rio Claro    |               44.6 |            -0.1 |            6.10155 |              0.2 |                71.0 |             131.6 |
| 2023-05-18 | São Lourenço |               95.6 |            -0.2 |           84.89678 |              0.2 |                10.2 |              88.6 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
