
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
#> Rows: 50,094
#> Columns: 8
#> $ data                <date> 2022-03-05, 2022-03-05, 2022-03-05, 2022-03-05, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 43.1, 55.8, 82.3, 78.6, 99.0, 45.0, 81.4, 43.0, 56…
#> $ volume_variacao     <dbl> 0.1, -0.2, 0.2, 0.4, -0.2, -0.4, 0.1, 0.0, -0.1, -…
#> $ volume_operacional  <dbl> 423.51644, 312.89321, 140.85071, 12.96781, 111.041…
#> $ pluviometria_dia    <dbl> 8.9, 1.1, 45.4, 21.4, 0.8, 0.4, 1.4, 0.0, 0.0, 0.0…
#> $ pluviometria_mensal <dbl> 16.4, 20.1, 54.4, 22.0, 11.6, 1.2, 6.6, 7.5, 19.0,…
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
| 2022-03-05 | Cantareira   |                43.1 |              0.1 |           423.51644 |               8.9 |                 16.4 |              174.1 |
| 2022-03-05 | Alto Tietê   |                55.8 |            \-0.2 |           312.89321 |               1.1 |                 20.1 |              164.6 |
| 2022-03-05 | Guarapiranga |                82.3 |              0.2 |           140.85071 |              45.4 |                 54.4 |              154.8 |
| 2022-03-05 | Cotia        |                78.6 |              0.4 |            12.96781 |              21.4 |                 22.0 |              154.1 |
| 2022-03-05 | Rio Grande   |                99.0 |            \-0.2 |           111.04113 |               0.8 |                 11.6 |              186.7 |
| 2022-03-05 | Rio Claro    |                45.0 |            \-0.4 |             6.15609 |               0.4 |                  1.2 |              243.7 |
| 2022-03-05 | São Lourenço |                81.4 |              0.1 |            72.29796 |               1.4 |                  6.6 |              195.1 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
