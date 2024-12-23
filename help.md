---
title: Help
---
<div id="video">
 <h1>Video Tour</h1>
        <p>Take a video tour of the PFOCR website!</p>
        <p><iframe width="560" height="315" src="https://www.youtube.com/embed/8XRS_dTX-eM?si=ufH5i7Ah7Dc8sMx9" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></p>
        <p>TogoTV. Feb 13 2024, YouTube: <a href="https://youtu.be/8XRS_dTX-eM" target="_blank">https://youtu.be/8XRS_dTX-eM</a>, DOI: <a href="https://doi.org/10.7875/togotv.2024.004" target="_blank">https://doi.org/10.7875/togotv.2024.004</a>.</p>
        
<div id="navigate">
<h1>Navigate</h1>

<h2>Search</h2>
<p>The collection of pathway figures can be searched by gene symbol, title and other keywords, either directly in the <b>Search</b> field at the top of each page or on the front page. For example, search for your favorite pathway by a word from the title (i.e. "Statin"), or your favorite gene either by symbol (i.e. "BRCA1").</p>
<ul>
<li>Go to dedicated <a href="search.html">Search page</a>.</li>
<li>Alternatively, check out <a href="https://pfocrummage.maayanlab.cloud" target="_blank">PFOCRummage</a> to search human figures by gene set enrichment, PMC query and keywords.</li>
</ul>

<h2>Browse</h2>
<p>The Pathway Figure OCR content can be browsed by cross-references to other databases:</p>
<ul>
<li><a href="/browse/wikipathways.html">Pathway Figures translated to WikiPathways</a>: View a subset of figures that have been manually translated into WikiPathways models.</li>
<li><a href="/browse/ndex.html">Pathway Figures deposited at NDEx</a>: View the subset of pathway figures below that have been coverted to the Cytoscape CX format and deposited at NDEx.</li>
</ul>

<p>Or by parsing JSON files containing all pathway figure information:</p>
<ul>
<li><a href="https://pfocr.wikipathways.org/json/getFigureInfo.json">All figure information</a></li>
<li><a href="https://pfocr.wikipathways.org/json/listFiguresByOrganism.json">Figure information by organism</a></li>
</ul>
</div>

<div id="download">
<h1>Download</h1>

<h2>Download GMT: Gene Matrix Transposed</h2>
<ul>
<li>The latest GMT for all pathway figures can be found at https://data.wikipathways.org/pfocr/current. Archives of prior releases can be found in sibling directories.
</li>
</ul>

<h2>Downloading and Accessing Individual Pathways</h2>
<ul>
<li>The permanent link to a specific pathway has the pattern <code>https://pfocr.wikipathways.org/figures/{figid}.html</code>. This link is also accessible from the <b>options</b> drop-down under the figure from the pathway figure page.</li>
<li>View the figure at PMC directly from the <b>options</b> drop-down under the figure from the pathway figure page.</li>
<li>To read the associated paper at PMC, access the <b>options</b> drop-down under the figure from the pathway figure page.</li>
<li>If the figure has been translated to a <b>WikiPathways</b> model, you can open it directly at WikiPathways from the pathway figure page by accessing the <b>options</b> drop-down under the figure.</li>
<li>Open a network representation of the list of genes at <b>NDEx</b> from each pathway figure page by accessing the <b>options</b> drop-down under the figure.</li>
<li>Download individual pathway figures in <b>JPG</b> format from each pathway figure page by accessing the <b>options</b> drop-down under the figure.</li>
<li>Download the list of annotated genes in the <b>GPML</b> (Graphical Pathway Markup Language) format from each pathway figure page by accessing the <b>options</b> drop-down under the figure. These starter GPMLs are meant to facilitate the curation of WikiPathways models by providing curators with already annotated nodes.</li>
</ul>


</div>


<div id="analyze">
<h1>Analyze</h1>

<p>Pathway gene sets can be used for analysis in multiple tools:</p>
<ul>
<li>The <a href="https://maayanlab.cloud/Enrichr/" target="_blank">Enrichr</a> tool includes the Pathway Figure OCR gene sets as one of its libraries for enrichment analysis.</li>
<li>Use <a href="https://pfocrummage.maayanlab.cloud/" target="_blank">PFOCRummage</a> to search by gene set enrichment, PMC or keywords.</li>
<li>Use the <a href="https://www.ndexbio.org/iquery/" target="_blank">NDEx Integrated Query</a> for quick enrichment analysis.</li>
<li>Run <a href="https://github.com/gladstone-institutes/Interactive-Enrichment-Analysis/" target="_blank">IEA</a> locally for interactive enrichment analyses.</li>
<li>Use <a href="https://www.webgestalt.org/" target="_blank">WebGestalt</a> for more advanced enrichment analysis options.</li>
<li>Use our GMT file as a custom data source in the <a href="https://biit.cs.ut.ee/gprofiler/gost" target="_blank">g:Profiler</a> tool for enrichment analysis.</li>
<li>Parse the <a href="https://pfocr.wikipathways.org/json/getFigureInfo.json">JSON of all figure information</a></li>
<li>Parse the <a href="https://pfocr.wikipathways.org/json/listFiguresByOrganism.json">JSON of figure information by organism</a></li>
</ul>
</div>
