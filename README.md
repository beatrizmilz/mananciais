
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
#> Rows: 52,215
#> Columns: 8
#> $ data                <date> 2023-01-02, 2023-01-02, 2023-01-02, 2023-01-02, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 43.3, 48.5, 85.6, 52.8, 100.7, 43.3, 80.2, 42.8, 4…
#> $ volume_variacao     <dbl> 0.5, 0.1, 0.3, 0.1, -0.2, -0.2, -0.9, 0.6, 0.1, 0.…
#> $ volume_operacional  <dbl> 424.90275, 271.80496, 146.59945, 8.71167, 112.9470…
#> $ pluviometria_dia    <dbl> 9.8, 0.3, 0.2, 0.0, 0.0, 0.0, 0.0, 10.1, 3.6, 20.0…
#> $ pluviometria_mensal <dbl> 19.9, 3.9, 20.2, 11.4, 1.0, 0.0, 0.2, 10.1, 3.6, 2…
#> $ pluviometria_hist   <dbl> 264.5, 239.1, 229.8, 218.2, 247.5, 295.5, 273.2, 2…
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
| 2023-01-02 | Cantareira   |               43.3 |             0.5 |          424.90275 |              9.8 |                19.9 |             264.5 |
| 2023-01-02 | Alto Tietê   |               48.5 |             0.1 |          271.80496 |              0.3 |                 3.9 |             239.1 |
| 2023-01-02 | Guarapiranga |               85.6 |             0.3 |          146.59945 |              0.2 |                20.2 |             229.8 |
| 2023-01-02 | Cotia        |               52.8 |             0.1 |            8.71167 |              0.0 |                11.4 |             218.2 |
| 2023-01-02 | Rio Grande   |              100.7 |            -0.2 |          112.94709 |              0.0 |                 1.0 |             247.5 |
| 2023-01-02 | Rio Claro    |               43.3 |            -0.2 |            5.91878 |              0.0 |                 0.0 |             295.5 |
| 2023-01-02 | São Lourenço |               80.2 |            -0.9 |           71.27254 |              0.0 |                 0.2 |             273.2 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
