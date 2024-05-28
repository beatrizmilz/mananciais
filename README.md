
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
#> Rows: 55,792
#> Columns: 8
#> $ data                <date> 2024-05-27, 2024-05-27, 2024-05-27, 2024-05-27, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 69.8, 69.7, 73.7, 74.3, 84.5, 38.8, 93.6, 69.6, 69…
#> $ volume_variacao     <dbl> 0.2, 0.1, 0.3, 0.3, 0.0, 0.5, 0.6, 0.0, -0.2, -0.1…
#> $ volume_operacional  <dbl> 685.80194, 390.65582, 126.16078, 12.26412, 94.7994…
#> $ pluviometria_dia    <dbl> 28.7, 17.4, 14.4, 12.6, 2.0, 17.2, 17.0, 12.1, 9.6…
#> $ pluviometria_mensal <dbl> 46.9, 35.2, 27.0, 30.6, 20.6, 55.2, 47.8, 18.2, 17…
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
| 2024-05-27 | Cantareira   |               69.8 |             0.2 |          685.80194 |             28.7 |                46.9 |              73.8 |
| 2024-05-27 | Alto Tietê   |               69.7 |             0.1 |          390.65582 |             17.4 |                35.2 |              56.4 |
| 2024-05-27 | Guarapiranga |               73.7 |             0.3 |          126.16078 |             14.4 |                27.0 |              58.8 |
| 2024-05-27 | Cotia        |               74.3 |             0.3 |           12.26412 |             12.6 |                30.6 |              63.6 |
| 2024-05-27 | Rio Grande   |               84.5 |             0.0 |           94.79948 |              2.0 |                20.6 |              78.2 |
| 2024-05-27 | Rio Claro    |               38.8 |             0.5 |            5.29619 |             17.2 |                55.2 |             131.8 |
| 2024-05-27 | São Lourenço |               93.6 |             0.6 |           83.13232 |             17.0 |                47.8 |              87.6 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
