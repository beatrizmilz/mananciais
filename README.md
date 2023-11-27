
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
#> Rows: 54,511
#> Columns: 8
#> $ data                <date> 2023-11-26, 2023-11-26, 2023-11-26, 2023-11-26, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 72.6, 62.3, 59.8, 87.6, 102.2, 42.3, 68.0, 72.6, 6…
#> $ volume_variacao     <dbl> 0.0, 0.0, 0.4, 0.0, 0.7, -0.7, 1.4, 0.0, -0.1, 0.0…
#> $ volume_operacional  <dbl> 712.65515, 349.13180, 102.33131, 14.44422, 114.679…
#> $ pluviometria_dia    <dbl> 0.6, 6.2, 5.8, 3.6, 3.2, 7.2, 5.0, 1.9, 1.2, 0.4, …
#> $ pluviometria_mensal <dbl> 102.0, 64.3, 107.4, 71.0, 63.2, 138.0, 136.8, 101.…
#> $ pluviometria_hist   <dbl> 149.8, 122.4, 124.0, 123.9, 138.0, 194.3, 150.4, 1…
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
| 2023-11-26 | Cantareira   |               72.6 |             0.0 |          712.65515 |              0.6 |               102.0 |             149.8 |
| 2023-11-26 | Alto Tietê   |               62.3 |             0.0 |          349.13180 |              6.2 |                64.3 |             122.4 |
| 2023-11-26 | Guarapiranga |               59.8 |             0.4 |          102.33131 |              5.8 |               107.4 |             124.0 |
| 2023-11-26 | Cotia        |               87.6 |             0.0 |           14.44422 |              3.6 |                71.0 |             123.9 |
| 2023-11-26 | Rio Grande   |              102.2 |             0.7 |          114.67957 |              3.2 |                63.2 |             138.0 |
| 2023-11-26 | Rio Claro    |               42.3 |            -0.7 |            5.78178 |              7.2 |               138.0 |             194.3 |
| 2023-11-26 | São Lourenço |               68.0 |             1.4 |           60.39063 |              5.0 |               136.8 |             150.4 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
