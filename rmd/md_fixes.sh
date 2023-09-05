#Run manually from _figures dir to make changes to all .md files
for file in *.md; do
  echo $file
  figid_alias=$(grep "^figid_alias:" ${file} | sed 's/figid_alias: //')
  redirect_from="/figures/${figid_alias}"
  echo $redirect_from
  sed '$d' $file > temp.md
  echo "redirect_from: ${redirect_from}" >> temp.md
  tail -n 1 $file >> temp.md  
  mv temp.md $file
done

