
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
#> Rows: 47,910
#> Columns: 8
#> $ data                <date> 2021-04-27, 2021-04-27, 2021-04-27, 2021-04-27, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 51.1, 59.9, 71.3, 80.2, 91.6, 65.9, 79.6, 51.2, 60…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.2, -0.2, -0.1, 0.1, 0.2, 0.0, 0.0, …
#> $ volume_operacional  <dbl> 501.42753, 335.63727, 122.10126, 13.22936, 102.708…
#> $ pluviometria_dia    <dbl> 0.1, 0.0, 1.4, 0.4, 0.0, 0.2, 0.6, 0.0, 0.0, 0.0, …
#> $ pluviometria_mensal <dbl> 8.8, 41.3, 46.6, 56.4, 62.0, 231.2, 77.4, 8.7, 41.…
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
| 2021-04-27 | Cantareira   |                51.1 |            \-0.1 |           501.42753 |               0.1 |                  8.8 |               83.1 |
| 2021-04-27 | Alto Tietê   |                59.9 |            \-0.1 |           335.63727 |               0.0 |                 41.3 |               95.0 |
| 2021-04-27 | Guarapiranga |                71.3 |            \-0.2 |           122.10126 |               1.4 |                 46.6 |               72.5 |
| 2021-04-27 | Cotia        |                80.2 |            \-0.2 |            13.22936 |               0.4 |                 56.4 |               77.6 |
| 2021-04-27 | Rio Grande   |                91.6 |            \-0.1 |           102.70825 |               0.0 |                 62.0 |              103.7 |
| 2021-04-27 | Rio Claro    |                65.9 |              0.1 |             9.00684 |               0.2 |                231.2 |              191.1 |
| 2021-04-27 | São Lourenço |                79.6 |              0.2 |            70.66030 |               0.6 |                 77.4 |              111.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
