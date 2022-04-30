
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
#> Rows: 50,479
#> Columns: 8
#> $ data                <date> 2022-04-29, 2022-04-29, 2022-04-29, 2022-04-29, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 44.1, 60.7, 87.8, 91.2, 100.7, 46.1, 93.3, 44.1, 6…
#> $ volume_variacao     <dbl> 0.0, -0.1, -0.3, -0.2, -0.2, -0.2, -0.2, -0.1, -0.…
#> $ volume_operacional  <dbl> 432.67653, 340.08010, 150.27581, 15.03972, 112.947…
#> $ pluviometria_dia    <dbl> 0.0, 0.1, 0.0, 0.2, 0.0, 0.2, 0.4, 0.0, 0.3, 0.0, …
#> $ pluviometria_mensal <dbl> 13.3, 44.4, 15.8, 19.4, 51.6, 218.8, 54.0, 13.3, 4…
#> $ pluviometria_hist   <dbl> 83.2, 91.5, 72.3, 78.3, 103.1, 192.1, 110.7, 83.2,…
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
| 2022-04-29 | Cantareira   |                44.1 |              0.0 |           432.67653 |               0.0 |                 13.3 |               83.2 |
| 2022-04-29 | Alto Tietê   |                60.7 |            \-0.1 |           340.08010 |               0.1 |                 44.4 |               91.5 |
| 2022-04-29 | Guarapiranga |                87.8 |            \-0.3 |           150.27581 |               0.0 |                 15.8 |               72.3 |
| 2022-04-29 | Cotia        |                91.2 |            \-0.2 |            15.03972 |               0.2 |                 19.4 |               78.3 |
| 2022-04-29 | Rio Grande   |               100.7 |            \-0.2 |           112.94709 |               0.0 |                 51.6 |              103.1 |
| 2022-04-29 | Rio Claro    |                46.1 |            \-0.2 |             6.29959 |               0.2 |                218.8 |              192.1 |
| 2022-04-29 | São Lourenço |                93.3 |            \-0.2 |            82.91305 |               0.4 |                 54.0 |              110.7 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
