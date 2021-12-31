
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
#> Rows: 49,639
#> Columns: 8
#> $ data                <date> 2021-12-30, 2021-12-30, 2021-12-30, 2021-12-30, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 24.8, 40.0, 56.4, 37.2, 83.9, 45.9, 75.4, 24.8, 40…
#> $ volume_variacao     <dbl> 0.0, -0.1, 0.1, -0.1, -0.1, -0.3, -0.1, 0.0, 0.1, …
#> $ volume_operacional  <dbl> 243.94665, 224.16671, 96.59693, 6.13826, 94.07740,…
#> $ pluviometria_dia    <dbl> 13.7, 0.0, 0.0, 0.2, 0.0, 0.8, 0.0, 7.6, 7.5, 0.0,…
#> $ pluviometria_mensal <dbl> 126.9, 134.2, 83.2, 123.2, 137.4, 289.6, 136.4, 11…
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
| 2021-12-30 | Cantareira   |                24.8 |              0.0 |           243.94665 |              13.7 |                126.9 |              207.6 |
| 2021-12-30 | Alto Tietê   |                40.0 |            \-0.1 |           224.16671 |               0.0 |                134.2 |              190.9 |
| 2021-12-30 | Guarapiranga |                56.4 |              0.1 |            96.59693 |               0.0 |                 83.2 |              174.0 |
| 2021-12-30 | Cotia        |                37.2 |            \-0.1 |             6.13826 |               0.2 |                123.2 |              168.4 |
| 2021-12-30 | Rio Grande   |                83.9 |            \-0.1 |            94.07740 |               0.0 |                137.4 |              187.6 |
| 2021-12-30 | Rio Claro    |                45.9 |            \-0.3 |             6.27735 |               0.8 |                289.6 |              256.5 |
| 2021-12-30 | São Lourenço |                75.4 |            \-0.1 |            66.93377 |               0.0 |                136.4 |              210.6 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
