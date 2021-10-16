
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
#> Rows: 49,107
#> Columns: 8
#> $ data                <date> 2021-10-15, 2021-10-15, 2021-10-15, 2021-10-15, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 28.2, 38.3, 46.0, 47.0, 78.0, 35.9, 53.7, 28.4, 38…
#> $ volume_variacao     <dbl> -0.2, -0.1, 0.0, -0.2, 0.1, -0.1, 0.0, -0.2, -0.2,…
#> $ volume_operacional  <dbl> 276.97146, 214.61335, 78.69646, 7.75827, 87.52755,…
#> $ pluviometria_dia    <dbl> 1.7, 5.7, 0.0, 0.0, 6.4, 1.2, 0.0, 0.1, 0.1, 0.0, …
#> $ pluviometria_mensal <dbl> 58.8, 34.8, 29.8, 30.2, 38.8, 43.6, 69.2, 57.1, 29…
#> $ pluviometria_hist   <dbl> 122.3, 110.3, 113.9, 114.0, 133.0, 174.7, 140.5, 1…
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
| 2021-10-15 | Cantareira   |                28.2 |            \-0.2 |           276.97146 |               1.7 |                 58.8 |              122.3 |
| 2021-10-15 | Alto Tietê   |                38.3 |            \-0.1 |           214.61335 |               5.7 |                 34.8 |              110.3 |
| 2021-10-15 | Guarapiranga |                46.0 |              0.0 |            78.69646 |               0.0 |                 29.8 |              113.9 |
| 2021-10-15 | Cotia        |                47.0 |            \-0.2 |             7.75827 |               0.0 |                 30.2 |              114.0 |
| 2021-10-15 | Rio Grande   |                78.0 |              0.1 |            87.52755 |               6.4 |                 38.8 |              133.0 |
| 2021-10-15 | Rio Claro    |                35.9 |            \-0.1 |             4.90590 |               1.2 |                 43.6 |              174.7 |
| 2021-10-15 | São Lourenço |                53.7 |              0.0 |            47.66259 |               0.0 |                 69.2 |              140.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
