\name{gendate}
\alias{gendate}
\title{ Compile the date of measurement }
\description{ 
   Function \code{gendate} compiles different types of calendar dates and returns vector of class \code{"Date"}. \code{gendate} recognizes single argument \code{x} as a vector of class \code{"character"}, \code{"Date"}, \code{"POSIXct"} or \code{"POSIXlt"}.
}

\usage{
gendate(x)
}

\arguments{
  \item{x}{ vector of calendar dates of class \code{"character"}, \code{"Date"}, \code{"POSIXct"} or \code{"POSIXlt"}.}
}

\details{
  The \code{gendate} function rounds different types of date to single days. If more precise time point is specified by \code{"POSIXct"} or \code{"POSIXlt"} class, only the information about the day is used. In the case of character input, two formats are recognized: \code{"2013-05-30"} and \code{"30.05.2013"} also in shortened variant \code{"2013-5-30"} and \code{"30.5.2013"}. Only the first 10 characters are used in both cases. If only the month (as \code{"2013-05"} or \code{"5.2013"}) or the year (as \code{"2013"}) is specified by the character string, the date is placed into the 15th day in the case of month or into a 1st July in the case of year.
}

\value{
  \item{res}{ vector of dates of class \code{"Date"}. }
}

\author{ Jiri Kalina \cr
         \email{kalina@mail.muni.cz}}

\examples{
## Single dates:
gendate(Sys.Date())
gendate("10.6.1993")
gendate("1856")

## Date vectors:
gendate(c("2000-05-30","2001","4.4.98","2003-06-01 12:30:45"))
gendate(c(as.POSIXlt("2003-06-01 12:30:45"),"2003-07-02"))
}
\keyword{ gendate }
