
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
#> Rows: 49,898
#> Columns: 8
#> $ data                <date> 2022-02-05, 2022-02-05, 2022-02-05, 2022-02-05, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 37.6, 54.0, 84.3, 74.3, 101.4, 43.5, 93.8, 36.9, 5…
#> $ volume_variacao     <dbl> 0.7, 0.3, -0.9, 0.7, -0.3, -0.3, 0.2, 0.8, 0.6, -0…
#> $ volume_operacional  <dbl> 369.03732, 302.38787, 144.24321, 12.26412, 113.715…
#> $ pluviometria_dia    <dbl> 5.3, 0.1, 8.6, 5.6, 0.2, 0.0, 0.4, 0.3, 1.5, 1.8, …
#> $ pluviometria_mensal <dbl> 41.2, 37.2, 33.6, 14.0, 32.2, 39.8, 61.6, 35.9, 37…
#> $ pluviometria_hist   <dbl> 201.6, 191.5, 193.9, 183.5, 207.7, 238.7, 233.4, 2…
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
| 2022-02-05 | Cantareira   |                37.6 |              0.7 |           369.03732 |               5.3 |                 41.2 |              201.6 |
| 2022-02-05 | Alto Tietê   |                54.0 |              0.3 |           302.38787 |               0.1 |                 37.2 |              191.5 |
| 2022-02-05 | Guarapiranga |                84.3 |            \-0.9 |           144.24321 |               8.6 |                 33.6 |              193.9 |
| 2022-02-05 | Cotia        |                74.3 |              0.7 |            12.26412 |               5.6 |                 14.0 |              183.5 |
| 2022-02-05 | Rio Grande   |               101.4 |            \-0.3 |           113.71507 |               0.2 |                 32.2 |              207.7 |
| 2022-02-05 | Rio Claro    |                43.5 |            \-0.3 |             5.94007 |               0.0 |                 39.8 |              238.7 |
| 2022-02-05 | São Lourenço |                93.8 |              0.2 |            83.35188 |               0.4 |                 61.6 |              233.4 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
