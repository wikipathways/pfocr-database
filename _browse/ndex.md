---
display-title: "NDEx"
btn-class: "btn-front"
---

<h1>Pathway Figures deposited at NDEx</h1>
<p>Browse the subset of pathway figures below that have been coverted to the Cytoscape CX format and deposited at NDEx.</p>
<hr/><br/>
{% assign sorted_figures = site.figures | sort: "year" | reverse %}
<ul>
  {% for pw in sorted_figures %}
    {% if pw.ndex and pw.ndex != '' %}
    {% assign ndex-short =  pw.ndex | truncate: 11 %}
      <li><a href="{{ pw.url }}">{{ pw.figtitle }} ({{ pw.year }}, <em>{{ pw.organisms.first }})</em></a>
        <a href="https://www.ndexbio.org/viewer/networks/{{pw.ndex}}" target="_blank">
          <img alt="NDEx" src="https://img.shields.io/static/v1?label=NDEx&message={{ ndex-short }}&color=brightgreen">
        </a>
      </li>
    {% endif %} 
  {% endfor %} 
</ul>