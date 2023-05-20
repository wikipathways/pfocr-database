#!/usr/bin/env Rscript

library(yaml)

# Custom yaml writing function
write_yaml_custom <- function(data, con) {
  cat("---\n", file = con)
  for (i in 1:length(data)) {
    if (names(data[i]) == "organisms") {
      cat("organisms:\n", file = con, append = TRUE)
      for (o in data$organisms) {
        cat("- ",o, "\n", sep = "", file = con, append = TRUE)
      }
    } else {
      yaml::write_yaml(data[i], con)
    }
  }
  cat("---\n", file = con, append = TRUE)
}

# Specify the directory containing the YAML files
directory <- "../_figures"

# Get a list of all YAML files in the directory
files <- list.files(directory, pattern = "*.md", full.names = TRUE)

# Process each file
for (f in files[46689]) {
  # Read the YAML data
  data <- yaml.load_file(f)
  print(data$figid_alias)
  print(which(files == f))
  
  # Check if 'organisms' key exists
  if ("organisms" %in% names(data)) {
    # Fix comma-separated lists
    if (length(data$organisms) == 1) {
      data$organisms <- strsplit(data$organisms, ", ")[[1]]
    }
    
    # If 'organisms' is a list, preserve the list structure
    if (length(data$organisms) > 1) {
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "Plants", "unspecified plant", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "Plant", "unspecified plant", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "E. coli", "Escherichia coli", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "B. subtilis", "Bacillus subtilis", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "Barley", "Hordeum vulgare", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "C. elegans", "Caenorhabditis elegans", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "D. melanogaster", "Drosophila melanogaster", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "Hordeum vulgare L.", "Hordeum vulgare", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "Microbes", "unspecified bacteria", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "NA", "unassigned", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "Sugarcane", "Saccharum officinarum", x)))
    } else if (data$organisms == "Plants") {
      data$organisms <- "unspecified plant"
    } else if (data$organisms == "Plant") {
      data$organisms <- "unspecified plant"
    } else if (data$organisms == "E. coli") {
      data$organisms <- "Escherichia coli"
    } else if (data$organisms == "B. subtilis") {
      data$organisms <- "Bacillus subtilis"
    } else if (data$organisms == "Barley") {
      data$organisms <- "Hordeum vulgare"
    } else if (data$organisms == "C. elegans") {
      data$organisms <- "Caenorhabditis elegans"
    } else if (data$organisms == "D. melanogaster") {
      data$organisms <- "Drosophila melanogaster"
    } else if (data$organisms == "Hordeum vulgare L.") {
      data$organisms <- "Hordeum vulgare"
    } else if (data$organisms == "Microbes") {
      data$organisms <- "unspecified bacteria"
    } else if (data$organisms == "NA") {
      data$organisms <- "unassigned"
    }  else if (data$organisms == "") {
      data$organisms <- "unassigned"
    } else if (data$organisms == "Sugarcane") {
      data$organisms <- "Saccharum officinarum"
    }
  }

  # Write the data back to the file
  con <- file(f, "w")
  on.exit(close(con))
  write_yaml_custom(data, con)
}
