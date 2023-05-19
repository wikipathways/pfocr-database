#!/usr/bin/env Rscript

library(yaml)

# Custom yaml writing function
write_yaml_custom <- function(data, con) {
  cat("---\n", file = con)
  for (i in 1:length(data)) {
    if (names(data[i]) == "organisms") {
      cat("organisms:\n", file = con, append = TRUE)
      for (o in data[i]){
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
  
  # Check if 'organisms' key exists
  if ("organisms" %in% names(data)) {
    # If 'organisms' is a list, preserve the list structure
    if (is.list(data$organisms)) {
      data$organisms <- lapply(data$organisms, function(x) ifelse(x == "plant", "unspecified plant", x))
    } else if (data$organisms == "plant") {
      data$organisms <- "unspecified plant"
    }
  }

  # Write the data back to the file
  con <- file(f, "w")
  on.exit(close(con))
  write_yaml_custom(data, con)
}
