\name{plot.neat}
\alias{plot.neat}
\title{
Plot method of \code{neat}
}
\description{
\code{plot} method for class "\code{neat}".
}
\usage{
\method{plot}{neat}(x, nbreaks = 10, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{An object of class "\code{neat}"}
  \item{nbreaks}{Number of breaks to be used in the histogram (default is 10)}
  \item{\dots}{Further arguments passed to or from other methods}
}
\value{
An histogram showing the distribution of p-values and a p-p plot comparing the distribution of p-values to the uniform distribution.}
\author{Mirko Signorelli}
\seealso{\code{\link{neat}}, \code{\link{print.neat}}, \code{\link{summary.neat}}}
\references{
Signorelli, M., Vinciotti, V., Wit, E. C. (2016). NEAT: an efficient network enrichment analysis test. ArXiv preprint, arXiv:1604.01210. Url: https://arxiv.org/abs/1604.01210.
}
\examples{
\dontrun{
data(yeast)
esr2 = list('ESR 2' = yeast$esr2)

test = neat(alist = esr2, blist = yeast$goslimproc, network = yeast$yeastnet, 
            nettype='undirected', nodes = yeast$ynetgenes, alpha = 0.01)

plot(test)
}}
\keyword{methods}