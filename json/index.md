---
title: JSON API
---

<h1>JSON API for PFOCR</h1>
This set of JSON files contain all the information needed to support programmatic access to PFOCR contents and stats. 

<h2>List</h2>
Comprehensive lists of key data types in PFOCR with minimal information for each. 
<dl>
    <dt><a href="./listOrganisms.json">listOrganisms.json</a></dt>
    <dd>A list of all organisms in PFOCR as an array of latin genus species values all under the `organisms` key.</dd>
    <dt><a href="./listFiguresByOrganism.json">listFiguresByOrganism.json</a></dt>
    <dd>A list of all figures in PFOCR organized by organism. The `organisms` key has an array of arrays containing each organism's `latin`, `two-letter-code` and `common` key-value pairs, plus a `figures` key that has an array of arrays containing each figures's `id`, `url`, `name`, `species` key-value pairs.</dd>
</dl>

<h2>Get</h2>
While <b>getCounts.json</b> provides summary statistics for PFOCR, <b>getFigureyInfo.json</b> provides key metadata for every figure.
<dl>
    <dt><a href="./getCounts.json">getCounts.json</a></dt>
    <dd>Summary statistics for the PFOCR database, including the number of `organisms`, `figures`, `papers`, and `entities` as key-value pairs.</dd>
    <dt><a href="./getFigureInfo.json">getFigureInfo.json</a></dt>
    <dd>Key metadata for every figure in PFOCR. The `figureInfo` key contains an array of arrays containing each figure's `id`, `url`, `title`, `organisms`, `pmcid`, and `year`key-value pairs.</dd>
</dl>