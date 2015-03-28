\name{datasimr-package}
\alias{datasimr-package}
\alias{datasimr}
\docType{package}
\title{
A package for simulating random data from a given data frame
}
\description{
Takes a data frame and generates fake data that has the same variables with similar type, but all random.

Useful for debugging secure code.

No guanrantee or warrenty of any kind on the safety / security / privacy features of this code.
}
\details{
\tabular{ll}{
Package: \tab datasimr\cr
Type: \tab Package\cr
Version: \tab 0.3\cr
Date: \tab 2015-03-27\cr
License: \tab MIT\cr
}
\code{simulateData} takes a data frame and returns a function that will generate n observations from a fake data set. 
}
\author{
John Eric Humphries

Maintainer: johneric@uchicago.edu
}
\references{

}
~~ Optionally other standard keywords, one per line, from file KEYWORDS in the R documentation directory ~~
\keyword{ package }
\seealso{
~~ Optional links to other man pages, e.g. ~~
~~ \code{\link[<pkg>:<pkg>-package]{<pkg>}} ~~
}
\examples{
#make: the function genData for the iris data set
genData <- simulateData(iris)
#genereate a data.frame with 100 draws from the fake data
genData(100) 
}
