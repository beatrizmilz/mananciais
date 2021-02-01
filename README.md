
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
#> Rows: 47,308
#> Columns: 8
#> $ data                [3m[90m<date>[39m[23m 2021-01-31, 2021-01-31, 2021-01-31, 2021-01-31, …
#> $ sistema             [3m[90m<chr>[39m[23m "Cantareira", "Alto Tietê", "Guarapiranga", "Coti…
#> $ volume_porcentagem  [3m[90m<dbl>[39m[23m 42.6, 56.8, 69.6, 71.1, 80.7, 46.6, 64.4, 42.6, 5…
#> $ volume_variacao     [3m[90m<dbl>[39m[23m 0.0, -0.1, -0.3, 0.0, -0.1, -0.3, -0.7, 0.0, -0.2…
#> $ volume_operacional  [3m[90m<dbl>[39m[23m 418.22665, 318.08042, 119.07770, 11.73585, 90.515…
#> $ pluviometria_dia    [3m[90m<dbl>[39m[23m 0.0, 0.2, 0.0, 0.0, 0.2, 0.0, 0.2, 0.0, 0.0, 0.0,…
#> $ pluviometria_mensal [3m[90m<dbl>[39m[23m 181.6, 189.6, 190.6, 152.4, 135.8, 179.6, 157.8, …
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
| 2021-01-31 | Cantareira   |                42.6 |              0.0 |           418.22665 |               0.0 |                181.6 |              265.1 |
| 2021-01-31 | Alto Tietê   |                56.8 |            \-0.1 |           318.08042 |               0.2 |                189.6 |              246.7 |
| 2021-01-31 | Guarapiranga |                69.6 |            \-0.3 |           119.07770 |               0.0 |                190.6 |              229.9 |
| 2021-01-31 | Cotia        |                71.1 |              0.0 |            11.73585 |               0.0 |                152.4 |              222.4 |
| 2021-01-31 | Rio Grande   |                80.7 |            \-0.1 |            90.51593 |               0.2 |                135.8 |              249.2 |
| 2021-01-31 | Rio Claro    |                46.6 |            \-0.3 |             6.36665 |               0.0 |                179.6 |              296.9 |
| 2021-01-31 | São Lourenço |                64.4 |            \-0.7 |            57.16546 |               0.2 |                157.8 |              273.1 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
