
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
#> Rows: 52,026
#> Columns: 8
#> $ data                <date> 2022-12-06, 2022-12-06, 2022-12-06, 2022-12-06, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 34.2, 46.1, 78.9, 45.4, 102.9, 40.8, 81.2, 33.8, 4…
#> $ volume_variacao     <dbl> 0.4, 0.2, 1.3, 0.7, 0.3, 0.0, 3.1, 0.2, 0.2, 0.9, …
#> $ volume_operacional  <dbl> 335.96606, 258.17020, 135.14254, 7.49368, 115.4548…
#> $ pluviometria_dia    <dbl> 19.1, 10.2, 15.8, 26.6, 10.8, 3.6, 20.2, 8.0, 11.8…
#> $ pluviometria_mensal <dbl> 58.5, 38.9, 57.4, 69.2, 64.2, 77.2, 189.2, 39.4, 2…
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
| 2022-12-06 | Cantareira   |               34.2 |             0.4 |          335.96606 |             19.1 |                58.5 |             209.9 |
| 2022-12-06 | Alto Tietê   |               46.1 |             0.2 |          258.17020 |             10.2 |                38.9 |             189.3 |
| 2022-12-06 | Guarapiranga |               78.9 |             1.3 |          135.14254 |             15.8 |                57.4 |             173.3 |
| 2022-12-06 | Cotia        |               45.4 |             0.7 |            7.49368 |             26.6 |                69.2 |             166.2 |
| 2022-12-06 | Rio Grande   |              102.9 |             0.3 |          115.45480 |             10.8 |                64.2 |             188.0 |
| 2022-12-06 | Rio Claro    |               40.8 |             0.0 |            5.57561 |              3.6 |                77.2 |             258.7 |
| 2022-12-06 | São Lourenço |               81.2 |             3.1 |           72.09237 |             20.2 |               189.2 |             211.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
