
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
#> Rows: 54,182
#> Columns: 8
#> $ data                <date> 2023-10-10, 2023-10-10, 2023-10-10, 2023-10-10, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 70.7, 62.8, 58.0, 84.4, 101.4, 44.6, 73.2, 69.9, 6…
#> $ volume_variacao     <dbl> 0.8, 0.5, 1.4, 1.2, 1.1, -0.4, 3.1, 1.0, 0.8, 2.0,…
#> $ volume_operacional  <dbl> 693.96443, 351.94349, 99.21287, 13.93045, 113.7150…
#> $ pluviometria_dia    <dbl> 0.1, 0.4, 0.4, 0.4, 1.4, 6.2, 2.0, 39.2, 24.6, 17.…
#> $ pluviometria_mensal <dbl> 184.9, 124.6, 120.8, 118.4, 103.0, 180.6, 159.6, 1…
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
| 2023-10-10 | Cantareira   |               70.7 |             0.8 |          693.96443 |              0.1 |               184.9 |             126.1 |
| 2023-10-10 | Alto Tietê   |               62.8 |             0.5 |          351.94349 |              0.4 |               124.6 |             104.2 |
| 2023-10-10 | Guarapiranga |               58.0 |             1.4 |           99.21287 |              0.4 |               120.8 |             114.2 |
| 2023-10-10 | Cotia        |               84.4 |             1.2 |           13.93045 |              0.4 |               118.4 |             119.6 |
| 2023-10-10 | Rio Grande   |              101.4 |             1.1 |          113.71507 |              1.4 |               103.0 |             132.7 |
| 2023-10-10 | Rio Claro    |               44.6 |            -0.4 |            6.10155 |              6.2 |               180.6 |             172.9 |
| 2023-10-10 | São Lourenço |               73.2 |             3.1 |           65.05205 |              2.0 |               159.6 |             141.7 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
