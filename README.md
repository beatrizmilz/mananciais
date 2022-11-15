
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
#> Rows: 51,872
#> Columns: 8
#> $ data                <date> 2022-11-14, 2022-11-14, 2022-11-14, 2022-11-14, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 31.8, 46.9, 61.9, 42.6, 101.9, 36.3, 74.6, 31.8, 4…
#> $ volume_variacao     <dbl> 0.0, -0.1, 0.0, -0.1, -0.2, -1.6, -0.4, -0.1, 0.0,…
#> $ volume_operacional  <dbl> 312.28831, 262.87525, 105.96443, 7.02551, 114.2931…
#> $ pluviometria_dia    <dbl> 9.1, 1.1, 2.2, 12.0, 2.4, 0.2, 21.8, 0.0, 0.1, 0.2…
#> $ pluviometria_mensal <dbl> 63.8, 26.4, 24.0, 49.6, 79.8, 136.4, 79.4, 54.7, 2…
#> $ pluviometria_hist   <dbl> 149.5, 124.6, 124.0, 123.9, 137.3, 194.0, 151.2, 1…
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
| 2022-11-14 | Cantareira   |               31.8 |             0.0 |          312.28831 |              9.1 |                63.8 |             149.5 |
| 2022-11-14 | Alto Tietê   |               46.9 |            -0.1 |          262.87525 |              1.1 |                26.4 |             124.6 |
| 2022-11-14 | Guarapiranga |               61.9 |             0.0 |          105.96443 |              2.2 |                24.0 |             124.0 |
| 2022-11-14 | Cotia        |               42.6 |            -0.1 |            7.02551 |             12.0 |                49.6 |             123.9 |
| 2022-11-14 | Rio Grande   |              101.9 |            -0.2 |          114.29317 |              2.4 |                79.8 |             137.3 |
| 2022-11-14 | Rio Claro    |               36.3 |            -1.6 |            4.96165 |              0.2 |               136.4 |             194.0 |
| 2022-11-14 | São Lourenço |               74.6 |            -0.4 |           66.23803 |             21.8 |                79.4 |             151.2 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
