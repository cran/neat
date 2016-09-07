\name{neat}
\alias{neat}
\alias{pvalue}
\alias{neatc}
\title{Performs neat for lists of gene sets}
\description{Compute NEAT (Signorelli et al., 2016), a test for network enrichment analysis between/from a first list of sets ('A sets') and/to a second list of sets ('B sets').}
\usage{
neat(alist, blist = NULL, network, nettype, nodes, alpha = NULL, 
     anames = NULL, bnames = NULL)
}
\arguments{
  \item{alist}{List of A sets. Each element within the list is a vector of genes and represents a gene set}
  \item{blist}{List of B sets. Each element within the list is a vector of genes and represents a gene set. If \code{nettype == "undirected"}, this argument is optional: if provided, every set of \code{blist} is compared with every set of \code{alist}; if \code{NULL}, the function compares sets in \code{alist} between themselves}
  \item{network}{One of the following objects: an adjacency matrix of class "matrix" (see 'Example 1') or a sparse adjacency matrix of class "dgCMatrix"; an \code{igraph} object (see 'Example 2'); a two-column matrix where every row represents and edge (for directed networks, parent nodes must be in the first column, and child nodes in the second)}
  \item{nettype}{Either \code{'directed'} or \code{'undirected'}}
  \item{nodes}{Vector containing the (ordered) names of all nodes in the network}
  \item{alpha}{Significance level of the test (optional). If specified, a column with the conclusion of the test is added to the output}
  \item{anames}{Vector of names for the elements of \code{alist} (optional: it has to be provided only if the elements of \code{alist} are not named)}
  \item{bnames}{Vector of names for the elements of \code{blist} (optional: it has to be provided only if the elements of \code{blist} are not named)}
}
\value{A data frame with the following columns:
\item{A}{A set}
\item{B}{B set}
\item{nab}{observed number of links from A to B}
\item{expected_nab}{expected number of links from A to B (in absence of enrichment)}
\item{pvalue}{p-value of the test}
\item{conclusion}{conclusion of the test (only if \code{alpha} is specified): no enrichment, overenrichment or underenrichment}
}
\author{Mirko Signorelli}
\seealso{\code{\link{networkmatrix}}, \code{\link{plot.neat}},  \code{\link{print.neat}}, \code{\link{summary.neat}}}
\references{
Signorelli, M., Vinciotti, V., Wit, E. C. (2016). NEAT: an efficient network enrichment analysis test. BMC Bioinformatics, 17:352. Url: https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-016-1203-6.
}
\examples{
# Example 1: network given as adjacency matrix:
A = matrix(0, nrow=7, ncol=7)
A[1,c(2,3)]=1; A[2,c(5,7)]=1;A[3,c(1,4)]=1;A[4,c(2,5,7)]=1;A[6,c(2,5)]=1;A[7,4]=1
labels = letters[1:7]
set1 = c('a','e')
set2 = c('c','g')
set3 = c('d','f')
alist = list('set 1' = set1, 'set 2' = set2)
blist = list('set 3' = set3)

test1 = neat(alist = alist, blist = blist, network=A, 
             nettype='directed', nodes=labels, alpha=0.05)
print(test1)

# Example 2: network given as igraph object:
library(igraph)
network = erdos.renyi.game(15, 1/3)
set1 = 1:4
set2 = c(2,5,13)
set3 = c(3,9,14)
set4 = c(8,15,20)
alist = list('set 1' = set1, 'set 2' = set2)
blist = list('set 3' = set3, 'set 4' = set4)

test2 = neat(alist, blist, network = network, 
             nettype='undirected', nodes=seq(1,15), alpha=NULL)
print(test2)

# Example 3: network given as list of links:
networklist = matrix(nrow=13, ncol=2)
networklist[,1]=c('a','a','b','b','c','d','d','d','f','f','f','h','h')
networklist[,2]=c('d','e','e','g','d','b','e','g','a','b','e','c','g')

labels = letters[1:8]
set1 = c('a','b','e')
set2 = c('c','g')
set3 = c('d','f')
set4 = c('a','b','f')
alist = list('set 1' = set1, 'set 2' = set2)
blist = list('set 3' = set3, 'set4' = set4)

test3 = neat(alist, blist, network = networklist, 
             nettype = 'undirected', nodes=labels, alpha=0.05)
print(test3)

alist = list('set 1' = set1, 'set 2' = set2, 'set 3' = set3)
test4 = neat(alist, network = networklist, 
             nettype = 'undirected', nodes=labels, alpha=0.05)
print(test4)

# Example 4: ESR data
\dontrun{
data(yeast)
esr = list('ESR 1' = yeast$esr1, 'ESR 2' = yeast$esr2)
test = neat(alist = esr, blist = yeast$goslimproc, network = yeast$yeastnet,
            nettype = 'undirected', nodes = yeast$ynetgenes, alpha = 0.01)
# Replace with "blist = yeast$kegg" to use kegg pathways

m = dim(test)[1]
test1 = test[1:(m/2),]
table(test1$conclusion)
plot(test1)
o1=test1[test1$conclusion=='Overenrichment',]
print(o1, nrows='ALL') #display overenrichments

test2 = test[(m/2+1):m,]
table(test2$conclusion)
plot(test2)
o2=test2[test2$conclusion=='Overenrichment',]
print(o2, nrows='ALL') #display overenrichments
}}
\keyword{htest}
