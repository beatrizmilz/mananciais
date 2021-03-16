
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
#> Rows: 47,609
#> Columns: 8
#> $ data                <date> 2021-03-15, 2021-03-15, 2021-03-15, 2021-03-15, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 51.5, 61.9, 75.0, 81.6, 87.7, 52.0, 65.5, 51.3, 62…
#> $ volume_variacao     <dbl> 0.2, -0.1, -0.2, 0.0, -0.4, 0.0, -0.8, 0.1, -0.1, …
#> $ volume_operacional  <dbl> 505.69527, 346.74837, 128.45762, 13.46071, 98.4241…
#> $ pluviometria_dia    <dbl> 11.6, 4.0, 0.0, 0.2, 0.0, 0.0, 0.2, 0.0, 0.0, 0.0,…
#> $ pluviometria_mensal <dbl> 100.3, 72.6, 87.2, 62.8, 46.4, 82.0, 74.6, 88.7, 6…
#> $ pluviometria_hist   <dbl> 176.2, 167.6, 155.9, 151.3, 187.2, 244.8, 196.2, 1…
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
| 2021-03-15 | Cantareira   |                51.5 |              0.2 |           505.69527 |              11.6 |                100.3 |              176.2 |
| 2021-03-15 | Alto Tietê   |                61.9 |            \-0.1 |           346.74837 |               4.0 |                 72.6 |              167.6 |
| 2021-03-15 | Guarapiranga |                75.0 |            \-0.2 |           128.45762 |               0.0 |                 87.2 |              155.9 |
| 2021-03-15 | Cotia        |                81.6 |              0.0 |            13.46071 |               0.2 |                 62.8 |              151.3 |
| 2021-03-15 | Rio Grande   |                87.7 |            \-0.4 |            98.42417 |               0.0 |                 46.4 |              187.2 |
| 2021-03-15 | Rio Claro    |                52.0 |              0.0 |             7.10313 |               0.0 |                 82.0 |              244.8 |
| 2021-03-15 | São Lourenço |                65.5 |            \-0.8 |            58.20216 |               0.2 |                 74.6 |              196.2 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
