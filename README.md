
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
#> Rows: 49,310
#> Columns: 8
#> $ data                <date> 2021-11-13, 2021-11-13, 2021-11-13, 2021-11-13, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 27.1, 38.7, 49.8, 42.4, 81.9, 45.0, 68.0, 27.3, 38…
#> $ volume_variacao     <dbl> -0.2, -0.2, -0.2, -0.5, -0.1, 0.2, -0.1, -0.2, -0.…
#> $ volume_operacional  <dbl> 266.55815, 217.08180, 85.21307, 7.00253, 91.86310,…
#> $ pluviometria_dia    <dbl> 0.0, 0.0, 0.0, 0.4, 0.4, 0.2, 0.8, 3.8, 1.9, 3.4, …
#> $ pluviometria_mensal <dbl> 32.5, 19.1, 12.4, 13.6, 20.8, 38.2, 8.8, 32.5, 19.…
#> $ pluviometria_hist   <dbl> 149.0, 130.1, 124.0, 126.1, 140.2, 195.5, 154.6, 1…
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
| :--------- | :----------- | ------------------: | ---------------: | ------------------: | ----------------: | -------------------: | -----------------: |
| 2021-11-13 | Cantareira   |                27.1 |            \-0.2 |           266.55815 |               0.0 |                 32.5 |              149.0 |
| 2021-11-13 | Alto Tietê   |                38.7 |            \-0.2 |           217.08180 |               0.0 |                 19.1 |              130.1 |
| 2021-11-13 | Guarapiranga |                49.8 |            \-0.2 |            85.21307 |               0.0 |                 12.4 |              124.0 |
| 2021-11-13 | Cotia        |                42.4 |            \-0.5 |             7.00253 |               0.4 |                 13.6 |              126.1 |
| 2021-11-13 | Rio Grande   |                81.9 |            \-0.1 |            91.86310 |               0.4 |                 20.8 |              140.2 |
| 2021-11-13 | Rio Claro    |                45.0 |              0.2 |             6.14515 |               0.2 |                 38.2 |              195.5 |
| 2021-11-13 | São Lourenço |                68.0 |            \-0.1 |            60.39063 |               0.8 |                  8.8 |              154.6 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
