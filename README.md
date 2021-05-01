
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Pacote Mananciais

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
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
-   Arquivo xlsx - em breve!

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

Caso você não tenha conexão à internet, você pode utilizar as bases
disponíveis no pacote. Porém as mesmas estarão atualizadas até a data em
que você instalou (ou atualizou) o pacote. Existem duas bases
disponíveis, em que a diferença é o período dos dados.

-   `mananciais_consolidado` - 2000 à 2020

-   `mananciais` - 2000 à 2021 (parcial).

Abaixo segue um exemplo das bases disponíveis:

``` r
dplyr::glimpse(mananciais)
#> Rows: 47,938
#> Columns: 8
#> $ data                <date> 2021-05-01, 2021-05-01, 2021-05-01, 2021-05-01, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 50.7, 59.5, 70.9, 79.4, 90.6, 67.2, 79.7, 50.8, 59…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.1, -0.2, -0.3, 0.1, -0.2, -0.1, -0.…
#> $ volume_operacional  <dbl> 498.22596, 333.32517, 121.34363, 13.09820, 101.626…
#> $ pluviometria_dia    <dbl> 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.0, 0.0, 0.2, 0.2, …
#> $ pluviometria_mensal <dbl> 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.0, 9.0, 43.6, 48.0…
#> $ pluviometria_hist   <dbl> 77.4, 75.4, 58.6, 64.6, 80.4, 133.3, 89.3, 83.1, 9…
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

| data       | sistema      | volume\_porcentagem | volume\_variacao | volume\_operacional | pluviometria\_dia | pluviometria\_mensal | pluviometria\_hist |
|:-----------|:-------------|--------------------:|-----------------:|--------------------:|------------------:|---------------------:|-------------------:|
| 2021-05-01 | Cantareira   |                50.7 |             -0.1 |           498.22596 |               0.0 |                  0.0 |               77.4 |
| 2021-05-01 | Alto Tietê   |                59.5 |             -0.1 |           333.32517 |               0.0 |                  0.0 |               75.4 |
| 2021-05-01 | Guarapiranga |                70.9 |             -0.1 |           121.34363 |               0.0 |                  0.0 |               58.6 |
| 2021-05-01 | Cotia        |                79.4 |             -0.2 |            13.09820 |               0.0 |                  0.0 |               64.6 |
| 2021-05-01 | Rio Grande   |                90.6 |             -0.3 |           101.62691 |               0.0 |                  0.0 |               80.4 |
| 2021-05-01 | Rio Claro    |                67.2 |              0.1 |             9.18208 |               0.2 |                  0.2 |              133.3 |
| 2021-05-01 | São Lourenço |                79.7 |             -0.2 |            70.76219 |               0.0 |                  0.0 |               89.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
