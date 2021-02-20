
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
#> Rows: 47,441
#> Columns: 8
#> $ data                [3m[90m<date>[39m[23m 2021-02-19, 2021-02-19, 2021-02-19, 2021-02-19, …
#> $ sistema             [3m[90m<chr>[39m[23m "Cantareira", "Alto Tietê", "Guarapiranga", "Coti…
#> $ volume_porcentagem  [3m[90m<dbl>[39m[23m 47.6, 58.7, 70.6, 74.3, 90.1, 46.8, 62.2, 47.3, 5…
#> $ volume_variacao     [3m[90m<dbl>[39m[23m 0.3, 0.2, 0.3, 0.0, 0.5, 0.1, -0.5, 0.2, 0.4, 0.6…
#> $ volume_operacional  [3m[90m<dbl>[39m[23m 467.11163, 329.05233, 120.83918, 12.26412, 101.08…
#> $ pluviometria_dia    [3m[90m<dbl>[39m[23m 4.2, 2.7, 2.0, 6.6, 0.8, 3.6, 0.0, 10.1, 27.2, 38…
#> $ pluviometria_mensal [3m[90m<dbl>[39m[23m 153.7, 135.1, 116.6, 112.0, 173.4, 146.4, 152.4, …
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
| 2021-02-19 | Cantareira   |                47.6 |              0.3 |           467.11163 |               4.2 |                153.7 |              203.1 |
| 2021-02-19 | Alto Tietê   |                58.7 |              0.2 |           329.05233 |               2.7 |                135.1 |              195.5 |
| 2021-02-19 | Guarapiranga |                70.6 |              0.3 |           120.83918 |               2.0 |                116.6 |              193.8 |
| 2021-02-19 | Cotia        |                74.3 |              0.0 |            12.26412 |               6.6 |                112.0 |              177.9 |
| 2021-02-19 | Rio Grande   |                90.1 |              0.5 |           101.08883 |               0.8 |                173.4 |              207.5 |
| 2021-02-19 | Rio Claro    |                46.8 |              0.1 |             6.40038 |               3.6 |                146.4 |              238.2 |
| 2021-02-19 | São Lourenço |                62.2 |            \-0.5 |            55.20377 |               0.0 |                152.4 |              233.8 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
