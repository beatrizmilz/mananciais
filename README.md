
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
#> Rows: 55,806
#> Columns: 8
#> $ data                <date> 2024-05-29, 2024-05-29, 2024-05-29, 2024-05-29, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 70.4, 69.9, 74.0, 74.3, 84.3, 39.0, 94.8, 70.3, 69…
#> $ volume_variacao     <dbl> 0.1, 0.0, 0.0, 0.0, -0.2, -0.1, 0.3, 0.5, 0.2, 0.3…
#> $ volume_operacional  <dbl> 691.24189, 391.51334, 126.67038, 12.26412, 94.5928…
#> $ pluviometria_dia    <dbl> 0.0, 0.0, 0.0, 0.2, 0.0, 0.0, 0.0, 19.8, 8.8, 2.4,…
#> $ pluviometria_mensal <dbl> 66.7, 44.0, 29.4, 33.8, 22.2, 65.4, 54.0, 66.7, 44…
#> $ pluviometria_hist   <dbl> 73.8, 56.4, 58.8, 63.6, 78.2, 131.8, 87.6, 73.8, 5…
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
| 2024-05-29 | Cantareira   |               70.4 |             0.1 |          691.24189 |              0.0 |                66.7 |              73.8 |
| 2024-05-29 | Alto Tietê   |               69.9 |             0.0 |          391.51334 |              0.0 |                44.0 |              56.4 |
| 2024-05-29 | Guarapiranga |               74.0 |             0.0 |          126.67038 |              0.0 |                29.4 |              58.8 |
| 2024-05-29 | Cotia        |               74.3 |             0.0 |           12.26412 |              0.2 |                33.8 |              63.6 |
| 2024-05-29 | Rio Grande   |               84.3 |            -0.2 |           94.59284 |              0.0 |                22.2 |              78.2 |
| 2024-05-29 | Rio Claro    |               39.0 |            -0.1 |            5.33545 |              0.0 |                65.4 |             131.8 |
| 2024-05-29 | São Lourenço |               94.8 |             0.3 |           84.23296 |              0.0 |                54.0 |              87.6 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
