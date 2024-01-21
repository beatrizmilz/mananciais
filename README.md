
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
#> Rows: 54,896
#> Columns: 8
#> $ data                <date> 2024-01-20, 2024-01-20, 2024-01-20, 2024-01-20, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 70.5, 57.6, 69.1, 78.8, 103.3, 42.5, 79.3, 69.9, 5…
#> $ volume_variacao     <dbl> 0.6, 0.0, 0.1, -0.4, 0.2, -0.3, -0.5, 0.0, 0.0, 0.…
#> $ volume_operacional  <dbl> 692.39807, 322.75468, 118.32476, 13.00033, 115.843…
#> $ pluviometria_dia    <dbl> 36.3, 9.3, 0.4, 3.0, 13.6, 0.4, 3.4, 19.5, 23.7, 9…
#> $ pluviometria_mensal <dbl> 165.7, 101.1, 132.4, 82.8, 192.4, 157.2, 111.6, 12…
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
| 2024-01-20 | Cantareira   |               70.5 |             0.6 |          692.39807 |             36.3 |               165.7 |             262.7 |
| 2024-01-20 | Alto Tietê   |               57.6 |             0.0 |          322.75468 |              9.3 |               101.1 |             234.0 |
| 2024-01-20 | Guarapiranga |               69.1 |             0.1 |          118.32476 |              0.4 |               132.4 |             229.8 |
| 2024-01-20 | Cotia        |               78.8 |            -0.4 |           13.00033 |              3.0 |                82.8 |             218.5 |
| 2024-01-20 | Rio Grande   |              103.3 |             0.2 |          115.84362 |             13.6 |               192.4 |             245.9 |
| 2024-01-20 | Rio Claro    |               42.5 |            -0.3 |            5.81318 |              0.4 |               157.2 |             293.3 |
| 2024-01-20 | São Lourenço |               79.3 |            -0.5 |           70.45672 |              3.4 |               111.6 |             273.2 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
