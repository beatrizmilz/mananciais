
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
#> Rows: 50,213
#> Columns: 8
#> $ data                <date> 2022-03-22, 2022-03-22, 2022-03-22, 2022-03-22, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 45.3, 58.7, 89.6, 92.0, 104.3, 49.7, 96.5, 45.3, 5…
#> $ volume_variacao     <dbl> 0.0, 0.4, 0.1, 0.4, 0.2, -1.9, 0.5, 0.2, 0.8, 0.2,…
#> $ volume_operacional  <dbl> 444.91034, 328.88659, 153.43655, 15.18190, 117.014…
#> $ pluviometria_dia    <dbl> 0.1, 0.2, 0.0, 0.0, 0.0, 1.2, 0.4, 5.4, 4.8, 6.0, …
#> $ pluviometria_mensal <dbl> 87.2, 129.3, 211.0, 189.6, 167.4, 190.8, 267.6, 87…
#> $ pluviometria_hist   <dbl> 174.1, 164.6, 154.8, 154.1, 186.7, 243.7, 195.1, 1…
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
| 2022-03-22 | Cantareira   |                45.3 |              0.0 |           444.91034 |               0.1 |                 87.2 |              174.1 |
| 2022-03-22 | Alto Tietê   |                58.7 |              0.4 |           328.88659 |               0.2 |                129.3 |              164.6 |
| 2022-03-22 | Guarapiranga |                89.6 |              0.1 |           153.43655 |               0.0 |                211.0 |              154.8 |
| 2022-03-22 | Cotia        |                92.0 |              0.4 |            15.18190 |               0.0 |                189.6 |              154.1 |
| 2022-03-22 | Rio Grande   |               104.3 |              0.2 |           117.01496 |               0.0 |                167.4 |              186.7 |
| 2022-03-22 | Rio Claro    |                49.7 |            \-1.9 |             6.79194 |               1.2 |                190.8 |              243.7 |
| 2022-03-22 | São Lourenço |                96.5 |              0.5 |            85.67451 |               0.4 |                267.6 |              195.1 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
