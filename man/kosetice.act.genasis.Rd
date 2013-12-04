\name{kosetice.act.genasis}
\alias{kosetice.act.genasis}
\docType{data}
\title{ Data on active POPs concentration measurements on Kosetice observatory }
\description{ Data on active POPs concentration measurements on Kosetice observatory in data frame of "genasis" type.}
\usage{data(kosetice.act.genasis)}
\format{
  A data frame with 6270 observations on the following 6 variables.
  \describe{
    \item{\code{valu}}{ concentration of individual POP in ngm-3 }
    \item{\code{comp}}{ name of the pollutant }
    \item{\code{date_start}}{ initial date of measurement period }
    \item{\code{date_end}}{ final date of mesurement period } 
    \item{\code{temp}}{ average temperature during the measurement period in Celsius degrees }
    \item{\code{wind}}{ average wind speed during the measurement period in ms-1 } 
  }
}

\source{ Global ENvironmental ASsessment Information System (GENASIS) (\url{http://www.genasis.cz/data-browser/}) }

\references{ 
Dusek L., Klanova J., Boruvkova J., Hulek R., Jarkovsky J., Kubasek M., Gregor J., Sebkova K., Hrebicek J., Holoubek I., Kalina J. (2010). GENASIS - Global Environmental Assessment and Information System [online].
}

\examples{
data(kosetice.act.genasis)
genstatistic(kosetice.act.genasis,input="genasis",pollutant="benzo(a)pyrene")
}

\keyword{datasets}