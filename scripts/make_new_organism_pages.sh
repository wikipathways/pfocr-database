#!/bin/zsh

          orgList=() 
          for file in ../_organisms/*; do
            basename_no_ext=$(basename "$file" .${file##*.})
            orgList+=("$basename_no_ext")
          done
          echo ${#orgList[@]}
          figInfo="https://pfocr.wikipathways.org/json/getFigureInfo.json"
          #IFS=$'\n' latinOrgs=($(jq -r '.figureInfo[].organisms' ../_site/json/getFigureInfo.json | \
          IFS=$'\n' latinOrgs=($(curl -s $figInfo | jq -r '.figureInfo[].organisms' | \
            tr ',' '\n' | \
            awk '{$1=$1};1' | \
            sort | uniq))
          checkOrgs=()
          for org in "${latinOrgs[@]}"; do
            org_modified=$(echo "$org" | tr -d '.' | sed 's/ /_/g' | tr '[:upper:]' '[:lower:]')
            checkOrgs+=("$org_modified")
          done
          declare -A orgs_hash
          for (( i=0; i<${#latinOrgs[@]}; i++ )); do
            key="${checkOrgs[i]}"
            value="${latinOrgs[i]}"
            orgs_hash[$key]=$value
          done
          echo ${#checkOrgs[@]}
          for key latin in ${(kv)orgs_hash}; do
            if [[ ! " ${orgList[*]} " =~ " ${key} " ]]; then
              echo "Adding $latin"
              echo "---" > "../_organisms/${key}.md"
              echo "common: $latin" >> "../_organisms/${key}.md"
              echo "latin: $latin" >> "../_organisms/${key}.md"
              echo "ncbi: " >> "../_organisms/${key}.md"
              echo "title: $latin pathways" >> "../_organisms/${key}.md"
              echo "group: " >> "../_organisms/${key}.md"
              echo "---" >> "../_organisms/${key}.md"
            fi
          done