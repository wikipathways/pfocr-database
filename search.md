---
title: Search Results
---
<script>
  let hasInputListener = false;
</script>
<script src="/assets/js/simple-jekyll-search-ap.js"></script> 

<script>
  var div = document.getElementById("navbarNavAltMarkup");
  div.classList.add("show");
  //hide search widget
  document.getElementById("search-widget").style.display = "none";
</script>

<div class="alert alert-primary" role="alert">
  <span title="pro-tip" >
    <i class="fa fa-circle-info"></i>
  </span>
  <i>Pro-tip:</i> Start typing any keywords for figure titles, captions, genes or metabolites and the first 40 results will appear. You can include organisms, keywords, and even publication year in your query. Multi-term queries are processed as AND queries.
</div> 

<div class="search">
  <i class="fa fa-search" aria-hidden="true"></i>
  <input type="text" id="search-input" placeholder="&nbsp;Start typing your query terms here...">
  <span style="font-size: small;">Examples: 
  <a href="search.html?query=ace2 aldosterone human">ACE2 aldosterone human</a> |  
  <a href="search.html?query=stem cell">stem cell</a> |  
  <a href="search.html?query=drosophila">drosophila</a> |  
  <a href="search.html?query=cancer 2022">cancer 2022</a> |  
  </span>
  <br>
  <img id="loading-gif" src="/assets/img/loading.gif" alt="Loading..." style="display: none;width: 50px;float: left;margin: 25px;">
  <ul id="results-container" style="list-style:none;float:left;width:75%;"></ul>
</div>

<div class="alert" role="alert" style="float:right;width:150px;background-color:#ffeaca;color:#857444;">
  <h3>Additional ways to find figures:</h3> 
  <ul style="list-style:none;margin-left:-5px;text-align:center;">
   {% assign sorted_browse = site.browse | where:"btn-class","btn-front" | sort: "order" %} 
    {% for bp in sorted_browse %}
      <li><a class="btn btn-sm {{bp.btn-class}} my-1" style="font-size:medium;width:105px;" href="{{bp.url}}" title="{{bp.tooltip}}"> {{ bp.display-title }}</a></li>
    {% endfor %}
    {% assign sorted_browse = site.browse | where_exp:"item","item.btn-class contains 'pill'" | sort: "order" %}
    {% for bp in sorted_browse %} 
      <li><a class="btn btn-sm {{bp.btn-class}} my-1" style="font-size:medium;width:105px;" href="{{bp.url}}" title="{{bp.tooltip}}"> {{ bp.display-title }}</a></li>
    {% endfor %}   
  </ul>
</div> 

<script>
SimpleJekyllSearch({
  searchInput: document.getElementById('search-input'),
  resultsContainer: document.getElementById('results-container'),
  json: '/search.json',
  searchResultTemplate: '<table style="border-style:none; padding:0px; margin:0px;"><tr> ' +
        '<td style="width:160px;border-style:none;"><a style="text-decoration:none;" href="{url}" ' + 
        'target="_blank"><img alt="Figure thumbnail" ' +
         'src="https://www.ncbi.nlm.nih.gov/pmc/articles/{pmcid}/bin/{filename}"/></a></td>' +
         '<td style="border-style:none;"><a style="font-size:16px;text-decoration:none;color:#1A0DAB;" href="{url}" ' +
         'target="_blank">{title}</a>' +
         '<br/><span style="color:#777777;">{alias} - {organisms}</span>' +
        '<br/><span style="font-size:13px;">{description}</span>' +
        '<br/><span style="color:#777777;"><i>Publication year: {year}</i></span>' +
        '</td></tr></table>',
  noResultsText: 'No results found',
  limit: 40,
  fuzzy: false,
  exclude: ['url'],
  sortMiddleware: function(a, b) {
    var aYear = a.year.match(/\d+/);
    var bYear = b.year.match(/\d+/);
    if(null == aYear){
      aYear = 1900;
    } else {
      aYear[0];
    }
    if(null == bYear){
      bYear = 1900;
    } else {
      aYear[0];
    }
    const aNum = parseInt(aYear);
    const bNum = parseInt(bYear);
    return bNum - aNum;
  }
})
</script>
<script>
function triggerInputEvent() {
  //AP: Support multiple searchboxes and query params
  const searchInput = document.getElementById('search-input')
  const loadingGif = document.getElementById('loading-gif'); // Get the loading gif element
  const searchParams = new URLSearchParams(window.location.search);
  const query = searchParams.get('query');

  loadingGif.style.display = 'block'; // Show the loading gif
  searchInput.value = "performing search..."; 


  const registerInputPromise = new Promise((resolve) => {
    if (hasInputListener) {
      resolve();
    } else {
      const intervalId = setInterval(() => {
        if (hasInputListener) {
          //console.log("now!")
          clearInterval(intervalId);
          resolve();
        } else {
          //console.log("not yet...")
        }
      }, 100);
    }
  });
  registerInputPromise.then(() => {
    //console.log(query);
    loadingGif.style.display = 'none'; // Hide the loading gif
    searchInput.value = query; 
    const inputEvent = new InputEvent('input', { inputType: 'insertText' });
    searchInput.dispatchEvent(inputEvent);
  });
}
triggerInputEvent();
</script>