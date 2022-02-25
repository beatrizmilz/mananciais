
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
#> Rows: 50,031
#> Columns: 8
#> $ data                <date> 2022-02-24, 2022-02-24, 2022-02-24, 2022-02-24, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 42.8, 57.0, 84.3, 78.6, 100.5, 48.7, 82.3, 42.8, 5…
#> $ volume_variacao     <dbl> 0.0, 0.0, 0.2, 1.0, -0.2, -1.1, 0.2, -0.1, -0.1, -…
#> $ volume_operacional  <dbl> 420.42316, 319.24001, 144.24321, 12.96781, 112.755…
#> $ pluviometria_dia    <dbl> 0.1, 0.1, 11.4, 35.2, 0.0, 0.8, 2.4, 0.3, 0.1, 0.2…
#> $ pluviometria_mensal <dbl> 106.7, 82.7, 56.4, 67.0, 125.0, 267.6, 93.0, 106.6…
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
| 2022-02-24 | Cantareira   |                42.8 |              0.0 |           420.42316 |               0.1 |                106.7 |              201.6 |
| 2022-02-24 | Alto Tietê   |                57.0 |              0.0 |           319.24001 |               0.1 |                 82.7 |              191.5 |
| 2022-02-24 | Guarapiranga |                84.3 |              0.2 |           144.24321 |              11.4 |                 56.4 |              193.9 |
| 2022-02-24 | Cotia        |                78.6 |              1.0 |            12.96781 |              35.2 |                 67.0 |              183.5 |
| 2022-02-24 | Rio Grande   |               100.5 |            \-0.2 |           112.75560 |               0.0 |                125.0 |              207.7 |
| 2022-02-24 | Rio Claro    |                48.7 |            \-1.1 |             6.65177 |               0.8 |                267.6 |              238.7 |
| 2022-02-24 | São Lourenço |                82.3 |              0.2 |            73.12286 |               2.4 |                 93.0 |              233.4 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
