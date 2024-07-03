
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
#> Rows: 56,044
#> Columns: 8
#> $ data                <date> 2024-07-02, 2024-07-02, 2024-07-02, 2024-07-02, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 66.1, 63.9, 60.5, 63.2, 76.7, 36.2, 87.2, 66.3, 64…
#> $ volume_variacao     <dbl> -0.2, -0.2, -0.4, -0.4, -0.3, -0.3, -0.3, -0.1, -0…
#> $ volume_operacional  <dbl> 649.60165, 357.93361, 103.53826, 10.43024, 86.0553…
#> $ pluviometria_dia    <dbl> 0.5, 0.2, 0.0, 0.2, 0.0, 0.0, 0.0, 0.2, 0.1, 0.0, …
#> $ pluviometria_mensal <dbl> 0.7, 0.3, 0.0, 0.2, 0.0, 0.4, 0.0, 0.2, 0.1, 0.0, …
#> $ pluviometria_hist   <dbl> 43.0, 47.6, 40.9, 47.1, 52.8, 88.8, 75.5, 43.0, 47…
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
| 2024-07-02 | Cantareira   |               66.1 |            -0.2 |          649.60165 |              0.5 |                 0.7 |              43.0 |
| 2024-07-02 | Alto Tietê   |               63.9 |            -0.2 |          357.93361 |              0.2 |                 0.3 |              47.6 |
| 2024-07-02 | Guarapiranga |               60.5 |            -0.4 |          103.53826 |              0.0 |                 0.0 |              40.9 |
| 2024-07-02 | Cotia        |               63.2 |            -0.4 |           10.43024 |              0.2 |                 0.2 |              47.1 |
| 2024-07-02 | Rio Grande   |               76.7 |            -0.3 |           86.05538 |              0.0 |                 0.0 |              52.8 |
| 2024-07-02 | Rio Claro    |               36.2 |            -0.3 |            4.94301 |              0.0 |                 0.4 |              88.8 |
| 2024-07-02 | São Lourenço |               87.2 |            -0.3 |           77.41556 |              0.0 |                 0.0 |              75.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
