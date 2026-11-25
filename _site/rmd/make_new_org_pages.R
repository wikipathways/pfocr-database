# Create new org md pages

install.packages(c("rmarkdown", "yaml", "jsonlite"))
library(rmarkdown)
library(yaml)
library(jsonlite)

json_data <- fromJSON("https://pfocr.wikipathways.org/json/listOrganisms.json")
organism_list <- json_data$organisms

for (organism in organism_list) {
  print(organism)
  row <- taxdata[taxdata$taxname == organism, ]
  if (nrow(row) > 0) {
    filename <- gsub("\\.", "", row$taxname)
    filename <- gsub(" ", "_", filename)
    filename <- tolower(filename)
    filename <- file.path("_organisms",paste0(filename, ".md"))
    
    yaml_data <- list(
      common = row$taxname,
      latin = row$taxname,
      ncbi = row$taxid,
      title = row$taxname,
      group = row$group,
      image = row$url
    )
    
    yaml_content <- as.yaml(yaml_data)
    
    con <- file(filename, "w")
    write("---", con)
    write(yaml_content, con)
    write("---", con)
    close(con)
  }
}
