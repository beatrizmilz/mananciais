
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
#> Rows: 54,994
#> Columns: 8
#> $ data                <date> 2024-02-03, 2024-02-03, 2024-02-03, 2024-02-03, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 74.0, 64.1, 78.0, 82.8, 102.6, 38.0, 90.7, 73.7, 6…
#> $ volume_variacao     <dbl> 0.3, 0.2, 1.0, 0.4, 0.9, -0.5, 0.9, 0.0, 0.0, 0.6,…
#> $ volume_operacional  <dbl> 726.52409, 359.21801, 133.59366, 13.66088, 115.066…
#> $ pluviometria_dia    <dbl> 12.8, 11.6, 9.2, 2.8, 2.4, 5.4, 12.4, 0.0, 0.0, 0.…
#> $ pluviometria_mensal <dbl> 21.6, 27.2, 15.6, 56.8, 6.4, 8.2, 24.0, 8.8, 15.6,…
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
| 2024-02-03 | Cantareira   |               74.0 |             0.3 |          726.52409 |             12.8 |                21.6 |             202.5 |
| 2024-02-03 | Alto Tietê   |               64.1 |             0.2 |          359.21801 |             11.6 |                27.2 |             176.4 |
| 2024-02-03 | Guarapiranga |               78.0 |             1.0 |          133.59366 |              9.2 |                15.6 |             193.4 |
| 2024-02-03 | Cotia        |               82.8 |             0.4 |           13.66088 |              2.8 |                56.8 |             181.9 |
| 2024-02-03 | Rio Grande   |              102.6 |             0.9 |          115.06678 |              2.4 |                 6.4 |             206.6 |
| 2024-02-03 | Rio Claro    |               38.0 |            -0.5 |            5.18930 |              5.4 |                 8.2 |             242.3 |
| 2024-02-03 | São Lourenço |               90.7 |             0.9 |           80.51958 |             12.4 |                24.0 |             230.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
