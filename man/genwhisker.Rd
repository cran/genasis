\name{genwhisker}
\alias{genwhisker}
\title{ Box and whisker plot - overview of dataset }
\description{ 
  Function \code{genwisker} allows to draw several box & whisker plots of the dataset. Boxes and whiskers could be drawn for all the data on each pollutant or differentiated by colours over individual years.
}

\usage{
genwhisker(x, y=NA, input="openair", method="mqm", pollutant=NA,
        distr="norm", by.years=FALSE, col="#A52375",
        legend=TRUE, xlab="", ylab="Concentration", main=NA)
}

\arguments{
  \item{x}{ vector of concentration values or data frame of "genasis"/"openair" type. See 'Details' for more detailed description of both data types.}
  \item{y}{ vector of measurement dates in the case of vector input only.}
  \item{input}{ type of data.frame in the case of data.frame input. The allowed values are \code{"openair"} (default) and \code{"genasis"}. In case of vector input, this argument is meaningless.}
  \item{method}{ arrangement of boxes and whiskers. Default \code{"mqm"} means median-quartiles-min/max, alternative \code{"mqq"} (median-quartiles-5/95quantiles) and "tqm" (trimean-quartiles-min/max) are available.}
  \item{pollutant}{ name of the pollutant(s), which will be included into the box & whisker plot. Not necessary if only data for one pollutant is available in \code{x}. If not specified, all pollutants are included into the box & whisker plot.}
  \item{distr}{ if  \code{distr="norm"} (default), the linear y-axis is used, if \code{distr="lnorm"}, the logarithmic scale is used.}
  \item{by.years}{ logical. If \code{by.years=FALSE}, all data for each pollutant are used together, if \code{by.years=TRUE}, individual years are distinguished by colors specified in argument \code{col}.}
  \item{col}{ vector of colors of the boxes & whiskers. If a length of the vector in the color-by-years version is different from the number of years in the measurement period, implicit colors are used.}
  \item{legend}{ logical. Should a legend be drawn in a multi-color mode?}
  \item{xlab}{ a label for the x axis.}  
  \item{ylab}{ a label for the y axis.}
  \item{main}{ a main title for the plot.}
}

\details{
  The \code{genwhisker} function draws a box & whisker plot of selected compounds from the dataset. The function recognises three different input formats: Option \code{input="openair"} uses "openair" format of data frame with first column of name 'date' and class \code{"Date"}, optional columns of names \code{"date_end"}, \code{"temp"}, \code{"wind"} and \code{"note"} and other columns of class \code{"numeric"} containing concentration values and named by names of the compounds. \code{input="genasis"} is used for the data frame with six columns \code{"valu"}, \code{"comp"}, \code{"date_start"}, \code{"date_end"}, \code{"temp"} and \code{"wind"} where the first, fifth and sixth are of class \code{"numeric"}, second of class \code{"character"} and third and fourth columns could be both \code{"character"} or \code{"Date"} class. The names of columns in  \code{input="genasis"} are not rigid, only their order is assumed. There is also a possibility to specify \code{x} and \code{y} as two vectors of equal lenght, first of class \code{"numeric"} containing concentration values, second of class \code{"character"} or \code{"Date"} containing measurement dates.
  
  Central tendency of the dataset for selected pollutants from \code{x} is drawn as a bold horizontal line, 25th and 75th quantiles (e.g. 1st and 3rd quartiles) as a lighter box and extremes by a light horizontal lines (whiskers) at the ends of vertical line connecting all the values. There are three possibilities of boxes & whiskers arrangement. Option \code{method="mqm"} (default) means that central tendency lies in median, box margins in 1st and 3rd quartiles and whiskers in min/max. Alternative \code{method="mqq"} means that central tendency lies in median, box margins in 1st and 3rd quartiles and whiskers in 5th and 95th quantiles, finally \code{method="tqm"} means that central tendency lies in trimean, box margins in 1st and 3rd quartiles and whiskers in min/max.
  
  There are two posibilities of drawing. The default option \code{by.years=FALSE} plots all the values for each pollutant in one box & whisker arrangement, while \code{by.years=TRUE} plots a number of color-distinguished overlapping boxes & whiskers. The colors could be defined by the argument \code{col} as a vector of the same length as the period of measurement. If the length of the vector and the period differ, default colors are used for plotting.
  
  If \code{by.years=TRUE} and \code{legend=TRUE}, the legend is drawn upon the plot as a colored years according to the color(s) of box(es) & whisker(s).
}

\author{ Jiri Kalina \cr
         \email{kalina@mail.muni.cz}}

\seealso{
\code{\link{genloq}, \link{genoutlier}, \link{genhistogram}, \link{genpastoact},
      \link{genanaggr}, \link{genplot}, \link{genstatistic}, \link{gentransform}}
}

\examples{
## Definition of simple data sources:
c1<-c(0.386,0.269,0.182,0.254,0.455,0.263,0.405,0.211)
c2<-"benzo(ghi)perylene"
c3<-c("2012-02-01","2012-05-03","2012-08-05","2012-11-07",
      "2013-02-15","2013-05-10","2013-08-02","2013-11-06")
c4<-c("2012-02-08","2012-05-10","2012-08-12","2012-11-14",
      "2013-02-22","2013-05-17","2013-08-09","2013-11-13")

sample_genasis<-data.frame(c1,c2,c3,c4)
sample_openair<-data.frame(c4,c1)
colnames(sample_openair)=c("date",c2)

## Examples of different usages:
genwhisker(sample_openair,distr="lnorm",col="black")
genwhisker(sample_genasis,input="genasis",distr="norm",by.years=TRUE,
           col=c("blue","red"),legend=TRUE,main="benzo(ghi)perylene")
genwhisker(c1,c3,main="benzo(ghi)perylene")

## Use of example data from the package:
data(kosetice.pas.openair)
genwhisker(kosetice.pas.openair[,1:8],
           col=c("gold","orange","red","black"),by.years=TRUE)
data(kosetice.pas.genasis)
genwhisker(kosetice.pas.genasis[1:208,],input="genasis",distr="lnorm",
           col="orange")
}
\keyword{ genwhisker }
