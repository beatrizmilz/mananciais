
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
#> Rows: 55,057
#> Columns: 8
#> $ data                <date> 2024-02-12, 2024-02-12, 2024-02-12, 2024-02-12, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 73.7, 64.5, 79.2, 80.8, 99.5, 37.1, 89.2, 73.8, 64…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.3, -0.4, -0.3, -0.1, -0.1, 0.0, -0.…
#> $ volume_operacional  <dbl> 723.43187, 361.15819, 135.65961, 13.32822, 111.591…
#> $ pluviometria_dia    <dbl> 0.0, 0.0, 2.4, 0.0, 0.0, 0.0, 0.0, 0.5, 0.2, 0.0, …
#> $ pluviometria_mensal <dbl> 26.1, 50.8, 32.4, 58.4, 13.8, 44.4, 24.4, 26.1, 50…
#> $ pluviometria_hist   <dbl> 202.5, 176.4, 193.4, 181.9, 206.6, 242.3, 230.5, 2…
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
| 2024-02-12 | Cantareira   |               73.7 |            -0.1 |          723.43187 |              0.0 |                26.1 |             202.5 |
| 2024-02-12 | Alto Tietê   |               64.5 |            -0.1 |          361.15819 |              0.0 |                50.8 |             176.4 |
| 2024-02-12 | Guarapiranga |               79.2 |            -0.3 |          135.65961 |              2.4 |                32.4 |             193.4 |
| 2024-02-12 | Cotia        |               80.8 |            -0.4 |           13.32822 |              0.0 |                58.4 |             181.9 |
| 2024-02-12 | Rio Grande   |               99.5 |            -0.3 |          111.59181 |              0.0 |                13.8 |             206.6 |
| 2024-02-12 | Rio Claro    |               37.1 |            -0.1 |            5.06505 |              0.0 |                44.4 |             242.3 |
| 2024-02-12 | São Lourenço |               89.2 |            -0.1 |           79.22821 |              0.0 |                24.4 |             230.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
