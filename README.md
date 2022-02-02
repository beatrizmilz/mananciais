
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
#> Rows: 49,870
#> Columns: 8
#> $ data                <date> 2022-02-01, 2022-02-01, 2022-02-01, 2022-02-01, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 34.5, 51.9, 81.5, 69.8, 100.5, 43.2, 91.1, 33.6, 5…
#> $ volume_variacao     <dbl> 0.9, 0.8, 1.5, 1.4, 0.5, 0.0, 1.2, 1.3, 1.3, 2.1, …
#> $ volume_operacional  <dbl> 338.86889, 290.55106, 139.54960, 11.52222, 112.755…
#> $ pluviometria_dia    <dbl> 21.3, 12.6, 3.8, 5.6, 3.4, 10.0, 4.2, 24.4, 18.2, …
#> $ pluviometria_mensal <dbl> 21.3, 12.6, 3.8, 5.6, 3.4, 10.0, 4.2, 322.0, 239.1…
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
| 2022-02-01 | Cantareira   |                34.5 |              0.9 |           338.86889 |              21.3 |                 21.3 |              201.6 |
| 2022-02-01 | Alto Tietê   |                51.9 |              0.8 |           290.55106 |              12.6 |                 12.6 |              191.5 |
| 2022-02-01 | Guarapiranga |                81.5 |              1.5 |           139.54960 |               3.8 |                  3.8 |              193.9 |
| 2022-02-01 | Cotia        |                69.8 |              1.4 |            11.52222 |               5.6 |                  5.6 |              183.5 |
| 2022-02-01 | Rio Grande   |               100.5 |              0.5 |           112.75560 |               3.4 |                  3.4 |              207.7 |
| 2022-02-01 | Rio Claro    |                43.2 |              0.0 |             5.89755 |              10.0 |                 10.0 |              238.7 |
| 2022-02-01 | São Lourenço |                91.1 |              1.2 |            80.95224 |               4.2 |                  4.2 |              233.4 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
