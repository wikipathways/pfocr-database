#!/usr/bin/env Rscript

library(yaml)

# Specify the directory containing the YAML files
directory <- "../_figures"

# Get a list of all YAML files in the directory
files <- list.files(directory, pattern = "*.md", full.names = TRUE)

# Process each file
for (file in files) {
  # Read the YAML data
  data <- yaml.load_file(file)

  # Check if 'organisms' key exists and is a list
  if ("organisms" %in% names(data) && is.list(data$organisms)) {
    # Replace 'plant' with 'unspecified plant'
    data$organisms <- lapply(data$organisms, function(x) ifelse(x == "plant", "unspecified plant", x))
  }

  # Write the data back to the file
  con <- file(file, "w")
  on.exit(close(con))
  yaml::write_yaml(data, con)
}
