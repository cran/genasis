\name{genloq}
\alias{genloq}
\title{ Substitution of (concentration) values below a limit of quantification (LoQ) }
\description{ 
  Function \code{genloq} uses given (or determines) threshold of the limit of quantification and substitutes string \code{"LoQ"} of values below it.
}

\usage{
genloq(x, y=NA, input="openair", output=NA, loq=NA, 
       method="mle", distr="lnorm", pollutant=NA, plot=TRUE, 
       ylim=c(NA,NA), columns=2, col.points="black", pch=1, 
       xlab="Date", ylab="Concentration", main=NA)
}

\arguments{
  \item{x}{ a vector of concentration values (of class \code{"numeric"} or \code{"character"}) or data frame of "genasis"/"openair" type with concentration column allowed to be of class \code{"character"}. See 'Details' for more detailed description of both data types and the exceptions for \code{genloq} function.}
  \item{y}{ a vector of measurement dates in the case of vector input only.}
  \item{input}{ a type of data frame in the case of data frame input. The allowed values are \code{"openair"} (default) and \code{"genasis"} with an exception of the column with concentration values, which could be of class \code{"character"}. In case of vector input, this argument is meaningless.}
  \item{output}{ a type of output data frame. As in the \code{input} argument, both data frames \code{"openair"}  and \code{"genasis"} are available, with the default value equal to \code{input}.}
  \item{loq}{ a value of the limit of quantification which will be used for all pollutants.} 
  \item{method}{ method of values below LoQ substitution. Allowed values are \code{"exc"} for exclusion, \code{"1.0"}, \code{"2.0"}, \code{"sq2"} for substitution by constant and \code{"mle"} for modified maximum likelihood method. See 'Details' for more detailed description of methods.}
  \item{distr}{ if \code{method="mle"} (default), specifies if normal \code{distr="norm"} or log-normal \code{distr="lnorm"} distribution will be used for likelihood maximization.}
  \item{pollutant}{ a name(s) of the pollutant(s), for which the LoQs are substituted. Not necessary if only data for one pollutant is available in \code{x}. If not specified, results for all pollutants are computed and plots for all pollutants are drawn in a multi-plot arrangement.}
  \item{plot}{ logical. Indicates, whether plot should be plotted.}
  \item{ylim}{ vector of class \code{"numeric"} and length 2 setting the lower and upper border of the plot.}
  \item{columns}{ number of columns in the multi-plot arrangement.}
  \item{col.points}{ color of over LoQ points inside the plot.}
  \item{pch}{ plotting 'character', i.e., symbol to use. For more details see \link{points}.}
  \item{xlab}{ the x label of the plot.}
  \item{ylab}{ the y label of the plot.}
  \item{main}{ overall title for the plot.}
}

\details{
  The \code{genloq} function substitutes values below the limit of quantification (LoQ) (equivalently the limit of detection (LoD)) marked as "loq", "LoQ" or "LOQ" in the \code{x}. Although both data frames of types "openair" and "genasis" are defined with columns containing concentration values of class \code{"numeric"}, it is necessary to mark values below LoQ as character string - thus here is an exception from the definition and both data types "openair" and "genasis", as well as vector \code{x} could contain concentration values of class \code{"character"}. See 'Examples' paragraph. 
  
  Thus the function recognises three different input formats: Option \code{input="openair"} uses "openair" format of data frame with first column of name \code{"date"} and class \code{"Date"}, optional columns of names \code{"date_end"}, \code{"temp"}, \code{"wind"} and \code{"note"} and other columns of class \code{"numeric"} or \code{"character"} containing concentration values and named by names of the compounds. \code{input="genasis"} is used for the data frame with six columns \code{"valu"}, \code{"comp"}, \code{"date_start"}, \code{"date_end"}, \code{"temp"} and \code{"wind"} where the first could be both \code{"numeric"} or \code{"character"} class, fifth and sixth are of class \code{"numeric"}, second of class \code{"character"} and third and fourth columns could be both \code{"character"} or \code{"Date"} class. The names of columns in  \code{input="genasis"} are not rigid, only their order is assumed. There is also a possibility to specify \code{x} and \code{y} as two vectors of equal lenght, first of class \code{"numeric"} or \code{"character"} containing concentration values, second of class \code{"character"} or \code{"Date"} containing measurement dates.
  
  The \code{output} argument specifies of which type the result will be. Both types of \code{"data.frame"} class \code{output="openair"} and \code{output="genasis"} are available - now without any exceptions with all concentration values of class \code{"numeric"}, the default value is equal to the \code{input} argument, therefore the vector class of output is possible only if \code{x} is \code{"numeric"} or \code{"character"} vector and \code{output} is not specified.
  
  There are five available methods of LoQs treatment. The simpliest method \code{method="exc"} is not recommended because of high bias and meaningless approach. Standard constant methods \code{method="1.0"}, \code{method="2.0"} and \code{method="sq2"} serve for substitution of (concentration) values below LoQ by value of LoQ divided gradually by 1 ,2 and square root of 2. The most recommended is the modified maximum likelihood method \code{method="mle"} which will be described later.
}

\value{
  a list containing: 

  \item{res}{ the data frame (or vector) according to the \code{output} argument settings with substituted (or eventually excluded) (concentration) values below limit of quantification. }
  
  \item{loq}{ numeric value of LoQ}
}

\author{ Jiri Kalina \cr
         \email{kalina@mail.muni.cz}}

\seealso{
\code{\link{genoutlier}, \link{genhistogram}, \link{genpastoact}, \link{genanaggr}, 
      \link{genplot}, \link{genstatistic}, \link{gentransform}, \link{genwhisker}}
}

\examples{
## Definition of simple data sources:
c1<-rlnorm(100,0,1)
c2<-"random compound"
c3<-as.Date(as.Date("2013-01-01"):as.Date("2013-04-10"),
            origin="1970-01-01")
c4<-c3+1

# Cuts the values below the 0.5.
c1[which(c1<0.5)]<-"LoQ"

sample_genasis<-data.frame(c1,c2,c3,c4)
sample_openair<-data.frame(c4,c1)
colnames(sample_openair)=c("date",c2)

## Examples of different usages:
genloq(c1,c3,pollutant=c2,method="sq2")
genloq(sample_openair,method="mle")
}
\keyword{ genloq }
