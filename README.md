
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
#> Rows: 54,301
#> Columns: 8
#> $ data                <date> 2023-10-27, 2023-10-27, 2023-10-27, 2023-10-27, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 72.4, 65.2, 61.8, 87.3, 102.1, 40.4, 73.0, 72.5, 6…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.1, -0.3, 0.0, -0.2, -1.2, 0.0, -0.1…
#> $ volume_operacional  <dbl> 710.81464, 365.29880, 105.72109, 14.40963, 114.486…
#> $ pluviometria_dia    <dbl> 0.2, 0.0, 0.0, 0.0, 0.2, 0.0, 0.0, 2.1, 2.0, 0.2, …
#> $ pluviometria_mensal <dbl> 258.1, 177.1, 162.4, 169.2, 143.4, 260.0, 240.4, 2…
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
| 2023-10-27 | Cantareira   |               72.4 |            -0.1 |          710.81464 |              0.2 |               258.1 |             126.1 |
| 2023-10-27 | Alto Tietê   |               65.2 |            -0.1 |          365.29880 |              0.0 |               177.1 |             104.2 |
| 2023-10-27 | Guarapiranga |               61.8 |            -0.1 |          105.72109 |              0.0 |               162.4 |             114.2 |
| 2023-10-27 | Cotia        |               87.3 |            -0.3 |           14.40963 |              0.0 |               169.2 |             119.6 |
| 2023-10-27 | Rio Grande   |              102.1 |             0.0 |          114.48627 |              0.2 |               143.4 |             132.7 |
| 2023-10-27 | Rio Claro    |               40.4 |            -0.2 |            5.51483 |              0.0 |               260.0 |             172.9 |
| 2023-10-27 | São Lourenço |               73.0 |            -1.2 |           64.85520 |              0.0 |               240.4 |             141.7 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
