
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
#> Rows: 53,629
#> Columns: 8
#> $ data                <date> 2023-07-23, 2023-07-23, 2023-07-23, 2023-07-23, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 80.1, 68.4, 69.7, 93.3, 96.6, 39.0, 75.5, 80.3, 68…
#> $ volume_variacao     <dbl> -0.2, -0.2, -0.3, -0.2, -0.2, -0.1, -0.8, -0.2, -0…
#> $ volume_operacional  <dbl> 786.81880, 383.19861, 119.32894, 15.39664, 108.406…
#> $ pluviometria_dia    <dbl> 0.0, 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.0, …
#> $ pluviometria_mensal <dbl> 4.8, 7.6, 6.2, 11.6, 7.8, 31.4, 19.4, 4.8, 7.4, 6.…
#> $ pluviometria_hist   <dbl> 44.0, 49.7, 41.2, 47.5, 53.5, 89.5, 76.5, 44.0, 49…
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
| 2023-07-23 | Cantareira   |               80.1 |            -0.2 |          786.81880 |              0.0 |                 4.8 |              44.0 |
| 2023-07-23 | Alto Tietê   |               68.4 |            -0.2 |          383.19861 |              0.2 |                 7.6 |              49.7 |
| 2023-07-23 | Guarapiranga |               69.7 |            -0.3 |          119.32894 |              0.0 |                 6.2 |              41.2 |
| 2023-07-23 | Cotia        |               93.3 |            -0.2 |           15.39664 |              0.0 |                11.6 |              47.5 |
| 2023-07-23 | Rio Grande   |               96.6 |            -0.2 |          108.40616 |              0.0 |                 7.8 |              53.5 |
| 2023-07-23 | Rio Claro    |               39.0 |            -0.1 |            5.33545 |              0.0 |                31.4 |              89.5 |
| 2023-07-23 | São Lourenço |               75.5 |            -0.8 |           67.03339 |              0.0 |                19.4 |              76.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
