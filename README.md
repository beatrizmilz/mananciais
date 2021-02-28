
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
#> Rows: 47,490
#> Columns: 8
#> $ data                <date> 2021-02-26, 2021-02-26, 2021-02-26, 2021-02-26, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 48.0, 60.2, 69.7, 75.3, 88.1, 49.6, 60.2, 47.9, 60…
#> $ volume_variacao     <dbl> 0.1, 0.2, 0.3, 0.4, 0.2, 0.3, 0.5, 0.1, 0.0, 0.0, …
#> $ volume_operacional  <dbl> 471.22729, 337.39754, 119.32894, 12.42205, 98.7769…
#> $ pluviometria_dia    <dbl> 8.4, 16.2, 8.8, 0.4, 14.6, 8.0, 0.4, 4.9, 8.9, 11.…
#> $ pluviometria_mensal <dbl> 168.1, 173.6, 137.0, 135.2, 190.8, 194.6, 175.4, 1…
#> $ pluviometria_hist   <dbl> 203.1, 195.5, 193.8, 177.9, 207.5, 238.2, 233.8, 2…
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
| 2021-02-26 | Cantareira   |                48.0 |              0.1 |           471.22729 |               8.4 |                168.1 |              203.1 |
| 2021-02-26 | Alto Tietê   |                60.2 |              0.2 |           337.39754 |              16.2 |                173.6 |              195.5 |
| 2021-02-26 | Guarapiranga |                69.7 |              0.3 |           119.32894 |               8.8 |                137.0 |              193.8 |
| 2021-02-26 | Cotia        |                75.3 |              0.4 |            12.42205 |               0.4 |                135.2 |              177.9 |
| 2021-02-26 | Rio Grande   |                88.1 |              0.2 |            98.77699 |              14.6 |                190.8 |              207.5 |
| 2021-02-26 | Rio Claro    |                49.6 |              0.3 |             6.78018 |               8.0 |                194.6 |              238.2 |
| 2021-02-26 | São Lourenço |                60.2 |              0.5 |            53.44817 |               0.4 |                175.4 |              233.8 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
