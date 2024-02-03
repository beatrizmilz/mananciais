
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
#> Rows: 54,987
#> Columns: 8
#> $ data                <date> 2024-02-02, 2024-02-02, 2024-02-02, 2024-02-02, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 73.7, 63.9, 77.0, 82.4, 101.7, 38.5, 89.8, 73.7, 6…
#> $ volume_variacao     <dbl> 0.0, 0.0, 0.6, 1.6, -0.5, -0.6, 2.0, 0.2, 0.2, 0.8…
#> $ volume_operacional  <dbl> 724.06752, 357.94688, 131.79122, 13.59396, 114.100…
#> $ pluviometria_dia    <dbl> 0.0, 0.0, 0.0, 44.8, 0.0, 0.0, 3.4, 8.8, 15.6, 6.4…
#> $ pluviometria_mensal <dbl> 8.8, 15.6, 6.4, 54.0, 4.0, 2.8, 11.6, 8.8, 15.6, 6…
#> $ pluviometria_hist   <dbl> 202.5, 176.4, 193.4, 181.9, 206.6, 242.3, 230.5, 2…
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
| 2024-02-02 | Cantareira   |               73.7 |             0.0 |          724.06752 |              0.0 |                 8.8 |             202.5 |
| 2024-02-02 | Alto Tietê   |               63.9 |             0.0 |          357.94688 |              0.0 |                15.6 |             176.4 |
| 2024-02-02 | Guarapiranga |               77.0 |             0.6 |          131.79122 |              0.0 |                 6.4 |             193.4 |
| 2024-02-02 | Cotia        |               82.4 |             1.6 |           13.59396 |             44.8 |                54.0 |             181.9 |
| 2024-02-02 | Rio Grande   |              101.7 |            -0.5 |          114.10027 |              0.0 |                 4.0 |             206.6 |
| 2024-02-02 | Rio Claro    |               38.5 |            -0.6 |            5.25713 |              0.0 |                 2.8 |             242.3 |
| 2024-02-02 | São Lourenço |               89.8 |             2.0 |           79.76508 |              3.4 |                11.6 |             230.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
