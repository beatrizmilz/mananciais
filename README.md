
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
#> Rows: 55,239
#> Columns: 8
#> $ data                <date> 2024-03-09, 2024-03-09, 2024-03-09, 2024-03-09, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 76.8, 71.1, 86.4, 91.4, 101.5, 41.5, 99.6, 76.4, 7…
#> $ volume_variacao     <dbl> 0.4, 0.1, 1.2, 0.7, 0.3, 0.0, 0.4, 0.1, 0.4, 0.2, …
#> $ volume_operacional  <dbl> 754.40028, 398.35972, 147.91095, 15.07519, 113.907…
#> $ pluviometria_dia    <dbl> 27.4, 3.6, 29.4, 19.8, 15.2, 2.2, 1.4, 0.1, 1.4, 0…
#> $ pluviometria_mensal <dbl> 69.7, 38.4, 36.2, 40.8, 45.8, 90.2, 32.6, 42.3, 34…
#> $ pluviometria_hist   <dbl> 175.0, 154.4, 155.9, 154.1, 185.2, 241.0, 198.9, 1…
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
| 2024-03-09 | Cantareira   |               76.8 |             0.4 |          754.40028 |             27.4 |                69.7 |             175.0 |
| 2024-03-09 | Alto Tietê   |               71.1 |             0.1 |          398.35972 |              3.6 |                38.4 |             154.4 |
| 2024-03-09 | Guarapiranga |               86.4 |             1.2 |          147.91095 |             29.4 |                36.2 |             155.9 |
| 2024-03-09 | Cotia        |               91.4 |             0.7 |           15.07519 |             19.8 |                40.8 |             154.1 |
| 2024-03-09 | Rio Grande   |              101.5 |             0.3 |          113.90757 |             15.2 |                45.8 |             185.2 |
| 2024-03-09 | Rio Claro    |               41.5 |             0.0 |            5.67800 |              2.2 |                90.2 |             241.0 |
| 2024-03-09 | São Lourenço |               99.6 |             0.4 |           88.48135 |              1.4 |                32.6 |             198.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
