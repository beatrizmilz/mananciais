
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
#> Rows: 48,554
#> Columns: 8
#> $ data                <date> 2021-07-28, 2021-07-28, 2021-07-28, 2021-07-28, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 41.6, 49.6, 54.9, 65.3, 64.6, 45.4, 63.1, 41.6, 49…
#> $ volume_variacao     <dbl> 0.0, -0.1, 0.3, 0.1, 0.5, 0.5, -0.3, -0.1, -0.2, -…
#> $ volume_operacional  <dbl> 408.14465, 278.06891, 94.00247, 10.77759, 72.41412…
#> $ pluviometria_dia    <dbl> 16.7, 14.1, 19.2, 16.4, 18.0, 26.0, 21.6, 0.0, 0.0…
#> $ pluviometria_mensal <dbl> 17.1, 21.7, 27.4, 25.6, 27.4, 34.8, 47.6, 0.4, 7.6…
#> $ pluviometria_hist   <dbl> 45.3, 48.4, 41.1, 51.3, 54.5, 91.3, 76.9, 45.3, 48…
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
| 2021-07-28 | Cantareira   |                41.6 |              0.0 |           408.14465 |              16.7 |                 17.1 |               45.3 |
| 2021-07-28 | Alto Tietê   |                49.6 |            \-0.1 |           278.06891 |              14.1 |                 21.7 |               48.4 |
| 2021-07-28 | Guarapiranga |                54.9 |              0.3 |            94.00247 |              19.2 |                 27.4 |               41.1 |
| 2021-07-28 | Cotia        |                65.3 |              0.1 |            10.77759 |              16.4 |                 25.6 |               51.3 |
| 2021-07-28 | Rio Grande   |                64.6 |              0.5 |            72.41412 |              18.0 |                 27.4 |               54.5 |
| 2021-07-28 | Rio Claro    |                45.4 |              0.5 |             6.21099 |              26.0 |                 34.8 |               91.3 |
| 2021-07-28 | São Lourenço |                63.1 |            \-0.3 |            56.04172 |              21.6 |                 47.6 |               76.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
