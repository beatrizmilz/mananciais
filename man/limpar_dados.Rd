% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/limpar_dados.R
\name{limpar_dados}
\alias{limpar_dados}
\title{Limpar dados.}
\usage{
limpar_dados(df)
}
\arguments{
\item{df}{Tibble a ser limpa.}
}
\value{
Retorna um tibble com os dados limpos.
}
\description{
Pode ser usada com o pipe ( \verb{\%>\%} ) (veja exemplo abaixo).
A limpeza consiste em: retirar colunas desnecessárias ou repetidas, altera o
tipo de algumas variáveis.
}
\examples{
mananciais:::obter_dia("2020-09-26") \%>\% mananciais:::limpar_dados()
}
\keyword{internal}
