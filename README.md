
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
#> Rows: 55,456
#> Columns: 8
#> $ data                <date> 2024-04-09, 2024-04-09, 2024-04-09, 2024-04-09, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 77.5, 76.5, 86.1, 87.1, 97.6, 39.6, 99.5, 77.6, 76…
#> $ volume_variacao     <dbl> -0.1, 0.0, -0.1, -0.2, 0.0, -0.2, 0.8, -0.1, 0.0, …
#> $ volume_operacional  <dbl> 760.69551, 428.40156, 147.38614, 14.37509, 109.530…
#> $ pluviometria_dia    <dbl> 2.6, 7.9, 1.6, 3.4, 25.6, 4.6, 12.8, 0.0, 0.0, 0.0…
#> $ pluviometria_mensal <dbl> 2.8, 11.5, 5.4, 4.6, 32.4, 11.8, 14.2, 0.2, 3.6, 3…
#> $ pluviometria_hist   <dbl> 80.7, 88.3, 72.1, 78.0, 102.6, 193.1, 110.0, 80.7,…
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
| 2024-04-09 | Cantareira   |               77.5 |            -0.1 |          760.69551 |              2.6 |                 2.8 |              80.7 |
| 2024-04-09 | Alto Tietê   |               76.5 |             0.0 |          428.40156 |              7.9 |                11.5 |              88.3 |
| 2024-04-09 | Guarapiranga |               86.1 |            -0.1 |          147.38614 |              1.6 |                 5.4 |              72.1 |
| 2024-04-09 | Cotia        |               87.1 |            -0.2 |           14.37509 |              3.4 |                 4.6 |              78.0 |
| 2024-04-09 | Rio Grande   |               97.6 |             0.0 |          109.53069 |             25.6 |                32.4 |             102.6 |
| 2024-04-09 | Rio Claro    |               39.6 |            -0.2 |            5.41862 |              4.6 |                11.8 |             193.1 |
| 2024-04-09 | São Lourenço |               99.5 |             0.8 |           88.36819 |             12.8 |                14.2 |             110.0 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
