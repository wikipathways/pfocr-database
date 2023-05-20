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
for (f in files) {
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
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "V. splendidusUpon", "Vibrio splendidus", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "E. coli", "Escherichia coli", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "Y. lipolytica", "Yarrowia lipolytica", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "T. forsythia", "Tannerella forsythia", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "R. marinus", "Rhodothermus marinus", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "P. aeruginosa", "Pseudomonas aeruginosa", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "P. putida", "Pseudomonas putida", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "P. notoginseng", "Panax notoginseng", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "P. kudriavzevii", "Pichia kudriavzevii", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "L. infantum", "Leishmania infantum", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "L. in", "unassigned", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "L. var", "unassigned", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "Oryza sativa L.", "Oryza sativa", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "C. sakazakii", "Cronobacter sakazakii", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "C. zofingiensis", "Chromochloris zofingiensis", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "C. crispusPWY", "Chondrus crispus", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "C. crispusEarly", "Chondrus crispus", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "A. heterophyllum", "Aconitum heterophyllum", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "Drosophila", "Drosophila melanogaster", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "Hydra", "Hydra vulgaris", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "Virus", "unspecified virus", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "L. Hybrids", "Ranunculus asiaticus", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "L. Leaf", "Gossypium arboreum", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "K. pneumoniae", "Klebsiella pneumoniae", x)))
      data$organisms <- unlist(lapply(data$organisms, function(x) ifelse(x == "Danio", "Danio rerio", x)))
    } else if (data$organisms == "V. splendidusUpon") {
      data$organisms <- "Vibrio splendidus"
    }  else if (data$organisms == "E. coli") {
      data$organisms <- "Escherichia coli"
    }  else if (data$organisms == "Y. lipolytica") {
      data$organisms <- "Yarrowia lipolytica"
    }  else if (data$organisms == "T. forsythia") {
      data$organisms <- "Tannerella forsythia"
    }  else if (data$organisms == "R. marinus") {
      data$organisms <- "Rhodothermus marinus"
    }  else if (data$organisms == "P. aeruginosa") {
      data$organisms <- "Pseudomonas aeruginosa"
    }   else if (data$organisms == "P. putida") {
      data$organisms <- "Pseudomonas putida"
    }   else if (data$organisms == "P. notoginseng") {
      data$organisms <- "Panax notoginseng"
    }   else if (data$organisms == "P. kudriavzevii") {
      data$organisms <- "Pichia kudriavzevii"
    }   else if (data$organisms == "Oryza sativa L.") {
      data$organisms <- "Oryza sativa"
    }   else if (data$organisms == "K. pneumoniae") {
      data$organisms <- "Klebsiella pneumoniae"
    } else if (data$organisms == "Danio") {
      data$organisms <- "Danio rerio"
    } else if (data$organisms == "C. sakazakii") {
      data$organisms <- "Cronobacter sakazakii"
    } else if (data$organisms == "C. zofingiensis") {
      data$organisms <- "Chromochloris zofingiensis"
    } else if (data$organisms == "C. crispusPWY") {
      data$organisms <- "Chondrus crispus"
    } else if (data$organisms == "C. crispusEarly") {
      data$organisms <- "Chondrus crispus"
    } else if (data$organisms == "A. heterophyllum") {
      data$organisms <- "Aconitum heterophyllum"
    } else if (data$organisms == "Drosophila") {
      data$organisms <- "Drosophila melanogaster"
    } else if (data$organisms == "Hydra") {
      data$organisms <- "Hydra vulgaris"
    } else if (data$organisms == "Virus") {
      data$organisms <- "unspecified virus"
    } else if (data$organisms == "L. Hybrids") {
      data$organisms <- "Ranunculus asiaticus"
    } else if (data$organisms == "L. Leaf") {
      data$organisms <- "Gossypium arboreum"
    } else if (data$organisms == "L. infantum") {
      data$organisms <- "Leishmania infantum"
    } else if (data$organisms == "L. in") {
      data$organisms <- "unassigned"
    } else if (data$organisms == "L. var") {
      data$organisms <- "unassigned"
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
