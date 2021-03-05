
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
#> Rows: 47,532
#> Columns: 8
#> $ data                <date> 2021-03-04, 2021-03-04, 2021-03-04, 2021-03-04, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 48.6, 60.6, 73.1, 78.2, 87.4, 49.5, 63.7, 48.6, 60…
#> $ volume_variacao     <dbl> 0.0, 0.0, 0.6, 0.2, -0.2, -0.4, -1.2, 0.0, -0.1, 0…
#> $ volume_operacional  <dbl> 477.32480, 339.39515, 125.14299, 12.90289, 98.0721…
#> $ pluviometria_dia    <dbl> 0.0, 0.9, 12.6, 0.0, 4.2, 0.0, 4.6, 0.3, 0.6, 5.2,…
#> $ pluviometria_mensal <dbl> 2.2, 4.1, 26.0, 15.0, 12.2, 0.4, 30.8, 2.2, 3.2, 1…
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
| 2021-03-04 | Cantareira   |                48.6 |              0.0 |           477.32480 |               0.0 |                  2.2 |              176.2 |
| 2021-03-04 | Alto Tietê   |                60.6 |              0.0 |           339.39515 |               0.9 |                  4.1 |              167.6 |
| 2021-03-04 | Guarapiranga |                73.1 |              0.6 |           125.14299 |              12.6 |                 26.0 |              155.9 |
| 2021-03-04 | Cotia        |                78.2 |              0.2 |            12.90289 |               0.0 |                 15.0 |              151.3 |
| 2021-03-04 | Rio Grande   |                87.4 |            \-0.2 |            98.07211 |               4.2 |                 12.2 |              187.2 |
| 2021-03-04 | Rio Claro    |                49.5 |            \-0.4 |             6.76843 |               0.0 |                  0.4 |              244.8 |
| 2021-03-04 | São Lourenço |                63.7 |            \-1.2 |            56.60266 |               4.6 |                 30.8 |              196.2 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
