
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
#> Rows: 50,108
#> Columns: 8
#> $ data                <date> 2022-03-07, 2022-03-07, 2022-03-07, 2022-03-07, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 43.1, 55.7, 82.4, 79.8, 100.5, 44.4, 81.4, 43.1, 5…
#> $ volume_variacao     <dbl> 0.0, 0.0, 0.0, 0.4, 1.7, -0.3, -0.1, 0.0, -0.1, 0.…
#> $ volume_operacional  <dbl> 423.14073, 312.20686, 141.11119, 13.16369, 112.755…
#> $ pluviometria_dia    <dbl> 6.3, 9.7, 0.2, 0.0, 9.4, 2.0, 0.2, 0.0, 0.2, 9.6, …
#> $ pluviometria_mensal <dbl> 22.7, 30.0, 64.2, 32.4, 21.0, 3.2, 7.0, 16.4, 20.3…
#> $ pluviometria_hist   <dbl> 174.1, 164.6, 154.8, 154.1, 186.7, 243.7, 195.1, 1…
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
| 2022-03-07 | Cantareira   |                43.1 |              0.0 |           423.14073 |               6.3 |                 22.7 |              174.1 |
| 2022-03-07 | Alto Tietê   |                55.7 |              0.0 |           312.20686 |               9.7 |                 30.0 |              164.6 |
| 2022-03-07 | Guarapiranga |                82.4 |              0.0 |           141.11119 |               0.2 |                 64.2 |              154.8 |
| 2022-03-07 | Cotia        |                79.8 |              0.4 |            13.16369 |               0.0 |                 32.4 |              154.1 |
| 2022-03-07 | Rio Grande   |               100.5 |              1.7 |           112.75560 |               9.4 |                 21.0 |              186.7 |
| 2022-03-07 | Rio Claro    |                44.4 |            \-0.3 |             6.06899 |               2.0 |                  3.2 |              243.7 |
| 2022-03-07 | São Lourenço |                81.4 |            \-0.1 |            72.29796 |               0.2 |                  7.0 |              195.1 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
