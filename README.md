
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
#> Rows: 56,709
#> Columns: 8
#> $ data                <date> 2024-10-05, 2024-10-05, 2024-10-05, 2024-10-05, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 49.7, 45.4, 37.9, 37.3, 64.2, 25.9, 46.9, 49.9, 45…
#> $ volume_variacao     <dbl> -0.2, -0.2, -0.2, -0.4, -0.2, 0.2, 0.1, -0.2, -0.2…
#> $ volume_operacional  <dbl> 488.41084, 254.22292, 64.94879, 6.15966, 71.97264,…
#> $ pluviometria_dia    <dbl> 1.1, 0.1, 0.0, 0.6, 1.0, 0.6, 0.4, 16.5, 1.2, 1.2,…
#> $ pluviometria_mensal <dbl> 19.4, 3.6, 2.4, 6.0, 7.4, 13.2, 6.6, 18.3, 3.5, 2.…
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
| 2024-10-05 | Cantareira   |               49.7 |            -0.2 |          488.41084 |              1.1 |                19.4 |             130.3 |
| 2024-10-05 | Alto Tietê   |               45.4 |            -0.2 |          254.22292 |              0.1 |                 3.6 |             109.3 |
| 2024-10-05 | Guarapiranga |               37.9 |            -0.2 |           64.94879 |              0.0 |                 2.4 |             114.7 |
| 2024-10-05 | Cotia        |               37.3 |            -0.4 |            6.15966 |              0.6 |                 6.0 |             120.4 |
| 2024-10-05 | Rio Grande   |               64.2 |            -0.2 |           71.97264 |              1.0 |                 7.4 |             133.1 |
| 2024-10-05 | Rio Claro    |               25.9 |             0.2 |            3.54570 |              0.6 |                13.2 |             174.8 |
| 2024-10-05 | São Lourenço |               46.9 |             0.1 |           41.62933 |              0.4 |                 6.6 |             144.0 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
