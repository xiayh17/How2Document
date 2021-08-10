#' Get Gene
#'
#' extract the column in the list format of the data frame
#' @param data a data frame contains column of genes in list form
#' @param col column of genes list
#'
#' @return a character list contains all genes
#' @export
#'
#' @examples
#' getgene(data = sea_data, col = "leadingEdge")
getgene <- function(data,col){
  genes_col <- data[col]
  genes <- unlist(genes_col, use.names = FALSE)
  return(genes)
}
