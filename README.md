
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
#> Rows: 48,687
#> Columns: 8
#> $ data                <date> 2021-08-16, 2021-08-16, 2021-08-16, 2021-08-16, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 39.3, 46.8, 51.2, 60.8, 68.2, 45.2, 58.5, 39.5, 47…
#> $ volume_variacao     <dbl> -0.2, -0.2, -0.3, -0.4, 0.3, -0.3, -0.1, -0.1, -0.…
#> $ volume_operacional  <dbl> 386.44417, 262.31252, 87.72895, 10.03318, 76.45642…
#> $ pluviometria_dia    <dbl> 0.0, 0.0, 0.0, 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, …
#> $ pluviometria_mensal <dbl> 0.1, 2.8, 0.6, 0.8, 1.0, 34.2, 5.2, 0.1, 2.8, 0.6,…
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
| 2021-08-16 | Cantareira   |                39.3 |            \-0.2 |           386.44417 |               0.0 |                  0.1 |               33.2 |
| 2021-08-16 | Alto Tietê   |                46.8 |            \-0.2 |           262.31252 |               0.0 |                  2.8 |               36.1 |
| 2021-08-16 | Guarapiranga |                51.2 |            \-0.3 |            87.72895 |               0.0 |                  0.6 |               40.0 |
| 2021-08-16 | Cotia        |                60.8 |            \-0.4 |            10.03318 |               0.2 |                  0.8 |               37.7 |
| 2021-08-16 | Rio Grande   |                68.2 |              0.3 |            76.45642 |               0.0 |                  1.0 |               49.1 |
| 2021-08-16 | Rio Claro    |                45.2 |            \-0.3 |             6.17801 |               0.0 |                 34.2 |               99.5 |
| 2021-08-16 | São Lourenço |                58.5 |            \-0.1 |            51.98359 |               0.0 |                  5.2 |               62.7 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
