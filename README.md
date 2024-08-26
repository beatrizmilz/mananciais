
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
#> Rows: 56,422
#> Columns: 8
#> $ data                <date> 2024-08-25, 2024-08-25, 2024-08-25, 2024-08-25, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 58.4, 54.5, 46.5, 50.3, 71.2, 27.8, 61.3, 58.6, 54…
#> $ volume_variacao     <dbl> -0.2, -0.2, -0.2, -0.2, -0.2, 0.1, -0.4, -0.2, -0.…
#> $ volume_operacional  <dbl> 573.90938, 305.17577, 79.58506, 8.30275, 79.84299,…
#> $ pluviometria_dia    <dbl> 5.8, 3.5, 11.0, 8.4, 11.0, 8.8, 13.6, 0.0, 0.0, 0.…
#> $ pluviometria_mensal <dbl> 37.5, 34.2, 52.0, 41.8, 49.4, 64.0, 53.6, 31.7, 30…
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
| 2024-08-25 | Cantareira   |               58.4 |            -0.2 |          573.90938 |              5.8 |                37.5 |              33.9 |
| 2024-08-25 | Alto Tietê   |               54.5 |            -0.2 |          305.17577 |              3.5 |                34.2 |              29.6 |
| 2024-08-25 | Guarapiranga |               46.5 |            -0.2 |           79.58506 |             11.0 |                52.0 |              39.7 |
| 2024-08-25 | Cotia        |               50.3 |            -0.2 |            8.30275 |              8.4 |                41.8 |              40.0 |
| 2024-08-25 | Rio Grande   |               71.2 |            -0.2 |           79.84299 |             11.0 |                49.4 |              48.3 |
| 2024-08-25 | Rio Claro    |               27.8 |             0.1 |            3.79998 |              8.8 |                64.0 |             100.6 |
| 2024-08-25 | São Lourenço |               61.3 |            -0.4 |           54.46237 |             13.6 |                53.6 |              60.8 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
