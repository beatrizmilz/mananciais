
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

-   [Arquivo
    `.csv`](https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv)
-   [Arquivo
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
#> Rows: 51,340
#> Columns: 8
#> $ data                <date> 2022-08-30, 2022-08-30, 2022-08-30, 2022-08-30, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 33.2, 50.3, 59.8, 60.5, 88.5, 43.8, 66.9, 33.3, 50…
#> $ volume_variacao     <dbl> -0.1, 0.1, -0.3, -0.5, 0.8, 3.4, -0.1, -0.2, -0.2,…
#> $ volume_operacional  <dbl> 326.13693, 281.90605, 102.33131, 9.97717, 99.30764…
#> $ pluviometria_dia    <dbl> 0.1, 0.7, 0.8, 0.4, 8.8, 20.0, 1.8, 0.0, 1.9, 0.4,…
#> $ pluviometria_mensal <dbl> 39.6, 36.2, 24.6, 23.4, 48.4, 137.0, 52.6, 39.5, 3…
#> $ pluviometria_hist   <dbl> 33.9, 28.6, 40.0, 40.4, 48.7, 99.8, 61.4, 33.9, 28…
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
| 2022-08-30 | Cantareira   |               33.2 |            -0.1 |          326.13693 |              0.1 |                39.6 |              33.9 |
| 2022-08-30 | Alto Tietê   |               50.3 |             0.1 |          281.90605 |              0.7 |                36.2 |              28.6 |
| 2022-08-30 | Guarapiranga |               59.8 |            -0.3 |          102.33131 |              0.8 |                24.6 |              40.0 |
| 2022-08-30 | Cotia        |               60.5 |            -0.5 |            9.97717 |              0.4 |                23.4 |              40.4 |
| 2022-08-30 | Rio Grande   |               88.5 |             0.8 |           99.30764 |              8.8 |                48.4 |              48.7 |
| 2022-08-30 | Rio Claro    |               43.8 |             3.4 |            5.98281 |             20.0 |               137.0 |              99.8 |
| 2022-08-30 | São Lourenço |               66.9 |            -0.1 |           59.43562 |              1.8 |                52.6 |              61.4 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
