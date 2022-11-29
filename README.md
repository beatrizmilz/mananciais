
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
#> Rows: 51,970
#> Columns: 8
#> $ data                <date> 2022-11-28, 2022-11-28, 2022-11-28, 2022-11-28, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 32.6, 45.4, 70.4, 39.0, 103.6, 39.1, 71.9, 32.5, 4…
#> $ volume_variacao     <dbl> 0.1, -0.1, 1.7, -0.3, -0.5, 0.2, -0.1, 0.0, 0.1, 2…
#> $ volume_operacional  <dbl> 320.47330, 254.16184, 120.58715, 6.44143, 116.2332…
#> $ pluviometria_dia    <dbl> 5.6, 1.5, 0.8, 0.4, 6.0, 3.6, 0.0, 0.3, 0.8, 0.0, …
#> $ pluviometria_mensal <dbl> 136.4, 65.1, 92.8, 86.2, 151.4, 197.2, 97.4, 130.8…
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
| 2022-11-28 | Cantareira   |               32.6 |             0.1 |          320.47330 |              5.6 |               136.4 |             149.5 |
| 2022-11-28 | Alto Tietê   |               45.4 |            -0.1 |          254.16184 |              1.5 |                65.1 |             124.6 |
| 2022-11-28 | Guarapiranga |               70.4 |             1.7 |          120.58715 |              0.8 |                92.8 |             124.0 |
| 2022-11-28 | Cotia        |               39.0 |            -0.3 |            6.44143 |              0.4 |                86.2 |             123.9 |
| 2022-11-28 | Rio Grande   |              103.6 |            -0.5 |          116.23326 |              6.0 |               151.4 |             137.3 |
| 2022-11-28 | Rio Claro    |               39.1 |             0.2 |            5.34531 |              3.6 |               197.2 |             194.0 |
| 2022-11-28 | São Lourenço |               71.9 |            -0.1 |           63.87445 |              0.0 |                97.4 |             151.2 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
