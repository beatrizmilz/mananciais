
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
#> Rows: 47,427
#> Columns: 8
#> $ data                [3m[90m<date>[39m[23m 2021-02-17, 2021-02-17, 2021-02-17, 2021-02-17, …
#> $ sistema             [3m[90m<chr>[39m[23m "Cantareira", "Alto Tietê", "Guarapiranga", "Coti…
#> $ volume_porcentagem  [3m[90m<dbl>[39m[23m 47.1, 58.1, 69.7, 74.0, 88.2, 46.6, 63.1, 46.9, 5…
#> $ volume_variacao     [3m[90m<dbl>[39m[23m 0.2, 0.2, 0.0, 0.0, 0.0, 0.5, -0.5, 0.2, 0.2, 0.1…
#> $ volume_operacional  [3m[90m<dbl>[39m[23m 462.72435, 325.53969, 119.32894, 12.20127, 98.953…
#> $ pluviometria_dia    [3m[90m<dbl>[39m[23m 5.6, 14.4, 31.4, 3.2, 0.2, 11.6, 7.2, 0.3, 0.4, 3…
#> $ pluviometria_mensal [3m[90m<dbl>[39m[23m 139.4, 105.2, 76.6, 100.6, 158.6, 134.2, 134.0, 1…
#> $ pluviometria_hist   [3m[90m<dbl>[39m[23m 203.1, 195.5, 193.8, 177.9, 207.5, 238.2, 233.8, …
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
| 2021-02-17 | Cantareira   |                47.1 |              0.2 |           462.72435 |               5.6 |                139.4 |              203.1 |
| 2021-02-17 | Alto Tietê   |                58.1 |              0.2 |           325.53969 |              14.4 |                105.2 |              195.5 |
| 2021-02-17 | Guarapiranga |                69.7 |              0.0 |           119.32894 |              31.4 |                 76.6 |              193.8 |
| 2021-02-17 | Cotia        |                74.0 |              0.0 |            12.20127 |               3.2 |                100.6 |              177.9 |
| 2021-02-17 | Rio Grande   |                88.2 |              0.0 |            98.95368 |               0.2 |                158.6 |              207.5 |
| 2021-02-17 | Rio Claro    |                46.6 |              0.5 |             6.36665 |              11.6 |                134.2 |              238.2 |
| 2021-02-17 | São Lourenço |                63.1 |            \-0.5 |            56.04172 |               7.2 |                134.0 |              233.8 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
