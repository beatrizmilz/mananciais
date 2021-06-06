
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
#> Rows: 48,183
#> Columns: 8
#> $ data                <date> 2021-06-05, 2021-06-05, 2021-06-05, 2021-06-05, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 47.1, 57.4, 65.6, 75.7, 81.1, 49.4, 73.4, 47.2, 57…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.3, 0.0, -0.5, -0.2, -0.2, -0.2, -0.…
#> $ volume_operacional  <dbl> 462.71707, 321.40360, 112.34593, 12.48555, 91.0197…
#> $ pluviometria_dia    <dbl> 0.0, 0.3, 0.2, 0.2, 0.0, 0.4, 0.0, 0.1, 0.1, 0.0, …
#> $ pluviometria_mensal <dbl> 0.2, 0.6, 0.8, 1.2, 2.0, 0.6, 4.2, 0.2, 0.3, 0.6, …
#> $ pluviometria_hist   <dbl> 57.1, 56.8, 53.9, 59.9, 61.6, 98.1, 76.3, 57.1, 56…
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
| 2021-06-05 | Cantareira   |                47.1 |            \-0.1 |           462.71707 |               0.0 |                  0.2 |               57.1 |
| 2021-06-05 | Alto Tietê   |                57.4 |            \-0.1 |           321.40360 |               0.3 |                  0.6 |               56.8 |
| 2021-06-05 | Guarapiranga |                65.6 |            \-0.3 |           112.34593 |               0.2 |                  0.8 |               53.9 |
| 2021-06-05 | Cotia        |                75.7 |              0.0 |            12.48555 |               0.2 |                  1.2 |               59.9 |
| 2021-06-05 | Rio Grande   |                81.1 |            \-0.5 |            91.01974 |               0.0 |                  2.0 |               61.6 |
| 2021-06-05 | Rio Claro    |                49.4 |            \-0.2 |             6.75669 |               0.4 |                  0.6 |               98.1 |
| 2021-06-05 | São Lourenço |                73.4 |            \-0.2 |            65.15056 |               0.0 |                  4.2 |               76.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
