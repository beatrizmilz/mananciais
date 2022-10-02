
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
#> Rows: 51,564
#> Columns: 8
#> $ data                <date> 2022-10-01, 2022-10-01, 2022-10-01, 2022-10-01, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 32.4, 47.9, 61.3, 54.7, 93.3, 46.7, 65.8, 32.1, 47…
#> $ volume_variacao     <dbl> 0.3, 0.2, 0.8, 0.1, 0.5, -0.8, 0.2, 0.4, 0.3, 0.9,…
#> $ volume_operacional  <dbl> 317.83293, 268.34917, 104.99202, 9.02561, 104.7087…
#> $ pluviometria_dia    <dbl> 16.7, 6.1, 5.0, 4.0, 6.8, 6.0, 4.4, 0.3, 0.0, 0.4,…
#> $ pluviometria_mensal <dbl> 16.7, 6.1, 5.0, 4.0, 6.8, 6.0, 4.4, 118.1, 79.3, 9…
#> $ pluviometria_hist   <dbl> 126.3, 106.0, 114.5, 120.2, 132.7, 173.7, 141.2, 8…
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
| 2022-10-01 | Cantareira   |               32.4 |             0.3 |          317.83293 |             16.7 |                16.7 |             126.3 |
| 2022-10-01 | Alto Tietê   |               47.9 |             0.2 |          268.34917 |              6.1 |                 6.1 |             106.0 |
| 2022-10-01 | Guarapiranga |               61.3 |             0.8 |          104.99202 |              5.0 |                 5.0 |             114.5 |
| 2022-10-01 | Cotia        |               54.7 |             0.1 |            9.02561 |              4.0 |                 4.0 |             120.2 |
| 2022-10-01 | Rio Grande   |               93.3 |             0.5 |          104.70871 |              6.8 |                 6.8 |             132.7 |
| 2022-10-01 | Rio Claro    |               46.7 |            -0.8 |            6.37788 |              6.0 |                 6.0 |             173.7 |
| 2022-10-01 | São Lourenço |               65.8 |             0.2 |           58.48600 |              4.4 |                 4.4 |             141.2 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
