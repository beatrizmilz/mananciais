
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
#> Rows: 53,874
#> Columns: 8
#> $ data                <date> 2023-08-27, 2023-08-27, 2023-08-27, 2023-08-27, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 73.6, 63.8, 58.9, 84.6, 93.5, 43.3, 61.2, 73.6, 63…
#> $ volume_variacao     <dbl> 0.0, -0.1, 0.0, -0.3, 0.3, 2.4, 0.1, -0.2, 0.0, -0…
#> $ volume_operacional  <dbl> 722.61901, 357.61356, 100.88847, 13.96436, 104.891…
#> $ pluviometria_dia    <dbl> 2.0, 0.5, 0.4, 0.2, 2.8, 13.6, 1.0, 12.1, 8.0, 10.…
#> $ pluviometria_mensal <dbl> 21.3, 34.1, 19.2, 18.6, 24.4, 93.6, 27.4, 19.3, 33…
#> $ pluviometria_hist   <dbl> 34.1, 29.0, 39.9, 40.2, 48.7, 100.4, 61.3, 34.1, 2…
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
| 2023-08-27 | Cantareira   |               73.6 |             0.0 |          722.61901 |              2.0 |                21.3 |              34.1 |
| 2023-08-27 | Alto Tietê   |               63.8 |            -0.1 |          357.61356 |              0.5 |                34.1 |              29.0 |
| 2023-08-27 | Guarapiranga |               58.9 |             0.0 |          100.88847 |              0.4 |                19.2 |              39.9 |
| 2023-08-27 | Cotia        |               84.6 |            -0.3 |           13.96436 |              0.2 |                18.6 |              40.2 |
| 2023-08-27 | Rio Grande   |               93.5 |             0.3 |          104.89173 |              2.8 |                24.4 |              48.7 |
| 2023-08-27 | Rio Claro    |               43.3 |             2.4 |            5.91878 |             13.6 |                93.6 |             100.4 |
| 2023-08-27 | São Lourenço |               61.2 |             0.1 |           54.36992 |              1.0 |                27.4 |              61.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
