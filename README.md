
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
#> Rows: 47,161
#> Columns: 8
#> $ data                [3m[90m<date>[39m[23m 2021-01-10, 2021-01-10, 2021-01-10, 2021-01-10, …
#> $ sistema             [3m[90m<chr>[39m[23m "Cantareira", "Alto Tietê", "Guarapiranga", "Coti…
#> $ volume_porcentagem  [3m[90m<dbl>[39m[23m 37.5, 56.4, 62.5, 64.4, 82.3, 45.6, 59.9, 37.3, 5…
#> $ volume_variacao     [3m[90m<dbl>[39m[23m 0.2, 0.1, 0.3, 0.0, 0.0, 0.2, 0.0, 0.2, 0.3, 0.7,…
#> $ volume_operacional  [3m[90m<dbl>[39m[23m 368.06658, 316.04990, 106.93940, 10.63207, 92.371…
#> $ pluviometria_dia    [3m[90m<dbl>[39m[23m 7.6, 0.1, 0.0, 0.0, 0.2, 0.2, 0.2, 3.3, 2.4, 17.0…
#> $ pluviometria_mensal [3m[90m<dbl>[39m[23m 41.8, 93.9, 44.6, 33.8, 60.4, 108.2, 38.8, 34.2, …
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
| 2021-01-10 | Cantareira   |                37.5 |              0.2 |           368.06658 |               7.6 |                 41.8 |              265.1 |
| 2021-01-10 | Alto Tietê   |                56.4 |              0.1 |           316.04990 |               0.1 |                 93.9 |              246.7 |
| 2021-01-10 | Guarapiranga |                62.5 |              0.3 |           106.93940 |               0.0 |                 44.6 |              229.9 |
| 2021-01-10 | Cotia        |                64.4 |              0.0 |            10.63207 |               0.0 |                 33.8 |              222.4 |
| 2021-01-10 | Rio Grande   |                82.3 |              0.0 |            92.37132 |               0.2 |                 60.4 |              249.2 |
| 2021-01-10 | Rio Claro    |                45.6 |              0.2 |             6.23305 |               0.2 |                108.2 |              296.9 |
| 2021-01-10 | São Lourenço |                59.9 |              0.0 |            53.17261 |               0.2 |                 38.8 |              273.1 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
