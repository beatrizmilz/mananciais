
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
#> Rows: 48,113
#> Columns: 8
#> $ data                <date> 2021-05-26, 2021-05-26, 2021-05-26, 2021-05-26, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 48.3, 58.2, 67.7, 76.8, 85.2, 54.6, 76.1, 48.4, 58…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.2, -0.2, -0.4, -1.9, -1.1, 0.0, 0.0…
#> $ volume_operacional  <dbl> 474.11764, 326.04864, 115.82376, 12.67718, 95.5248…
#> $ pluviometria_dia    <dbl> 0.1, 0.2, 0.0, 0.4, 0.0, 0.0, 0.0, 0.0, 0.1, 0.0, …
#> $ pluviometria_mensal <dbl> 29.3, 32.4, 23.4, 29.4, 36.0, 88.2, 52.2, 29.2, 32…
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
| 2021-05-26 | Cantareira   |                48.3 |            \-0.1 |           474.11764 |               0.1 |                 29.3 |               77.4 |
| 2021-05-26 | Alto Tietê   |                58.2 |            \-0.1 |           326.04864 |               0.2 |                 32.4 |               75.4 |
| 2021-05-26 | Guarapiranga |                67.7 |            \-0.2 |           115.82376 |               0.0 |                 23.4 |               58.6 |
| 2021-05-26 | Cotia        |                76.8 |            \-0.2 |            12.67718 |               0.4 |                 29.4 |               64.6 |
| 2021-05-26 | Rio Grande   |                85.2 |            \-0.4 |            95.52486 |               0.0 |                 36.0 |               80.4 |
| 2021-05-26 | Rio Claro    |                54.6 |            \-1.9 |             7.46253 |               0.0 |                 88.2 |              133.3 |
| 2021-05-26 | São Lourenço |                76.1 |            \-1.1 |            67.63242 |               0.0 |                 52.2 |               89.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
