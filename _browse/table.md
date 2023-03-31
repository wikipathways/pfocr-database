---
order: 1
layout: table-page
display-title: "Table"
tooltip: "Searchable table with filtering and sort options" 
btn-class: "btn-front"
---
<a class="btn btn-sm btn-front my-2" style="float:right;" href="/#browse">Browse</a>
<div class="table-responsive-sm">
<table  class="table table-sm" id="myTable">
  <col style="width:auto" />
  <col style="width:75px" />
  <col style="width:200px" />
  <!-- NOTE: SORT IS TOO SLOW FOR FULL TABLE -->
  <th>Figure Title</th>
  <th>Year</th>
  <th>Organism</th>
  {% assign pw-sorted = site.figures | sort: "year" | reverse  %}
  {% for pw in pw-sorted %}
  {% assign clean-title = pw.figtitle | remove: "'" | remove: '"' %}
  <tr>
    <td title="{{ clean-title }}">
      <a href="{{ pw.url }}">{{ clean-title }}</a>
    </td>
    <td>{{ pw.year}}</td>
    <td title="{{ pw.organisms | join: ", "}}">{{ pw.organisms | join: ", "}}</td>
  </tr>
  {% endfor %}
</table>
</div>
