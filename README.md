
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
#> Rows: 50,703
#> Columns: 8
#> $ data                <date> 2022-05-31, 2022-05-31, 2022-05-31, 2022-05-31, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 41.6, 62.3, 79.1, 84.6, 99.2, 43.8, 90.4, 41.5, 62…
#> $ volume_variacao     <dbl> 0.1, 0.2, 0.6, 0.6, 0.6, 0.3, 0.2, -0.1, -0.1, -0.…
#> $ volume_operacional  <dbl> 408.66156, 348.95841, 135.40103, 13.96436, 111.230…
#> $ pluviometria_dia    <dbl> 24.6, 21.4, 20.4, 21.0, 20.2, 23.4, 34.6, 0.0, 0.0…
#> $ pluviometria_mensal <dbl> 56.2, 53.4, 29.6, 27.8, 33.2, 79.6, 72.8, 31.6, 32…
#> $ pluviometria_hist   <dbl> 74.8, 69.4, 59.6, 64.6, 79.9, 132.6, 88.9, 74.8, 6…
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
| 2022-05-31 | Cantareira   |                41.6 |              0.1 |           408.66156 |              24.6 |                 56.2 |               74.8 |
| 2022-05-31 | Alto Tietê   |                62.3 |              0.2 |           348.95841 |              21.4 |                 53.4 |               69.4 |
| 2022-05-31 | Guarapiranga |                79.1 |              0.6 |           135.40103 |              20.4 |                 29.6 |               59.6 |
| 2022-05-31 | Cotia        |                84.6 |              0.6 |            13.96436 |              21.0 |                 27.8 |               64.6 |
| 2022-05-31 | Rio Grande   |                99.2 |              0.6 |           111.23083 |              20.2 |                 33.2 |               79.9 |
| 2022-05-31 | Rio Claro    |                43.8 |              0.3 |             5.98281 |              23.4 |                 79.6 |              132.6 |
| 2022-05-31 | São Lourenço |                90.4 |              0.2 |            80.30366 |              34.6 |                 72.8 |               88.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
