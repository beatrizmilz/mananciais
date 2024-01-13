
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
#> Rows: 54,840
#> Columns: 8
#> $ data                <date> 2024-01-12, 2024-01-12, 2024-01-12, 2024-01-12, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 69.9, 56.8, 51.9, 76.3, 100.9, 38.3, 60.6, 70.1, 5…
#> $ volume_variacao     <dbl> -0.2, -0.3, 0.0, 0.0, 0.6, -0.3, 0.3, -0.1, -0.3, …
#> $ volume_operacional  <dbl> 686.76236, 318.36284, 88.88030, 12.58116, 113.1387…
#> $ pluviometria_dia    <dbl> 1.3, 0.0, 3.2, 6.2, 19.6, 2.6, 2.0, 10.7, 3.1, 31.…
#> $ pluviometria_mensal <dbl> 54.6, 28.6, 46.4, 39.0, 79.0, 61.4, 5.4, 53.3, 28.…
#> $ pluviometria_hist   <dbl> 262.7, 234.0, 229.8, 218.5, 245.9, 293.3, 273.2, 2…
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
| 2024-01-12 | Cantareira   |               69.9 |            -0.2 |          686.76236 |              1.3 |                54.6 |             262.7 |
| 2024-01-12 | Alto Tietê   |               56.8 |            -0.3 |          318.36284 |              0.0 |                28.6 |             234.0 |
| 2024-01-12 | Guarapiranga |               51.9 |             0.0 |           88.88030 |              3.2 |                46.4 |             229.8 |
| 2024-01-12 | Cotia        |               76.3 |             0.0 |           12.58116 |              6.2 |                39.0 |             218.5 |
| 2024-01-12 | Rio Grande   |              100.9 |             0.6 |          113.13879 |             19.6 |                79.0 |             245.9 |
| 2024-01-12 | Rio Claro    |               38.3 |            -0.3 |            5.22798 |              2.6 |                61.4 |             293.3 |
| 2024-01-12 | São Lourenço |               60.6 |             0.3 |           53.81628 |              2.0 |                 5.4 |             273.2 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
