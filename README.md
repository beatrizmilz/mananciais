
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

-   [Arquivo
    `.csv`](https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv)
-   [Arquivo
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
#> Rows: 51,067
#> Columns: 8
#> $ data                <date> 2022-07-22, 2022-07-22, 2022-07-22, 2022-07-22, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 37.3, 56.2, 69.4, 75.1, 93.5, 41.5, 80.6, 37.4, 56…
#> $ volume_variacao     <dbl> -0.1, -0.2, -0.3, -0.4, -0.2, 0.0, -0.5, -0.1, -0.…
#> $ volume_operacional  <dbl> 366.10875, 315.11158, 118.82658, 12.39037, 104.891…
#> $ pluviometria_dia    <dbl> 0.1, 0.2, 0.0, 0.2, 0.2, 0.4, 0.0, 0.0, 0.2, 0.0, …
#> $ pluviometria_mensal <dbl> 0.7, 3.2, 0.2, 3.4, 3.0, 19.0, 7.6, 0.6, 3.0, 0.2,…
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

| data       | sistema      | volume_porcentagem | volume_variacao | volume_operacional | pluviometria_dia | pluviometria_mensal | pluviometria_hist |
|:-----------|:-------------|-------------------:|----------------:|-------------------:|-----------------:|--------------------:|------------------:|
| 2022-07-22 | Cantareira   |               37.3 |            -0.1 |          366.10875 |              0.1 |                 0.7 |              46.5 |
| 2022-07-22 | Alto Tietê   |               56.2 |            -0.2 |          315.11158 |              0.2 |                 3.2 |              46.9 |
| 2022-07-22 | Guarapiranga |               69.4 |            -0.3 |          118.82658 |              0.0 |                 0.2 |              41.5 |
| 2022-07-22 | Cotia        |               75.1 |            -0.4 |           12.39037 |              0.2 |                 3.4 |              51.3 |
| 2022-07-22 | Rio Grande   |               93.5 |            -0.2 |          104.89173 |              0.2 |                 3.0 |              54.2 |
| 2022-07-22 | Rio Claro    |               41.5 |             0.0 |            5.67800 |              0.4 |                19.0 |              91.3 |
| 2022-07-22 | São Lourenço |               80.6 |            -0.5 |           71.57950 |              0.0 |                 7.6 |              77.7 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
