
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
#> Rows: 52,670
#> Columns: 8
#> $ data                <date> 2023-03-08, 2023-03-08, 2023-03-08, 2023-03-08, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 73.8, 70.7, 86.4, 95.3, 103.6, 42.8, 100.0, 73.3, …
#> $ volume_variacao     <dbl> 0.5, 0.2, 1.1, 0.4, 0.5, 0.0, -0.8, 0.8, 0.2, 1.0,…
#> $ volume_operacional  <dbl> 724.76728, 395.90542, 147.91095, 15.72208, 116.233…
#> $ pluviometria_dia    <dbl> 8.2, 0.0, 3.6, 0.2, 10.4, 0.0, 0.0, 7.7, 5.4, 0.2,…
#> $ pluviometria_mensal <dbl> 87.0, 40.0, 32.2, 28.4, 31.0, 36.4, 99.8, 78.8, 40…
#> $ pluviometria_hist   <dbl> 174.3, 155.5, 155.4, 154.6, 186.7, 243.5, 196.8, 1…
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
| 2023-03-08 | Cantareira   |               73.8 |             0.5 |          724.76728 |              8.2 |                87.0 |             174.3 |
| 2023-03-08 | Alto Tietê   |               70.7 |             0.2 |          395.90542 |              0.0 |                40.0 |             155.5 |
| 2023-03-08 | Guarapiranga |               86.4 |             1.1 |          147.91095 |              3.6 |                32.2 |             155.4 |
| 2023-03-08 | Cotia        |               95.3 |             0.4 |           15.72208 |              0.2 |                28.4 |             154.6 |
| 2023-03-08 | Rio Grande   |              103.6 |             0.5 |          116.23326 |             10.4 |                31.0 |             186.7 |
| 2023-03-08 | Rio Claro    |               42.8 |             0.0 |            5.84471 |              0.0 |                36.4 |             243.5 |
| 2023-03-08 | São Lourenço |              100.0 |            -0.8 |           88.82128 |              0.0 |                99.8 |             196.8 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
