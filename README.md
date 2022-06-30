
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
#> Rows: 50,906
#> Columns: 8
#> $ data                <date> 2022-06-29, 2022-06-29, 2022-06-29, 2022-06-29, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 39.8, 60.2, 75.8, 82.4, 98.1, 44.6, 89.4, 40.0, 60…
#> $ volume_variacao     <dbl> -0.2, -0.1, -0.1, -0.4, -0.2, 0.0, -0.4, -0.1, -0.…
#> $ volume_operacional  <dbl> 391.32267, 337.13773, 129.73759, 13.59396, 110.095…
#> $ pluviometria_dia    <dbl> 0.1, 0.2, 0.0, 0.0, 0.2, 0.2, 0.2, 0.0, 0.3, 0.0, …
#> $ pluviometria_mensal <dbl> 29.8, 20.8, 17.4, 31.6, 37.0, 64.6, 65.0, 29.7, 20…
#> $ pluviometria_hist   <dbl> 59.1, 55.5, 53.6, 60.1, 61.1, 98.5, 75.9, 59.1, 55…
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
| 2022-06-29 | Cantareira   |                39.8 |            \-0.2 |           391.32267 |               0.1 |                 29.8 |               59.1 |
| 2022-06-29 | Alto Tietê   |                60.2 |            \-0.1 |           337.13773 |               0.2 |                 20.8 |               55.5 |
| 2022-06-29 | Guarapiranga |                75.8 |            \-0.1 |           129.73759 |               0.0 |                 17.4 |               53.6 |
| 2022-06-29 | Cotia        |                82.4 |            \-0.4 |            13.59396 |               0.0 |                 31.6 |               60.1 |
| 2022-06-29 | Rio Grande   |                98.1 |            \-0.2 |           110.09562 |               0.2 |                 37.0 |               61.1 |
| 2022-06-29 | Rio Claro    |                44.6 |              0.0 |             6.09068 |               0.2 |                 64.6 |               98.5 |
| 2022-06-29 | São Lourenço |                89.4 |            \-0.4 |            79.44275 |               0.2 |                 65.0 |               75.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
