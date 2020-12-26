
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

  - `mananciais_consolidado` - 2000 à 2019 - [Baixar versão
    `.csv`](https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais_consolidado.csv)

  - `mananciais` - 2000 à 2020 (parcial) - [Baixar versão
    `.csv`](https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv).
    Esse arquivo é atualizado através de um workflow no [GitHub
    Actions](https://github.com/beatrizmilz/mananciais/actions).

Abaixo segue um exemplo das bases disponíveis:

``` r
dplyr::glimpse(mananciais)
#> Rows: 47,049
#> Columns: 8
#> $ data                [3m[90m<date>[39m[23m 2020-12-25, 2020-12-25, 2020-12-25, 2020-12-25, …
#> $ sistema             [3m[90m<chr>[39m[23m "Cantareira", "Alto Tietê", "Guarapiranga", "Coti…
#> $ volume_porcentagem  [3m[90m<dbl>[39m[23m 34.9, 53.3, 53.1, 61.5, 78.6, 45.0, 59.3, 34.9, 5…
#> $ volume_variacao     [3m[90m<dbl>[39m[23m 0.0, -0.1, 0.0, 0.0, -0.2, -0.4, -0.3, 0.1, -0.2,…
#> $ volume_operacional  [3m[90m<dbl>[39m[23m 342.99674, 298.73444, 90.96478, 10.14573, 88.1865…
#> $ pluviometria_dia    [3m[90m<dbl>[39m[23m 0.1, 0.2, 0.0, 0.8, 0.2, 0.6, 0.2, 0.0, 0.0, 0.0,…
#> $ pluviometria_mensal [3m[90m<dbl>[39m[23m 157.7, 146.8, 103.0, 156.2, 107.4, 187.8, 168.2, …
#> $ pluviometria_hist   [3m[90m<dbl>[39m[23m 215.2, 188.7, 173.5, 167.7, 188.4, 256.8, 211.3, …
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
| 2020-12-25 | Cantareira   |                34.9 |              0.0 |           342.99674 |               0.1 |                157.7 |              215.2 |
| 2020-12-25 | Alto Tietê   |                53.3 |            \-0.1 |           298.73444 |               0.2 |                146.8 |              188.7 |
| 2020-12-25 | Guarapiranga |                53.1 |              0.0 |            90.96478 |               0.0 |                103.0 |              173.5 |
| 2020-12-25 | Cotia        |                61.5 |              0.0 |            10.14573 |               0.8 |                156.2 |              167.7 |
| 2020-12-25 | Rio Grande   |                78.6 |            \-0.2 |            88.18655 |               0.2 |                107.4 |              188.4 |
| 2020-12-25 | Rio Claro    |                45.0 |            \-0.4 |             6.14734 |               0.6 |                187.8 |              256.8 |
| 2020-12-25 | São Lourenço |                59.3 |            \-0.3 |            52.71432 |               0.2 |                168.2 |              211.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
