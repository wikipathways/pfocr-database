---
order: 3
display-title: "NDEx"
tooltip: "Figures with network representations at NDEx" 
btn-class: "btn-ndex btn-pill"
---

<h1>Pathway Figures deposited at NDEx</h1>
<p>Browse the subset of pathway figures below that have been coverted to the Cytoscape CX format and deposited at NDEx.</p>
<hr/><br/>
{% assign sorted_figures = site.figures | sort: "year" | reverse %}
<ul>
  {% for pw in sorted_figures %}
    {% if pw.ndex and pw.ndex != '' %}
    {% assign ndex-short =  pw.ndex | truncate: 11 %}
      <li><a href="{{ pw.url }}">{{ pw.figtitle }} ({{ pw.year }}, <em>{{ pw.organisms | join: "," }})</em></a>
      </li> 
    {% endif %} 
  {% endfor %} 
</ul>