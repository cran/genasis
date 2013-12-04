\name{genoutlier}
\alias{genoutlier}
\title{ Identification and exclusion of outliers }
\description{ 
  Function \code{genoutlier} finds and excludes outlied (concentration) values according to selected method and draws plot of outliers.
}

\usage{
genoutlier(x, y=NA, input="openair", output=NA, method="lm3s",
           sides=2, pollutant=NA, plot=TRUE, columns=2, 
           col.points="black", pch=1, xlab="Date", 
           ylab="Concentration", main=NA)
}

\arguments{
  \item{x}{ a vector of concentration values or data frame of genasis/openair type. See 'Details' for more detailed description of both data types.}
  \item{y}{ a vector of measurement dates in the case of vector input only.}
  \item{input}{ a type of data.frame in the case of data.frame input. The allowed values are "openair" (default) and "genasis". In case of vector input, this argument is meaningless.}
  \item{output}{ a type of output data.frame. As in the \code{input} argument, both data.frames "openair" and "genasis" are available, with the default value equal to \code{input}.}
  \item{method}{ method of threshold(s) determination. Allowed values are \code{"m2s"} and \code{"m3s"} for mean +(-) 3 standard deviation, \code{"lm2s"} and \code{"lm3s"} for log-transformed variant and \code{"iqr2"}, \code{"iqr4"} and \code{"iqr7"} for interquatile distances.  See 'Details' for more detailed description of methods.}
  \item{sides}{ if \code{sides}=2 (default), both lower and upper threshold are used. If \code{sides}=1, only the upper one is in charge.}
  \item{pollutant}{ a name(s) of the pollutant(s), for which the outliers are find. Not necessary if only data for one pollutant is available in \code{x}. If not specified, plots for all pollutants are drawn in a multi-plot arrangement.}
  \item{plot}{ logical. Indicates, whether plot should be plotted.}
  \item{columns}{ number of columns in the multi-plot arrangement.}
  \item{col.points}{ color of non-outlied points inside the plot.}
  \item{pch}{ plotting 'character', i.e., symbol to use. For more details see \link{points}.}
  \item{xlab}{ the x label of the plot.}
  \item{ylab}{ the y label of the plot.}
  \item{main}{ overall title for the plot.}
}

\details{
  The \code{genoutlier} function finds outlied (concentration) values according to a criterion given by arguments \code{method} and \code{sides} and substitutes them by NAs. The function recognises three different input formats: Option \code{input="openair"} uses "openair" format of data frame with first column of name \code{"date"} and class \code{"Date"}, optional columns of names \code{"date_end"}, \code{"temp"}, \code{"wind"} and \code{"note"} and other columns of class \code{"numeric"} containing concentration values and named by names of the compounds. \code{input="genasis"} is used for the data frame with six columns \code{"valu"}, \code{"comp"}, \code{"date_start"}, \code{"date_end"}, \code{"temp"} and \code{"wind"} where the first, fifth and sixth are of class \code{"numeric"}, second of class \code{"character"} and third and fourth columns could be both \code{"character"} or \code{"Date"} class. The names of columns in  \code{input="genasis"} are not rigid, only their order is assumed. There is also a possibility to specify \code{x} and \code{y} as two vectors of equal lenght, first of class \code{"numeric"} containing concentration values, second of class \code{"character"} or \code{"Date"} containing measurement dates.
  
  The \code{output} argument specifies of which type the resul will be. Both types of \code{"data.frame"} class \code{output="openair"} and \code{output="genasis"} are available, the default value is equal to the \code{input} argument, therefore the vector class of output is possible only if \code{x} is of class \code{"numeric"} and \code{output} is not specified.
  
  There are seven available methods of outlier threshold set up: \code{method="m3s"} set the lower threshold equal to sample mean - 3 standard deviations and the uuper threshold to the sample mean + 3 standard deviations. Variant \code{method="m2s"} works similarly with only doubled standard deviations. In case of log-normally distributed data, the variant \code{method="lm3s"} could work better, setting up the lower threshold as geometric mean / 3 geometric standard deviation and the upper threshold as geometric mean * 3 geometric standard deviation. Analogously \code{method="lm2s"} works with the doubled geometric standard deviation. Non-parametric variants \code{"iqr2"}, \code{"iqr4"} and \code{"iqr7"} set lower threshold to 25th quantile - a * interquartile range and upper threshold to 75th quantile + a * interquartile range with parameter a sequentially 0.5, 1.5 and 3 (thus the whole range is 2, 4 and 7 times the interquartile range). 
  
  The argument \code{sides} serves to specification, whether the one-sided or two-sided exclusion of outliers will be done. In the case \code{sides=2} (default), both outliers under the lower and over the upper threshold are excluded, conversely if \code{sides=1}, only the outliers over the upper threshold are excluded.
}

\value{
  a list containing: 

  \item{res}{ the data frame (or vector) according to the \code{output} argument settings with outlied values substituted by NAs. }
  
  \item{lower}{ numeric value of lower threshold}
  
  \item{upper}{ numeric value of upper threshold}
}

\author{ Jiri Kalina \cr
         \email{kalina@mail.muni.cz}}

\seealso{
\code{\link{genloq}, \link{genhistogram}, \link{genpastoact}, \link{genanaggr}, 
      \link{genplot}, \link{genstatistic}, \link{gentransform}, \link{genwhisker}}
}

\examples{
## Definition of simple data sources:
c1<-rnorm(100)+12
c2<-"random compound"
c3<-as.Date(as.Date("2013-01-01"):as.Date("2013-04-10"),
            origin="1970-01-01")
c4<-c3+1

sample_genasis<-data.frame(c1,c2,c3,c4)
sample_openair<-data.frame(c4,c1)
colnames(sample_openair)=c("date",c2)

## Examples of different usages:
genoutlier(sample_openair,input="openair",pollutant="random compound",
           method="m2s")
genoutlier(sample_genasis,input="genasis",method="m3s")

## Use of example data from the package:
data(kosetice.pas.openair)
genoutlier(genpastoact(kosetice.pas.openair[,1:8]),method="lm3s",
           main="Outliers",ylab="Concentration ngm-3")
genoutlier(kosetice.pas.openair[,c(1:4,23:26)],col.points="orange",
           method="lm3s")
data(kosetice.pas.genasis)
genoutlier(kosetice.pas.genasis[625:832,],input="genasis",
           method="lm2s",sides=1)
}
\keyword{ genoutlier }
