
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
#> Rows: 56,618
#> Columns: 8
#> $ data                <date> 2024-09-22, 2024-09-22, 2024-09-22, 2024-09-22, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 52.8, 48.5, 39.9, 42.0, 66.4, 26.6, 52.7, 53.0, 48…
#> $ volume_variacao     <dbl> -0.2, -0.2, 0.0, -0.2, -0.1, -0.2, -0.4, -0.2, -0.…
#> $ volume_operacional  <dbl> 518.36943, 271.71217, 68.30054, 6.93385, 74.49458,…
#> $ pluviometria_dia    <dbl> 0.2, 0.4, 0.0, 0.2, 0.0, 0.4, 0.0, 4.0, 1.3, 1.2, …
#> $ pluviometria_mensal <dbl> 5.4, 4.5, 12.0, 22.6, 7.8, 17.6, 43.2, 5.2, 4.1, 1…
#> $ pluviometria_hist   <dbl> 81.2, 60.3, 76.7, 75.6, 93.0, 138.7, 111.7, 81.2, …
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
| 2024-09-22 | Cantareira   |               52.8 |            -0.2 |          518.36943 |              0.2 |                 5.4 |              81.2 |
| 2024-09-22 | Alto Tietê   |               48.5 |            -0.2 |          271.71217 |              0.4 |                 4.5 |              60.3 |
| 2024-09-22 | Guarapiranga |               39.9 |             0.0 |           68.30054 |              0.0 |                12.0 |              76.7 |
| 2024-09-22 | Cotia        |               42.0 |            -0.2 |            6.93385 |              0.2 |                22.6 |              75.6 |
| 2024-09-22 | Rio Grande   |               66.4 |            -0.1 |           74.49458 |              0.0 |                 7.8 |              93.0 |
| 2024-09-22 | Rio Claro    |               26.6 |            -0.2 |            3.64142 |              0.4 |                17.6 |             138.7 |
| 2024-09-22 | São Lourenço |               52.7 |            -0.4 |           46.77560 |              0.0 |                43.2 |             111.7 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
