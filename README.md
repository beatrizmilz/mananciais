
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
#> Rows: 49,989
#> Columns: 8
#> $ data                <date> 2022-02-18, 2022-02-18, 2022-02-18, 2022-02-18, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 42.7, 56.7, 84.7, 76.8, 100.2, 48.0, 83.6, 42.6, 5…
#> $ volume_variacao     <dbl> 0.1, 0.1, -0.2, 0.0, 0.0, 0.1, -0.5, 0.0, -0.1, -0…
#> $ volume_operacional  <dbl> 419.53679, 317.44735, 145.02797, 12.67718, 112.373…
#> $ pluviometria_dia    <dbl> 13.0, 5.6, 3.0, 3.2, 3.8, 20.4, 0.4, 0.0, 0.0, 0.2…
#> $ pluviometria_mensal <dbl> 94.2, 73.6, 44.4, 19.6, 70.0, 196.2, 67.6, 81.2, 6…
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
| 2022-02-18 | Cantareira   |                42.7 |              0.1 |           419.53679 |              13.0 |                 94.2 |              201.6 |
| 2022-02-18 | Alto Tietê   |                56.7 |              0.1 |           317.44735 |               5.6 |                 73.6 |              191.5 |
| 2022-02-18 | Guarapiranga |                84.7 |            \-0.2 |           145.02797 |               3.0 |                 44.4 |              193.9 |
| 2022-02-18 | Cotia        |                76.8 |              0.0 |            12.67718 |               3.2 |                 19.6 |              183.5 |
| 2022-02-18 | Rio Grande   |               100.2 |              0.0 |           112.37321 |               3.8 |                 70.0 |              207.7 |
| 2022-02-18 | Rio Claro    |                48.0 |              0.1 |             6.55952 |              20.4 |                196.2 |              238.7 |
| 2022-02-18 | São Lourenço |                83.6 |            \-0.5 |            74.26379 |               0.4 |                 67.6 |              233.4 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
