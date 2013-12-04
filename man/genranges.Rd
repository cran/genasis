\name{genranges}
\alias{genranges}
\title{ Determines "smooth" range of input data }
\description{ 
  Function \code{genranges} determines suitable lower and upper borders of numeric range covering all values of input vector. Both borders are chosen sutable rounded not to have a lot of decimals.
}

\usage{
genranges(x, delta=0)
}

\arguments{
  \item{x}{ numerical vector.}
  \item{delta}{ a fraction of the range befor the first and after the last value.}
 }

\details{
  The \code{genranges} function determines two numbers for lower and upper border of a range, covering all the values of input vector. Both the numbers are chosen taking into account the magnitude and the accuracy of input values, such that the result is rounded by adding some space before the first and after the last value. A minimal size of this space could be defined by the argument \code{delta}. 
}

\value{
  \item{\code{range}}{ numerical vector of length 2: first element is the lower and second element the upper border of the range. 
  }
}

\author{ Jiri Kalina \email{kalina@mail.muni.cz}}

\examples{
## Input as a pair of vectors.
genranges(c(0.9,NA,18.335,8,NaN,-6.4))
}
\keyword{ genranges }
