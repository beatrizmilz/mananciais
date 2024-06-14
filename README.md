
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
#> Rows: 55,911
#> Columns: 8
#> $ data                <date> 2024-06-13, 2024-06-13, 2024-06-13, 2024-06-13, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 68.9, 67.9, 69.1, 70.4, 81.3, 40.7, 93.3, 69.0, 68…
#> $ volume_variacao     <dbl> -0.1, -0.2, -0.3, -0.4, -0.2, -0.2, -0.3, -0.1, -0…
#> $ volume_operacional  <dbl> 676.54808, 380.56397, 118.32476, 11.61350, 91.1880…
#> $ pluviometria_dia    <dbl> 0.0, 0.3, 0.4, 0.2, 0.0, 0.0, 0.2, 0.0, 0.2, 0.2, …
#> $ pluviometria_mensal <dbl> 0.6, 11.7, 1.6, 2.4, 1.6, 45.0, 4.0, 0.6, 11.4, 1.…
#> $ pluviometria_hist   <dbl> 56.9, 52.7, 53.1, 58.0, 60.5, 96.9, 75.3, 56.9, 52…
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
| 2024-06-13 | Cantareira   |               68.9 |            -0.1 |          676.54808 |              0.0 |                 0.6 |              56.9 |
| 2024-06-13 | Alto Tietê   |               67.9 |            -0.2 |          380.56397 |              0.3 |                11.7 |              52.7 |
| 2024-06-13 | Guarapiranga |               69.1 |            -0.3 |          118.32476 |              0.4 |                 1.6 |              53.1 |
| 2024-06-13 | Cotia        |               70.4 |            -0.4 |           11.61350 |              0.2 |                 2.4 |              58.0 |
| 2024-06-13 | Rio Grande   |               81.3 |            -0.2 |           91.18804 |              0.0 |                 1.6 |              60.5 |
| 2024-06-13 | Rio Claro    |               40.7 |            -0.2 |            5.56849 |              0.0 |                45.0 |              96.9 |
| 2024-06-13 | São Lourenço |               93.3 |            -0.3 |           82.91305 |              0.2 |                 4.0 |              75.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
