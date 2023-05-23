#!/bin/zsh

# Parsing JSON and extracting 'organisms' fields
jq -r '.figureInfo[].organisms' ../_site/json/getFigureInfo.json | \
# Splitting fields by comma
tr ',' '\n' | \
# Removing leading and trailing whitespaces
awk '{$1=$1};1' | \
# Sorting and removing duplicates
sort | uniq > unique_org_list.txt
