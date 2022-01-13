
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
#> Rows: 49,730
#> Columns: 8
#> $ data                <date> 2022-01-12, 2022-01-12, 2022-01-12, 2022-01-12, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 28.4, 46.4, 71.3, 53.8, 96.3, 49.2, 94.8, 28.1, 45…
#> $ volume_variacao     <dbl> 0.3, 0.5, 1.4, 0.8, 0.7, -1.8, 0.5, 0.3, 0.4, 1.2,…
#> $ volume_operacional  <dbl> 278.93852, 260.20789, 122.10126, 8.86786, 108.0328…
#> $ pluviometria_dia    <dbl> 11.3, 12.4, 31.8, 14.8, 24.8, 1.0, 28.8, 0.1, 0.0,…
#> $ pluviometria_mensal <dbl> 117.8, 94.0, 112.4, 119.2, 209.2, 220.8, 154.4, 10…
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
| 2022-01-12 | Cantareira   |                28.4 |              0.3 |           278.93852 |              11.3 |                117.8 |              263.7 |
| 2022-01-12 | Alto Tietê   |                46.4 |              0.5 |           260.20789 |              12.4 |                 94.0 |              243.3 |
| 2022-01-12 | Guarapiranga |                71.3 |              1.4 |           122.10126 |              31.8 |                112.4 |              229.9 |
| 2022-01-12 | Cotia        |                53.8 |              0.8 |             8.86786 |              14.8 |                119.2 |              217.9 |
| 2022-01-12 | Rio Grande   |                96.3 |              0.7 |           108.03289 |              24.8 |                209.2 |              248.6 |
| 2022-01-12 | Rio Claro    |                49.2 |            \-1.8 |             6.72158 |               1.0 |                220.8 |              296.9 |
| 2022-01-12 | São Lourenço |                94.8 |              0.5 |            84.23296 |              28.8 |                154.4 |              273.1 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
