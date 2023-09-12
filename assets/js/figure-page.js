/*
JS for every figure page
*/
  var trs = $("#participants-table tr");
  var trsChem = $("#chems-table tr");
  var trsDis = $("#dis-table tr");
  var btnMoreDesc = $("#descMore");
  var btnLessDesc = $("#descLess");
  var btnMore = $("#tableMore");
  var btnLess = $("#tableLess");
  var btnLess1 = $("#tableLess1");
  const tblGrad = $("#tableGrad")[0];
  var btnMoreChems = $("#tableMoreChems");
  var btnLessChems = $("#tableLessChems");
  var btnLessChems1 = $("#tableLessChems1");
  const tblGradChems = $("#tableGradChems")[0];
  var btnMoreDis = $("#tableMoreDis");
  var btnLessDis = $("#tableLessDis");
  var btnLessDis1 = $("#tableLessDis1");
  const tblGradDis = $("#tableGradDis")[0];
  var trsLength = trs.length;
  var trsLenChems = trsChem.length;
  var trsLenDis = trsDis.length;
  var startIndex = 6;
  var currentIndex = startIndex;
  var currentIndexChems = startIndex;
  var currentIndexDis = startIndex;
  const orgSelect = document.getElementById("organismSelect");
  
  function UrlExists(url) {
    var http = new XMLHttpRequest();
    http.open('HEAD', url, false);
    http.send();
    if (http.status != 404)
      return true;
    else
      return false;
  }

  trs.hide();
  trs.slice(0, startIndex).show();
  checkButton(trsLength,$("#participants-table tr:visible").length, btnMore, btnLess, btnLess1, tblGrad);
  trsChem.hide();
  trsChem.slice(0, startIndex).show();
  checkButton(trsLenChems, $("#chems-table tr:visible").length, btnMoreChems, btnLessChems, btnLessChems1, tblGradChems);
  trsDis.hide();
  trsDis.slice(0, startIndex).show();
  checkButton(trsLenDis, $("#dis-table tr:visible").length, btnMoreDis, btnLessDis, btnLessDis1, tblGradDis);

  checkButtonDesc();

  btnMoreDesc.click(function (e) {
    e.preventDefault();
    document.getElementById("caption").style.maxHeight = ""; 
    checkButtonDesc();
  });

  btnLessDesc.click(function (e) {
    e.preventDefault();
    document.getElementById("caption").style.maxHeight = "75px"; 
    checkButtonDesc();
  });

  function checkButtonDesc() {
    var currentHeight = $("#caption").height();
    var scrollHeight = document.getElementById("caption").scrollHeight;

    if (scrollHeight <= 75){ // no need to expand/collapse
      btnMoreDesc.hide();
      btnLessDesc.hide();
    } else {
      if (currentHeight > 75) { // time to collapse
        btnMoreDesc.hide();
        btnLessDesc.show();
      } else {                  // time to expand
        btnMoreDesc.show();
        btnLessDesc.hide();
      }
    } 
  }


  function checkButton(trsLength, currentLength, btnM, btnL,btnL1,tblG) {
    if (trsLength > startIndex){
      if (currentLength == trsLength ) {
      btnM.hide();
      btnL.show();
      btnL1.show();
      tblG.style.display = 'none';
      } else {
      btnM.show();
      btnL.hide();
      btnL1.hide();
      tblG.style.display = 'block';
      }
    } else {
      btnM.hide();
      btnL.hide();
      btnL1.hide();
      tblG.style.display = 'none';
    }
  }

  window.onload = function() {
    orgSelect.addEventListener("change", filterTable);
  }

    // Function to filter the table
    function filterTable() {
        const selectedOrganism = orgSelect.value;
        // Loop through each table row (starting from 1 to skip the header)
        var newRowCount = 0;
        for (let i = 1; i < trs.length; i++) {
          const cell = trs[i].getElementsByTagName("td")[0];
          const organism = cell.textContent || cell.innerText;
          // Show or hide the row based on the selected organism
          if (organism === selectedOrganism || selectedOrganism === "All") {
            trs[i].style.display = "";
            newRowCount++;
          } else {
            trs[i].style.display = "none";
          }
        }
        checkButton(newRowCount, newRowCount, btnMore, btnLess, btnLess1, tblGrad);
    }

  btnMore.click(function (e) {
    e.preventDefault();
    $("#participants-table tr").slice(startIndex, trsLength).show();
    checkButton(trsLength, $("#participants-table tr:visible").length, btnMore, btnLess, btnLess1,tblGrad);
  });
  btnLess.click(function (e) {
    e.preventDefault();
    orgSelect.selectedIndex = 0; // reset organism select
    filterTable();
    $("#participants-table tr").slice(startIndex, trsLength).hide();
    checkButton(trsLength, $("#participants-table tr:visible").length, btnMore, btnLess, btnLess1,tblGrad);
  });
  btnLess1.click(function (e) {
    e.preventDefault();
    orgSelect.selectedIndex = 0; // reset organism select
    filterTable();
    $("#participants-table tr").slice(startIndex, trsLength).hide();
    checkButton(trsLength, $("#participants-table tr:visible").length, btnMore, btnLess, btnLess1,tblGrad);
  });

  btnMoreChems.click(function (e) {
    e.preventDefault();
    $("#chems-table tr").slice(startIndex, trsLenChems).show();
    checkButton(trsLenChems, $("#chems-table tr:visible").length, btnMoreChems, btnLessChems, btnLessChems1, tblGradChems);
  });
  btnLessChems.click(function (e) {
    e.preventDefault();
    $("#chems-table tr").slice(startIndex, trsLenChems).hide();
    checkButton(trsLenChems, $("#chems-table tr:visible").length, btnMoreChems, btnLessChems, btnLessChems1, tblGradChems);
  });
  btnLessChems1.click(function (e) {
    e.preventDefault();
    $("#chems-table tr").slice(startIndex, trsLenChems).hide();
    checkButton(trsLenChems, $("#chems-table tr:visible").length, btnMoreChems, btnLessChems, btnLessChems1, tblGradChems);
  });

  btnMoreDis.click(function (e) {
    e.preventDefault();
    $("#dis-table tr").slice(startIndex, trsLenDis).show();
    checkButton(trsLenDis, $("#dis-table tr:visible").length, btnMoreDis, btnLessDis, btnLessDis1, tblGradDis);
  });
  btnLessDis.click(function (e) {
    e.preventDefault();
    $("#dis-table tr").slice(startIndex, trsLenDis).hide();
    checkButton(trsLenDis, $("#dis-table tr:visible").length, btnMoreDis, btnLessDis, btnLessDis1, tblGradDis);
  });
  btnLessDis.click(function (e) {
    e.preventDefault();
    $("#dis-table tr").slice(startIndex, trsLenDis).hide();
    checkButton(trsLenDis, $("#dis-table tr:visible").length, btnMoreDis, btnLessDis, btnLessDis1, tblGradDis);
  });

  const copyBtn = document.querySelector('.copy-btn');
  const toCopy = document.querySelector('.copy-btn').getAttribute('to-copy');

  copyBtn.addEventListener('click', () => {
    navigator.clipboard.writeText(toCopy)
      .then(() => {
        toCopy.value = '';
      })
      .catch(err => {
        console.log('Something went wrong', err);
      })
  });


    // Genes for PathVisio
    const pvgBtn = document.querySelector('.pvg-btn');

    pvgBtn.addEventListener('click', () => {
      var toPvg = getPVgenes();
      navigator.clipboard.writeText(toPvg)
    .then(() => {
      toPvg = '';
    })
    .catch(err => {
      console.log('Something went wrong', err);
    })
    });

    // Function to prep genes for PV
    function getPVgenes() {
      var pvGenes = '<?xml version="1.0" encoding="UTF-8"?>'+
      '<Pathway xmlns="http://pathvisio.org/GPML/2013a" Name="untitled" Data-Source="COPIED">';
      var GraphIdNum = 1000;
      var CenterX = 100;
      var CenterY = 100;

      // for all rows for a given organism
      var myOrganism = orgSelect.value;
      if (myOrganism === "All") {
        myOrganism = orgSelect.options[1].value;
      }
      for (let i = 1; i < trs.length; i++) {
        const cell = trs[i].getElementsByTagName("td")[0];
        const organism = cell.textContent || cell.innerText;
        // Show or hide the row based on the selected organism
        if (organism === myOrganism ) {
          var GraphId = "a"+GraphIdNum;
          pvGenes = pvGenes + '<DataNode TextLabel="'+ trs[i].getElementsByTagName("td")[5].innerText +
          '" GraphId="'+ GraphId +'" Type="GeneProduct">'+
          '<Comment>OCR lexicon match: '+trs[i].getElementsByTagName("td")[3].innerText +'</Comment>'+
          '<Graphics CenterX="' + CenterX + '" CenterY="' + CenterY + '" Width="90" Height="25" ZOrder="33000" FontSize="12" Valign="Middle"/>'+  
          '<Xref Database="Entrez Gene" ID="' + trs[i].getElementsByTagName("td")[6].innerText +
           '" /> </DataNode>';
           GraphIdNum++;
           CenterY = CenterY + 25;
           var rowCheck = GraphIdNum % 10;
           if (rowCheck == 0) {
             CenterX = CenterX + 100;
             CenterY = 100;
           }
        } 
      }
      pvGenes = pvGenes + '<InfoBox CenterX="0.0" CenterY="0.0" /></Pathway>';
      return (pvGenes);
    }

    // Chemicals for PathVisio
    const pvcBtn = document.querySelector('.pvc-btn');

    pvcBtn.addEventListener('click', () => {
      var toPvc = getPVchems();
      navigator.clipboard.writeText(toPvc)
    .then(() => {
      toPvc = '';
    })
    .catch(err => {
      console.log('Something went wrong', err);
    })
    });

    // Function to prep chemicals for PV
    function getPVchems() {
      var pvChems = '<?xml version="1.0" encoding="UTF-8"?>'+
      '<Pathway xmlns="http://pathvisio.org/GPML/2013a" Name="untitled" Data-Source="COPIED">';
      var GraphIdNum = 1000;
      var CenterX = 100;
      var CenterY = 100;

      for (let i = 1; i < trsChem.length; i++) {
        const cell = trsChem[i].getElementsByTagName("td")[4];
        var chebi = cell.textContent || cell.innerText;
        // Show or hide the row based on the selected organism
        if (chebi.startsWith("chebi:") ) {
          chebi = chebi.substring("chebi:".length)
          var GraphId = "a"+GraphIdNum;
          pvChems = pvChems + '<DataNode TextLabel="'+ trsChem[i].getElementsByTagName("td")[3].innerText +
          '" GraphId="'+ GraphId +'" Type="Metabolite">'+
          '<Comment>OCR lexicon match: '+trsChem[i].getElementsByTagName("td")[0].innerText +'</Comment>'+
          '<Graphics CenterX="' + CenterX + '" CenterY="' + CenterY + '" Width="90" Height="25" ZOrder="33000" FontSize="12" Valign="Middle" Color="0000ff" />'+  
          '<Xref Database="ChEBI" ID="' + chebi +
           '" /> </DataNode>';
           GraphIdNum++;
           CenterY = CenterY + 25;
           var rowCheck = GraphIdNum % 10;
           if (rowCheck == 0) {
             CenterX = CenterX + 100;
             CenterY = 100;
           }
        } 
      }
      pvChems = pvChems + '<InfoBox CenterX="0.0" CenterY="0.0" /></Pathway>';
      return (pvChems);
    }

    // Drugst.one button
    const drugBtn = document.querySelector('.drugstone-btn');
    if (drugBtn) {
     drugBtn.addEventListener('click', () => {
      var nodeList = getDrugstone();
      if (nodeList === '') {
        alert('No human genes found to query Drugst.one');
        return;
      }
      var drugstoneUrl = 'https://drugst.one/standalone?nodes='+nodeList+'&autofillEdges=true&activateNetworkMenuButtonAdjacentDrugs=true&interactionDrugProtein=NeDRex&licensedDatasets=true';
      window.open(drugstoneUrl, '_blank');
     });
    }

    // Function to prep genes for Drugst.one query
     function getDrugstone() {
      var drugstoneGenes = '';
      var queryCount = 0;
      // for all human rows 
      for (let i = 1; i < trs.length; i++) {
        const cell = trs[i].getElementsByTagName("td")[0];
        const organism = cell.textContent || cell.innerText;
        // Show or hide the row based on the selected organism
        if (organism === "Homo sapiens" & queryCount < 100 ) {
          drugstoneGenes = drugstoneGenes + 'ncbigene:' + trs[i].getElementsByTagName("td")[6].innerText + ',';
          queryCount++;
        } 
      }
      return (drugstoneGenes);
    }