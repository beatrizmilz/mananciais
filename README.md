
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
#> Rows: 54,623
#> Columns: 8
#> $ data                <date> 2023-12-12, 2023-12-12, 2023-12-12, 2023-12-12, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 74.2, 62.5, 60.6, 86.5, 104.0, 42.6, 66.5, 74.2, 6…
#> $ volume_variacao     <dbl> 0.0, 0.2, 0.4, 0.2, 0.0, 0.1, -0.4, 0.1, 0.0, 1.0,…
#> $ volume_operacional  <dbl> 728.39622, 349.94661, 103.78015, 14.27176, 116.623…
#> $ pluviometria_dia    <dbl> 0.1, 1.0, 0.0, 0.2, 0.4, 6.4, 0.2, 11.4, 8.7, 30.0…
#> $ pluviometria_mensal <dbl> 29.6, 19.0, 32.4, 9.4, 25.2, 122.0, 30.2, 29.5, 18…
#> $ pluviometria_hist   <dbl> 212.7, 186.7, 173.3, 166.4, 187.6, 259.3, 214.3, 2…
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
| 2023-12-12 | Cantareira   |               74.2 |             0.0 |          728.39622 |              0.1 |                29.6 |             212.7 |
| 2023-12-12 | Alto Tietê   |               62.5 |             0.2 |          349.94661 |              1.0 |                19.0 |             186.7 |
| 2023-12-12 | Guarapiranga |               60.6 |             0.4 |          103.78015 |              0.0 |                32.4 |             173.3 |
| 2023-12-12 | Cotia        |               86.5 |             0.2 |           14.27176 |              0.2 |                 9.4 |             166.4 |
| 2023-12-12 | Rio Grande   |              104.0 |             0.0 |          116.62370 |              0.4 |                25.2 |             187.6 |
| 2023-12-12 | Rio Claro    |               42.6 |             0.1 |            5.82368 |              6.4 |               122.0 |             259.3 |
| 2023-12-12 | São Lourenço |               66.5 |            -0.4 |           59.05513 |              0.2 |                30.2 |             214.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
