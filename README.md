
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
#> Rows: 55,148
#> Columns: 8
#> $ data                <date> 2024-02-25, 2024-02-25, 2024-02-25, 2024-02-25, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 75.9, 68.8, 85.6, 88.8, 102.9, 41.2, 99.5, 75.6, 6…
#> $ volume_variacao     <dbl> 0.3, 0.6, 0.0, 2.1, 1.0, 0.8, 2.2, 0.3, 0.6, 1.5, …
#> $ volume_operacional  <dbl> 745.79550, 385.56499, 146.59945, 14.65279, 115.454…
#> $ pluviometria_dia    <dbl> 1.2, 14.2, 12.0, 9.4, 0.0, 49.4, 30.2, 18.6, 28.7,…
#> $ pluviometria_mensal <dbl> 165.0, 176.6, 159.6, 213.2, 109.0, 281.4, 194.6, 1…
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
| 2024-02-25 | Cantareira   |               75.9 |             0.3 |          745.79550 |              1.2 |               165.0 |             202.5 |
| 2024-02-25 | Alto Tietê   |               68.8 |             0.6 |          385.56499 |             14.2 |               176.6 |             176.4 |
| 2024-02-25 | Guarapiranga |               85.6 |             0.0 |          146.59945 |             12.0 |               159.6 |             193.4 |
| 2024-02-25 | Cotia        |               88.8 |             2.1 |           14.65279 |              9.4 |               213.2 |             181.9 |
| 2024-02-25 | Rio Grande   |              102.9 |             1.0 |          115.45480 |              0.0 |               109.0 |             206.6 |
| 2024-02-25 | Rio Claro    |               41.2 |             0.8 |            5.62663 |             49.4 |               281.4 |             242.3 |
| 2024-02-25 | São Lourenço |               99.5 |             2.2 |           88.36819 |             30.2 |               194.6 |             230.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
