
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
#> Rows: 46,965
#> Columns: 8
#> $ data                [3m[90m<date>[39m[23m 2020-12-13, 2020-12-13, 2020-12-13, 2020-12-13, …
#> $ sistema             [3m[90m<chr>[39m[23m "Cantareira", "Alto Tietê", "Guarapiranga", "Coti…
#> $ volume_porcentagem  [3m[90m<dbl>[39m[23m 32.7, 53.1, 49.2, 57.5, 77.3, 46.6, 59.5, 32.5, 5…
#> $ volume_variacao     [3m[90m<dbl>[39m[23m 0.2, 0.0, -0.3, -0.3, 0.2, -0.2, 0.3, 0.0, 0.0, -…
#> $ volume_operacional  [3m[90m<dbl>[39m[23m 320.96404, 297.34437, 84.30411, 9.48107, 86.70788…
#> $ pluviometria_dia    [3m[90m<dbl>[39m[23m 15.0, 15.8, 0.0, 1.8, 0.8, 11.2, 0.8, 5.1, 6.9, 0…
#> $ pluviometria_mensal [3m[90m<dbl>[39m[23m 97.5, 82.5, 21.4, 18.0, 39.6, 109.4, 27.6, 82.5, …
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
| 2020-12-13 | Cantareira   |                32.7 |              0.2 |           320.96404 |              15.0 |                 97.5 |              215.2 |
| 2020-12-13 | Alto Tietê   |                53.1 |              0.0 |           297.34437 |              15.8 |                 82.5 |              188.7 |
| 2020-12-13 | Guarapiranga |                49.2 |            \-0.3 |            84.30411 |               0.0 |                 21.4 |              173.5 |
| 2020-12-13 | Cotia        |                57.5 |            \-0.3 |             9.48107 |               1.8 |                 18.0 |              167.7 |
| 2020-12-13 | Rio Grande   |                77.3 |              0.2 |            86.70788 |               0.8 |                 39.6 |              188.4 |
| 2020-12-13 | Rio Claro    |                46.6 |            \-0.2 |             6.36889 |              11.2 |                109.4 |              256.8 |
| 2020-12-13 | São Lourenço |                59.5 |              0.3 |            52.80588 |               0.8 |                 27.6 |              211.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
