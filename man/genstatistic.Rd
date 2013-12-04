\name{genstatistic}
\alias{genstatistic}
\title{ Computes a set of statistics on input data }
\description{ 
  Function \code{genstatistic} computes a set of statistic according to demands on evaluation of Genasis and GMP data.
}

\usage{
genstatistic(x, y=NA, input="openair", pollutant=NA, by.years=FALSE)
}

\arguments{
  \item{x}{ vector of concentration values or data frame of "genasis"/"openair" type. See 'Details' for more detailed description of both data types.}
  \item{y}{ vector of measurement dates in the case of vector input only.}
  \item{input}{ type of data frame in the case of data frame input. The allowed values are \code{"openair"} (default) and \code{"genasis"}. In case of vector input, this argument is meaningless.}
  \item{pollutant}{ name of the pollutant(s), which will be included into resulting data frame.}
  \item{by.years}{ logical. Should the statistics be computed for each year separately?}
}

\details{
  The \code{genstatistic} function provides a set of descriptive statistics, commonly used when evaluating Genasis datasets. The resulting table contains 18 columns (19 in the variant with \code{by.years=TRUE}): \cr
  \code{pollutant} name of the compound as taken from \code{x}. \cr
  \code{year} the year, for which the summary statistics are computed (only if \code{by.years=TRUE}). \cr
  \code{n} number of valid results used for calculations of the summary statistics. \cr
  \code{mean} arithmetic mean of concentration values. \cr
  \code{sd} standard deviation of concentration values. \cr
  \code{geom. mean} geometric mean of concentration values. \cr
  \code{geom. sd} geometric standard deviation. \cr
  \code{min} minimal value. \cr
  \code{median} median of concentration values. \cr
  \code{max} maximal value. \cr
  \code{Pearson} Pearson correlation (product moment) to time, available if at least 3 concentration values are present. \cr
  \code{Pp} p value of Pearson trend test, available if at least 3 concentration values are present. \cr
  \code{Daniels} Daniels trend test, available if at least 3 concentration values are present. \cr
  \code{Dp} p value of Daniels trend test, available if at least 3 concentration values are present. \cr
  \code{Mann-Kendall} Mann-Kendall tau, see \link{MannKendall}, available if at least 4 concentration values are present. \cr
  \code{MKp} p-value of Mann-Kendall trend test, for metodic, see \link{MannKendall}, available if at least 3 concentration values are present. \cr
  \code{LS slope} linear regression line (least squares fitting) slope. \cr
  \code{TS slope} Theil-Sen linear regression line slope. \cr
  \code{delta} difference between the final and the initial concentration value in the period.
}

\value{
  \item{res}{ data frame containing 18 (19 in case of \code{by.years=TRUE}) as described in paragraph 'Details'.
  }
}

\author{ Jiri Jarkovsky \cr
         Jiri Kalina \cr
         \email{kalina@mail.muni.cz}}
         
\seealso{
\code{\link{genloq}, \link{genoutlier}, \link{genhistogram}, \link{genpastoact},
      \link{genanaggr}, \link{genplot}, \link{gentransform}, \link{genwhisker}}
}

\examples{
## Vector input.
genstatistic(c(0.123,0.158,0.087,0.252,0.211,0.154),
             c("2012-01-10","2012-08-17","2012-12-12",
               "2013-04-09","2013-08-08","2013-12-10"),
             pollutant=c("pp-DDE"),by.years=TRUE)

## Use of example data from the package:
data(kosetice.pas.genasis)
genstatistic(kosetice.pas.genasis,input="genasis")
data(kosetice.pas.openair)
genstatistic(genpastoact(genoutlier(kosetice.pas.openair[,c(1:4,20:26)],
                         plot=FALSE)$res,method="auto"))
}
\keyword{ genstatistic }
