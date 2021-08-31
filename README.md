
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
#> Rows: 48,785
#> Columns: 8
#> $ data                <date> 2021-08-30, 2021-08-30, 2021-08-30, 2021-08-30, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 37.3, 44.7, 49.9, 58.5, 71.0, 44.3, 56.4, 37.4, 44…
#> $ volume_variacao     <dbl> -0.1, 0.1, 0.7, 0.0, 0.8, 1.6, 1.2, 0.0, -0.1, 0.7…
#> $ volume_operacional  <dbl> 365.86217, 250.16939, 85.44080, 9.64485, 79.68722,…
#> $ pluviometria_dia    <dbl> 0.2, 3.8, 1.0, 0.4, 3.6, 20.0, 4.2, 16.8, 11.9, 11…
#> $ pluviometria_mensal <dbl> 21.1, 24.1, 23.4, 37.4, 20.4, 79.0, 51.4, 20.9, 20…
#> $ pluviometria_hist   <dbl> 33.2, 36.1, 40.0, 37.7, 49.1, 99.5, 62.7, 33.2, 36…
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
| 2021-08-30 | Cantareira   |                37.3 |            \-0.1 |           365.86217 |               0.2 |                 21.1 |               33.2 |
| 2021-08-30 | Alto Tietê   |                44.7 |              0.1 |           250.16939 |               3.8 |                 24.1 |               36.1 |
| 2021-08-30 | Guarapiranga |                49.9 |              0.7 |            85.44080 |               1.0 |                 23.4 |               40.0 |
| 2021-08-30 | Cotia        |                58.5 |              0.0 |             9.64485 |               0.4 |                 37.4 |               37.7 |
| 2021-08-30 | Rio Grande   |                71.0 |              0.8 |            79.68722 |               3.6 |                 20.4 |               49.1 |
| 2021-08-30 | Rio Claro    |                44.3 |              1.6 |             6.05817 |              20.0 |                 79.0 |               99.5 |
| 2021-08-30 | São Lourenço |                56.4 |              1.2 |            50.07999 |               4.2 |                 51.4 |               62.7 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
