
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
#> Rows: 56,373
#> Columns: 8
#> $ data                <date> 2024-08-18, 2024-08-18, 2024-08-18, 2024-08-18, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 59.7, 55.9, 49.4, 52.5, 72.9, 28.4, 69.6, 59.9, 56…
#> $ volume_variacao     <dbl> -0.2, -0.3, -0.4, -0.3, -0.2, -0.1, -1.5, -0.1, -0…
#> $ volume_operacional  <dbl> 586.43729, 313.39165, 84.53105, 8.65996, 81.72582,…
#> $ pluviometria_dia    <dbl> 0.0, 0.0, 0.2, 0.0, 0.0, 0.0, 0.2, 0.0, 0.1, 0.0, …
#> $ pluviometria_mensal <dbl> 31.7, 30.3, 41.0, 33.4, 38.4, 53.4, 40.0, 31.7, 30…
#> $ pluviometria_hist   <dbl> 33.9, 29.6, 39.7, 40.0, 48.3, 100.6, 60.8, 33.9, 2…
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
| 2024-08-18 | Cantareira   |               59.7 |            -0.2 |          586.43729 |              0.0 |                31.7 |              33.9 |
| 2024-08-18 | Alto Tietê   |               55.9 |            -0.3 |          313.39165 |              0.0 |                30.3 |              29.6 |
| 2024-08-18 | Guarapiranga |               49.4 |            -0.4 |           84.53105 |              0.2 |                41.0 |              39.7 |
| 2024-08-18 | Cotia        |               52.5 |            -0.3 |            8.65996 |              0.0 |                33.4 |              40.0 |
| 2024-08-18 | Rio Grande   |               72.9 |            -0.2 |           81.72582 |              0.0 |                38.4 |              48.3 |
| 2024-08-18 | Rio Claro    |               28.4 |            -0.1 |            3.87956 |              0.0 |                53.4 |             100.6 |
| 2024-08-18 | São Lourenço |               69.6 |            -1.5 |           61.83341 |              0.2 |                40.0 |              60.8 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
