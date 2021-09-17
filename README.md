
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
#> Rows: 48,904
#> Columns: 8
#> $ data                <date> 2021-09-16, 2021-09-16, 2021-09-16, 2021-09-16, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 33.7, 42.4, 47.3, 54.1, 73.7, 38.8, 53.0, 33.9, 42…
#> $ volume_variacao     <dbl> -0.2, -0.1, -0.2, -0.1, 0.1, 0.1, -0.4, -0.2, -0.2…
#> $ volume_operacional  <dbl> 331.15638, 237.45579, 80.92418, 8.92027, 82.67675,…
#> $ pluviometria_dia    <dbl> 0.7, 1.0, 1.8, 1.4, 3.2, 5.8, 2.6, 0.0, 0.0, 0.0, …
#> $ pluviometria_mensal <dbl> 24.6, 13.4, 3.8, 10.2, 4.8, 23.6, 17.4, 23.9, 12.4…
#> $ pluviometria_hist   <dbl> 83.2, 78.3, 77.0, 81.3, 93.9, 140.6, 114.0, 83.2, …
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
| 2021-09-16 | Cantareira   |                33.7 |            \-0.2 |           331.15638 |               0.7 |                 24.6 |               83.2 |
| 2021-09-16 | Alto Tietê   |                42.4 |            \-0.1 |           237.45579 |               1.0 |                 13.4 |               78.3 |
| 2021-09-16 | Guarapiranga |                47.3 |            \-0.2 |            80.92418 |               1.8 |                  3.8 |               77.0 |
| 2021-09-16 | Cotia        |                54.1 |            \-0.1 |             8.92027 |               1.4 |                 10.2 |               81.3 |
| 2021-09-16 | Rio Grande   |                73.7 |              0.1 |            82.67675 |               3.2 |                  4.8 |               93.9 |
| 2021-09-16 | Rio Claro    |                38.8 |              0.1 |             5.29619 |               5.8 |                 23.6 |              140.6 |
| 2021-09-16 | São Lourenço |                53.0 |            \-0.4 |            47.04123 |               2.6 |                 17.4 |              114.0 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
