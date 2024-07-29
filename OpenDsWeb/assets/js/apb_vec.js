
function InitTablesVec() {



    /* Fabricante de Veículos: Configuração dos Cliques */
    var tbFabrSource = $('#tbFabrSource').dataTable();
    var tbFabrTarget = $('#tbFabrTarget').dataTable();

    tbFabrSource.on('click', 'tr', function () {

        // se não houver dados
        if (tbFabrSource.fnGetData().length == 0)
            return;

        var $row = $(this);
        var addRow = tbFabrSource.fnGetData(this);
        tbFabrTarget.css("background-color", "#FFFF99");

        // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
        if (addRow == null)
            return;

        tbFabrTarget.fnAddData(addRow);

        var index = tbFabrSource.fnGetPosition(this); // get the table index
        tbFabrSource.fnDeleteRow(index);

        // reapply sort
        tbFabrTarget.fnSort([[1, 'asc']]); // sort call by Name

        // Store   target Ids in hidden field
        SetVeiFabTargetIds();
    });

    tbFabrTarget.on('click', 'tr', function () {
        if (tbFabrTarget.fnGetData().length == 0)
            return;

        var $row = $(this);
        var addRow = tbFabrTarget.fnGetData(this);
        // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
        if (addRow == null)
            return;

        tbFabrSource.fnAddData(addRow);

        var index = tbFabrTarget.fnGetPosition(this); // get the table index
        tbFabrTarget.fnDeleteRow(index);

        // reapply sort
        tbFabrSource.fnSort([[1, 'asc']]); // sort call by Name

        // Store Ramo target Ids in hidden field
        SetVeiFabTargetIds();
    });
}


function SetVeiTipoTargetIds() {
            var tbTpVeiTarget = $('#tbTpVeiTarget').dataTable();

            var sIdTpVeiList = '';
            var sNmTpVeiList = '';
            for (var i = 0; i < tbTpVeiTarget.fnGetData().length; i++) {
                sIdTpVeiList = sIdTpVeiList + ';' + tbTpVeiTarget.fnGetData(i, 0);
                sNmTpVeiList = sNmTpVeiList + ';' + tbTpVeiTarget.fnGetData(i, 1);
            };

            sIdTpVeiList = sIdTpVeiList.substring(1); // zero-based
            sNmTpVeiList = sNmTpVeiList.substring(1); // zero-based

            $("[id*=hddVeiTipoTargetList]").val(sIdTpVeiList);
            $("[id*=hddListaVeiTipo]").val(sNmTpVeiList);

            if (!$("[id*=hddVeiTipoTargetList]").val() == $("[id*=hddVeiMarOldList]").val()) { $("[id*=hddVeiMarChanged]").val("1") }

            // Set Header background color
            if (sIdTpVeiList == '') {
                // nada selecionado: cor cinza
                $('#acbtnTpVei').css("background-color", "rgb(102,102,104)");
            }
            else {
                // algo selecionado: cor laranja
                $('#acbtnTpVei').className = "btn btn-block btn-primary waves-effect waves-light";
            };

            textoFiltrosNovo();
        };


        function SetVeiFabTargetIds() {
            var tbFabrTarget = $('#tbFabrTarget').dataTable();

            var sIdFabrList = '';
            var sNmFabrList = '';
            for (var i = 0; i < tbFabrTarget.fnGetData().length; i++) {
                sIdFabrList = sIdFabrList + ';' + tbFabrTarget.fnGetData(i, 0);
                sNmFabrList = sNmFabrList + ';' + tbFabrTarget.fnGetData(i, 1);
            };

            sIdFabrList = sIdFabrList.substring(1); // zero-based
            sNmFabrList = sNmFabrList.substring(1); // zero-based

            $("[id*=hddVeiFabTargetList]").val(sIdFabrList);
            $("[id*=hddListaVeiFab]").val(sNmFabrList);

            if (!$("[id*=hddVeiFabTargetList]").val() == $("[id*=hddVeiFabOldList]").val()) {
                $("[id*=hddVeiMarChanged]").val("0")
                $("[id*=hddVeiModChanged]").val("0")
            }

            // Set Header background color
            if (sIdFabrList == '') {
                // nada selecionado: cor cinza
                $('#acbtnFabr').css("background-color", "rgb(102,102,104)");
            }
            else {
                // algo selecionado: cor laranja
                $('#acbtnFabr').className = "btn btn-block btn-primary waves-effect waves-light";
            };

            textoFiltrosNovo();
        };

        function SetMarcaTargetIds() {
            var tbMarcaTarget = $('#tbMarcaTarget').dataTable();

            var sIdMrcList = '';
            var sNmMrcList = '';
            for (var i = 0; i < tbMarcaTarget.fnGetData().length; i++) {
                sIdMrcList = sIdMrcList + ';' + tbMarcaTarget.fnGetData(i, 0);
                sNmMrcList = sNmMrcList + ';' + tbMarcaTarget.fnGetData(i, 2);
            };

            sIdMrcList = sIdMrcList.substring(1); // zero-based
            sNmMrcList = sNmMrcList.substring(1); // zero-based

            $("[id*=hddVeiMarTargetList]").val(sIdMrcList);
            $("[id*=hddListaVeiMar]").val(sNmMrcList);

            // Set Header background color
            if (sIdMrcList == '') {
                // nada selecionado: cor cinza
                $('#acbtnMarca').css("background-color", "rgb(102,102,104)");
            }
            else {
                // algo selecionado: cor laranja
                $('#acbtnMarca').className = "btn btn-block btn-primary waves-effect waves-light";
            };

            textoFiltrosNovo();
        };
		
		
		
		function SetModeloTargetIds() {
            var tbModeloSource = $('#tbModeloSource').dataTable();
            var tbModeloTarget = $('#tbModeloTarget').dataTable();

            var sIdModList = '';
            var sNmModList = '';
            for (var i = 0; i < tbModeloTarget.fnGetData().length; i++) {
                sIdModList = sIdModList + ';' + tbModeloTarget.fnGetData(i, 0);
                sNmModList = sNmModList + ';' + tbModeloTarget.fnGetData(i, 3);
            };

            sIdModList = sIdModList.substring(1); // zero-based
            sNmModList = sNmModList.substring(1); // zero-based

            $("[id*=hddVeiModTargetList]").val(sIdModList);
            $("[id*=hddListaVeiMod]").val(sNmModList);

            // Set Header background color
            if (sIdModList == '') {
                // nada selecionado: cor cinza
                $('#acbtnModelo').css("background-color", "rgb(102,102,104)");
            }
            else {
                // algo selecionado: cor laranja
                $('#acbtnModelo').className = "btn btn-block btn-primary waves-effect waves-light";
            };

            textoFiltrosNovo();
        };
		
		
		 function DoSearchAjaxMarca() {

            // Set input parameters
            var oPesquisa = {};
            oPesquisa.lstIdFabr = $("[id*=hddVeiFabTargetList]").val();

            $.ajax({

                url: "PesquisaBase.aspx/doSearchMarca",

                data: JSON.stringify({ 'oInputPesquisa': oPesquisa }),

                contentType: "application/json; charset=utf-8",
                dataType: "json",

                type: "POST",
                success: function (data) {

                    // get return object values
                    var oSearchReturn = data.d;

                    // clean table 
                    var divTbResult = $("#divTbMarcaSource");
                    divTbResult.empty();


                    // set column headers begin
                    var sTableHtml = '<table id="tbMarcaSource" class="table table-striped table-bordered table-hover w-100 d-block d-md-table"><thead><tr>';


                    // set table headers
                    var aColHeaders = oSearchReturn.sTableHeaders.split(",");
                    for (var i = 0; i < aColHeaders.length; i++) {
                        sTableHtml += '<th>' + aColHeaders[i] + '</th>';
                    };

                    // append header end and body placeholder
                    sTableHtml += '</tr></thead><tbody></tbody></table>'
                    divTbResult.append(sTableHtml);




                    // set datatable´s field config
                    var aTableFields = oSearchReturn.sTableFields.split(",");

                    var varColumns = [];

                    for (var i = 0; i < aColHeaders.length; i++) {

                        if (i == 0 || i == 3)
                            // first column invisible
                            var element = { mDataProp: aTableFields[i], bVisible: false };
                        else if (i == 2)
                            var element = { mDataProp: aTableFields[i], iDataSort: 3 };
                        else
                            var element = { mDataProp: aTableFields[i] };

                        varColumns.push(element);
                    };

                    $("[id*=hddVeiMarChanged]").val("1");

                    // config results dataTable
                    // ------------------------

                    var oTbMarcaSource = $('#tbMarcaSource').dataTable({


                        "bDestroy": true

                        // Customized by Filipe 10/06/2014: Number of columns must match the <td> count
                        // in order to avoid the message:
                        // Unable to get property 'className' of undefined or null reference


                        , "aaData": oSearchReturn.lstRows  //data.d
                        , "aoColumns": varColumns

                        , aaSorting: [[3, 'desc']]  // initial sort by qtdREgistros

                        // Filipe 09/08/2014: datatables translation
                        , "oLanguage": DataTablesPortugues()
                        , "iDisplayLength": 25


                    });


                    //
                    // Configuração da Table Target
                    //
                    // clean table 
                    var divTbResult = $("#divTbMarcaTarget");
                    divTbResult.empty();

                    // set column headers begin
                    var xTableHtml = '<table id="tbMarcaTarget" class="table table-bordered table-hover w-100 d-block d-md-table"><thead><tr>';

                    // set table headers
                    var aColHeaders = oSearchReturn.sTableHeaders.split(",");
                    for (var i = 0; i < aColHeaders.length; i++) {
                        xTableHtml += '<th>' + aColHeaders[i] + '</th>';
                    };

                    // append header end and body placeholder
                    xTableHtml += '</tr></thead><tbody></tbody></table>';

                    //ModalMessage(xTableHtml);

                    divTbResult.append(xTableHtml);

                    // config results dataTable
                    // ------------------------
                    var oTbMarcaTarget = $('#tbMarcaTarget').dataTable({
                        "bDestroy": true
                        // Customized by Filipe 10/06/2014: Number of columns must match the <td> count
                        // in order to avoid the message:
                        // Unable to get property 'className' of undefined or null reference
                        , "aaData": oSearchReturn.lstEmpty  //data.d
                        , "aoColumns": varColumns
                        , aaSorting: [[3, 'asc']]  // initial sort by qtd REgistros

                        // Filipe 09/08/2014: datatables translation
                        , "oLanguage": DataTablesPortugues()
                        , "iDisplayLength": 25


                    });

                    oTbMarcaSource.on('click', 'tr', function () {
                        ;
                        // se não houver dados
                        if (oTbMarcaSource.fnGetData().length == 0)
                            return;

                        var $row = $(this);
                        var addRow = oTbMarcaSource.fnGetData(this);
                        otbMarcaTarget.css("background-color", "#FFFF99");
                        // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                        if (addRow == null)
                            return;

                        oTbMarcaTarget.fnAddData(addRow);

                        var index = oTbMarcaSource.fnGetPosition(this); // get the table index
                        oTbMarcaSource.fnDeleteRow(index);

                        // reapply sort
                        oTbMarcaTarget.fnSort([[0, 'asc']]); // sort call by ddd
                        SetMarcaTargetIds();
                    });

                    oTbMarcaTarget.on('click', 'tr', function () {
                        // se não houver dados
                        if (oTbMarcaTarget.fnGetData().length == 0)
                            return;

                        var $row = $(this);
                        var addRow = oTbMarcaTarget.fnGetData(this);
                        // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                        if (addRow == null)
                            return;

                        oTbMarcaSource.fnAddData(addRow);

                        var index = oTbMarcaTarget.fnGetPosition(this); // get the table index
                        oTbMarcaTarget.fnDeleteRow(index);

                        // reapply sort
                        oTbMarcaSource.fnSort([[3, 'desc']]); // sort call by Qtd Registros

                        SetMarcaTargetIds();

                    });


                }
            });

        };
		
		 function DoSearchAjaxModelo() {

            // Set input parameters
            var oPesquisa = {};
            oPesquisa.lstIdFabr = $("[id*=hddVeiFabTargetList]").val();
            oPesquisa.lstIdMarca = $("[id*=hddVeiMarTargetList]").val();
            oPesquisa.lstIdTipo = $("[id*=hddVeiTipoTargetList]").val();

            $.ajax({

                url: "PesquisaBase.aspx/doSearchModelo",

                data: JSON.stringify({ 'oInputPesquisa': oPesquisa }),

                contentType: "application/json; charset=utf-8",
                dataType: "json",

                type: "POST",
                success: function (data) {

                    // get return object values
                    var oSearchReturn = data.d;

                    // clean table 
                    var divTbResult = $("#divTbModeloSource");
                    divTbResult.empty();


                    // set column headers begin
                    var sTableHtml = '<table id="tbModeloSource" class="table table-striped table-bordered table-hover w-100 d-block d-md-table"><thead><tr>';


                    // set table headers
                    var aColHeaders = oSearchReturn.sTableHeaders.split(",");
                    for (var i = 0; i < aColHeaders.length; i++) {
                        sTableHtml += '<th>' + aColHeaders[i] + '</th>';
                    };

                    // append header end and body placeholder
                    sTableHtml += '</tr></thead><tbody></tbody></table>'
                    divTbResult.append(sTableHtml);




                    // set datatable´s field config
                    var aTableFields = oSearchReturn.sTableFields.split(",");

                    var varColumns = [];

                    for (var i = 0; i < aColHeaders.length; i++) {

                        if (i == 0 || i == 5 || i == 2)
                            // first column invisible
                            var element = { mDataProp: aTableFields[i], bVisible: false };
                        else if (i == 4)
                            var element = { mDataProp: aTableFields[i], iDataSort: 5, bVisible: false };
                        else
                            var element = { mDataProp: aTableFields[i] };

                        varColumns.push(element);
                    };

                    $("[id*=hddVeiModChanged]").val("1");

                    // config results dataTable
                    // ------------------------

                    var oTbModeloSource = $('#tbModeloSource').dataTable({


                        "bDestroy": true

                        // Customized by Filipe 10/06/2014: Number of columns must match the <td> count
                        // in order to avoid the message:
                        // Unable to get property 'className' of undefined or null reference


                        , "aaData": oSearchReturn.lstRows  //data.d
                        , "aoColumns": varColumns

                        , aaSorting: [[4, 'desc']]  // initial sort by qtdREgistros

                        // Filipe 09/08/2014: datatables translation
                        , "oLanguage": DataTablesPortugues()
                        , "iDisplayLength": 25


                    });


                    //
                    // Configuração da Table Target
                    //
                    // clean table 
                    var divTbResult = $("#divTbModeloTarget");
                    divTbResult.empty();

                    // set column headers begin
                    var xTableHtml = '<table id="tbModeloTarget" class="table table-bordered table-hover w-100 d-block d-md-table"><thead><tr>';

                    // set table headers
                    var aColHeaders = oSearchReturn.sTableHeaders.split(",");
                    for (var i = 0; i < aColHeaders.length; i++) {
                        xTableHtml += '<th>' + aColHeaders[i] + '</th>';
                    };

                    // append header end and body placeholder
                    xTableHtml += '</tr></thead><tbody></tbody></table>';

                    //ModalMessage(xTableHtml);

                    divTbResult.append(xTableHtml);

                    // config results dataTable
                    // ------------------------
                    var oTbModeloTarget = $('#tbModeloTarget').dataTable({
                        "bDestroy": true
                        // Customized by Filipe 10/06/2014: Number of columns must match the <td> count
                        // in order to avoid the message:
                        // Unable to get property 'className' of undefined or null reference
                        , "aaData": oSearchReturn.lstEmpty  //data.d
                        , "aoColumns": varColumns
                        , aaSorting: [[3, 'asc']]  // initial sort by qtd REgistros

                        // Filipe 09/08/2014: datatables translation
                        , "oLanguage": DataTablesPortugues()
                        , "iDisplayLength": 25


                    });

                    oTbModeloSource.on('click', 'tr', function () {
                        ;
                        // se não houver dados
                        if (oTbModeloSource.fnGetData().length == 0)
                            return;

                        var $row = $(this);
                        var addRow = oTbModeloSource.fnGetData(this);
                        oTbModeloTarget.css("background-color", "#FFFF99");
                        // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                        if (addRow == null)
                            return;

                        oTbModeloTarget.fnAddData(addRow);

                        var index = oTbModeloSource.fnGetPosition(this); // get the table index
                        oTbModeloSource.fnDeleteRow(index);

                        // reapply sort
                        oTbModeloTarget.fnSort([[0, 'asc']]); // sort call by ddd
                        SetModeloTargetIds();
                    });

                    oTbModeloTarget.on('click', 'tr', function () {
                        // se não houver dados
                        if (oTbModeloTarget.fnGetData().length == 0)
                            return;

                        var $row = $(this);
                        var addRow = oTbModeloTarget.fnGetData(this);
                        // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                        if (addRow == null)
                            return;

                        oTbModeloSource.fnAddData(addRow);

                        var index = oTbModeloTarget.fnGetPosition(this); // get the table index
                        oTbModeloTarget.fnDeleteRow(index);

                        // reapply sort
                        oTbModeloSource.fnSort([[3, 'desc']]); // sort call by Qtd Registros

                        SetModeloTargetIds();

                    });


                }
            });

        };


        function DoSearchAjaxFabricante() {

            // Set input parameters
            var oPesquisa = {};
            oPesquisa.lstIdTipo = $("[id*=hddVeiTipoTargetList]").val();

            $.ajax({

                url: "PesquisaBase.aspx/doSearchFabricante",

                data: JSON.stringify({ 'oInputPesquisa': oPesquisa }),

                contentType: "application/json; charset=utf-8",
                dataType: "json",

                type: "POST",
                success: function (data) {

                    // get return object values
                    var oSearchReturn = data.d;

                    // clean table 
                    var divTbResult = $("#divTbFabricanteSource");
                    divTbResult.empty();


                    // set column headers begin
                    var sTableHtml = '<table id="tbFabrSource" class="table table-striped table-bordered table-hover w-100 d-block d-md-table"><thead><tr>';


                    // set table headers
                    var aColHeaders = oSearchReturn.sTableHeaders.split(",");
                    for (var i = 0; i < aColHeaders.length; i++) {
                        sTableHtml += '<th>' + aColHeaders[i] + '</th>';
                    };

                    // append header end and body placeholder
                    sTableHtml += '</tr></thead><tbody></tbody></table>'
                    divTbResult.append(sTableHtml);




                    // set datatable´s field config
                    var aTableFields = oSearchReturn.sTableFields.split(",");

                    var varColumns = [];

                    for (var i = 0; i < aColHeaders.length; i++) {

                        if (i == 1)
                            // first column invisible
                            var element = { mDataProp: aTableFields[i] };
                        else
                            var element = { mDataProp: aTableFields[i], bVisible: false };

                        varColumns.push(element);
                    };

                    /* Rogério Atenção */
                    $("[id*=hddVeiModChanged]").val("1");

                    // config results dataTable
                    // ------------------------

                    var oTbFabrSource = $('#tbFabrSource').dataTable({


                        "bDestroy": true

                        // Customized by Filipe 10/06/2014: Number of columns must match the <td> count
                        // in order to avoid the message:
                        // Unable to get property 'className' of undefined or null reference


                        , "aaData": oSearchReturn.lstRows  //data.d
                        , "aoColumns": varColumns

                        , aaSorting: [[3, 'desc']]  // initial sort by qtdREgistros

                        // Filipe 09/08/2014: datatables translation
                        , "oLanguage": DataTablesPortugues()
                        , "iDisplayLength": 25


                    });


                    //
                    // Configuração da Table Target
                    //
                    // clean table 
                    var divTbResult = $("#divTbFabricanteTarget");
                    divTbResult.empty();

                    // set column headers begin
                    var xTableHtml = '<table id="tbFabrTarget" class="table table-bordered table-hover w-100 d-block d-md-table"><thead><tr>';

                    // set table headers
                    var aColHeaders = oSearchReturn.sTableHeaders.split(",");
                    for (var i = 0; i < aColHeaders.length; i++) {
                        xTableHtml += '<th>' + aColHeaders[i] + '</th>';
                    };

                    // append header end and body placeholder
                    xTableHtml += '</tr></thead><tbody></tbody></table>';

                    //ModalMessage(xTableHtml);

                    divTbResult.append(xTableHtml);

                    // config results dataTable
                    // ------------------------
                    var oTbFabrTarget = $('#tbFabrTarget').dataTable({
                        "bDestroy": true
                        // Customized by Filipe 10/06/2014: Number of columns must match the <td> count
                        // in order to avoid the message:
                        // Unable to get property 'className' of undefined or null reference
                        , "aaData": oSearchReturn.lstEmpty  //data.d
                        , "aoColumns": varColumns
                        , aaSorting: [[3, 'desc']]  // initial sort by qtd REgistros

                        // Filipe 09/08/2014: datatables translation
                        , "oLanguage": DataTablesPortugues()
                        , "iDisplayLength": 25


                    });

                    oTbFabrSource.on('click', 'tr', function () {
                        ;
                        // se não houver dados
                        if (oTbFabrSource.fnGetData().length == 0)
                            return;

                        var $row = $(this);
                        var addRow = oTbFabrSource.fnGetData(this);
                        oTbFabrTarget.css("background-color", "#FFFF99");
                        // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                        if (addRow == null)
                            return;

                        oTbFabrTarget.fnAddData(addRow);

                        var index = oTbFabrSource.fnGetPosition(this); // get the table index
                        oTbFabrSource.fnDeleteRow(index);

                        // reapply sort
                        oTbFabrTarget.fnSort([[3, 'desc']]); // sort call by ddd

                      

                        SetVeiFabTargetIds();

                      
                    });

                    oTbFabrTarget.on('click', 'tr', function () {
                        // se não houver dados
                        if (oTbFabrTarget.fnGetData().length == 0)
                            return;

                        var $row = $(this);
                        var addRow = oTbFabrTarget.fnGetData(this);
                        // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                        if (addRow == null)
                            return;

                        oTbFabrSource.fnAddData(addRow);

                        var index = oTbFabrTarget.fnGetPosition(this); // get the table index
                        oTbFabrTarget.fnDeleteRow(index);

                        // reapply sort
                        oTbFabrSource.fnSort([[3, 'desc']]); // sort call by Qtd Registros

                        SetVeiFabTargetIds();

                    });


                }
            });

        };

