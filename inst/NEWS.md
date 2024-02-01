# neat 1.2.4

-   Released: January 2024
-   This update aims to fix CRAN’s checks note “Package vignette without
    corresponding tangle output: ‘neat.Rmd’”
-   Added package logo to vignette
-   Updated CITATION file (replaced citEntry() with bibentry() as per
    CRAN note)

# neat 1.2.3

-   Released: January 2021
-   Added index to the Vignette and changed the VignetteIndexEntry
-   Updated package URL in DESCRIPTION file
-   Updated article URL in CITATION file

# neat 1.2.2

-   Released: October 2020

Minor updates in the package DESCRIPTION file:

-   Updated mantainer’s email address
-   Updated URLs associated to the package
-   Authorship information updated using <Authors@R> format
-   Added link to ORCID

# neat 1.2.1

-   Released: January 2020
-   The main change introduced from this version is the automatic
    computation of a multiple testing correction within the `neat`
    function. This is done through the specification of an extra
    argument, `mtc.type`, whose default value computes the FDR multiple
    testing correction. An extra column called `adjusted_p` has been
    added to the output of `neat`. The `summary.neat` function now
    returns summaries based on `adjusted_p` (and not any more based on
    `pvalue`)
-   Another technical change introduced concerns the way in which class
    checks are performed within all package functions, so as to get
    ready to the changes that will be introduced from R 4.0.0 (see
    <https://developer.r-project.org/Blog/public/2019/11/09/when-you-think-class.-think-again/index.html>).
