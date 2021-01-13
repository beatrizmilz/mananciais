
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Pacote Mananciais

<!-- badges: start -->

[![R build
status](https://github.com/beatrizmilz/mananciais/workflows/R-CMD-check/badge.svg)](https://github.com/beatrizmilz/mananciais/actions)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
<!-- badges: end -->

O objetivo deste pacote é disponibilizar a base de dados sobre volume
armazenado em mananciais de abastecimento público na Região
Metropolitana de São Paulo (SP - Brasil).

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

> **Caso você não utilize R**, é possível **fazer download da base de
> dados** através [deste
> link](https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv).

Caso você queira utilizar a base mais atual, sem que seja necessário
instalar o pacote, recomendo que utilize o seguinte código:

``` r
mananciais <- readr::read_csv2("https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv")
```

## Instalação

Este pacote pode ser instalado através do [GitHub](https://github.com/)
utilizando o seguinte código em `R`:

``` r
# install.packages("devtools")
devtools::install_github("beatrizmilz/mananciais")
library(mananciais)
```

## Como usar?

Existem dois arquivos disponíveis, em que a diferença é o período dos
dados. Caso você não utilize `R` e queira ter acesso aos dados em
formato `.csv`, os mesmos podem ser acessados através dos links a
seguir. Lembrete: o arquivo foi salvo em formato “separado por ponto e
vírgula”, e com encoding “UTF-8”.

  - `mananciais_consolidado` - 2000 à 2020 - [Baixar versão
    `.csv`](https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais_consolidado.csv)

  - `mananciais` - 2000 à 2021 (parcial) - [Baixar versão
    `.csv`](https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv).
    Esse arquivo é atualizado através de um workflow no [GitHub
    Actions](https://github.com/beatrizmilz/mananciais/actions).

Abaixo segue um exemplo das bases disponíveis:

``` r
dplyr::glimpse(mananciais)
#> Rows: 47,175
#> Columns: 8
#> $ data                [3m[90m<date>[39m[23m 2021-01-12, 2021-01-12, 2021-01-12, 2021-01-12, …
#> $ sistema             [3m[90m<chr>[39m[23m "Cantareira", "Alto Tietê", "Guarapiranga", "Coti…
#> $ volume_porcentagem  [3m[90m<dbl>[39m[23m 38.6, 56.4, 65.2, 65.7, 82.2, 45.8, 60.8, 38.2, 5…
#> $ volume_variacao     [3m[90m<dbl>[39m[23m 0.4, 0.0, 0.9, 0.5, 0.0, 0.1, 0.9, 0.7, 0.0, 1.8,…
#> $ volume_operacional  [3m[90m<dbl>[39m[23m 379.25727, 316.21414, 111.60438, 10.83611, 92.201…
#> $ pluviometria_dia    [3m[90m<dbl>[39m[23m 6.1, 0.1, 0.4, 1.6, 0.2, 0.6, 3.6, 37.3, 0.3, 14.…
#> $ pluviometria_mensal [3m[90m<dbl>[39m[23m 85.2, 94.3, 59.2, 50.4, 60.8, 109.2, 49.8, 79.1, …
#> $ pluviometria_hist   [3m[90m<dbl>[39m[23m 265.1, 246.7, 229.9, 222.4, 249.2, 296.9, 273.1, …
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
| 2021-01-12 | Cantareira   |                38.6 |              0.4 |           379.25727 |               6.1 |                 85.2 |              265.1 |
| 2021-01-12 | Alto Tietê   |                56.4 |              0.0 |           316.21414 |               0.1 |                 94.3 |              246.7 |
| 2021-01-12 | Guarapiranga |                65.2 |              0.9 |           111.60438 |               0.4 |                 59.2 |              229.9 |
| 2021-01-12 | Cotia        |                65.7 |              0.5 |            10.83611 |               1.6 |                 50.4 |              222.4 |
| 2021-01-12 | Rio Grande   |                82.2 |              0.0 |            92.20172 |               0.2 |                 60.8 |              249.2 |
| 2021-01-12 | Rio Claro    |                45.8 |              0.1 |             6.25517 |               0.6 |                109.2 |              296.9 |
| 2021-01-12 | São Lourenço |                60.8 |              0.9 |            54.00062 |               3.6 |                 49.8 |              273.1 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
