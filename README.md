
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
#> Rows: 52,719
#> Columns: 8
#> $ data                <date> 2023-03-15, 2023-03-15, 2023-03-15, 2023-03-15, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 78.5, 73.8, 88.9, 101.6, 103.6, 43.5, 101.0, 77.9,…
#> $ volume_variacao     <dbl> 0.6, 0.4, 1.1, 0.2, -0.4, -0.1, 0.1, 0.8, 0.4, 1.6…
#> $ volume_operacional  <dbl> 771.24081, 413.61268, 152.11858, 16.76039, 116.233…
#> $ pluviometria_dia    <dbl> 3.1, 4.7, 1.6, 4.0, 0.0, 0.0, 42.6, 35.8, 2.0, 36.…
#> $ pluviometria_mensal <dbl> 175.3, 107.6, 201.0, 103.4, 75.6, 92.4, 282.6, 172…
#> $ pluviometria_hist   <dbl> 174.3, 155.5, 155.4, 154.6, 186.7, 243.5, 196.8, 1…
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
| 2023-03-15 | Cantareira   |               78.5 |             0.6 |          771.24081 |              3.1 |               175.3 |             174.3 |
| 2023-03-15 | Alto Tietê   |               73.8 |             0.4 |          413.61268 |              4.7 |               107.6 |             155.5 |
| 2023-03-15 | Guarapiranga |               88.9 |             1.1 |          152.11858 |              1.6 |               201.0 |             155.4 |
| 2023-03-15 | Cotia        |              101.6 |             0.2 |           16.76039 |              4.0 |               103.4 |             154.6 |
| 2023-03-15 | Rio Grande   |              103.6 |            -0.4 |          116.23326 |              0.0 |                75.6 |             186.7 |
| 2023-03-15 | Rio Claro    |               43.5 |            -0.1 |            5.95073 |              0.0 |                92.4 |             243.5 |
| 2023-03-15 | São Lourenço |              101.0 |             0.1 |           89.73103 |             42.6 |               282.6 |             196.8 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
