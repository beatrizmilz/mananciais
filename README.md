
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
#> Rows: 49,555
#> Columns: 8
#> $ data                <date> 2021-12-18, 2021-12-18, 2021-12-18, 2021-12-18, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 25.2, 39.0, 55.7, 37.5, 84.8, 53.4, 74.1, 24.7, 38…
#> $ volume_variacao     <dbl> 0.5, 0.8, 0.1, 0.0, 0.3, 1.3, 0.4, 0.4, 0.6, 0.3, …
#> $ volume_operacional  <dbl> 247.23216, 218.49228, 95.41493, 6.18109, 95.10995,…
#> $ pluviometria_dia    <dbl> 7.4, 0.5, 0.2, 0.4, 3.6, 7.6, 1.2, 34.8, 34.4, 0.0…
#> $ pluviometria_mensal <dbl> 83.3, 110.9, 69.8, 73.4, 95.8, 236.2, 69.4, 75.9, …
#> $ pluviometria_hist   <dbl> 207.6, 190.9, 174.0, 168.4, 187.6, 256.5, 210.6, 2…
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

| data       | sistema      | volume\_porcentagem | volume\_variacao | volume\_operacional | pluviometria\_dia | pluviometria\_mensal | pluviometria\_hist |
| :--------- | :----------- | ------------------: | ---------------: | ------------------: | ----------------: | -------------------: | -----------------: |
| 2021-12-18 | Cantareira   |                25.2 |              0.5 |           247.23216 |               7.4 |                 83.3 |              207.6 |
| 2021-12-18 | Alto Tietê   |                39.0 |              0.8 |           218.49228 |               0.5 |                110.9 |              190.9 |
| 2021-12-18 | Guarapiranga |                55.7 |              0.1 |            95.41493 |               0.2 |                 69.8 |              174.0 |
| 2021-12-18 | Cotia        |                37.5 |              0.0 |             6.18109 |               0.4 |                 73.4 |              168.4 |
| 2021-12-18 | Rio Grande   |                84.8 |              0.3 |            95.10995 |               3.6 |                 95.8 |              187.6 |
| 2021-12-18 | Rio Claro    |                53.4 |              1.3 |             7.29980 |               7.6 |                236.2 |              256.5 |
| 2021-12-18 | São Lourenço |                74.1 |              0.4 |            65.84176 |               1.2 |                 69.4 |              210.6 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
