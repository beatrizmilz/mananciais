
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
#> Rows: 53,930
#> Columns: 8
#> $ data                <date> 2023-09-04, 2023-09-04, 2023-09-04, 2023-09-04, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 72.5, 63.5, 58.4, 83.8, 94.8, 43.7, 61.8, 72.6, 63…
#> $ volume_variacao     <dbl> -0.1, 0.0, 0.0, 0.2, 0.0, -0.2, 0.7, 0.1, 0.1, 0.6…
#> $ volume_operacional  <dbl> 712.41667, 355.80708, 99.92995, 13.82900, 106.3628…
#> $ pluviometria_dia    <dbl> 0.4, 0.1, 0.2, 0.2, 0.0, 0.0, 0.2, 25.3, 22.8, 25.…
#> $ pluviometria_mensal <dbl> 25.7, 23.2, 25.8, 25.4, 20.0, 20.2, 18.6, 25.3, 23…
#> $ pluviometria_hist   <dbl> 81.4, 60.7, 76.8, 76.0, 93.5, 139.5, 112.8, 81.4, …
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
| 2023-09-04 | Cantareira   |               72.5 |            -0.1 |          712.41667 |              0.4 |                25.7 |              81.4 |
| 2023-09-04 | Alto Tietê   |               63.5 |             0.0 |          355.80708 |              0.1 |                23.2 |              60.7 |
| 2023-09-04 | Guarapiranga |               58.4 |             0.0 |           99.92995 |              0.2 |                25.8 |              76.8 |
| 2023-09-04 | Cotia        |               83.8 |             0.2 |           13.82900 |              0.2 |                25.4 |              76.0 |
| 2023-09-04 | Rio Grande   |               94.8 |             0.0 |          106.36289 |              0.0 |                20.0 |              93.5 |
| 2023-09-04 | Rio Claro    |               43.7 |            -0.2 |            5.97211 |              0.0 |                20.2 |             139.5 |
| 2023-09-04 | São Lourenço |               61.8 |             0.7 |           54.92536 |              0.2 |                18.6 |             112.8 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
