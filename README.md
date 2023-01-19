
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
#> Rows: 52,327
#> Columns: 8
#> $ data                <date> 2023-01-18, 2023-01-18, 2023-01-18, 2023-01-18, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 49.0, 51.2, 78.9, 70.4, 102.2, 41.8, 99.2, 48.9, 5…
#> $ volume_variacao     <dbl> 0.1, 0.0, 0.0, 1.1, -0.4, 0.0, -0.3, 0.4, 0.0, 0.0…
#> $ volume_operacional  <dbl> 481.70427, 287.00723, 135.14254, 11.61350, 114.679…
#> $ pluviometria_dia    <dbl> 0.1, 0.1, 0.0, 0.8, 0.0, 0.0, 0.0, 2.1, 0.0, 0.2, …
#> $ pluviometria_mensal <dbl> 138.0, 75.8, 169.4, 183.6, 82.2, 127.2, 206.4, 137…
#> $ pluviometria_hist   <dbl> 264.5, 239.1, 229.8, 218.2, 247.5, 295.5, 273.2, 2…
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
| 2023-01-18 | Cantareira   |               49.0 |             0.1 |          481.70427 |              0.1 |               138.0 |             264.5 |
| 2023-01-18 | Alto Tietê   |               51.2 |             0.0 |          287.00723 |              0.1 |                75.8 |             239.1 |
| 2023-01-18 | Guarapiranga |               78.9 |             0.0 |          135.14254 |              0.0 |               169.4 |             229.8 |
| 2023-01-18 | Cotia        |               70.4 |             1.1 |           11.61350 |              0.8 |               183.6 |             218.2 |
| 2023-01-18 | Rio Grande   |              102.2 |            -0.4 |          114.67957 |              0.0 |                82.2 |             247.5 |
| 2023-01-18 | Rio Claro    |               41.8 |             0.0 |            5.70899 |              0.0 |               127.2 |             295.5 |
| 2023-01-18 | São Lourenço |               99.2 |            -0.3 |           88.14210 |              0.0 |               206.4 |             273.2 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
