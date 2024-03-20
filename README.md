
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
#> Rows: 55,309
#> Columns: 8
#> $ data                <date> 2024-03-19, 2024-03-19, 2024-03-19, 2024-03-19, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 76.7, 73.0, 88.1, 90.7, 100.9, 42.2, 99.4, 76.7, 7…
#> $ volume_variacao     <dbl> 0.0, 0.2, 0.5, -0.3, 0.0, -0.1, 0.3, -0.1, 0.3, -0…
#> $ volume_operacional  <dbl> 753.68771, 408.98091, 150.80202, 14.96893, 113.138…
#> $ pluviometria_dia    <dbl> 6.9, 9.4, 21.4, 2.8, 0.0, 0.0, 0.0, 15.1, 20.4, 0.…
#> $ pluviometria_mensal <dbl> 106.2, 96.7, 62.2, 46.0, 71.4, 157.4, 43.2, 99.3, …
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
| 2024-03-19 | Cantareira   |               76.7 |             0.0 |          753.68771 |              6.9 |               106.2 |             175.0 |
| 2024-03-19 | Alto Tietê   |               73.0 |             0.2 |          408.98091 |              9.4 |                96.7 |             154.4 |
| 2024-03-19 | Guarapiranga |               88.1 |             0.5 |          150.80202 |             21.4 |                62.2 |             155.9 |
| 2024-03-19 | Cotia        |               90.7 |            -0.3 |           14.96893 |              2.8 |                46.0 |             154.1 |
| 2024-03-19 | Rio Grande   |              100.9 |             0.0 |          113.13879 |              0.0 |                71.4 |             185.2 |
| 2024-03-19 | Rio Claro    |               42.2 |            -0.1 |            5.76091 |              0.0 |               157.4 |             241.0 |
| 2024-03-19 | São Lourenço |               99.4 |             0.3 |           88.25511 |              0.0 |                43.2 |             198.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
