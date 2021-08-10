#' Note Data.
#'
#' add note messages to Rdata produced by `save()`.
#'
#' @param remark add a message to it
#' @return a Rdata with note message
#' @name note_data
#' @examples
#' a <- c("a","b")
#' file = paste0(tempdir(),"test.Rdata")
#' mysave(a,remark = "This is test message",file = file)
#' myload(file)
NULL

#> NULL
#' @inheritParams base::save
#' @rdname note_data
#'
#' @export
#'
#' @seealso See \code{\link[base]{save}}
#'    function from package (base)
mysave <- function(..., remark = "NULL") {
  save(..., remark)
}

#' @inheritParams base::load
#' @rdname note_data
#'
#' @export
#'
#' @seealso See \code{\link[base]{load}}
#'    function from package (base)
myload <- function(...) {
  load(..., envir = .GlobalEnv)
  message(remark)
}
