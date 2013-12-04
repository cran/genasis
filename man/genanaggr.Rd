\name{genanaggr}
\alias{genanaggr}
\title{ Computes annual aggregations from (relevant) POPs concentration data }
\description{ 
  Function \code{genannagr} aggregates (concentration) values over time using selected aggregation function. Aggregation is made for whole years by the middle time points of measurement intervals. If assumptions on number of measurements or their (semi)equidistance are not met, the aggregation is flagged and eventually discarded.
}

\usage{
genanaggr(x, y=NA, input="openair", output=NA, 
          pollutant=NA, method="mean", minn=4, 
          gap=3, show.flagged=FALSE)
}

\arguments{
  \item{x}{ vector of concentration values or data frame of "genasis"/"openair" type. See 'Details' for more detailed description of both data types.}
  \item{y}{ vector of measurement dates in the case of vector input only.}
  \item{input}{ type of data.frame in the case of data.frame input. The allowed values are \code{"openair"} (default) and \code{"genasis"}. In case of vector input, this argument is meaningless.}
  \item{output}{ type of output data.frame. As in the \code{input} argument, both data frames "openair" and "genasis" are available, with the default value equal to \code{input}.}
  \item{pollutant}{ name of the pollutant(s), for which the aggregation is made. Not necessary if only data for one pollutant is available in \code{x}. If not specified, the aggregation is made for all pollutants in \code{x}.}
  \item{method}{ a function to compute the aggregation which can be applied to all pollutants data.}
  \item{minn}{ the minimal number of measurements for receiving result without the flag.}
  \item{gap}{ the maximal size of a time gap between two consequent measurements as a multiple of average time between measurements in given year for receiving result without the flag.}
  \item{show.flagged}{ logical. If \code{TRUE}, the flagged values are allowed in result, If \code{FALSE}, these values are replaced by \code{NA}s.}
  }

\details{
  Function \code{genanaggr} computes annual aggregations of measured (concentration) values. The function recognises three different input formats: Option \code{input="openair"} uses openair format of data frame with first column of name \code{"date"} and type \code{"Date"}, optional columns of names \code{"date_end"}, \code{"temp"}, \code{"wind"} and \code{"note"} and other columns of type \code{"numeric"} containing concentration values and named by names of the compounds. \code{input="genasis"} is used for the data frame with six columns \code{"valu"}, \code{"comp"}, \code{"date_start"}, \code{"date_end"}, \code{"temp"} and \code{"wind"} where the first, fifth and sixth are of class \code{"numeric"}, second of class \code{"character"} and third and fourth columns could be both \code{"character"} or \code{"Date"} type. The names of columns in  \code{input="genasis"} are not rigid, only their order is assumed. There is also a possibility to specify \code{x} and \code{y} as two vectors of equal lenght, first of type numeric containing concentration values, second of type \code{"character"} or Date containing measurement dates.
  
  There is no report in a case of vector output. In a case of \code{output="openair"}, the problematic rows are flagged in column \code{"note"} with a list of problematic compound. Finally in a case of \code{output="genasis"}, there is a detailed description of the problem (unfulfilled criterion) in the relevant row of the data frame of "genasis" type.
  
  If there is only a single date (\code{date} column in "openair", \code{date_start} column in "genasis" type data frame or \code{y} in the case of vector input), it is used directly, whereafter if a range is available (specified by \code{date_end} in both data.frame formats), the middle day of the range is computed. If only the month (as \code{"2013-05"} or \code{"5.2013"}) or the year (as \code{"2013"}) is specified, the date is placed into the 15th day in the case of month or into a 1st July in the case of year.
  
  An user-specified function is used for computing the aggregations for all pollutants (or another parameters), except of reserved names \code{"temp"} and \code{"wind"}, for which the arithmetic mean is used. It can be a function or a symbol or character string naming a function on a numeric vector.
  
  There are two conditions of usability of (concentration) values inside individual years for the aggregation. First, the \code{minn} argument, default set up to \code{4}, which restricts the minimal number of measurements during each year as a criteria of representativeness and second, the \code{gap} argument, default set up to \code{3}, which restricts the maximal time gap betwen consequents measurements (and start/end of the year) in scale of average time gap between them as a criteria of equidistance. If not both conditions are met, the aggregation is flagged (by a note in column \code{note} in case of data frame) and according to a logical value of the \code{show.flagged}, the results are shown or replaced by \code{NA}s.
}

\value{
  a list containing: 

  \item{res}{ Aggregated data frame of "openair"/"genasis" format or vector of aggregated values in case of vector input. Start and end dates are set up to 1st January and 31st December of each year. There is also the column \code{"note"} containing flags and brief description of their reason in both data farme output formats. }
}

\author{ Jiri Kalina \cr
         \email{kalina@mail.muni.cz}}
         
\references{ Klanova, J.; Dusek, L.; Boruvkova, J.; Hulek, R.; Sebkova, K. i.; Gregor, J.; Jarkovsky, J.; Kalina, J.; Hrebicek, J. and Holoubek, I. (2012) The initial analysis of the Global Monitoring Plan (GMP) reports and a detailed proposal to develop an interactive on-line data storage, handling, and presentation module for the GMP in the framework of the GENASIS database and risk assessment tool. Masaryk University, pp. 157.}

\seealso{
\code{\link{genloq}, \link{genoutlier}, \link{genhistogram}, \link{genpastoact}, \link{genplot}, 
      \link{genstatistic}, \link{gentransform}, \link{genwhisker}}
}

\examples{
## Vector input.
genanaggr(c(0.123,0.158,0.087,0.252,0.211,0.154),
          c("2012-01-10","2012-08-17","2012-12-12",
            "2013-04-09","2013-08-08","2013-12-10"),
          minn=3)

## Use of example data from the package:
data(kosetice.pas.genasis)
genanaggr(kosetice.pas.genasis,input="genasis",show.flagged=TRUE)
data(kosetice.act.openair)
genanaggr(genoutlier(kosetice.act.openair[1:6],
          plot=FALSE)$res,minn=6,gap=1.5)
}
\keyword{ genanaggr }
