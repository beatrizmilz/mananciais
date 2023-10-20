
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
#> Rows: 54,245
#> Columns: 8
#> $ data                <date> 2023-10-19, 2023-10-19, 2023-10-19, 2023-10-19, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 72.9, 65.6, 62.5, 88.0, 103.8, 43.7, 79.1, 72.8, 6…
#> $ volume_variacao     <dbl> 0.1, 0.3, 0.5, 0.4, -0.2, 0.2, 0.6, 0.4, 0.4, 0.4,…
#> $ volume_operacional  <dbl> 715.65552, 367.72932, 106.93940, 14.51355, 116.428…
#> $ pluviometria_dia    <dbl> 0.2, 0.0, 0.0, 0.2, 0.6, 2.4, 0.2, 0.7, 1.6, 8.4, …
#> $ pluviometria_mensal <dbl> 243.9, 174.2, 159.8, 158.6, 134.4, 252.0, 229.4, 2…
#> $ pluviometria_hist   <dbl> 126.1, 104.2, 114.2, 119.6, 132.7, 172.9, 141.7, 1…
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
| 2023-10-19 | Cantareira   |               72.9 |             0.1 |          715.65552 |              0.2 |               243.9 |             126.1 |
| 2023-10-19 | Alto Tietê   |               65.6 |             0.3 |          367.72932 |              0.0 |               174.2 |             104.2 |
| 2023-10-19 | Guarapiranga |               62.5 |             0.5 |          106.93940 |              0.0 |               159.8 |             114.2 |
| 2023-10-19 | Cotia        |               88.0 |             0.4 |           14.51355 |              0.2 |               158.6 |             119.6 |
| 2023-10-19 | Rio Grande   |              103.8 |            -0.2 |          116.42838 |              0.6 |               134.4 |             132.7 |
| 2023-10-19 | Rio Claro    |               43.7 |             0.2 |            5.97211 |              2.4 |               252.0 |             172.9 |
| 2023-10-19 | São Lourenço |               79.1 |             0.6 |           70.25339 |              0.2 |               229.4 |             141.7 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
