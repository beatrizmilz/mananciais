
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
#> Rows: 51,410
#> Columns: 8
#> $ data                <date> 2022-09-09, 2022-09-09, 2022-09-09, 2022-09-09, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 31.8, 49.0, 58.5, 57.1, 89.2, 45.0, 66.3, 32.0, 49…
#> $ volume_variacao     <dbl> -0.2, -0.2, -0.2, -0.2, -0.1, -0.1, -0.2, -0.1, -0…
#> $ volume_operacional  <dbl> 312.72114, 274.56635, 100.16933, 9.42683, 100.0178…
#> $ pluviometria_dia    <dbl> 0.0, 0.1, 0.0, 0.2, 0.0, 0.0, 0.0, 0.8, 0.0, 7.0, …
#> $ pluviometria_mensal <dbl> 9.2, 8.5, 14.8, 14.0, 25.4, 19.4, 21.8, 9.2, 8.4, …
#> $ pluviometria_hist   <dbl> 80.5, 59.6, 76.7, 76.0, 92.8, 139.4, 112.5, 80.5, …
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
| 2022-09-09 | Cantareira   |               31.8 |            -0.2 |          312.72114 |              0.0 |                 9.2 |              80.5 |
| 2022-09-09 | Alto Tietê   |               49.0 |            -0.2 |          274.56635 |              0.1 |                 8.5 |              59.6 |
| 2022-09-09 | Guarapiranga |               58.5 |            -0.2 |          100.16933 |              0.0 |                14.8 |              76.7 |
| 2022-09-09 | Cotia        |               57.1 |            -0.2 |            9.42683 |              0.2 |                14.0 |              76.0 |
| 2022-09-09 | Rio Grande   |               89.2 |            -0.1 |          100.01783 |              0.0 |                25.4 |              92.8 |
| 2022-09-09 | Rio Claro    |               45.0 |            -0.1 |            6.14515 |              0.0 |                19.4 |             139.4 |
| 2022-09-09 | São Lourenço |               66.3 |            -0.2 |           58.86521 |              0.0 |                21.8 |             112.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
