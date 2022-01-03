
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
#> Rows: 49,660
#> Columns: 8
#> $ data                <date> 2022-01-02, 2022-01-02, 2022-01-02, 2022-01-02, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 25.3, 40.9, 61.0, 42.6, 85.7, 46.1, 82.1, 25.0, 40…
#> $ volume_variacao     <dbl> 0.3, 0.5, 1.5, 1.3, 0.3, 0.1, 3.1, 0.1, 0.2, 2.1, …
#> $ volume_operacional  <dbl> 248.21328, 228.89807, 104.50679, 7.02551, 96.14923…
#> $ pluviometria_dia    <dbl> 14.2, 10.8, 4.4, 8.4, 1.8, 17.4, 2.4, 15.9, 13.4, …
#> $ pluviometria_mensal <dbl> 30.1, 24.2, 33.6, 26.0, 45.2, 18.4, 38.4, 15.9, 13…
#> $ pluviometria_hist   <dbl> 263.7, 243.3, 229.9, 217.9, 248.6, 296.9, 273.1, 2…
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
| 2022-01-02 | Cantareira   |                25.3 |              0.3 |           248.21328 |              14.2 |                 30.1 |              263.7 |
| 2022-01-02 | Alto Tietê   |                40.9 |              0.5 |           228.89807 |              10.8 |                 24.2 |              243.3 |
| 2022-01-02 | Guarapiranga |                61.0 |              1.5 |           104.50679 |               4.4 |                 33.6 |              229.9 |
| 2022-01-02 | Cotia        |                42.6 |              1.3 |             7.02551 |               8.4 |                 26.0 |              217.9 |
| 2022-01-02 | Rio Grande   |                85.7 |              0.3 |            96.14923 |               1.8 |                 45.2 |              248.6 |
| 2022-01-02 | Rio Claro    |                46.1 |              0.1 |             6.29959 |              17.4 |                 18.4 |              296.9 |
| 2022-01-02 | São Lourenço |                82.1 |              3.1 |            72.91625 |               2.4 |                 38.4 |              273.1 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
