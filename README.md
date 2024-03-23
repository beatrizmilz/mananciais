
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
#> Rows: 55,330
#> Columns: 8
#> $ data                <date> 2024-03-22, 2024-03-22, 2024-03-22, 2024-03-22, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 76.7, 73.5, 87.6, 90.5, 100.2, 43.5, 99.5, 76.7, 7…
#> $ volume_variacao     <dbl> 0.0, 0.3, 0.0, 0.2, -0.1, 1.7, 0.3, 0.0, 0.2, -0.3…
#> $ volume_operacional  <dbl> 752.96207, 412.06159, 150.01279, 14.93361, 112.373…
#> $ pluviometria_dia    <dbl> 5.6, 11.1, 2.4, 6.4, 8.0, 44.8, 18.6, 1.8, 2.3, 0.…
#> $ pluviometria_mensal <dbl> 119.7, 110.2, 70.8, 52.6, 79.4, 202.2, 63.0, 114.1…
#> $ pluviometria_hist   <dbl> 175.0, 154.4, 155.9, 154.1, 185.2, 241.0, 198.9, 1…
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
| 2024-03-22 | Cantareira   |               76.7 |             0.0 |          752.96207 |              5.6 |               119.7 |             175.0 |
| 2024-03-22 | Alto Tietê   |               73.5 |             0.3 |          412.06159 |             11.1 |               110.2 |             154.4 |
| 2024-03-22 | Guarapiranga |               87.6 |             0.0 |          150.01279 |              2.4 |                70.8 |             155.9 |
| 2024-03-22 | Cotia        |               90.5 |             0.2 |           14.93361 |              6.4 |                52.6 |             154.1 |
| 2024-03-22 | Rio Grande   |              100.2 |            -0.1 |          112.37321 |              8.0 |                79.4 |             185.2 |
| 2024-03-22 | Rio Claro    |               43.5 |             1.7 |            5.95073 |             44.8 |               202.2 |             241.0 |
| 2024-03-22 | São Lourenço |               99.5 |             0.3 |           88.36819 |             18.6 |                63.0 |             198.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
