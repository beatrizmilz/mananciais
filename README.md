
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
#> Rows: 54,490
#> Columns: 8
#> $ data                <date> 2023-11-23, 2023-11-23, 2023-11-23, 2023-11-23, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 72.6, 62.5, 59.1, 87.1, 100.7, 38.6, 60.7, 72.6, 6…
#> $ volume_variacao     <dbl> 0.0, -0.2, -0.3, 0.0, 0.0, -0.2, 0.7, -0.1, -0.1, …
#> $ volume_operacional  <dbl> 712.95943, 350.04114, 101.12852, 14.37509, 112.947…
#> $ pluviometria_dia    <dbl> 1.2, 0.8, 0.0, 5.8, 1.0, 1.4, 35.2, 0.0, 0.8, 0.4,…
#> $ pluviometria_mensal <dbl> 88.4, 55.6, 85.2, 65.0, 47.4, 100.0, 124.4, 87.2, …
#> $ pluviometria_hist   <dbl> 149.8, 122.4, 124.0, 123.9, 138.0, 194.3, 150.4, 1…
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
| 2023-11-23 | Cantareira   |               72.6 |             0.0 |          712.95943 |              1.2 |                88.4 |             149.8 |
| 2023-11-23 | Alto Tietê   |               62.5 |            -0.2 |          350.04114 |              0.8 |                55.6 |             122.4 |
| 2023-11-23 | Guarapiranga |               59.1 |            -0.3 |          101.12852 |              0.0 |                85.2 |             124.0 |
| 2023-11-23 | Cotia        |               87.1 |             0.0 |           14.37509 |              5.8 |                65.0 |             123.9 |
| 2023-11-23 | Rio Grande   |              100.7 |             0.0 |          112.94709 |              1.0 |                47.4 |             138.0 |
| 2023-11-23 | Rio Claro    |               38.6 |            -0.2 |            5.27663 |              1.4 |               100.0 |             194.3 |
| 2023-11-23 | São Lourenço |               60.7 |             0.7 |           53.90843 |             35.2 |               124.4 |             150.4 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
