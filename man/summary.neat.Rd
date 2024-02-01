\name{summary.neat}
\alias{summary.neat}
\title{
Summary method of \code{neat}
}
\description{
\code{summary} method for class "\code{neat}".
}
\usage{
\method{summary}{neat}(object, ...)
}
\arguments{
  \item{object}{An object of class "\code{neat}"}
  \item{\dots}{Further arguments passed to or from other methods}
}
\value{
The \code{summary.neat} function returns the following values:
\itemize{
\item the number of tests computed;
\item the number of enrichments at 1\% and 5\% level;
\item the p-value of the Kolmogorov-Smirnov test to check if the distribution of p-values is uniform.
}
}
\author{Mirko Signorelli}
\seealso{
\code{\link{neat}}, \code{\link{plot.neat}}, \code{\link{summary.neat}}
}
\references{
Signorelli, M., Vinciotti, V., Wit, E. C. (2016). NEAT: an efficient network enrichment analysis test. BMC Bioinformatics, 17:352. Url: https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-016-1203-6.
}
\examples{
\dontrun{
data(yeast)
esr = list('ESR 1' = yeast$esr1, 'ESR 2' = yeast$esr2)
test = neat(alist = esr, blist = yeast$goslimproc, network = yeast$yeastnet,
            nettype = 'undirected', nodes = yeast$ynetgenes, alpha = 0.01)

test1 = test[1:99,]
summary(test1)

test2 = test[100:198,]
summary(test2)
}}
\keyword{methods}
