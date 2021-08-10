#' col_to_rownames
#'
#' useful when expression matrix need to be rownamed by genes name,
#' duplicate gene names are automatically removed.
#' @param data expression matrix with a column of gene name
#' @param rownames colname of gene name
#' @param filter if TRUE, duplicate genes will removed by order of expression value, when FALSE will add suffixes to retain duplicate names
#'
#' @return a rownamed expression matrix
#' @export
#' @importFrom tibble column_to_rownames
#' @importFrom stats median
#' @examples
#' col_to_rownames(dup_data,"genes")
col_to_rownames <- function(data,rownames,filter = TRUE) {
  if (anyDuplicated(data[,rownames]) == 0) {
    data <- tibble::column_to_rownames(data,rownames)
  } else if (anyDuplicated(data[,rownames]) != 0 && filter == TRUE) {
    data$median=apply(data,1,median)
    data <- data[order(data[,rownames],data$median,decreasing = T),]
    data <- data[!duplicated(data[,rownames]),][,-ncol(data)]
  } else {
    data[,rownames] <- make.unique(data[,rownames])
    data <- tibble::column_to_rownames(data,rownames)
  }
  return(data)
}
