
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
#> Rows: 52,509
#> Columns: 8
#> $ data                <date> 2023-02-13, 2023-02-13, 2023-02-13, 2023-02-13, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 61.5, 58.0, 84.6, 81.2, 104.0, 40.8, 93.3, 60.6, 5…
#> $ volume_variacao     <dbl> 0.9, 0.8, 1.4, 1.2, 1.1, 0.1, 0.6, 1.1, 0.3, 0.6, …
#> $ volume_operacional  <dbl> 604.25382, 325.01827, 144.76631, 13.39437, 116.623…
#> $ pluviometria_dia    <dbl> 5.2, 24.4, 34.4, 26.4, 9.8, 10.8, 26.2, 6.8, 17.6,…
#> $ pluviometria_mensal <dbl> 175.5, 156.2, 139.6, 70.4, 84.8, 210.6, 119.6, 170…
#> $ pluviometria_hist   <dbl> 200.4, 169.7, 192.7, 182.2, 206.4, 239.2, 230.9, 2…
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
| 2023-02-13 | Cantareira   |               61.5 |             0.9 |          604.25382 |              5.2 |               175.5 |             200.4 |
| 2023-02-13 | Alto Tietê   |               58.0 |             0.8 |          325.01827 |             24.4 |               156.2 |             169.7 |
| 2023-02-13 | Guarapiranga |               84.6 |             1.4 |          144.76631 |             34.4 |               139.6 |             192.7 |
| 2023-02-13 | Cotia        |               81.2 |             1.2 |           13.39437 |             26.4 |                70.4 |             182.2 |
| 2023-02-13 | Rio Grande   |              104.0 |             1.1 |          116.62370 |              9.8 |                84.8 |             206.4 |
| 2023-02-13 | Rio Claro    |               40.8 |             0.1 |            5.57561 |             10.8 |               210.6 |             239.2 |
| 2023-02-13 | São Lourenço |               93.3 |             0.6 |           82.91305 |             26.2 |               119.6 |             230.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
