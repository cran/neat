\name{yeast}
\alias{yeast}
\docType{data}
\title{
List collecting various yeast data (see 'description')
}
\description{
\code{yeast} is a list that contains:

\code{yeastnet}: network matrix representing Yeastnet-v3 (Kim et al., 2013)

\code{ynetgenes}: vector with the names of the genes appearing in \code{yeastnet}

\code{esr1}: vector containing the first of the two gene sets that constitute the "Environmental Stress Response" (ESR) reported by Gasch et al. (2012)

\code{esr2}: vector containing the second gene set of the ESR

\code{goslimproc}: list containing the gene sets of the GOslim process ontology (Ashburner et al., 2000) for the buddying yeast Saccaromyces Cerevisiae (groups 'biological process' and 'other' are not included)

\code{kegg}: list containing the KEGG pathways (Kanehisa and Goto, 2002) for the buddying yeast Saccaromyces Cerevisiae
}
\format{
\code{yeast}: list
}
\source{
Ashburner, M., Ball, C. A., Blake, J. A., Botstein, D., Butler, H., Cherry, J. M., Davis, A. P., Dolinski, K., Dwight, S. S., Eppig, J. T., et al. (2000). Gene ontology: tool for the unification of biology. Nat. Genet., 25(1), 25-29.

Gasch, A. P., Spellman, P. T., Kao, C. M., Carmel-Harel, O., Eisen, M. B., Storz, G., Botstein, D., and Brown, P. O. (2000). Genomic expression programs in the response of yeast cells to environmental changes. Mol. Biol. Cell, 11(12), 4241-4257.

Kanehisa, M., and Goto, S. (2002). KEGG: Kyoto Encyclopedia of Genes and Genomes. Nucleic Acids Res., 28(1), 27-30.

Kim, H., Shin, J., Kim, E., Kim, H., Hwang, S., Shim, J. E., and Lee, I. (2013). Yeastnet v3: a public database of data-specific and integrated functional gene networks for saccharomyces cerevisiae. Nucleic Acids Res., 42 (D1), D731-6.

Signorelli, M., Vinciotti, V., Wit, E. C. (2016). NEAT: an efficient network enrichment analysis test. BMC Bioinformatics, 17:352. Url: https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-016-1203-6.
}
\references{

Ashburner, M., Ball, C. A., Blake, J. A., Botstein, D., Butler, H., Cherry, J. M., Davis, A. P., Dolinski, K., Dwight, S. S., Eppig, J. T., et al. (2000). Gene ontology: tool for the unification of biology. Nat. Genet., 25(1), 25-29.

Gasch, A. P., Spellman, P. T., Kao, C. M., Carmel-Harel, O., Eisen, M. B., Storz, G., Botstein, D., and Brown, P. O. (2000). Genomic expression programs in the response of yeast cells to environmental changes. Mol. Biol. Cell, 11(12), 4241-4257.

Kanehisa, M., and Goto, S. (2002). KEGG: Kyoto Encyclopedia of Genes and Genomes. Nucleic Acids Res., 28(1), 27-30.

Kim, H., Shin, J., Kim, E., Kim, H., Hwang, S., Shim, J. E., and Lee, I. (2013). Yeastnet v3: a public database of data-specific and integrated functional gene networks for saccharomyces cerevisiae. Nucleic Acids Res., 42 (D1), D731-6.

Signorelli, M., Vinciotti, V., Wit, E. C. (2016). NEAT: an efficient network enrichment analysis test. BMC Bioinformatics, 17:352. Url: https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-016-1203-6.
}
\examples{
\dontrun{
data(yeast)
esr = list('ESR 1' = yeast$esr1, 'ESR 2' = yeast$esr2)
test = neat(alist = esr, blist = yeast$goslimproc, network = yeast$yeastnet,
            nettype = 'undirected', nodes = yeast$ynetgenes, alpha = 0.01)
# Replace with "blist = yeast$kegg" to use kegg pathways

m = dim(test)[1]
test1 = test[1:(m/2),]
o1=test1[test1$conclusion=='Overenrichment',]
# list of overenrichments for the first ESR set:
print(o1, nrows='ALL') 

test2 = test[(m/2+1):m,]
o2=test2[test2$conclusion=='Overenrichment',]
# list of overenrichments for the second ESR set:
print(o2, nrows='ALL')

# the same can be done using KEGG pathways:
keggtest = neat(alist = esr, blist = yeast$kegg, network = yeast$yeastnet,
            nettype = 'undirected', nodes = yeast$ynetgenes, alpha = 0.01)
}}
\seealso{\code{\link{neat}}}
\keyword{datasets}
