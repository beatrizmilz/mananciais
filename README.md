
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
#> Rows: 52,047
#> Columns: 8
#> $ data                <date> 2022-12-09, 2022-12-09, 2022-12-09, 2022-12-09, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 36.5, 46.9, 83.0, 50.2, 102.7, 43.7, 84.1, 35.9, 4…
#> $ volume_variacao     <dbl> 0.6, 0.1, 0.6, 0.6, -0.6, 0.1, -0.2, 0.8, 0.2, 1.5…
#> $ volume_operacional  <dbl> 358.25638, 262.81661, 142.15392, 8.27755, 115.2606…
#> $ pluviometria_dia    <dbl> 0.1, 0.2, 0.0, 0.0, 0.0, 0.0, 0.0, 22.7, 0.2, 10.2…
#> $ pluviometria_mensal <dbl> 113.3, 65.4, 98.6, 91.6, 82.8, 125.4, 199.4, 113.2…
#> $ pluviometria_hist   <dbl> 209.9, 189.3, 173.3, 166.2, 188.0, 258.7, 211.9, 2…
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
| 2022-12-09 | Cantareira   |               36.5 |             0.6 |          358.25638 |              0.1 |               113.3 |             209.9 |
| 2022-12-09 | Alto Tietê   |               46.9 |             0.1 |          262.81661 |              0.2 |                65.4 |             189.3 |
| 2022-12-09 | Guarapiranga |               83.0 |             0.6 |          142.15392 |              0.0 |                98.6 |             173.3 |
| 2022-12-09 | Cotia        |               50.2 |             0.6 |            8.27755 |              0.0 |                91.6 |             166.2 |
| 2022-12-09 | Rio Grande   |              102.7 |            -0.6 |          115.26069 |              0.0 |                82.8 |             188.0 |
| 2022-12-09 | Rio Claro    |               43.7 |             0.1 |            5.97211 |              0.0 |               125.4 |             258.7 |
| 2022-12-09 | São Lourenço |               84.1 |            -0.2 |           74.68061 |              0.0 |               199.4 |             211.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
