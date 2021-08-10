# dependency package
usethis::use_package("stats")
usethis::use_package("utils")
usethis::use_package("DESeq2")
usethis::use_package("BiocGenerics")
usethis::use_package("ggplot2")
usethis::use_package("ggpubr")
usethis::use_package("tibble")

usethis::use_mit_license("Yonghe Xia")
usethis::use_readme_md()
usethis::use_code_of_conduct()

usethis::use_vignette("a_example_workflow")

## a website
# Run once to configure your package to use pkgdown
usethis::use_pkgdown()
pkgdown::build_site()

