#' @title Extract information from edited MD files
#'
#' @description Scans all MD files in _figures for provided search term and
#' returns list of matching figids. Could be used to identify figids for 
#' removal, e.g., when edited with XXX, or edited titles to store.
#' @param fields List of fields to search
#' @param search String to search for in fields
#' @return List of figids
#' @importFrom  yaml read_yaml
#' @export 
#'
#' @examples
#'   findFiguresByText("figtitle","XXX")
#'   findFiguresByText("organisms","Xenopus")
#'   findFiguresByText(c("caption","figtitle"), "Alzheimer")
#'   
findFiguresByText <- function(fields=NULL, search=NULL){
    if (is.null(fields))
        stop("Must provide one or more fields")
    if (is.null(search))
        stop("Must provide a search string")
    
    md.files <- list.files("../_figures/", ".md", full.names = T)
    
    figids <- c()
    
    for (mdf in md.files) {
        data <- yaml::yaml.load_file(mdf)
        for (f in fields){
            if (!f %in% names(data))
                stop(sprintf("%s not in md file", f))
            if (any(grepl(search, data[[f]])))
                figids <- c(figids, data$figid)
        }
    }
    
    return (unique(figids))
}