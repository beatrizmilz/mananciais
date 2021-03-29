
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
#> Rows: 47,700
#> Columns: 8
#> $ data                <date> 2021-03-28, 2021-03-28, 2021-03-28, 2021-03-28, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 52.6, 61.0, 72.7, 80.8, 85.7, 50.5, 63.7, 52.6, 61…
#> $ volume_variacao     <dbl> 0.0, -0.2, -0.3, -0.2, 0.0, -0.2, -0.3, 0.0, -0.2,…
#> $ volume_operacional  <dbl> 516.20504, 342.01594, 124.38091, 13.32822, 96.1492…
#> $ pluviometria_dia    <dbl> 1.4, 0.0, 6.6, 0.6, 6.0, 0.2, 7.0, 0.2, 0.1, 0.4, …
#> $ pluviometria_mensal <dbl> 140.4, 92.4, 119.8, 73.8, 77.4, 131.6, 120.6, 139.…
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
| 2021-03-28 | Cantareira   |                52.6 |              0.0 |           516.20504 |               1.4 |                140.4 |              176.2 |
| 2021-03-28 | Alto Tietê   |                61.0 |            \-0.2 |           342.01594 |               0.0 |                 92.4 |              167.6 |
| 2021-03-28 | Guarapiranga |                72.7 |            \-0.3 |           124.38091 |               6.6 |                119.8 |              155.9 |
| 2021-03-28 | Cotia        |                80.8 |            \-0.2 |            13.32822 |               0.6 |                 73.8 |              151.3 |
| 2021-03-28 | Rio Grande   |                85.7 |              0.0 |            96.14923 |               6.0 |                 77.4 |              187.2 |
| 2021-03-28 | Rio Claro    |                50.5 |            \-0.2 |             6.89849 |               0.2 |                131.6 |              244.8 |
| 2021-03-28 | São Lourenço |                63.7 |            \-0.3 |            56.60266 |               7.0 |                120.6 |              196.2 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
