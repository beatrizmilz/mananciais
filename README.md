
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
#> Rows: 47,280
#> Columns: 8
#> $ data                [3m[90m<date>[39m[23m 2021-01-27, 2021-01-27, 2021-01-27, 2021-01-27, …
#> $ sistema             [3m[90m<chr>[39m[23m "Cantareira", "Alto Tietê", "Guarapiranga", "Coti…
#> $ volume_porcentagem  [3m[90m<dbl>[39m[23m 42.5, 57.1, 70.1, 71.1, 81.3, 47.7, 64.6, 42.4, 5…
#> $ volume_variacao     [3m[90m<dbl>[39m[23m 0.1, 0.0, 0.4, 0.1, 0.2, -0.3, 1.3, 0.0, 0.1, 1.0…
#> $ volume_operacional  [3m[90m<dbl>[39m[23m 417.56640, 320.00428, 120.08347, 11.73585, 91.188…
#> $ pluviometria_dia    [3m[90m<dbl>[39m[23m 0.6, 2.5, 5.0, 0.2, 0.0, 0.2, 9.8, 4.0, 24.0, 28.…
#> $ pluviometria_mensal [3m[90m<dbl>[39m[23m 172.7, 188.6, 187.6, 150.8, 134.4, 179.6, 157.6, …
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
| 2021-01-27 | Cantareira   |                42.5 |              0.1 |           417.56640 |               0.6 |                172.7 |              265.1 |
| 2021-01-27 | Alto Tietê   |                57.1 |              0.0 |           320.00428 |               2.5 |                188.6 |              246.7 |
| 2021-01-27 | Guarapiranga |                70.1 |              0.4 |           120.08347 |               5.0 |                187.6 |              229.9 |
| 2021-01-27 | Cotia        |                71.1 |              0.1 |            11.73585 |               0.2 |                150.8 |              222.4 |
| 2021-01-27 | Rio Grande   |                81.3 |              0.2 |            91.18804 |               0.0 |                134.4 |              249.2 |
| 2021-01-27 | Rio Claro    |                47.7 |            \-0.3 |             6.52518 |               0.2 |                179.6 |              296.9 |
| 2021-01-27 | São Lourenço |                64.6 |              1.3 |            57.35348 |               9.8 |                157.6 |              273.1 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
