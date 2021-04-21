
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
#> Rows: 47,861
#> Columns: 8
#> $ data                <date> 2021-04-20, 2021-04-20, 2021-04-20, 2021-04-20, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 51.7, 59.1, 70.0, 79.0, 87.3, 59.8, 68.4, 51.7, 59…
#> $ volume_variacao     <dbl> 0.0, 0.0, 0.1, 0.0, 0.5, 3.3, 0.6, 0.2, -0.1, 0.3,…
#> $ volume_operacional  <dbl> 507.45727, 331.36155, 119.83183, 13.03291, 97.8963…
#> $ pluviometria_dia    <dbl> 0.1, 5.7, 3.4, 1.8, 4.0, 50.0, 9.0, 2.5, 2.4, 0.4,…
#> $ pluviometria_mensal <dbl> 8.2, 26.9, 40.8, 43.6, 47.2, 184.0, 49.4, 8.1, 21.…
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
| 2021-04-20 | Cantareira   |                51.7 |              0.0 |           507.45727 |               0.1 |                  8.2 |               83.1 |
| 2021-04-20 | Alto Tietê   |                59.1 |              0.0 |           331.36155 |               5.7 |                 26.9 |               95.0 |
| 2021-04-20 | Guarapiranga |                70.0 |              0.1 |           119.83183 |               3.4 |                 40.8 |               72.5 |
| 2021-04-20 | Cotia        |                79.0 |              0.0 |            13.03291 |               1.8 |                 43.6 |               77.6 |
| 2021-04-20 | Rio Grande   |                87.3 |              0.5 |            97.89636 |               4.0 |                 47.2 |              103.7 |
| 2021-04-20 | Rio Claro    |                59.8 |              3.3 |             8.16737 |              50.0 |                184.0 |              191.1 |
| 2021-04-20 | São Lourenço |                68.4 |              0.6 |            60.77416 |               9.0 |                 49.4 |              111.3 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4319745.svg)](https://doi.org/10.5281/zenodo.4319745)
