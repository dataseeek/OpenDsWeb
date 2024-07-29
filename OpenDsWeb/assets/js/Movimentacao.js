function InitTables() {
    var oTables = $('.datatable').DataTable({
        "bDestroy": true
        , aaSorting: [[1, 'desc']]  // sort by data-hora desc
    });
} // Final da IniyTables

function SetValor(id, data) {
    if (id === 1)
        $("[id*=hddCliente]").val(data);
    else if (id === 2)
        $("[id*=hddUsuario]").val(data);
    else if (id === 3)
        $("[id*=hddOperacao]").val(data);
    else
        $("[id*=hddVia]").val(data);
}


function FeedHiddenContagem(tipoArquivo) {
    if ($("[id*=hddidOperacao]").val() === "1") {
        var oTable = $('#tbContagem').dataTable();
        var iTableRowCount = oTable.fnGetData().length;

        // Put each row into an array element
        // ----------------------------------

        var oTableRows = [];
        for (var i = 0; i < iTableRowCount; i++) {
            var oRow = oTable.fnGetData(i);
            oTableRows.push(oRow);
        };

        var oRowsJson = JSON.stringify(oTableRows);

        $("[id*=hddtbContagem]").val(oRowsJson);
    }
    $("[id*=hddTipoArquivo]").val(tipoArquivo);
}

function DoPesqMovAjax() {

    var excadmin = "";

    if ($('#excadmin').is(':checked')) {
        excadmin = "SIM";        
    }


    var oPesquisa = {};
    oPesquisa.dtini = $('#dtini').val();
    oPesquisa.dtfim = $('#dtfim').val();
    oPesquisa.cliente = $("[id*=hddCliente]").val();
    oPesquisa.usuario = $("[id*=hddUsuario]").val();
    oPesquisa.operacao = $("[id*=hddOperacao]").val();
    oPesquisa.via = $("[id*=hddVia]").val();
    oPesquisa.qtdregini = $('#qtdRegini').val();
    oPesquisa.qtdregfim = $('#qtdRegfim').val();
    oPesquisa.excadmin = excadmin;

    $.ajax({

        url: "Movimentacao.aspx/doSearch",

        data: JSON.stringify({ 'oInputPesquisa': oPesquisa }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        type: "POST",
        success: function (data) {

            //
            // Configuração Source Table
            //

            // get return object values
            var oSearchReturn = data.d;

            if (oSearchReturn.status === 0) {
                swal(oSearchReturn.msgRetorno, '', 'error');
            }
            else {

                // clean table 
                var divTbResult = $("#idtbMovimentos");
                divTbResult.empty();

                // set column headers begin
                var sTableHtml = '<table id="tbMovimentos" class="table table-bordered table-hover" style="overflow-x: auto;"><thead><tr>';

                // set table headers
                var aColHeaders = oSearchReturn.sTableHeaders.split(",");
                for (var i = 0; i < aColHeaders.length; i++) {
                    sTableHtml += '<th>' + aColHeaders[i] + '</th>';
                }


                // append header end and body placeholder
                sTableHtml += '</tr></thead><tbody></tbody></table>';

                divTbResult.append(sTableHtml);

                // set datatable´s field config
                var aTableFields = oSearchReturn.sTableFields.split(",");
                var element = {};
                var varColumns = [];
                for (var ci = 0; ci < aColHeaders.length; ci++) {

                    if (ci <= 1 || ci >= 11 || ci == 4 )
                        element = { mDataProp: aTableFields[ci], bVisible: false };
                    else if (ci === 2)
                        element = { mDataProp: aTableFields[ci], iDataSort: 1 };
                    else
                        element = { mDataProp: aTableFields[ci] };

                    varColumns.push(element);

                }

                var oTables = $('#tbMovimentos').dataTable({


                    "bDestroy": true
                    , "aaData": oSearchReturn.lstRows  //data.d
                    , "aoColumns": varColumns
                    , aaSorting: [[1, 'desc']] // order por data-hora decrescente
                    , "oLanguage": DataTablesPortugues()
                    ,  buttons: [
                        'copy', 'csv', 'excel', 'pdf', 'print'
                    ]


                });




                oTables.on('click', 'tr', function () {
                    // se não houver dados
                    if (oTables.fnGetData().length === 0)
                        return;
                    var addRow = oTables.fnGetData(this);

                    // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                    if (addRow === null)
                        return;

                    if (addRow.mvwOper === 1 || addRow.mvwOper === 2) {
                        $("[id*=hddIdPesquisa]").val(addRow.mvwId0);
                        // alert(addRow.existeXLSCSV);
                        DoSearchAjax(addRow.mvwOper, addRow.mvwId, addRow.idcampos, addRow.idfiltros, addRow.idfilcompl, addRow.mvwDtHr, addRow.mvwQtd, addRow.mvwObs, addRow.Filtro, addRow.mvwArea, addRow.ip, addRow.solic, addRow.projeto, addRow.prazo, addRow.obs);
                    }
                });

                var divTbResultQtd = $("#divQtdRegistros");
                divTbResultQtd.empty();

                // set column headers begin

                var xTableHtml = '<table class="table table-striped table-bordered">';
                xTableHtml = xTableHtml + '<tr>';
                xTableHtml = xTableHtml + '<td>Total de registros</td>';
                xTableHtml = xTableHtml + '<td>Saldo devedor</td>';
                xTableHtml = xTableHtml + '</tr>';
                xTableHtml = xTableHtml + '<tr><td><strong>' + oSearchReturn.somaRegistros + '</strong></td>' + '<td><strong>R$ ' + oSearchReturn.somaValor + '</strong></td></td></table>';
                divTbResultQtd.append(xTableHtml);

            }
        }
        ,
        error: function (jqXHR, textStatus, errorThrown) {
            var mhRef = '/Login.aspx?erro=TIPOEXCESSOAINVALIDO' + "&msg=" + 'jqXHR.responseJSON.ExceptionType IS NULL'; if (jqXHR.responseJSON.ExceptionType != null) { mhRef = '/Login.aspx?erro=' + jqXHR.responseJSON.ExceptionType + "&msg=" + jqXHR.responseJSON.Message; window.location.href = mhRef;}
        }

    });

};



function DoSearchAjax(tipoPesquisa, idPesquisa, idCampos, idFiltros, idFilCompl, pData, pQtd, pCampos, pFiltros, idArea, ip, solic, projeto, prazo, obs) {

    $("[id*=hddidOperacao]").val(tipoPesquisa);
    $("[id*=hddIdPesquisa]").val(idPesquisa);
    // tipoPesquisa: 1.Contagem   2.Exportação

    var oPesquisa = {};
    oPesquisa.tipoPesquisa = tipoPesquisa;
    oPesquisa.idPesquisa = idPesquisa;
    oPesquisa.idCampos = idCampos;
    oPesquisa.idFiltros = idFiltros;
    oPesquisa.idFilCompl = idFilCompl;
    oPesquisa.idArea = idArea;

    $.ajax({

        url: "Movimentacao.aspx/doPesquisa",

        data: JSON.stringify({ 'oInputPesquisa': oPesquisa }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        type: "POST",
        success: function (data) {

            // get return object values
            var oSearchReturn = data.d;

            if (oSearchReturn.status < 0) { swal(oSearchReturn.msgRetorno, '', 'error'); }

            else {

                var divTbResult = $("#divDetCompl");
                divTbResult.empty();
                var sTableHtml = '<table class="table table-striped table-bordered"><tr><td>Solicitante</td><td>Projeto</td><td>Prazo de pagamento</td><td>Observações</td></tr>';
                sTableHtml = sTableHtml + '<tr><td>' + solic + '</td><td>' + projeto + '</td><td>' + prazo + '</td><td>' + obs + '</td></tr></table>';
                divTbResult.append(sTableHtml);

                var divTbResult2 = $("#divDetalhes");
                divTbResult.empty();
                var sTableHtml2 = ' <h4 class="red">Registros: ' + pQtd + '</h4> Filtros: ' + pFiltros;
                divTbResult2.append(sTableHtml2);

                // clean table
                var divTbResult3 = $("#divtbContagem");
                divTbResult3.empty();

                $("[id*=btnExcel]").removeAttr("disabled");
                $("[id*=btnCSV]").removeAttr("disabled");
                $("[id*=btnTXT]").removeAttr("disabled");

                var sTableHtml3 = '';

                if (oSearchReturn.status === 0 && tipoPesquisa === 2) {


                    
                    sTableHtml3 += '<br /><div class="row col-xs-12">';
                    sTableHtml3 += '<div class="alert alert-block alert-success">';
                    sTableHtml3 += '<button type="button" class="close" data-dismiss="alert">';
                    sTableHtml3 += '<i class="icon-remove"></i>';
                    sTableHtml3 += '</button>';
                    sTableHtml3 += '<i class="icon-ok green"></i>';
                    sTableHtml3 += 'Arquivos Disponíveis para Download nos formatos ';
                    sTableHtml3 += '<strong class="green">';
                    sTableHtml3 += 'Xls';
                    sTableHtml3 += '<small>,</small>';
                    sTableHtml3 += 'Csv';
                    sTableHtml3 += '<small> e </small>';
                    sTableHtml3 += 'Txt';
                    sTableHtml3 += '<small>. </small>';
                    sTableHtml3 += '</strong>';
                    sTableHtml3 += 'Clique no Botão Abaixo Conforme o Formato Desejado.';
                    sTableHtml3 += '</div></div>';
                    divTbResult3.append(sTableHtml3);
                }
                else {
                    // set column headers begin
                    sTableHtml3 = '<table id="tbContagem" class="table table-striped table-bordered table-hover"><thead><tr>';

                    // set table headers
                    var aColHeaders = oSearchReturn.sTableHeaders.split(",");
                    for (var i = 0; i < aColHeaders.length; i++) {
                        sTableHtml3 += '<th>' + aColHeaders[i] + '</th>';
                    };

                    // append header end and body placeholder
                    sTableHtml3 += '</tr></thead><tbody></tbody></table>'
                    divTbResult3.append(sTableHtml3);

                    // set datatable´s field config
                    var aTableFields = oSearchReturn.sTableFields.split(",");
                    var varColumns = [];
                    for (var di = 0; di < aColHeaders.length; di++) {
                        var element = { mDataProp: aTableFields[di] };
                        varColumns.push(element);
                    }




                    // config results dataTable
                    // ------------------------
                     $('#tbContagem').DataTable({
                        "bDestroy": true
                        // Customized by Filipe 10/06/2014: Number of columns must match the <td> count
                        // in order to avoid the message:
                        // Unable to get property 'className' of undefined or null reference
                        , "aaData": oSearchReturn.lstRows  //data.d
                        , "aoColumns": varColumns
                        , aaSorting: [[2, 'desc']] // initial sort by Qtd
                        , "oLanguage": DataTablesPortugues()
                        ,   buttons: [
                            'copy', 'csv', 'excel', 'pdf', 'print'
                        ]
                      
                    });
                }


                var coordenada = $('#tbContagem').offset().top;
                $('body,html').animate({ scrollTop: coordenada }, 200);
            }
        }
        ,
        error: function (jqXHR, textStatus, errorThrown) {
            var mhRef = '/Login.aspx?erro=TIPOEXCESSOAINVALIDO' + "&msg=" + 'jqXHR.responseJSON.ExceptionType IS NULL'; if (jqXHR.responseJSON.ExceptionType != null) { mhRef = '/Login.aspx?erro=' + jqXHR.responseJSON.ExceptionType + "&msg=" + jqXHR.responseJSON.Message; window.location.href = mhRef;}
        }
    });



};

$(document).ajaxSend(function () {
    Swal({
        title: 'Consulta em andamento...',
        html: 'Por favor aguarde alguns instantes',
        type: 'success',
        showConfirmButton: false,
        allowOutsideClick: false,
        // imageUrl: 'assets/images/ajax-loader.gif'
    });
    swal.showLoading();


});


$(document).ajaxComplete(function () {

    swal.close();

});

$body = $("body");


$(document).ajaxSend(function () {
    Swal({
        title: 'Consulta em andamento...',
        html: 'Por favor aguarde alguns instantes',
        type: 'success',
        showConfirmButton: false,
        allowOutsideClick: false
    });
    swal.showLoading();


});


$(document).ajaxComplete(function () {

    swal.close();

});
