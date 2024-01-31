
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
#> Rows: 54,966
#> Columns: 8
#> $ data                <date> 2024-01-30, 2024-01-30, 2024-01-30, 2024-01-30, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 73.4, 63.7, 75.8, 81.0, 103.3, 41.7, 87.9, 73.4, 6…
#> $ volume_variacao     <dbl> 0.0, 0.1, 0.2, -0.4, -0.7, -1.8, -0.6, 0.3, 0.5, 0…
#> $ volume_operacional  <dbl> 721.30717, 356.73812, 129.73759, 13.36127, 115.843…
#> $ pluviometria_dia    <dbl> 0.4, 0.2, 0.0, 0.0, 0.0, 8.2, 0.0, 16.0, 14.1, 17.…
#> $ pluviometria_mensal <dbl> 264.8, 190.4, 208.6, 123.6, 221.0, 468.4, 182.0, 2…
#> $ pluviometria_hist   <dbl> 262.7, 234.0, 229.8, 218.5, 245.9, 293.3, 273.2, 2…
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
| 2024-01-30 | Cantareira   |               73.4 |             0.0 |          721.30717 |              0.4 |               264.8 |             262.7 |
| 2024-01-30 | Alto Tietê   |               63.7 |             0.1 |          356.73812 |              0.2 |               190.4 |             234.0 |
| 2024-01-30 | Guarapiranga |               75.8 |             0.2 |          129.73759 |              0.0 |               208.6 |             229.8 |
| 2024-01-30 | Cotia        |               81.0 |            -0.4 |           13.36127 |              0.0 |               123.6 |             218.5 |
| 2024-01-30 | Rio Grande   |              103.3 |            -0.7 |          115.84362 |              0.0 |               221.0 |             245.9 |
| 2024-01-30 | Rio Claro    |               41.7 |            -1.8 |            5.69864 |              8.2 |               468.4 |             293.3 |
| 2024-01-30 | São Lourenço |               87.9 |            -0.6 |           78.05309 |              0.0 |               182.0 |             273.2 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
