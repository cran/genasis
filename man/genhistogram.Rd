\name{genhistogram}
\alias{genhistogram}
\title{ genhistogram }
\description{ 
  Function \code{genhistogram} creates a histogram of (usually) concentrations with equidistant breaks placed in "good-looking" numbers. If plot=TRUE, the resulting histogram is plotted with several possibilities of graphical options.
}

\usage{
genhistogram(x, breaks=7, input="openair", pollutant=NA, 
             delta=0, plot=TRUE, distr="norm", gap=0.05, 
             columns=2, col="#A52375", emboss=0, xlab="Concentration", 
             ylab="Number of samples", main=NA)
}

\arguments{
  \item{x}{ vector of concentration values or data frame of genasis/openair type. See 'Details' for more detailed description of both data types.}
  \item{breaks}{ a number of breaks between individualhistogram cells.}
  \item{input}{ type of data.frame in the case of data.frame input. The allowed values are "openair" (default) and "genasis". In case of vector input, this argument is meaningless.}
  \item{pollutant}{ name of the pollutant, for which the plot is plotted. Not necessary if only data for one pollutant is available in x. If not specified, plots for all pollutants are drawn in a multi-plot arrangement.}
  \item{delta}{ a delta value before the lowest and after the highest value of x. Positive number or 0.}
  \item{plot}{ logical. Should the result be plotted?}
  \item{distr}{ a name of distribution to interlace. Values "norm" and "lnorm" are possible.}
  \item{gap}{ the size of a gap between columns in a relative width of the column (number between 0 and 1).}
  \item{columns}{ number of columns in the multi-plot arrangement.}
  \item{col}{ a specification for the default plotting color. See section 'Color Specification' in \link{par}.}
  \item{emboss}{ 0,1,2 or 3 for differnet emboss efect of genhistogram columns.}
  \item{xlab}{ a label for the x axis, defaults to \code{"Concentration"}.}
  \item{ylab}{ a label for the x axis, defaults to \code{"Number of samples"}.}
  \item{main}{ overall title for the histogram.}
  }

\details{
  Function \code{genhistogram} creates a histogram, e.g. distribution of given data values into several cells with equidistant breaks placed in "good-looking" numbers. The function considers both the magnitude of the data values and their precision (number of decimals) and choose the breaks to be interpretable well (not to have a lot of decimals).Some empty range is add before the first and behind the last data value in order to smooth the breaks numbers. The minimal size of this range could be determined by the delta parameter.
  
  The function recognises three different input formats: Option \code{input="openair"} uses openair format of data frame with first column of name 'date' and type Date, optional columns of names \code{"date_end"}, \code{"temp"}, \code{"wind"} and \code{"note"} and other columns of class \code{"numeric"}" containing concentration values and named by names of the compounds. \code{input="genasis"} is used for the data frame with six columns \code{"valu"}, \code{"comp"}, \code{"date_start"}, \code{"date_end"}, \code{"temp"} and \code{"wind"} where the first, fifth and sixth are of class \code{"numeric"}", second of type character and third and fourth columns could be both \code{"character"} or \code{"Date"} class. The names of columns in "genasis" type data frame are not rigid, only their order is assumed. There is also a possibility to specify \code{x} as a numeric vector.  
  
  If \code{plot=TRUE}, the resulting histogram is plotted with several graphical possibilities. There are two options for plotting a curve of idealised distribution of concentration values. \code{distr="lnorm"} (default) draws curve of lognormal distribution, while \code{distr="norm"} draws curve of normal distribution defined by central tendency and variance of concentration data.
  
  The argument \code{emboss} allows to induce an impression of plasticity of the histogram colums by two different graphical effects or their combination. \code{emboss=0} implies flat columns without any effect, \code{emboss=1} makes an impression of shading, \code{emboss=2} bevels edges of the columns and \code{emboss=3} combines last two effect into one.
} 

\value{
  a list containing: 

  \item{borders }{numerical vector of column cell borders }
  \item{distr }{numerical vector of counts of values in the individual column cells  }
}

\author{ Jiri Kalina \cr
         \email{kalina@mail.muni.cz}}

\seealso{
\code{\link{genloq}, \link{genoutlier}, \link{genpastoact}, \link{genanaggr}, \link{genplot}, 
      \link{genstatistic}, \link{gentransform}, \link{genwhisker}}
}

\examples{
## Vector input.
genhistogram(rnorm(60))
  
## Use of example data from the package:
data(kosetice.pas.openair)
genhistogram(kosetice.pas.openair[,1:8],col="orange",emboss=3)
data(kosetice.pas.genasis)
genhistogram(kosetice.pas.genasis[1:208,],input="genasis",
             distr="lnorm",col="orange",emboss=2)
}
\keyword{ genhistogram }
