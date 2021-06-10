
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
#> Rows: 48,211
#> Columns: 8
#> $ data                <date> 2021-06-09, 2021-06-09, 2021-06-09, 2021-06-09, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 46.7, 57.0, 64.6, 75.5, 79.8, 49.4, 73.1, 46.7, 57…
#> $ volume_variacao     <dbl> 0.0, -0.1, -0.3, 0.0, -0.1, 0.4, 0.1, -0.1, 0.0, -…
#> $ volume_operacional  <dbl> 458.62344, 319.22959, 110.61772, 12.45378, 89.5132…
#> $ pluviometria_dia    <dbl> 0.1, 0.5, 1.6, 0.4, 2.4, 8.6, 2.4, 0.3, 1.8, 0.4, …
#> $ pluviometria_mensal <dbl> 0.6, 3.1, 2.8, 7.6, 9.6, 14.6, 17.2, 0.5, 2.6, 1.2…
#> $ pluviometria_hist   <dbl> 57.1, 56.8, 53.9, 59.9, 61.6, 98.1, 76.3, 57.1, 56…
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
| 2021-06-09 | Cantareira   |                46.7 |              0.0 |           458.62344 |               0.1 |                  0.6 |               57.1 |
| 2021-06-09 | Alto Tietê   |                57.0 |            \-0.1 |           319.22959 |               0.5 |                  3.1 |               56.8 |
| 2021-06-09 | Guarapiranga |                64.6 |            \-0.3 |           110.61772 |               1.6 |                  2.8 |               53.9 |
| 2021-06-09 | Cotia        |                75.5 |              0.0 |            12.45378 |               0.4 |                  7.6 |               59.9 |
| 2021-06-09 | Rio Grande   |                79.8 |            \-0.1 |            89.51325 |               2.4 |                  9.6 |               61.6 |
| 2021-06-09 | Rio Claro    |                49.4 |              0.4 |             6.75669 |               8.6 |                 14.6 |               98.1 |
| 2021-06-09 | São Lourenço |                73.1 |              0.1 |            64.95360 |               2.4 |                 17.2 |               76.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
