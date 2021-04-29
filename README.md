
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

  - [Arquivo
    `.csv`](https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv)
  - Arquivo xlsx - em breve\!

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

  - `mananciais_consolidado` - 2000 à 2020

  - `mananciais` - 2000 à 2021 (parcial).

Abaixo segue um exemplo das bases disponíveis:

``` r
dplyr::glimpse(mananciais)
#> Rows: 47,917
#> Columns: 8
#> $ data                <date> 2021-04-28, 2021-04-28, 2021-04-28, 2021-04-28, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 51.0, 59.8, 71.3, 80.2, 91.4, 66.1, 79.7, 51.1, 59…
#> $ volume_variacao     <dbl> -0.1, -0.1, 0.0, 0.0, -0.2, 0.2, 0.1, -0.1, -0.1, …
#> $ volume_operacional  <dbl> 501.14882, 335.07951, 122.10126, 13.22936, 102.527…
#> $ pluviometria_dia    <dbl> 0.0, 0.1, 1.2, 0.0, 0.8, 1.0, 0.0, 0.1, 0.0, 1.4, …
#> $ pluviometria_mensal <dbl> 8.8, 41.4, 47.8, 56.4, 62.8, 232.2, 77.4, 8.8, 41.…
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
| :--------- | :----------- | ------------------: | ---------------: | ------------------: | ----------------: | -------------------: | -----------------: |
| 2021-04-28 | Cantareira   |                51.0 |            \-0.1 |           501.14882 |               0.0 |                  8.8 |               83.1 |
| 2021-04-28 | Alto Tietê   |                59.8 |            \-0.1 |           335.07951 |               0.1 |                 41.4 |               95.0 |
| 2021-04-28 | Guarapiranga |                71.3 |              0.0 |           122.10126 |               1.2 |                 47.8 |               72.5 |
| 2021-04-28 | Cotia        |                80.2 |              0.0 |            13.22936 |               0.0 |                 56.4 |               77.6 |
| 2021-04-28 | Rio Grande   |                91.4 |            \-0.2 |           102.52755 |               0.8 |                 62.8 |              103.7 |
| 2021-04-28 | Rio Claro    |                66.1 |              0.2 |             9.03588 |               1.0 |                232.2 |              191.1 |
| 2021-04-28 | São Lourenço |                79.7 |              0.1 |            70.76219 |               0.0 |                 77.4 |              111.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
