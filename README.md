
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
#> Rows: 52,467
#> Columns: 8
#> $ data                <date> 2023-02-07, 2023-02-07, 2023-02-07, 2023-02-07, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 57.5, 55.8, 81.7, 79.6, 103.3, 43.9, 93.8, 57.0, 5…
#> $ volume_variacao     <dbl> 0.5, 0.4, 0.0, -0.2, 0.2, 0.9, -0.9, 0.3, 0.2, 0.0…
#> $ volume_operacional  <dbl> 564.44686, 312.71778, 139.80965, 13.13092, 115.843…
#> $ pluviometria_dia    <dbl> 3.2, 12.4, 0.2, 3.0, 4.0, 46.6, 0.2, 2.3, 2.0, 2.2…
#> $ pluviometria_mensal <dbl> 121.4, 96.0, 55.4, 31.6, 54.8, 155.6, 17.2, 118.2,…
#> $ pluviometria_hist   <dbl> 200.4, 169.7, 192.7, 182.2, 206.4, 239.2, 230.9, 2…
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
| 2023-02-07 | Cantareira   |               57.5 |             0.5 |          564.44686 |              3.2 |               121.4 |             200.4 |
| 2023-02-07 | Alto Tietê   |               55.8 |             0.4 |          312.71778 |             12.4 |                96.0 |             169.7 |
| 2023-02-07 | Guarapiranga |               81.7 |             0.0 |          139.80965 |              0.2 |                55.4 |             192.7 |
| 2023-02-07 | Cotia        |               79.6 |            -0.2 |           13.13092 |              3.0 |                31.6 |             182.2 |
| 2023-02-07 | Rio Grande   |              103.3 |             0.2 |          115.84362 |              4.0 |                54.8 |             206.4 |
| 2023-02-07 | Rio Claro    |               43.9 |             0.9 |            6.00427 |             46.6 |               155.6 |             239.2 |
| 2023-02-07 | São Lourenço |               93.8 |            -0.9 |           83.35188 |              0.2 |                17.2 |             230.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
