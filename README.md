
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
#> Rows: 55,855
#> Columns: 8
#> $ data                <date> 2024-06-05, 2024-06-05, 2024-06-05, 2024-06-05, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 69.9, 69.2, 71.9, 72.4, 82.6, 41.6, 94.7, 70.0, 69…
#> $ volume_variacao     <dbl> -0.1, 0.2, -0.3, -0.4, -0.2, 3.1, 0.0, -0.1, -0.2,…
#> $ volume_operacional  <dbl> 686.75116, 387.80192, 123.11320, 11.95175, 92.7110…
#> $ pluviometria_dia    <dbl> 0.0, 8.7, 0.0, 0.2, 1.0, 42.0, 0.6, 0.0, 0.4, 0.0,…
#> $ pluviometria_mensal <dbl> 0.1, 9.6, 0.0, 0.8, 1.4, 44.4, 3.0, 0.1, 0.9, 0.0,…
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
| 2024-06-05 | Cantareira   |               69.9 |            -0.1 |          686.75116 |              0.0 |                 0.1 |              56.9 |
| 2024-06-05 | Alto Tietê   |               69.2 |             0.2 |          387.80192 |              8.7 |                 9.6 |              52.7 |
| 2024-06-05 | Guarapiranga |               71.9 |            -0.3 |          123.11320 |              0.0 |                 0.0 |              53.1 |
| 2024-06-05 | Cotia        |               72.4 |            -0.4 |           11.95175 |              0.2 |                 0.8 |              58.0 |
| 2024-06-05 | Rio Grande   |               82.6 |            -0.2 |           92.71105 |              1.0 |                 1.4 |              60.5 |
| 2024-06-05 | Rio Claro    |               41.6 |             3.1 |            5.68831 |             42.0 |                44.4 |              96.9 |
| 2024-06-05 | São Lourenço |               94.7 |             0.0 |           84.12258 |              0.6 |                 3.0 |              75.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
