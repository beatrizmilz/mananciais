
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
#> Rows: 47,077
#> Columns: 8
#> $ data                [3m[90m<date>[39m[23m 2020-12-29, 2020-12-29, 2020-12-29, 2020-12-29, …
#> $ sistema             [3m[90m<chr>[39m[23m "Cantareira", "Alto Tietê", "Guarapiranga", "Coti…
#> $ volume_porcentagem  [3m[90m<dbl>[39m[23m 35.6, 53.1, 53.7, 62.4, 78.5, 44.6, 61.2, 35.3, 5…
#> $ volume_variacao     [3m[90m<dbl>[39m[23m 0.3, 0.1, 0.6, 0.2, 0.3, 0.7, 0.8, 0.3, -0.1, 0.0…
#> $ volume_operacional  [3m[90m<dbl>[39m[23m 349.55249, 297.52643, 91.89612, 10.28743, 88.0215…
#> $ pluviometria_dia    [3m[90m<dbl>[39m[23m 11.3, 23.6, 11.0, 4.6, 4.4, 39.0, 0.6, 21.7, 0.8,…
#> $ pluviometria_mensal [3m[90m<dbl>[39m[23m 204.6, 172.4, 130.4, 188.0, 114.6, 229.6, 170.4, …
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
| 2020-12-29 | Cantareira   |                35.6 |              0.3 |           349.55249 |              11.3 |                204.6 |              215.2 |
| 2020-12-29 | Alto Tietê   |                53.1 |              0.1 |           297.52643 |              23.6 |                172.4 |              188.7 |
| 2020-12-29 | Guarapiranga |                53.7 |              0.6 |            91.89612 |              11.0 |                130.4 |              173.5 |
| 2020-12-29 | Cotia        |                62.4 |              0.2 |            10.28743 |               4.6 |                188.0 |              167.7 |
| 2020-12-29 | Rio Grande   |                78.5 |              0.3 |            88.02153 |               4.4 |                114.6 |              188.4 |
| 2020-12-29 | Rio Claro    |                44.6 |              0.7 |             6.09068 |              39.0 |                229.6 |              256.8 |
| 2020-12-29 | São Lourenço |                61.2 |              0.8 |            54.36992 |               0.6 |                170.4 |              211.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
