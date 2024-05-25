
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
#> Rows: 55,771
#> Columns: 8
#> $ data                <date> 2024-05-24, 2024-05-24, 2024-05-24, 2024-05-24, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 69.8, 69.9, 73.7, 74.2, 85.2, 37.5, 93.0, 69.9, 70…
#> $ volume_variacao     <dbl> -0.1, -0.2, -0.6, -0.3, -0.4, -0.1, -0.1, -0.2, -0…
#> $ volume_operacional  <dbl> 685.17867, 391.74033, 126.16078, 12.23267, 95.6287…
#> $ pluviometria_dia    <dbl> 0.0, 0.1, 0.0, 0.2, 0.0, 0.2, 0.0, 0.0, 0.2, 0.0, …
#> $ pluviometria_mensal <dbl> 0.6, 4.3, 3.0, 5.4, 12.6, 20.2, 19.8, 0.6, 4.2, 3.…
#> $ pluviometria_hist   <dbl> 73.8, 56.4, 58.8, 63.6, 78.2, 131.8, 87.6, 73.8, 5…
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
| 2024-05-24 | Cantareira   |               69.8 |            -0.1 |          685.17867 |              0.0 |                 0.6 |              73.8 |
| 2024-05-24 | Alto Tietê   |               69.9 |            -0.2 |          391.74033 |              0.1 |                 4.3 |              56.4 |
| 2024-05-24 | Guarapiranga |               73.7 |            -0.6 |          126.16078 |              0.0 |                 3.0 |              58.8 |
| 2024-05-24 | Cotia        |               74.2 |            -0.3 |           12.23267 |              0.2 |                 5.4 |              63.6 |
| 2024-05-24 | Rio Grande   |               85.2 |            -0.4 |           95.62875 |              0.0 |                12.6 |              78.2 |
| 2024-05-24 | Rio Claro    |               37.5 |            -0.1 |            5.13168 |              0.2 |                20.2 |             131.8 |
| 2024-05-24 | São Lourenço |               93.0 |            -0.1 |           82.58467 |              0.0 |                19.8 |              87.6 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
