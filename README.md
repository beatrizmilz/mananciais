
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
#> Rows: 47,322
#> Columns: 8
#> $ data                [3m[90m<date>[39m[23m 2021-02-02, 2021-02-02, 2021-02-02, 2021-02-02, …
#> $ sistema             [3m[90m<chr>[39m[23m "Cantareira", "Alto Tietê", "Guarapiranga", "Coti…
#> $ volume_porcentagem  [3m[90m<dbl>[39m[23m 42.8, 56.6, 69.0, 71.0, 81.4, 46.6, 62.5, 42.7, 5…
#> $ volume_variacao     [3m[90m<dbl>[39m[23m 0.1, -0.1, -0.3, 0.0, 0.9, -0.1, -1.2, 0.1, -0.1,…
#> $ volume_operacional  [3m[90m<dbl>[39m[23m 419.87337, 317.36693, 118.07404, 11.70520, 91.356…
#> $ pluviometria_dia    [3m[90m<dbl>[39m[23m 5.0, 2.4, 0.4, 0.2, 22.0, 2.4, 0.0, 4.9, 16.9, 2.…
#> $ pluviometria_mensal [3m[90m<dbl>[39m[23m 9.9, 19.3, 2.4, 0.2, 23.0, 22.0, 0.0, 4.9, 16.9, …
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
| 2021-02-02 | Cantareira   |                42.8 |              0.1 |           419.87337 |               5.0 |                  9.9 |              203.1 |
| 2021-02-02 | Alto Tietê   |                56.6 |            \-0.1 |           317.36693 |               2.4 |                 19.3 |              195.5 |
| 2021-02-02 | Guarapiranga |                69.0 |            \-0.3 |           118.07404 |               0.4 |                  2.4 |              193.8 |
| 2021-02-02 | Cotia        |                71.0 |              0.0 |            11.70520 |               0.2 |                  0.2 |              177.9 |
| 2021-02-02 | Rio Grande   |                81.4 |              0.9 |            91.35653 |              22.0 |                 23.0 |              207.5 |
| 2021-02-02 | Rio Claro    |                46.6 |            \-0.1 |             6.36665 |               2.4 |                 22.0 |              238.2 |
| 2021-02-02 | São Lourenço |                62.5 |            \-1.2 |            55.48263 |               0.0 |                  0.0 |              233.8 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
