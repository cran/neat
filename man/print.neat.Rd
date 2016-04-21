\name{print.neat}
\alias{print.neat}
\title{
Print method of \code{neat}
}
\description{
\code{print} method for class "\code{neat}".
}
\usage{
\method{print}{neat}(x, nrows=10, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{An object of class "\code{neat}"}
  \item{nrows}{Maximum number of results to print (default is 10). It can be either an integer number or "ALL"}
  \item{\dots}{Further arguments passed to or from other methods}
}
\value{A dataframe showing the first \code{nrows} tests contained in a \code{neat} object.}
\author{Mirko Signorelli}
\seealso{\code{\link{neat}}, \code{\link{plot.neat}}, \code{\link{summary.neat}}}
\examples{
A = matrix(0, nrow=7, ncol=7)
A[1,c(2,3)]=1; A[2,c(5,7)]=1;A[3,c(1,4)]=1;A[4,c(2,5,7)]=1;A[6,c(2,5)]=1;A[7,4]=1

labels = letters[1:7]
set1 = c('a','e')
set2 = c('c','g')
set3 = c('d','f')
alist = list('set 1' = set1, 'set 2' = set2)
blist = list('set 3' = set3)

test = neat(alist, blist, network=A, nettype='directed', nodes=labels, alpha=0.05)
print(test)

}
\keyword{methods}
