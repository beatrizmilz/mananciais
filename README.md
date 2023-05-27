
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
#> Rows: 53,223
#> Columns: 8
#> $ data                <date> 2023-05-26, 2023-05-26, 2023-05-26, 2023-05-26, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 84.6, 74.4, 82.3, 97.7, 98.8, 43.5, 94.3, 84.7, 74…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.3, -0.3, -0.4, -0.2, -0.2, -0.1, -0…
#> $ volume_operacional  <dbl> 830.97021, 416.93682, 140.85071, 16.12531, 110.851…
#> $ pluviometria_dia    <dbl> 0.0, 0.2, 0.0, 0.0, 0.0, 0.2, 0.0, 0.0, 0.1, 0.2, …
#> $ pluviometria_mensal <dbl> 7.8, 27.6, 4.6, 2.0, 7.8, 72.2, 10.6, 7.8, 27.4, 4…
#> $ pluviometria_hist   <dbl> 75.0, 57.2, 59.1, 64.2, 79.2, 131.6, 88.6, 75.0, 5…
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
| 2023-05-26 | Cantareira   |               84.6 |            -0.1 |          830.97021 |              0.0 |                 7.8 |              75.0 |
| 2023-05-26 | Alto Tietê   |               74.4 |            -0.1 |          416.93682 |              0.2 |                27.6 |              57.2 |
| 2023-05-26 | Guarapiranga |               82.3 |            -0.3 |          140.85071 |              0.0 |                 4.6 |              59.1 |
| 2023-05-26 | Cotia        |               97.7 |            -0.3 |           16.12531 |              0.0 |                 2.0 |              64.2 |
| 2023-05-26 | Rio Grande   |               98.8 |            -0.4 |          110.85163 |              0.0 |                 7.8 |              79.2 |
| 2023-05-26 | Rio Claro    |               43.5 |            -0.2 |            5.95073 |              0.2 |                72.2 |             131.6 |
| 2023-05-26 | São Lourenço |               94.3 |            -0.2 |           83.79185 |              0.0 |                10.6 |              88.6 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
