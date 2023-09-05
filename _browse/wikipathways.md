---
order: 2
display-title: "WikiPathways"
tooltip: "Figures with pathway models at WikiPathways" 
btn-class: "btn-wikipathways btn-pill"
---

<h1>Pathway Figures translated to WikiPathways
    <a href="https://github.com/wikipathways/pfocr-database/edit/main/_data/wpid_map.tsv"
      target="_blank">
      <span title="Edit list" style="color: #666; font-size: 0.8em;">
         <i class="fa fa-pencil"></i>
      </span>
    </a>
</h1>
<p>Browse the subset of pathway figures below that have been manually translated into WikiPathways models.</p>
<hr/><br/>
{% assign sorted_figures = site.figures | sort: "year" | reverse %}
<ul> 
  {% for pw in sorted_figures %}
    {% if pw.wpid and pw.wpid != '' %}
      <li><a href="{{ pw.url }}">{{ pw.figtitle }} ({{ pw.year }}, <em>{{ pw.organisms | join: "," }})</em></a>
        <a href="https://www.wikipathways.org/instance/{{ pw.wpid }}" target="_blank">
          <img alt="WikiPathways" src="https://img.shields.io/static/v1?label=WikiPathways&message={{ pw.wpid }}&color=orange">
        </a>
      </li>
    {% endif %} 
  {% endfor %}
</ul>