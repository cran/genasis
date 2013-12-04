\name{gentransform}
\alias{gentransform}
\title{ Transforms data structure (vector, "genasis", "openair") }
\description{ 
  Function \code{gentransform} enables to transform different data structures used in the genasis package one to another.
}

\usage{
gentransform(x, y=NA, input="openair", output=NA, pollutant=NA)
}

\arguments{
  \item{x}{ vector of concentration values or data frame of genasis/openair type. See 'Details' for more detailed description of both data types.}
  \item{y}{ vector of measurement dates in the case of vector input only.}
  \item{input}{ type of data frame in the case of data frame input. The allowed values are \code{"openair"} (default) and \code{"genasis"}. In case of vector input, this argument is meaningless.}
  \item{output}{ type of output data frame. As in the \code{input} argument, both data frames "openair" and "genasis" are available, with the default value equal to \code{input}.}
  \item{pollutant}{ name of the pollutant(s), which will be included into resulting data frame.}
}

\details{
  The \code{gentransform} function serves from transforming data from one three different input formats to one of two formats used in genasis package: Option "openair" uses openair format of data frame with first column of name 'date' and class \code{"Date"}, optional columns of names \code{"date_end"}, \code{"temp"}, \code{"wind"} and \code{"note"} and other columns of type \code{"numeric"} containing concentration values and named by names of the compounds. \code{input="genasis"} is used for input of a data frame with six columns \code{"valu"}, \code{"comp"}, \code{"date_start"}, \code{"date_end"}, \code{"temp"} and \code{"wind"} where the first, fifth and sixth are of class \code{"numeric"}, second of class \code{"character"} and third and fourth columns could be both \code{"character"} or \code{"Date"} class. The names of columns in  \code{input="genasis"} are not rigid, only their order is assumed. There is also a possibility to input \code{x} and \code{y} as two vectors of equal lenght, first of class \code{"numeric"} containing concentration values, second of class \code{"character"} or \code{"Date"} containing measurement dates.
  
  Argument \code{output} must be specified in the case of vector input. In other cases it is set up equal to \code{input}, which lefts the data frame without significant changes (except sorting the rows by date).
}

\value{
  \item{\code{res}}{ Data frame or vector depending on the \code{output} argument, containing recalculated values of POPs air concentrations (in mass unit per cubic meter).}
}

\author{ Jiri Kalina \cr
         \email{kalina@mail.muni.cz}}

\seealso{
\code{\link{genloq}, \link{genoutlier}, \link{genhistogram}, \link{genpastoact},
      \link{genanaggr}, \link{genplot}, \link{genstatistic}, \link{genwhisker}}
}

\examples{
## Input as a pair of vectors.
gentransform(c(0.386,0.256,0.182,0.254),
             c("2013-05-01","2013-06-03","2013-07-05","2013-08-07"),
             output="genasis")
gentransform(c(0.386,0.256,0.182,0.254),
             c("2013-05-01","2013-06-03","2013-07-05","2013-08-07"),
             output="openair",pollutant="PeCB")

\dontrun{ ## Data frame inputs:
data(kosetice.act.genasis)
gentransform(kosetice.act.genasis,input="genasis",output="openair")
data(kosetice.pas.openair)
gentransform(genpastoact(genoutlier(kosetice.pas.openair,plot=FALSE)$res),
             output="genasis")}
}
\keyword{ gentransform }
