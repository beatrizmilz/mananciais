
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Pacote Mananciais

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
[![R build
status](https://github.com/beatrizmilz/mananciais/workflows/R-CMD-check/badge.svg)](https://github.com/beatrizmilz/mananciais/actions)  
[![update-data](https://github.com/beatrizmilz/mananciais/actions/workflows/2-update_data.yaml/badge.svg)](https://github.com/beatrizmilz/mananciais/actions/workflows/2-update_data.yaml)
<!-- badges: end -->

O objetivo deste pacote é disponibilizar a base de dados sobre o volume
operacional em mananciais de abastecimento público na Região
Metropolitana de São Paulo (SP - Brasil). O pacote é atualizado
diariamente através de um workflow com [GitHub
Actions](https://github.com/beatrizmilz/mananciais/actions).

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

**Caso você não utilize R**, é possível **fazer download da base de
dados** através dos seguintes links:

-   [Arquivo
    `.csv`](https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv)
-   Arquivo xlsx - em breve!

Os arquivos foram salvos com encoding UTF-8, e separados por
ponto-e-vírgula.

## Instalação

Este pacote pode ser instalado através do [GitHub](https://github.com/)
utilizando o seguinte código em `R`:

``` r
# install.packages("devtools")
devtools::install_github("beatrizmilz/mananciais")
library(mananciais)
```

## Como usar?

Caso você tenha conexão à internet, é possível buscar a base atualizada
usando a função `dados_mananciais()`:

``` r
mananciais <- mananciais::dados_mananciais() 
```

Caso você não tenha conexão à internet, você pode utilizar as bases
disponíveis no pacote. Porém as mesmas estarão atualizadas até a data em
que você instalou (ou atualizou) o pacote. Existem duas bases
disponíveis, em que a diferença é o período dos dados.

-   `mananciais_consolidado` - 2000 à 2020

-   `mananciais` - 2000 à 2021 (parcial).

Abaixo segue um exemplo das bases disponíveis:

``` r
dplyr::glimpse(mananciais)
#> Rows: 47,847
#> Columns: 8
#> $ data                <date> 2021-04-18, 2021-04-18, 2021-04-18, 2021-04-18, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 51.5, 59.2, 69.6, 78.8, 86.2, 54.6, 66.7, 51.7, 59…
#> $ volume_variacao     <dbl> -0.2, -0.2, 0.8, 0.4, 1.0, 0.1, 0.5, -0.1, -0.2, -…
#> $ volume_operacional  <dbl> 506.25196, 331.70320, 119.07770, 13.00033, 96.6713…
#> $ pluviometria_dia    <dbl> 1.4, 0.9, 21.2, 25.6, 26.2, 0.8, 21.4, 0.0, 0.0, 0…
#> $ pluviometria_mensal <dbl> 5.6, 18.8, 37.0, 40.8, 41.8, 93.2, 39.0, 4.2, 17.9…
#> $ pluviometria_hist   <dbl> 83.1, 95.0, 72.5, 77.6, 103.7, 191.1, 111.3, 83.1,…
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
|:-----------|:-------------|--------------------:|-----------------:|--------------------:|------------------:|---------------------:|-------------------:|
| 2021-04-18 | Cantareira   |                51.5 |             -0.2 |           506.25196 |               1.4 |                  5.6 |               83.1 |
| 2021-04-18 | Alto Tietê   |                59.2 |             -0.2 |           331.70320 |               0.9 |                 18.8 |               95.0 |
| 2021-04-18 | Guarapiranga |                69.6 |              0.8 |           119.07770 |              21.2 |                 37.0 |               72.5 |
| 2021-04-18 | Cotia        |                78.8 |              0.4 |            13.00033 |              25.6 |                 40.8 |               77.6 |
| 2021-04-18 | Rio Grande   |                86.2 |              1.0 |            96.67139 |              26.2 |                 41.8 |              103.7 |
| 2021-04-18 | Rio Claro    |                54.6 |              0.1 |             7.46253 |               0.8 |                 93.2 |              191.1 |
| 2021-04-18 | São Lourenço |                66.7 |              0.5 |            59.24527 |              21.4 |                 39.0 |              111.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
