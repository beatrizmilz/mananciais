
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Mananciais

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

Caso você queira utilizar a base mais atual, sem que seja necessário
instalar o pacote, recomendo que utilize o seguinte código:

``` r
mananciais <- readr::read_csv2("https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv")
```

**Caso você não utilize R**, também é possível **fazer download da base
de dados** através [deste
link](https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv).

## Instalação

Este pacote pode ser instalado através do [GitHub](https://github.com/)
utilizando o seguinte código em `R`:

``` r
# install.packages("devtools")
devtools::install_github("beatrizmilz/mananciais")
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
library(mananciais)

dplyr::glimpse(mananciais)
#> Rows: 46,426
#> Columns: 8
#> $ data                <date> 2020-09-27, 2020-09-27, 2020-09-27, 2020-09-27...
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Co...
#> $ volume_porcentagem  <dbl> 42.1, 60.9, 46.9, 64.4, 78.0, 63.5, 64.4, 42.3,...
#> $ volume_variacao     <dbl> -0.2, -0.2, -0.1, -0.4, -0.2, -0.5, -0.5, -0.2,...
#> $ volume_operacional  <dbl> 413.23628, 341.09546, 80.25369, 10.63207, 87.52...
#> $ pluviometria_dia    <dbl> 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0....
#> $ pluviometria_mensal <dbl> 22.2, 19.1, 11.0, 6.6, 25.4, 89.8, 19.0, 22.2, ...
#> $ pluviometria_hist   <dbl> 83.9, 80.0, 77.8, 82.5, 95.0, 141.6, 115.9, 83....

dplyr::glimpse(mananciais_consolidado)
#> Rows: 44,529
#> Columns: 8
#> $ data                <date> 2000-01-01, 2000-01-01, 2000-01-01, 2000-01-01...
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Co...
#> $ volume_porcentagem  <dbl> 47.1, 50.9, 36.0, 18.8, 81.0, 73.2, 47.8, 51.4,...
#> $ volume_variacao     <dbl> 0.3, 0.1, 0.0, 0.9, 0.4, -0.2, 0.7, 0.5, 0.4, 0...
#> $ volume_operacional  <dbl> 365.50555, 196.02547, 64.80029, 2.64579, 91.694...
#> $ pluviometria_dia    <dbl> 30.9, 26.0, 47.2, 0.0, 0.0, 5.2, 29.1, 47.3, 9....
#> $ pluviometria_mensal <dbl> 30.9, 26.0, 47.2, 0.0, 0.0, 5.2, 60.0, 73.3, 56...
#> $ pluviometria_hist   <dbl> 254.8, 238.1, 225.2, 217.8, 235.4, 292.0, 254.8...
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
mananciais %>% 
  dplyr::arrange(desc(data)) %>% 
  head(7) %>%
  knitr::kable()
```

| data       | sistema      | volume\_porcentagem | volume\_variacao | volume\_operacional | pluviometria\_dia | pluviometria\_mensal | pluviometria\_hist |
| :--------- | :----------- | ------------------: | ---------------: | ------------------: | ----------------: | -------------------: | -----------------: |
| 2020-09-27 | Cantareira   |                42.1 |            \-0.2 |           413.23628 |                 0 |                 22.2 |               83.9 |
| 2020-09-27 | Alto Tietê   |                60.9 |            \-0.2 |           341.09546 |                 0 |                 19.1 |               80.0 |
| 2020-09-27 | Guarapiranga |                46.9 |            \-0.1 |            80.25369 |                 0 |                 11.0 |               77.8 |
| 2020-09-27 | Cotia        |                64.4 |            \-0.4 |            10.63207 |                 0 |                  6.6 |               82.5 |
| 2020-09-27 | Rio Grande   |                78.0 |            \-0.2 |            87.52755 |                 0 |                 25.4 |               95.0 |
| 2020-09-27 | Rio Claro    |                63.5 |            \-0.5 |             8.67788 |                 0 |                 89.8 |              141.6 |
| 2020-09-27 | São Lourenço |                64.4 |            \-0.5 |            57.16546 |                 0 |                 19.0 |              115.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
