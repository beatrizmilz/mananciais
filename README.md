
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
#> Rows: 55,218
#> Columns: 8
#> $ data                <date> 2024-03-06, 2024-03-06, 2024-03-06, 2024-03-06, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 76.2, 70.1, 84.7, 90.7, 99.7, 39.5, 99.7, 76.0, 69…
#> $ volume_variacao     <dbl> 0.2, 0.3, -0.2, 0.2, 0.0, 0.2, 0.1, 0.0, -0.1, -0.…
#> $ volume_operacional  <dbl> 748.58586, 392.64784, 145.02797, 14.96893, 111.801…
#> $ pluviometria_dia    <dbl> 32.0, 21.1, 4.8, 12.4, 14.4, 11.2, 20.0, 4.5, 3.2,…
#> $ pluviometria_mensal <dbl> 41.0, 25.4, 6.8, 19.6, 15.0, 55.4, 24.8, 9.0, 4.3,…
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
| 2024-03-06 | Cantareira   |               76.2 |             0.2 |          748.58586 |             32.0 |                41.0 |             175.0 |
| 2024-03-06 | Alto Tietê   |               70.1 |             0.3 |          392.64784 |             21.1 |                25.4 |             154.4 |
| 2024-03-06 | Guarapiranga |               84.7 |            -0.2 |          145.02797 |              4.8 |                 6.8 |             155.9 |
| 2024-03-06 | Cotia        |               90.7 |             0.2 |           14.96893 |             12.4 |                19.6 |             154.1 |
| 2024-03-06 | Rio Grande   |               99.7 |             0.0 |          111.80112 |             14.4 |                15.0 |             185.2 |
| 2024-03-06 | Rio Claro    |               39.5 |             0.2 |            5.40469 |             11.2 |                55.4 |             241.0 |
| 2024-03-06 | São Lourenço |               99.7 |             0.1 |           88.59459 |             20.0 |                24.8 |             198.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
