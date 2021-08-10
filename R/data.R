#' Example data of Batch DESeq.
#'
#' A fake dataset containing 12 samples and 1000 Genes of Batch DESeq.
#' @format A gene rownamed data frame with 1000 rows and 12 variables:
#' \describe{
#' \item{A_1_1_1}{samples}
#' \item{A_2_2_2}{samples}
#' \item{A_3_3_3}{samples}
#' \item{B_4_4_4}{samples}
#' \item{B_5_5_5}{samples}
#' \item{B_6_6_6}{samples}
#' \item{C_7_7_7}{samples}
#' \item{C_8_8_8}{samples}
#' \item{C_9_9_9}{samples}
#' \item{D_10_10_10}{samples}
#' \item{D_11_11_11}{samples}
#' \item{D_12_12_12}{samples}
#' ...
#' }
#' @family Batch DESeq
"exp_data"

#' Example data of Batch DESeq.
#'
#' A fake group info of samples of Batch DESeq.
#' @format A character vector of 12 variables:
#' \describe{
#' \item{A}{group}
#' \item{B}{group}
#' \item{C}{group}
#' ...
#' }
#' @family Batch DESeq
"group"

#' Example data of col_to_rownames
#'
#' A Expression matrix with repeated gene names and expression value.
#'
#' @format A data frame with 10 rows and 5 variables:
#' \describe{
#'   \item{genes}{repeated gene names}
#'   \item{sample1}{samples expression value}
#'   \item{sample2}{samples expression value}
#'   \item{sample3}{samples expression value}
#'   \item{sample4}{samples expression value}
#'   ...
#' }
"dup_data"

#' Example data of box_violin_plot.
#'
#' A fake group info of samples of box_violin_plot.
#' @format A character vector of 21 variables:
#' \describe{
#' \item{Control}{group}
#' \item{AB}{group}
#' \item{AA}{group}
#' ...
#' }
#' @family box_violin_plot
"group2"

#' Example data of box_violin_plot.
#'
#' A fake dataset containing metadata.
#' @format A gene rownamed data frame with 69 rows and 21 variables:
#' \describe{
#' \item{Control1}{number}
#' \item{Control2}{number}
#' \item{Control3}{number}
#' ...
#' }
#' @family box_violin_plot
"Pathway"

#' Example data of getgene.
#'
#' A fake dataset.
#' @format A data frame with 91 rows and 8 variables:
#' \describe{
#' \item{ES}{number}
#' \item{NES}{number}
#' \item{leadingEdge}{list}
#' \item{nMoreExtreme}{character}
#' \item{padj}{number}
#' \item{pathway}{character}
#' \item{pval}{number}
#' \item{size}{integer}
#' ...
#' }
"sea_data"
