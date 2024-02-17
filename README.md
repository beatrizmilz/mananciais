
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
#> Rows: 55,085
#> Columns: 8
#> $ data                <date> 2024-02-16, 2024-02-16, 2024-02-16, 2024-02-16, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 74.0, 66.4, 82.6, 83.0, 101.9, 47.4, 91.1, 73.8, 6…
#> $ volume_variacao     <dbl> 0.2, 0.9, 0.6, 0.6, 0.9, 2.4, 0.8, 0.2, 0.7, 1.1, …
#> $ volume_operacional  <dbl> 726.62979, 372.13900, 141.37175, 13.69441, 114.293…
#> $ pluviometria_dia    <dbl> 2.3, 0.4, 1.2, 0.2, 2.4, 20.6, 1.0, 13.0, 19.6, 7.…
#> $ pluviometria_mensal <dbl> 62.1, 109.4, 88.2, 106.8, 90.0, 207.2, 89.4, 59.8,…
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
| 2024-02-16 | Cantareira   |               74.0 |             0.2 |          726.62979 |              2.3 |                62.1 |             202.5 |
| 2024-02-16 | Alto Tietê   |               66.4 |             0.9 |          372.13900 |              0.4 |               109.4 |             176.4 |
| 2024-02-16 | Guarapiranga |               82.6 |             0.6 |          141.37175 |              1.2 |                88.2 |             193.4 |
| 2024-02-16 | Cotia        |               83.0 |             0.6 |           13.69441 |              0.2 |               106.8 |             181.9 |
| 2024-02-16 | Rio Grande   |              101.9 |             0.9 |          114.29317 |              2.4 |                90.0 |             206.6 |
| 2024-02-16 | Rio Claro    |               47.4 |             2.4 |            6.47959 |             20.6 |               207.2 |             242.3 |
| 2024-02-16 | São Lourenço |               91.1 |             0.8 |           80.95224 |              1.0 |                89.4 |             230.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
