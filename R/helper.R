#' Run R code in temporary working directory.
#'
#' Sometimes one might want to run R code with a temporary working directory in
#' effect.  This function will do that
#'
#' @param dir Scalar string giving the desired temporary working directory.
#' @param expr Expression to run with the temporary working directory in effect.
#'
#' @return Invisible NULL
#' @importFrom checkmate assertDirectoryExists
#'
#' @examples
#' with_dir(tempdir(), cat("Hello world!", file=tempfile(fileext=".txt")))
with_dir = function(dir, expr){
  assertDirectoryExists(dir)
  old_wd = getwd()
  on.exit(setwd(old_wd))
  setwd(dir)
  evalq(expr)
  return(invisible())
}
