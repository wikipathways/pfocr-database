---
layout: home
title: Home
---
<div>
  {%- include_cached header.html %}
<section id="intro"> 
  <main class="home-page-content" aria-label="Content">
    <div class="wrapper">   
      <div class="outer-container">
        <div class="row-main gy-5 py-5" style="display:flex; flex-wrap: wrap;">
          <div class="col-5 px-0 mx-0" style="display:flex;">
            <div class="bg-gradient py-1 main-top-left">
              <div class="container px-0">
                <h2 style="font-family:Poppins; line-height:1.4"><b>Pathway Figure OCR</b> is an open science project dedicated to extracting pathway information from the published literature to be freely used by anyone.
                </h2>
                <a class="btn btn-sm btn-front my-1" href="/about.html">Read more</a>
                <a class="btn btn-sm btn-front my-1" href="https://youtu.be/8XRS_dTX-eM" target="_blank">Video tour</a>
                <br /><br />
                <div class="row-main gy-5 py-5" style="display:flex; flex-wrap: wrap;margin-right: -95px;margin-left: 25px;">
                  <div class="col-7 mx-3"> 
                    <div class="container">
                      <h3 style="font-family:Poppins; text-align: left; font-size:larger; padding-left:32px;"><b>Search published figures</b>
                      </h3>
                      <div id="search-widget2" style="float:left; margin:4px 20px 0px 0px;">
                        <form id="searchForm2" action="/search.html">
                        <i class="fa fa-search" aria-hidden="true"></i>
                        <input type="text" name="searchQuery2" placeholder="&nbsp;e.g., ace2 aldosterone human" style="width: 280px;">
                        </form>          
                      </div>
                      <script>
                        const searchForm2 = document.getElementById('searchForm2');
                        searchForm2.addEventListener('submit', function(event) {
                        event.preventDefault(); // Prevent the default form submission behavior
                        const searchQuery2 = encodeURIComponent(searchForm2.elements.searchQuery2.value); // Get the search query and encode it
                        const searchUrl2 = `/search.html?query=${searchQuery2}`; // Construct the search results page URL with the search query as a parameter
                        window.location.href = searchUrl2; // Navigate to the search results page
                        });
                      </script>
                      <p style="color: #6c757d;text-align: center; ">Search by gene symbols, pathway names or other keywords</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-7 mx-auto gy-4 py-4 px-0" style="display:flex;">
            <div style="margin-left:39px">
              <a href="/figures/PMC6365454__fnins-13-00025-g0002.html">
                <img src="assets/img/frontpage_image.png" title="Click to visit this figure page"/>
              </a>
              <p style="color: #6c757d;text-align: left">Pathway figures annotated with genes, metabolites, drugs and disease identifiers.</p>
            </div>
          </div> 
        </div>
      </div>
    </div>
  </main>
</section>
</div>
<section id="join">
    <div class="wrapper">   
      <div class="outer-container" style="background: linear-gradient(90deg, #fefefe, #eaefff 100%);">
        <div class="row-main gy-5 py-2" style="display:flex; flex-wrap: wrap;">
          <div class="col-4 mx-auto" style="display:flex;">
            <div class="bg-gradient p-3">
              <div class="container" style="margin-left:25px;">
                <h1 style="font-family:Linux Libertine; ">Dedicated to open access</h1><h2 style="font-family:Poppins; color: #6c757d;line-height:1.4"> Almost a thousand pathway figures are published each month. We are releasing the information trapped in inaccessible PDFs and images for researchers globally.</h2>
              </div>
            </div>
          </div>
          <div class="col-7 mx-auto" style="display:flex;">
            <div class="bg-gradient p-0">
              <div class="container">
              <a href="/stats">
                <img src="assets/img/pfocr_stats.png" style="height:350px;" />
              </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
</section>
<section id="browse">
    <div class="wrapper">   
      <div class="outer-container" style="background: linear-gradient(270deg, #fefefe, #eaefff 100%);">
        <div class="row-main gy-5 py-2" style="display:flex; flex-wrap: wrap;">
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="bg-gradient p-3">
              <div class="container">
              <div id="carouselBrowse" class="carousel slide" data-ride="true" data-wrap="true">
  <ol class="carousel-indicators" style="margin-bottom: -25px;">
    <li data-target="#carouselBrowse" data-slide-to="0" class="active"></li>
    <li data-target="#carouselBrowse" data-slide-to="1"></li>
  </ol>
  <div class="carousel-inner" style="width: 76%;margin-left: 12%;">
  <div class="carousel-item active">
<!--      <a href="/browse/table.html">
      <img class="d-block w-100" src="/assets/img/slideshow/browse-2.png" alt="Table filter">
      </a>
    </div>
    <div class="carousel-item">
    -->
          <a href="/browse/wikipathways.html">
      <img class="d-block w-100" src="/assets/img/slideshow/browse-6.png" alt="WikiPathways">
      </a>
    </div>
    <div class="carousel-item">
          <a href="/browse/ndex.html">
      <img class="d-block w-100" src="/assets/img/slideshow/analyze-4.png" alt="NDEx">
      </a>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselBrowse" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselBrowse" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
              </div>
              </div>
            </div>
          </div>
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="container">
                  <h1 style="font-family:Linux Libertine; text-align:right;">Browse the current collection</h1><h2 style="font-family:Poppins; text-align:right;color: #6c757d;line-height:1.4">Explore the full breadth and depth of published pathway knowledge. Discover pathways of interest by organism and other metadata.</h2>
                <div class="row mx-auto" style="display:flex; flex-wrap: wrap;">            
                  <div class="col-4 px-0" style="display:flex;"></div>
                  <div class="col-3 mx-auto" style="display:flex;">
                    <div class="container">      
                    <a class="btn btn-sm btn-wikipathways btn-pill w-100 my-2" style="font-size:large" href="browse/wikipathways.html">WikiPathways</a>  
                    <!-- <a class="btn btn-sm btn-front w-100 my-2" style="font-size:large" href="browse/table.html">Table</a>  -->   
                    </div>
                  </div>
                  <div class="col-3 mx-auto>" style="display:flex;">
                    <div class="container">   
                    <a class="btn btn-sm btn-ndex btn-pill w-100 my-2" style="font-size:large" href="browse/ndex.html">NDEx</a>     
                    </div>
                  </div>
                </div>
            </div>
          </div> 
        </div>
      </div>
    </div>
</section>
<section id="download"> 
    <div class="wrapper">   
      <div class="outer-container" style="background: linear-gradient(90deg, #fefefe, #eaefff 100%);">
        <div class="row-main gy-5 py-2" style="display:flex; flex-wrap: wrap;">
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="bg-gradient p-3">
              <div class="container">
              <h1 style="font-family:Linux Libertine; ">Download and analyze</h1><h2 style="font-family:Poppins; line-height:1.4; color: #6c757d;">Get pathway information in the format you need. Use online and software tools to perform pathway analysis.</h2>
              <div class="row mx-auto" style="display:flex; flex-wrap: wrap;">
                <div class="col-3 px-0" style="display:flex;">
                  <div style="width:150px;">
                <a class="btn btn-sm btn-front w-100 my-2" href="/help.html#download">Download</a>
                <a class="btn btn-sm btn-front w-100 my-2" href="/help.html#analyze">Analyze</a>
                  </div>
                </div>              
                <div class="col-5 mx-auto" style="display:flex;">
                  <div style="width:150px;">
      <a href="https://pathvisio.org/" 
      title="PathVisio is a free open-source pathway analysis and drawing software which allows drawing, editing, and analyzing biological pathways." target="_blank">
      <img src="/assets/img/logo-pathvisio.png" height="45px" style="padding:2px 1px"/></a>
      <a href="http://apps.cytoscape.org/apps/wikipathways" 
      title="Cytoscape is an open source software platform for visualizing complex-networks and integrating these with any type of attribute data." target="_blank">
      <img src="/assets/img/logo-cytoscape.png" height="45px" style="padding:2px 2px" /></a>
      <a href="https://amp.pharm.mssm.edu/Enrichr/" title="Enrichr is a comprehensive gene set enrichment analysis web server. Includes WikiPathways as one of their data sources." target="_blank">
      <img src="/assets/img/logo-enrichr.png" height="45px" style="padding:2px 8px" /></a>
      <a href="https://bioconductor.org/packages/clusterProfiler/" title="The clusterProfiler R package supports GO and pathway analysis performed as overrepresentation or GSEA." target="_blank">
      <img src="/assets/img/logo-clusterprofiler.png" height="45px" style="padding:2px 8px" /></a>
                  </div>
                </div>
                <div class="col-3 mx-auto" style="display:flex;">
                </div>
              </div>
              </div>
            </div> 
          </div>
          <div class="col-5 mx-auto" style="display:flex;">
            <div class="bg-gradient p-4">
            <div class="container">
              <div id="carouselDownload" class="carousel slide" data-ride="true" data-wrap="true">
  <ol class="carousel-indicators" style="margin-bottom: -25px;">
    <li data-target="#carouselDownload" data-slide-to="0" class="active"></li>
    <li data-target="#carouselDownload" data-slide-to="1"></li>
    <li data-target="#carouselDownload" data-slide-to="2"></li>
    <li data-target="#carouselDownload" data-slide-to="3"></li>
  </ol>
  <div class="carousel-inner" style="width: 76%;margin-left: 12%;">
    <div class="carousel-item active">
          <a href="https://pathvisio.org/" target="_blank">
      <img class="d-block w-100" src="/assets/img/slideshow/analyze-1.png" alt="PathVisio">
      </a>
    </div>
    <div class="carousel-item">
          <a href="https://www.ndexbio.org/iquery/" target="_blank">
      <img class="d-block w-100" src="/assets/img/slideshow/analyze-4.png" alt="NDEx iQuery">
      </a>
    </div>
    <div class="carousel-item">
          <a href="https://gladstone-bioinformatics.shinyapps.io/shiny-25years/" target="_blank">
      <img class="d-block w-100" src="/assets/img/slideshow/analyze-5.png" alt="R Shiny app">
      </a>
    </div>
    <div class="carousel-item">
          <a href="https://maayanlab.cloud/Enrichr/" target="_blank">
      <img class="d-block w-100" src="/assets/img/slideshow/analyze-6.png" alt="Enrichr">
      </a>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselDownload" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselDownload" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a> 
          </div>
        </div>        
        </div>
      </div>
    </div>
  </div>
</div>
</section> 
{%- include_cached footer.html -%}
<div class="wrapper">
  <div class="thanks-wrapper">
    {%- include_cached thanks.html -%}
  </div>
</div>

