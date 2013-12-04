\name{genpastoact}
\alias{genpastoact}
\title{ Recalculates adsorption results from passive air samplers to (active-like) concentrations }
\description{ 
  Function \code{genpastoact} provides two different tools for recalculating POPs concentration results from passive air samplers (in mass per filter units) to concentrations (in mass per air volume) comparable with results from active air samples.
}

\usage{
genpastoact(x, date_start=NA, date_end=NA, input="openair", 
            output=NA, method="auto", days=28, pollutant=NA, 
            temp=NA, wind=NA)
}

\arguments{
  \item{x}{ vector of concentration values or data frame of "genasis"/"openair"" type. See 'Details' for more detailed description of both data types.}
  \item{date_start}{ vector specifying the start of the measurement of class \code{"character"}, \code{"Date"}, \code{"POSIXct"} or \code{"POSIXlt"}, as described in \link{gendate}. Only meaningful for vector input.}
  \item{date_end}{ vector specifying the end of the measurement of class \code{"character"}, \code{"Date"}, \code{"POSIXct"} or \code{"POSIXlt"}, as described in \link{gendate}. Only meaningful for vector input.}
  \item{input}{ type of data.frame in the case of data.frame input. The allowed values are "openair" (default) and "genasis". In case of vector input, this argument is meaningless.}
  \item{output}{ type of output data frame. As in the \code{input} argument, both data frames "openair" and "genasis" are available, with the default value equal to \code{input}.}
  \item{method}{ method used for recalculation. Available values are \code{"const"}, \code{"temp"}, \code{"tempwind"}, \code{"auto"}, \code{"gaps4"} and \code{"gaps7"}. For detailed description see 'Details'.}
  \item{days}{ the length of the measurement period, which will be used, if not specified well by \code{date_start} and \code{date_end} aguments. If \code{date_start} is specified and \code{date_end} is not, the date of end of the measurement is computed and add.} 
  \item{pollutant}{ name of the pollutant to selct specific model constants. See 'Details' for a list of allowed values. It is necessary to specify \code{pollutant} argument in a case of numeric input.}
  \item{temp}{ a numeric vector of average temperatures in Celsius degrees (if known) during the measurement period. Only meaningful in a case of vector input.}
  \item{wind}{ a numeric vector of average wind speeds in meters per second (if known) during the measurement period. Only meaningful in a case of vector input.}
}

\details{
  The \code{genpastoact} function enables to use two different models for recalculating values of POPs concentration (in mass per filter units) from passive air samplers (of Genasis design) to real air concentrations (in mass per air volume units) as obtained from active air samplers. The function recognises three different input formats: Option \code{input="openair"} uses "openair" format of data frame with first column of name 'date' and type \code{"Date"}, optional columns of names \code{"date_end"}, \code{"temp"}, \code{"wind"} and \code{"note"} and other columns of type \code{"numeric"} containing concentration values and named by names of the compounds. \code{input="genasis"} is used for the data frame with six columns \code{"valu"}, \code{"comp"}, \code{"date_start"}, \code{"date_end"}, \code{"temp"} and \code{"wind"} where the first, fifth and sixth are of type \code{"numeric"}, second of type \code{"character"} and third and fourth columns could be both \code{"character"} or \code{"Date"} type. The names of columns in  \code{input="genasis"} are not rigid, only their order is assumed. There is also a possibility to specify \code{x} and \code{y} as two vectors of equal lenght, first of type \code{"numeric"} containing concentration values, second of type \code{"character"} or \code{"Date"} containing measurement dates.
  
  There are six possibilities of model choice. Three similar variants \code{method="const"}, \code{method="temp"} and \code{method="tempwind"} leads to the Genasis model taking into account gradually only the concentration, concentration and temperature and finally concentration, temperature and wind speed. If temperature and/or wind are necessary for the selected model, they need to be specified in appropriate column of data frame or as a \code{temp} and/or \code{wind} arguments in case of the vector input. The option \code{method="auto"} combines above mentioned three approaches, using as many variables, as possible (in such a cases NA represents not-known temperature/wind.)
  
  Remaining two options \code{method="gaps4"} and \code{method="gaps7"} lead to use of Global Air Passive Sampling (GAPS) model with two different effective gas-phase sampling rates (4 for usual and 7 for significantly windy sites). In all cases this model uses temperature (either as \code{temp} argument in the vector input mode, or as column \code{temp} in the data frame input mode) and does not use wind speed for the recalculation.
  
  The argument \code{pollutant} could take any value from the following set: \code{"naphthalene", "acenaphtylene", "acenaphtene", "fluorene", "phenantrene", "anthracene", "fluoranthene", "pyrene", "benzo(a)anthracene", "chrysene", "benzo(b)fluoranthene", "benzo(k)fluoranthene", "benzo(a)pyrene", "indeno(123cd)pyrene", "benzo(ghi)perylene", "PCB 28", "PCB 52", "PCB 101", "PCB 118", "PCB 138", "PCB 153", "PCB 180", "alpha-HCH", "beta-HCH", "gamma-HCH", "pp-DDE", "pp-DDD", "pp-DDT", "PeCB", "HCB"}. For other pollutants no model constant are known and thus the concentration can not be racalculated. 
}

\value{
  \item{res}{ Data frame or vector depending on the \code{output} argument, containing recalculated values of POPs air concentrations (in mass unit per cubic meter). }
}

\author{ Jana Klanova \cr
         Tom Harner \cr
         Jana Boruvkova \cr
         Jiri Kalina \cr
         \email{kalina@mail.muni.cz}}
         
\references{ Harner, T.; Su, K.; Genualdi, S.; Karpowicz, J.; Ahrens, L.; Mihele, C.; Schuster, J.; Charland, J. and Narayan, J., Calibration and application of PUF disk passive air samplers for tracking polycyclic aromatic compounds (PACs). Atmospheric Environment Vol. 75 (2013), pp. 123-128.}
         
\seealso{
\code{\link{genloq}, \link{genoutlier}, \link{genhistogram}, \link{genanaggr}, 
      \link{genplot}, \link{genstatistic}, \link{gentransform}, \link{genwhisker}}
}

\examples{
## Vector input
genpastoact(c(1,2,1.2,1.1,0.1),days=28,pollutant=c("pp-DDE"))

## Use of example data from the package:
data(kosetice.pas.genasis)
genpastoact(kosetice.pas.genasis,input="genasis",
            method="gaps7",pollutant=c("PCB 28"))
data(kosetice.pas.openair)
genpastoact(genoutlier(kosetice.pas.openair[,c(1:4,20)],plot=FALSE)$res,
            method="auto")
}
\keyword{ genpastoact }
