
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

-   [Arquivo
    `.csv`](https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv)
-   [Arquivo
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
#> Rows: 51,711
#> Columns: 8
#> $ data                <date> 2022-10-22, 2022-10-22, 2022-10-22, 2022-10-22, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 32.4, 46.3, 60.6, 49.3, 96.8, 41.4, 63.2, 32.5, 46…
#> $ volume_variacao     <dbl> -0.1, -0.2, -0.2, -0.3, -0.2, -0.3, 0.1, 0.1, -0.1…
#> $ volume_operacional  <dbl> 318.49599, 259.47247, 103.78015, 8.12728, 108.5930…
#> $ pluviometria_dia    <dbl> 0.9, 0.6, 0.2, 0.0, 0.0, 0.0, 0.0, 15.0, 2.2, 6.4,…
#> $ pluviometria_mensal <dbl> 77.5, 43.8, 53.0, 30.2, 101.8, 65.2, 53.8, 76.6, 4…
#> $ pluviometria_hist   <dbl> 126.3, 106.0, 114.5, 120.2, 132.7, 173.7, 141.2, 1…
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

| data       | sistema      | volume_porcentagem | volume_variacao | volume_operacional | pluviometria_dia | pluviometria_mensal | pluviometria_hist |
|:-----------|:-------------|-------------------:|----------------:|-------------------:|-----------------:|--------------------:|------------------:|
| 2022-10-22 | Cantareira   |               32.4 |            -0.1 |          318.49599 |              0.9 |                77.5 |             126.3 |
| 2022-10-22 | Alto Tietê   |               46.3 |            -0.2 |          259.47247 |              0.6 |                43.8 |             106.0 |
| 2022-10-22 | Guarapiranga |               60.6 |            -0.2 |          103.78015 |              0.2 |                53.0 |             114.5 |
| 2022-10-22 | Cotia        |               49.3 |            -0.3 |            8.12728 |              0.0 |                30.2 |             120.2 |
| 2022-10-22 | Rio Grande   |               96.8 |            -0.2 |          108.59308 |              0.0 |               101.8 |             132.7 |
| 2022-10-22 | Rio Claro    |               41.4 |            -0.3 |            5.65741 |              0.0 |                65.2 |             173.7 |
| 2022-10-22 | São Lourenço |               63.2 |             0.1 |           56.13508 |              0.0 |                53.8 |             141.2 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
