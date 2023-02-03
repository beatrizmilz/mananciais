
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
#> Rows: 52,432
#> Columns: 8
#> $ data                <date> 2023-02-02, 2023-02-02, 2023-02-02, 2023-02-02, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 53.6, 53.3, 80.8, 78.4, 103.6, 42.4, 97.2, 52.5, 5…
#> $ volume_variacao     <dbl> 1.1, 0.8, 0.2, 0.8, 0.7, 0.2, 0.0, 0.6, 1.0, 0.6, …
#> $ volume_operacional  <dbl> 526.42458, 298.83699, 138.25066, 12.93533, 116.233…
#> $ pluviometria_dia    <dbl> 55.4, 6.1, 0.2, 0.2, 4.4, 13.0, 0.4, 32.0, 40.1, 4…
#> $ pluviometria_mensal <dbl> 87.4, 46.2, 45.2, 9.4, 18.4, 69.6, 8.2, 32.0, 40.1…
#> $ pluviometria_hist   <dbl> 200.4, 169.7, 192.7, 182.2, 206.4, 239.2, 230.9, 2…
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
| 2023-02-02 | Cantareira   |               53.6 |             1.1 |          526.42458 |             55.4 |                87.4 |             200.4 |
| 2023-02-02 | Alto Tietê   |               53.3 |             0.8 |          298.83699 |              6.1 |                46.2 |             169.7 |
| 2023-02-02 | Guarapiranga |               80.8 |             0.2 |          138.25066 |              0.2 |                45.2 |             192.7 |
| 2023-02-02 | Cotia        |               78.4 |             0.8 |           12.93533 |              0.2 |                 9.4 |             182.2 |
| 2023-02-02 | Rio Grande   |              103.6 |             0.7 |          116.23326 |              4.4 |                18.4 |             206.4 |
| 2023-02-02 | Rio Claro    |               42.4 |             0.2 |            5.79223 |             13.0 |                69.6 |             239.2 |
| 2023-02-02 | São Lourenço |               97.2 |             0.0 |           86.34397 |              0.4 |                 8.2 |             230.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
