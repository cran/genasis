\name{genplot}
\alias{genplot}
\title{ Plot of concentration time series }
\description{ 
  Function \code{genplot} allows to draw points of time series of persistent organic pollutant concentration. Several parametric and non-parametric interlacing curves are available and optional (linear and exponential) and three possibilities of drawing confidence interval of the trend line (none, one-coloured and gradient).
}

\usage{
genplot(x, y=NA, input="openair", pollutant=NA, plot=TRUE,
        distr="lnorm", xlim=c(NA,NA), ylim=c(NA,NA), n=NA, 
        col="#A52375", col.points="black", pch=1, il="ls", 
        ci=TRUE, r=0.95, columns=2, xlab="Date",
        ylab="Concentration", main=NA)
}

\arguments{
  \item{x}{ vector of concentration values or data frame of genasis/openair type. See 'Details' for more detailed description of both data types.}
  \item{y}{ vector of measurement dates in the case of vector input only.}
  \item{input}{ type of data.frame in the case of data.frame input. The allowed values are \code{"openair"} (default) and \code{"genasis"}. In case of vector input, this argument is meaningless.}
  \item{pollutant}{ name of the pollutant(s), for which the plot is plotted. Not necessary if only data for one pollutant is available in \code{x}. If not specified, plots for all pollutants are drawn in a multi-plot arrangement.}
  \item{plot}{ logical. Indicates, whether plot should be plotted.}
  \item{xlim}{ \code{"character"} or \code{"Date"} class vector of length 2, giving the x axis coordinates ranges.}
  \item{ylim}{ numeric vector of length 2, giving the y axis coordinates ranges.}
  \item{n}{ number of breaks of interlacing line. If not specified, \code{n} is equal to the number of concentration values.}
  \item{col}{ color of interlacing line and confidence interval area, if chosen.}
  \item{col.points}{ color of points inside the plot.}
  \item{pch}{ plotting "character", i.e., symbol to use. For more details see \link{points}.}
  \item{il}{ type of the interlacing curve. Value \code{"ls"} leads to least square fitting of the curve, value \code{"ts"} leads to a non-parametric Theil-Sen curve.  If the value is \code{""}, no curve is plotted.}
  \item{distr}{ shape of the interlacing curve. Value \code{"norm"} leads to a linear interpolation, value \code{"lnorm"} to an exponential. If the value is \code{""}, no curve is plotted.}
  \item{ci}{ indicates, whether confidence interval of interlacing curve should be plotted. The allowed values are \code{TRUE} (default), \code{FALSE} and \code{"gradient"}.}
  \item{r}{ significance level of the confidence interval as a positive number between 0 and 1.}
  \item{columns}{ number of columns in the multi-plot arrangement.}
  \item{xlab}{ the x label of the plot.}
  \item{ylab}{ the y label of the plot.}
  \item{main}{ overall title for the plot.}
}

\details{
  The \code{genplot} function enables to draw a plot of concentration time series. The function recognises three different input formats: Option \code{input="openair"} uses openair format of data frame with first column of name \code{"date"} and type Date, optional columns of names \code{"date_end"}, \code{"temp"}, \code{"wind"} and \code{"note"} and other columns of class \code{"numeric"} containing concentration values and named by names of the compounds. \code{input="genasis"} is used for the data frame with six columns \code{"valu"}, \code{"comp"}, \code{"date_start"}, \code{"date_end"}, \code{"temp"} and \code{"wind"} where the first, fifth and sixth are of class \code{"numeric"}, second of class \code{"character"} and third and fourth columns could be both \code{"character"} or \code{"Date"} class. The names of columns in  \code{input="genasis"} are not rigid, only their order is assumed. There is also a possibility to specify \code{x} and \code{y} as two vectors of equal lenght, first of class \code{"numeric"} containing concentration values, second of class \code{"character"} or \code{"Date"} containing measurement dates.
  
  In all cases of input, if both start and end date are given, the date point is plotted as a middle of measurement period, if only one date is given, it is used directly.
  
  There are two options for plotting interlacing line of concentrations. \code{distr="lnorm"} (default) expects lognormal distribution and plots exponential trend, while \code{distr="norm"} expects roughly normal distribution of concentration data and plots linear trend.
  
  Two methods of interlacing are available under the argument \code{il}. \code{il="ls"} (default) deploys least squares method, while \code{il="ts"} deploys the Theil-Sen linear (or log-transformed exponential) estimator.
  
  Confidence intervals of trend lines are also available by the option \code{ci} with available values \code{TRUE} (default) for one-coluored area, \code{"gradient"} for probability gradient and \code{FALSE} for no confidence interval to be drawn. The default significance level of the confidence interval \code{r} is set up to \code{0.95}.
  
  Default values of \code{col} and \code{col.points} parameters to specify colours of regression line and points in the plot are set up to \code{#A52375} and black, default shape of points \code{pch} is set up to standard circles (1).
  
  In a case of multiple pollutants specified, the argument \code{columns} specifies the number of columns in resulting table of plots. Be careful with plotting higher numbers of plots - usual devices are not large enough to plot more than four plots at once, there is a need to set up sufficiently high and broad space for plotting inside the device settings.
  
  Main label and axes labels could be specified in \code{main}, \code{xlab} and \code{ylab}. A name of the pollutant is added after the user-set up label. If no specification is given, the name of the pollutant is used in main and "Date" and "Concentration" in axes labels. 
}

\value{
  a list containing: 

  \item{\code{slope}}{ slope of the regression line (in the case of exponential line, it is in a form of exponent of exp(x)).}
  
  \item{\code{intercept}}{ slope of the regression line (in the case of exponential line, it is in a form of multiplicative constant).}
  
  \item{\code{belt}}{ x-coordintaes (as \code{"Data"} class vector) of line breaks.}
  
  \item{\code{line}}{ y-coordintaes (concentration as \code{"numeric"} class vector) of line breaks.}
  
  \item{\code{lower}}{ y-coordintaes (as \code{"Data"} class vector) of confidence interval area lower border breaks.}
  
  \item{\code{upper}}{ y-coordintaes (as \code{"Data"} class vector) of confidence interval area upper border breaks.}
}

\author{ Jiri Jarkovsky \cr
         Jiri Kalina \cr
         \email{kalina@mail.muni.cz}}

\seealso{
\code{\link{genloq}, \link{genoutlier}, \link{genhistogram}, \link{genpastoact}, 
      \link{genanaggr}, \link{genstatistic}, \link{gentransform}, \link{genwhisker}}
}

\examples{
## Definition of simple data sources:
c1<-c(0.386,0.256,0.182,0.254)
c2<-"fluorene"
c3<-c("2013-05-01","2013-06-03","2013-07-05","2013-08-07")
c4<-c("2013-05-08","2013-06-10","2013-07-12","2013-08-14")

sample_genasis<-data.frame(c1,c2,c3,c4)
sample_openair<-data.frame(c4,c1)
colnames(sample_openair)=c("date","fluorene")

## Examples of different usages:
genplot(sample_openair,input="openair",pollutant="fluorene",distr="lnorm",
        n=10,ci="gradient",col="black",col.points="red",pch=15)
genplot(sample_genasis,input="genasis",n=10,col="blue")
genplot(c1,c3,ci=FALSE,pch=1,main="fluorene")

## Use of example data from the package:
data(kosetice.pas.openair)
genplot(kosetice.pas.openair[,1:8],col="orange",il="ts",ci=FALSE)
data(kosetice.pas.genasis)
\dontrun{genplot(kosetice.pas.genasis[1:208,],input="genasis",
         distr="lnorm",ci="gradient",col="orange")}
}
\keyword{ genplot }
