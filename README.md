
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
#> Rows: 53,783
#> Columns: 8
#> $ data                <date> 2023-08-14, 2023-08-14, 2023-08-14, 2023-08-14, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 76.1, 65.6, 62.9, 88.2, 94.8, 42.3, 67.0, 76.3, 65…
#> $ volume_variacao     <dbl> -0.2, -0.1, -0.3, -0.4, 0.0, 0.9, 0.1, -0.2, -0.1,…
#> $ volume_operacional  <dbl> 747.83900, 367.70051, 107.67228, 14.54829, 106.362…
#> $ pluviometria_dia    <dbl> 0.0, 0.0, 0.0, 0.0, 1.4, 2.8, 0.2, 0.4, 0.8, 4.4, …
#> $ pluviometria_mensal <dbl> 1.9, 24.0, 8.6, 7.8, 9.6, 51.0, 10.8, 1.9, 24.0, 8…
#> $ pluviometria_hist   <dbl> 34.1, 29.0, 39.9, 40.2, 48.7, 100.4, 61.3, 34.1, 2…
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
| 2023-08-14 | Cantareira   |               76.1 |            -0.2 |          747.83900 |              0.0 |                 1.9 |              34.1 |
| 2023-08-14 | Alto Tietê   |               65.6 |            -0.1 |          367.70051 |              0.0 |                24.0 |              29.0 |
| 2023-08-14 | Guarapiranga |               62.9 |            -0.3 |          107.67228 |              0.0 |                 8.6 |              39.9 |
| 2023-08-14 | Cotia        |               88.2 |            -0.4 |           14.54829 |              0.0 |                 7.8 |              40.2 |
| 2023-08-14 | Rio Grande   |               94.8 |             0.0 |          106.36289 |              1.4 |                 9.6 |              48.7 |
| 2023-08-14 | Rio Claro    |               42.3 |             0.9 |            5.78178 |              2.8 |                51.0 |             100.4 |
| 2023-08-14 | São Lourenço |               67.0 |             0.1 |           59.53088 |              0.2 |                10.8 |              61.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
