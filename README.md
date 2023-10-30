
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
#> Rows: 54,315
#> Columns: 8
#> $ data                <date> 2023-10-29, 2023-10-29, 2023-10-29, 2023-10-29, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 72.6, 64.9, 61.3, 87.6, 102.1, 39.9, 70.6, 72.5, 6…
#> $ volume_variacao     <dbl> 0.1, -0.2, -0.2, 0.3, -0.1, -0.2, -1.3, 0.1, -0.1,…
#> $ volume_operacional  <dbl> 712.52388, 363.76442, 104.99202, 14.44422, 114.486…
#> $ pluviometria_dia    <dbl> 0.0, 0.1, 4.6, 8.4, 1.2, 0.0, 1.6, 18.0, 1.9, 3.6,…
#> $ pluviometria_mensal <dbl> 276.1, 179.1, 170.6, 178.2, 146.4, 260.4, 250.2, 2…
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
| 2023-10-29 | Cantareira   |               72.6 |             0.1 |          712.52388 |              0.0 |               276.1 |             126.1 |
| 2023-10-29 | Alto Tietê   |               64.9 |            -0.2 |          363.76442 |              0.1 |               179.1 |             104.2 |
| 2023-10-29 | Guarapiranga |               61.3 |            -0.2 |          104.99202 |              4.6 |               170.6 |             114.2 |
| 2023-10-29 | Cotia        |               87.6 |             0.3 |           14.44422 |              8.4 |               178.2 |             119.6 |
| 2023-10-29 | Rio Grande   |              102.1 |            -0.1 |          114.48627 |              1.2 |               146.4 |             132.7 |
| 2023-10-29 | Rio Claro    |               39.9 |            -0.2 |            5.45455 |              0.0 |               260.4 |             172.9 |
| 2023-10-29 | São Lourenço |               70.6 |            -1.3 |           62.70509 |              1.6 |               250.2 |             141.7 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
