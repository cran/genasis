\name{kosetice.pas.openair}
\alias{kosetice.pas.openair}
\docType{data}
\title{ Data on passive POPs concentration measurements on Kosetice observatory }
\description{ Data on passive POPs concentration measurements on Kosetice observatory in data frame of "openair" type.}
\usage{data(kosetice.pas.openair)}
\format{
  A data frame with 52 rows on the following 34 variables.
  \describe{
    \item{\code{date}}{ initial date of measurement period }
    \item{\code{date_end}}{ final date of measurement period }
    \item{\code{temp}}{ average temperature during the measurement period in Celsius degrees }
    \item{\code{wind}}{ average wind speed during the measurement period in ms-1 } 
    \item{\code{naphthalene}}{ concentration of naphthalene in ngm-3 }
    \item{\code{acenaphtylene}}{ concentration of acenaphtylene in ngm-3 }
    \item{\code{acenaphtene}}{ concentration of acenaphtene in ngm-3 }
    \item{\code{fluorene}}{ concentration of fluorene in ngm-3 }
    \item{\code{phenantrene}}{ concentration of phenantrene in ngm-3 }
    \item{\code{anthracene}}{ concentration of anthracene in ngm-3 }
    \item{\code{fluoranthene}}{ concentration of fluoranthene in ngm-3 }
    \item{\code{pyrene}}{ concentration of pyrene in ngm-3 }
    \item{\code{benzo(a)anthracene}}{ concentration of benzo(a)anthracene in ngm-3 }
    \item{\code{chrysene}}{ concentration of chrysene in ngm-3 }
    \item{\code{benzo(b)fluoranthene}}{ concentration of benzo(b)fluoranthene in ngm-3 }
    \item{\code{benzo(k)fluoranthene}}{ concentration of benzo(k)fluoranthene in ngm-3 }
    \item{\code{benzo(a)pyrene}}{ concentration of benzo(a)pyrene in ngm-3 }
    \item{\code{indeno(123cd)pyrene}}{ concentration of indeno(123cd)pyrene in ngm-3 }
    \item{\code{benzo(ghi)perylene}}{ concentration of benzo(ghi)perylene in ngm-3 }
    \item{\code{PCB 28}}{ concentration of PCB 28 in ngm-3 }
    \item{\code{PCB 52}}{ concentration of PCB 52 in ngm-3 }
    \item{\code{PCB 101}}{ concentration of PCB 101 in ngm-3 }
    \item{\code{PCB 118}}{ concentration of PCB 118 in ngm-3 }
    \item{\code{PCB 138}}{ concentration of PCB 138 in ngm-3 }
    \item{\code{PCB 153}}{ concentration of PCB 153 in ngm-3 }
    \item{\code{PCB 180}}{ concentration of PCB 180 in ngm-3 }
    \item{\code{alpha-HCH}}{ concentration of alpha-HCH in ngm-3 }
    \item{\code{beta-HCH}}{ concentration of beta-HCH in ngm-3 }
    \item{\code{gamma-HCH}}{ concentration of gamma-HCH in ngm-3 }
    \item{\code{pp-DDE}}{ concentration of p,p'-DDE in ngm-3 }
    \item{\code{pp-DDD}}{ concentration of p,p'-DDD in ngm-3 }
    \item{\code{pp-DDT}}{ concentration of p,p'-DDT in ngm-3 }
    \item{\code{PeCB}}{ concentration of PeCB in ngm-3 }
    \item{\code{HCB}}{ concentration of HCB in ngm-3 }
  }
}

\source{ Global ENvironmental ASsessment Information System (GENASIS) (\url{http://www.genasis.cz/data-browser/}) }

\references{ 
Dusek L., Klanova J., Boruvkova J., Hulek R., Jarkovsky J., Kubasek M., Gregor J., Sebkova K., Hrebicek J., Holoubek I., Kalina J. (2010). GENASIS - Global Environmental Assessment and Information System [online].
}

\examples{
data(kosetice.pas.openair)
genstatistic(kosetice.pas.openair)
}

\keyword{datasets}