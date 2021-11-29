
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
#> Rows: 49,415
#> Columns: 8
#> $ data                <date> 2021-11-28, 2021-11-28, 2021-11-28, 2021-11-28, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 26.0, 37.7, 52.2, 39.4, 81.9, 48.2, 66.9, 26.1, 37…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.3, -0.4, -0.3, -0.1, -0.3, -0.1, -0…
#> $ volume_operacional  <dbl> 255.26969, 211.12579, 89.34219, 6.50742, 91.86310,…
#> $ pluviometria_dia    <dbl> 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 6.2, 1.3, 0.8, …
#> $ pluviometria_mensal <dbl> 78.5, 49.4, 90.8, 71.4, 70.2, 84.0, 33.2, 78.5, 49…
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
| 2021-11-28 | Cantareira   |                26.0 |            \-0.1 |           255.26969 |                 0 |                 78.5 |              149.0 |
| 2021-11-28 | Alto Tietê   |                37.7 |            \-0.1 |           211.12579 |                 0 |                 49.4 |              130.1 |
| 2021-11-28 | Guarapiranga |                52.2 |            \-0.3 |            89.34219 |                 0 |                 90.8 |              124.0 |
| 2021-11-28 | Cotia        |                39.4 |            \-0.4 |             6.50742 |                 0 |                 71.4 |              126.1 |
| 2021-11-28 | Rio Grande   |                81.9 |            \-0.3 |            91.86310 |                 0 |                 70.2 |              140.2 |
| 2021-11-28 | Rio Claro    |                48.2 |            \-0.1 |             6.58250 |                 0 |                 84.0 |              195.5 |
| 2021-11-28 | São Lourenço |                66.9 |            \-0.3 |            59.43562 |                 0 |                 33.2 |              154.6 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
