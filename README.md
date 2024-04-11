
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
#> Rows: 55,463
#> Columns: 8
#> $ data                <date> 2024-04-10, 2024-04-10, 2024-04-10, 2024-04-10, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 77.4, 76.5, 85.9, 86.9, 97.6, 39.5, 99.9, 77.5, 76…
#> $ volume_variacao     <dbl> -0.1, 0.0, -0.2, -0.2, 0.0, -0.1, 0.4, -0.1, 0.0, …
#> $ volume_operacional  <dbl> 760.34783, 428.55291, 147.12384, 14.34060, 109.530…
#> $ pluviometria_dia    <dbl> 0.7, 3.6, 0.2, 0.2, 0.0, 0.0, 1.4, 2.6, 7.9, 1.6, …
#> $ pluviometria_mensal <dbl> 3.5, 15.1, 5.6, 4.8, 32.4, 11.8, 15.6, 2.8, 11.5, …
#> $ pluviometria_hist   <dbl> 80.7, 88.3, 72.1, 78.0, 102.6, 193.1, 110.0, 80.7,…
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
| 2024-04-10 | Cantareira   |               77.4 |            -0.1 |          760.34783 |              0.7 |                 3.5 |              80.7 |
| 2024-04-10 | Alto Tietê   |               76.5 |             0.0 |          428.55291 |              3.6 |                15.1 |              88.3 |
| 2024-04-10 | Guarapiranga |               85.9 |            -0.2 |          147.12384 |              0.2 |                 5.6 |              72.1 |
| 2024-04-10 | Cotia        |               86.9 |            -0.2 |           14.34060 |              0.2 |                 4.8 |              78.0 |
| 2024-04-10 | Rio Grande   |               97.6 |             0.0 |          109.53069 |              0.0 |                32.4 |             102.6 |
| 2024-04-10 | Rio Claro    |               39.5 |            -0.1 |            5.39476 |              0.0 |                11.8 |             193.1 |
| 2024-04-10 | São Lourenço |               99.9 |             0.4 |           88.70790 |              1.4 |                15.6 |             110.0 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
