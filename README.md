
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
#> Rows: 48,001
#> Columns: 8
#> $ data                <date> 2021-05-10, 2021-05-10, 2021-05-10, 2021-05-10, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 49.5, 58.4, 69.3, 77.6, 88.2, 71.1, 77.6, 49.6, 58…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.1, -0.2, -0.3, 0.1, -0.2, -0.2, -0.…
#> $ volume_operacional  <dbl> 486.27168, 327.20399, 118.57560, 12.80588, 98.9536…
#> $ pluviometria_dia    <dbl> 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, …
#> $ pluviometria_mensal <dbl> 0.3, 1.6, 0.6, 1.0, 1.6, 28.6, 6.0, 0.3, 1.6, 0.6,…
#> $ pluviometria_hist   <dbl> 77.4, 75.4, 58.6, 64.6, 80.4, 133.3, 89.3, 77.4, 7…
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
| 2021-05-10 | Cantareira   |                49.5 |            \-0.1 |           486.27168 |                 0 |                  0.3 |               77.4 |
| 2021-05-10 | Alto Tietê   |                58.4 |            \-0.1 |           327.20399 |                 0 |                  1.6 |               75.4 |
| 2021-05-10 | Guarapiranga |                69.3 |            \-0.1 |           118.57560 |                 0 |                  0.6 |               58.6 |
| 2021-05-10 | Cotia        |                77.6 |            \-0.2 |            12.80588 |                 0 |                  1.0 |               64.6 |
| 2021-05-10 | Rio Grande   |                88.2 |            \-0.3 |            98.95368 |                 0 |                  1.6 |               80.4 |
| 2021-05-10 | Rio Claro    |                71.1 |              0.1 |             9.72284 |                 0 |                 28.6 |              133.3 |
| 2021-05-10 | São Lourenço |                77.6 |            \-0.2 |            68.93775 |                 0 |                  6.0 |               89.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
