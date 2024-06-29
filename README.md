
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
#> Rows: 56,016
#> Columns: 8
#> $ data                <date> 2024-06-28, 2024-06-28, 2024-06-28, 2024-06-28, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 66.6, 64.8, 62.2, 64.8, 77.7, 37.0, 88.8, 66.8, 65…
#> $ volume_variacao     <dbl> -0.2, -0.2, -0.4, -0.4, -0.2, -0.3, -0.5, -0.1, -0…
#> $ volume_operacional  <dbl> 654.52573, 362.82872, 106.45160, 10.69014, 87.1991…
#> $ pluviometria_dia    <dbl> 0.0, 0.2, 0.0, 0.0, 0.0, 0.2, 0.0, 0.0, 0.1, 0.0, …
#> $ pluviometria_mensal <dbl> 0.7, 14.4, 1.8, 3.4, 2.6, 51.2, 6.6, 0.7, 14.2, 1.…
#> $ pluviometria_hist   <dbl> 56.9, 52.7, 53.1, 58.0, 60.5, 96.9, 75.3, 56.9, 52…
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
| 2024-06-28 | Cantareira   |               66.6 |            -0.2 |          654.52573 |              0.0 |                 0.7 |              56.9 |
| 2024-06-28 | Alto Tietê   |               64.8 |            -0.2 |          362.82872 |              0.2 |                14.4 |              52.7 |
| 2024-06-28 | Guarapiranga |               62.2 |            -0.4 |          106.45160 |              0.0 |                 1.8 |              53.1 |
| 2024-06-28 | Cotia        |               64.8 |            -0.4 |           10.69014 |              0.0 |                 3.4 |              58.0 |
| 2024-06-28 | Rio Grande   |               77.7 |            -0.2 |           87.19914 |              0.0 |                 2.6 |              60.5 |
| 2024-06-28 | Rio Claro    |               37.0 |            -0.3 |            5.05558 |              0.2 |                51.2 |              96.9 |
| 2024-06-28 | São Lourenço |               88.8 |            -0.5 |           78.90690 |              0.0 |                 6.6 |              75.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
