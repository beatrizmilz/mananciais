
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
#> Rows: 50,885
#> Columns: 8
#> $ data                <date> 2022-06-26, 2022-06-26, 2022-06-26, 2022-06-26, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 40.2, 60.4, 76.4, 83.4, 98.3, 44.4, 90.4, 40.3, 60…
#> $ volume_variacao     <dbl> -0.1, -0.2, -0.1, -0.2, 0.0, 0.5, -0.6, -0.1, -0.2…
#> $ volume_operacional  <dbl> 394.38589, 338.61909, 130.76355, 13.76161, 110.284…
#> $ pluviometria_dia    <dbl> 0.0, 0.3, 0.6, 0.2, 2.6, 11.4, 0.6, 0.0, 0.2, 0.0,…
#> $ pluviometria_mensal <dbl> 29.7, 19.3, 17.4, 31.4, 35.8, 59.0, 62.4, 29.7, 19…
#> $ pluviometria_hist   <dbl> 59.1, 55.9, 54.0, 59.0, 61.6, 98.5, 76.3, 59.1, 55…
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
| 2022-06-26 | Cantareira   |                40.2 |            \-0.1 |           394.38589 |               0.0 |                 29.7 |               59.1 |
| 2022-06-26 | Alto Tietê   |                60.4 |            \-0.2 |           338.61909 |               0.3 |                 19.3 |               55.9 |
| 2022-06-26 | Guarapiranga |                76.4 |            \-0.1 |           130.76355 |               0.6 |                 17.4 |               54.0 |
| 2022-06-26 | Cotia        |                83.4 |            \-0.2 |            13.76161 |               0.2 |                 31.4 |               59.0 |
| 2022-06-26 | Rio Grande   |                98.3 |              0.0 |           110.28432 |               2.6 |                 35.8 |               61.6 |
| 2022-06-26 | Rio Claro    |                44.4 |              0.5 |             6.06899 |              11.4 |                 59.0 |               98.5 |
| 2022-06-26 | São Lourenço |                90.4 |            \-0.6 |            80.30366 |               0.6 |                 62.4 |               76.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
