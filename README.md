
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
#> Rows: 56,758
#> Columns: 8
#> $ data                <date> 2024-10-12, 2024-10-12, 2024-10-12, 2024-10-12, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 48.2, 43.8, 36.7, 35.5, 62.2, 25.0, 45.1, 48.3, 44…
#> $ volume_variacao     <dbl> -0.1, -0.2, -0.2, 0.0, -0.3, 0.1, 0.0, -0.2, -0.2,…
#> $ volume_operacional  <dbl> 473.46216, 245.59326, 62.78116, 5.86376, 69.78799,…
#> $ pluviometria_dia    <dbl> 17.9, 12.9, 13.8, 15.2, 11.8, 12.0, 13.2, 14.4, 6.…
#> $ pluviometria_mensal <dbl> 51.7, 24.1, 19.8, 25.0, 23.6, 38.4, 29.0, 33.8, 11…
#> $ pluviometria_hist   <dbl> 130.3, 109.3, 114.7, 120.4, 133.1, 174.8, 144.0, 1…
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
| 2024-10-12 | Cantareira   |               48.2 |            -0.1 |          473.46216 |             17.9 |                51.7 |             130.3 |
| 2024-10-12 | Alto Tietê   |               43.8 |            -0.2 |          245.59326 |             12.9 |                24.1 |             109.3 |
| 2024-10-12 | Guarapiranga |               36.7 |            -0.2 |           62.78116 |             13.8 |                19.8 |             114.7 |
| 2024-10-12 | Cotia        |               35.5 |             0.0 |            5.86376 |             15.2 |                25.0 |             120.4 |
| 2024-10-12 | Rio Grande   |               62.2 |            -0.3 |           69.78799 |             11.8 |                23.6 |             133.1 |
| 2024-10-12 | Rio Claro    |               25.0 |             0.1 |            3.41620 |             12.0 |                38.4 |             174.8 |
| 2024-10-12 | São Lourenço |               45.1 |             0.0 |           40.08745 |             13.2 |                29.0 |             144.0 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
