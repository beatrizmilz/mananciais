
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
#> Rows: 56,779
#> Columns: 8
#> $ data                <date> 2024-10-15, 2024-10-15, 2024-10-15, 2024-10-15, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 47.7, 43.4, 36.7, 35.0, 61.7, 24.6, 44.7, 48.0, 43…
#> $ volume_variacao     <dbl> -0.3, -0.2, -0.2, -0.4, -0.3, -0.1, -0.2, -0.2, -0…
#> $ volume_operacional  <dbl> 468.71477, 242.97853, 62.78116, 5.78065, 69.21180,…
#> $ pluviometria_dia    <dbl> 0.0, 0.0, 0.0, 0.2, 0.2, 0.0, 0.2, 0.0, 0.1, 0.0, …
#> $ pluviometria_mensal <dbl> 51.7, 24.6, 20.2, 25.6, 24.4, 40.2, 30.6, 51.7, 24…
#> $ pluviometria_hist   <dbl> 130.3, 109.3, 114.7, 120.4, 133.1, 174.8, 144.0, 1…
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
| 2024-10-15 | Cantareira   |               47.7 |            -0.3 |          468.71477 |              0.0 |                51.7 |             130.3 |
| 2024-10-15 | Alto Tietê   |               43.4 |            -0.2 |          242.97853 |              0.0 |                24.6 |             109.3 |
| 2024-10-15 | Guarapiranga |               36.7 |            -0.2 |           62.78116 |              0.0 |                20.2 |             114.7 |
| 2024-10-15 | Cotia        |               35.0 |            -0.4 |            5.78065 |              0.2 |                25.6 |             120.4 |
| 2024-10-15 | Rio Grande   |               61.7 |            -0.3 |           69.21180 |              0.2 |                24.4 |             133.1 |
| 2024-10-15 | Rio Claro    |               24.6 |            -0.1 |            3.35975 |              0.0 |                40.2 |             174.8 |
| 2024-10-15 | São Lourenço |               44.7 |            -0.2 |           39.66138 |              0.2 |                30.6 |             144.0 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
