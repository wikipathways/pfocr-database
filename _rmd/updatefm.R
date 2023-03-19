#' @title Update Frontmatter
#'
#' @description This function updates specified fields in the frontmatter of 
#' pathway figure .md files based on updates to a TSV mapping file. The 
#' function can be sourced as part of GitHub Actions in order to perform .md 
#' file updates.
#' @param field Name of the key to add or edit in each PFOCR .md file
#' @param file Name of TSV file in _data folder. Format requirements:
#'             * No headers
#'             * First column must be PFOCR IDs (figids excluding extension)
#'             * Second column should be the value to write
#' @details Only two-column TSV files are accepted. For list attributes, JSON
#' files should be read by an alternative function (TBD).  
#' @return None
#' @importFrom yaml write_yaml read_yaml
#' @export 
#'
#' @examples
#'   updateFrontmatter("ndex", "ndex_map")
#'   updateFrontmatter("wpid", "wpid_map")
#'   
updateFrontmatter <- function(field=NULL, file=NULL){
  if(is.null(field))
    stop("`field` parameter is missing!")
  if(is.null(file))
    stop("`file` parameter is missing!")
  
  if(!grepl('*\\.tsv$', file))
    file = paste(file, "tsv", sep = ".")
  
  path = file.path("_data", file)
  if(!file.exists(path))
    stop(sprintf("TSV file %s not found!", path))
  
  # read file
  map.df = read.table(path, sep = "\t", stringsAsFactors = F)
  
  # update md
  for(i in seq_along(map.df[,1])){
    ffp = file.path("_figures",paste(map.df[i,1],"md", sep = "."))
    if(!file.exists(ffp)){
      warning(sprintf("MD file %s not found", ffp))
      next
    }
    # read
    con = file(ffp, "r")
    md = yaml::read_yaml(con)
    close.connection(con)
    # write
    newval = map.df[i,2]
    oldval = unname(unlist(md[field]))
    if(!is.null(oldval))
      if (oldval==newval)
        next
    cat(sprintf("`%s` field updated in %s\n", field, ffp))
    con = file(ffp, "w")
    write("---", con)
    md[field] = map.df[i,2]
    yaml::write_yaml(md,con)
    write("---", con)
    close.connection(con)
  }
}

#' @title Update Frontmatter from RDS
#'
#' @description Prepares a temporary TSV and args for updateFrontmatter()
#' given an RDS and specified column(s). Automatically executes
#' updateFrontmatter() and then deletes temporary TSV.
#' @param columns List of column names to read from
#' @param file Name of RDS file in rds folder. Format requirements:
#'             * Column named "figid"
#'             * Columns matching "columns" parameter
#' Default is "pfocr_figures.rds"
#' @return None
#' @importFrom 
#' @export 
#'
#' @examples
#'   updateFrontmatterRDS("number")
#'   updateFrontmatter(c("figtitle","caption"), "pfocr_figures.rds")
#'   
updateFrontmatterRDS <- function(columns=NULL, file="pfocr_figures.rds"){
  if(is.null(columns))
    stop("`columns` parameter is missing!")
  
  figs<-readRDS(file.path("rds",file))

  for (colm in columns){
    figs_sub<-figs[, c("figid",colm)]
    write.table(figs_sub, "_data/temp.tsv",sep = "\t",row.names = F, col.names = F)
    updateFrontmatter(colm,"temp.tsv")
    file.remove("_data/temp.tsv")
  }
}


