function htmlListaPrecos(lstPrecos, lstFieldSel) {
    var retorno = '';
    var htmlret = '';

    // alert( $("[id*=hddOmiteValoresReais]").val() );

    if ($("[id*=hddOmiteValoresReais]").val() == "0") {
        var ArrLista = jsStringToArray(lstPrecos, ",");
        //var Campos = jsStringToArray(lstFieldSel, ",");
        var Campos = "###";

        retorno = "";
        var vlrTotal = 0;
        var taxaConv = 0;
        var indTodos = Campos.indexOf("ZZZ");
        for (i = 0; i < ArrLista.length; i++) {

            var pos2p = ArrLista[i].indexOf(":");
            var pospv = ArrLista[i].indexOf(";");
            var posfc = ArrLista[i].indexOf("}");

            var codigo = ArrLista[i].substring(1, pos2p);
            var nome = ArrLista[i].substring(pos2p + 1, pospv);
            var preco = Number(ArrLista[i].substring(pospv + 1, posfc));

            if (codigo == "R$") {
                taxaConv = preco;
            }
            else {
                if (indTodos >= 0 || Campos.indexOf(codigo) >= 0) {

                    retorno = retorno + '<tr>';
                    retorno = retorno + '<td>' + nome + '</td>';

                    retorno = retorno + '<td>R$ ' + formatReal(preco * taxaConv) + '</td>';
                    retorno = retorno + '</tr>';

                    vlrTotal = vlrTotal + preco;
                }

            }
        }

        if (vlrTotal > 0) {

            htmlret = htmlret + '<h3 class="row-fluid header smaller lighter blue"><span>Custo da Listagem</span></h3>';
            htmlret = htmlret + '<table class="table table-striped table-bordered">';
            /* htmlret = htmlret + '<tr>';
            htmlret = htmlret + '<td><b class="red">CAMPO</b></td>';
            htmlret = htmlret + '<td><b class="red">CUSTO</b></td>';
            htmlret = htmlret + '</tr>';
            htmlret = htmlret + retorno */

            htmlret = htmlret + '<tr>';
            htmlret = htmlret + '<td><b>Custo por registro</b></td>';
            htmlret = htmlret + '<td><b>R$ ' + formatReal(vlrTotal * taxaConv) + '</b></td>';
            htmlret = htmlret + '</tr>';


            var qtdp = $("[id*=hddValorParc]").val();
            var qtd = qtdp.replace(/\./g, "");
            var qtdx = parseInt(qtd);
            var valorp = parseInt(qtd) * (vlrTotal * taxaConv);

            htmlret = htmlret + '<tr>';
            htmlret = htmlret + '<td><b>Quantidade de registros</b></td>';
            htmlret = htmlret + '<td><b>' + qtdp + '</b></td>';
            htmlret = htmlret + '</tr>';

            // htmlret = htmlret + '<div class="infobox infobox-red"><div class="infobox-chart"><span class="sparkline" data-values="196,128,202,177,154,94,100,170,224"><canvas width="44" height="27" style="display: inline-block; width: 44px; height: 27px; vertical-align: top;"></canvas></span></div>';
            // htmlret = htmlret + '<div class="infobox-data"><span class="infobox-data-number">R$ ' + formatReal(valorp) + '</span><div class="infobox-content">Custo para todos os registros</div></div>';

            if (valorp > 0) {
                htmlret = htmlret + '<tr>';
                htmlret = htmlret + '<td><b>Custo Total</b></td>';
                htmlret = htmlret + '<td><b>R$ ' + formatReal(valorp) + '</b></td>';
                htmlret = htmlret + '</tr>';
            }
            htmlret = htmlret + '</table>';

            if (valorp > 0) {
                htmlret = htmlret + '<h4 class="header red lighter smaller"><i class="ace-icon fa fa-retweet smaller-80"></i> COMPRAR QUANTIDADE: <input class="input-small input-mask-integer" size="10" type="text" onblur="atualiza()" id="TextCompra" placeholder="" value=' + qtdx + '></h4>';
                htmlret = htmlret + '<center> <a href="#modal-form" class="btn btn-block btn-primary" data-toggle="modal" id="confirma" onclick="validate()"><i class="ace-icon fa fa-shopping-cart bigger-110"></i><span> Comprar</span></a></center>'
            }


            htmlret = htmlret + '<hr><center><span style="font-size:10px">- Valores em Reais <br /> - Valor total referente a quantidade de todos os registros disponiveis.<br /> - A quantidade de registros pode ser alterada no campo acima ou confirmacao de seu pedido.</span></center>';



        }
    }
    else {

        var qtdp = $("[id*=hddValorParc]").val();
        var qtd = qtdp.replace(/\./g, "");
        var qtdx = parseInt(qtd);
        var valorp = parseInt(qtd) * (vlrTotal * taxaConv);

        htmlret = htmlret + '<h4 class="header red lighter smaller"><i class="ace-icon fa fa-retweet smaller-80"></i> EXPORTAR QUANTIDADE: <input class="input-small input-mask-integer" size="10" type="text" onblur="atualiza()" id="TextCompra" placeholder="" value=' + qtdx + '></h4>';
        htmlret = htmlret + '<center> <a href="#htmlLstPrecosEnriquecimento" class="btn btn-block btn-primary" data-toggle="modal" id="confirma" onclick="validate()"><i class="ace-icon fa fa-shopping-cart bigger-110"></i><span> Exportar</span></a></center>'


    }
    return htmlret
}



function jsStringToArray(expression, separator) {
  var ArrLista = new Array();
  while (expression.length > 0) {
      var position = expression.indexOf(separator);
      if (position < 0) {
          ArrLista.push(expression);
          expression = '';
      }
      else {
          ArrLista.push(expression.substring(0, position));
          expression = expression.substring(position + 1);
      }
  }
  return ArrLista
}

function formatReal(int) {
    var tmpNeg = int + '';
    var int = parseInt(int.toFixed(2).toString().replace(/[^\d]+/g, ''));
    var tmp = int + '';
    var neg = false;
    if (tmpNeg.indexOf("-") == 0) {
        neg = true;
        tmp = tmp.replace("-", "");
    }
    if (tmp.length == 1) tmp = "0" + tmp
    tmp = tmp.replace(/([0-9]{2})$/g, ",$1");
    if (tmp.length > 6)
        tmp = tmp.replace(/([0-9]{3}),([0-9]{2}$)/g, ".$1,$2");
    if (tmp.length > 9)
        tmp = tmp.replace(/([0-9]{3}).([0-9]{3}),([0-9]{2}$)/g, ".$1.$2,$3");
    if (tmp.length > 12)
        tmp = tmp.replace(/([0-9]{3}).([0-9]{3}).([0-9]{3}),([0-9]{2}$)/g, ".$1.$2.$3,$4");
    if (tmp.indexOf(".") == 0) tmp = tmp.replace(".", "");
    if (tmp.indexOf(",") == 0) tmp = tmp.replace(",", "0,");
    return (neg ? '-' + tmp : tmp);
};

function clickSelecao(dtSource, dtTarget, idSort, adSort) {

    if (dtSource.fnGetData().length > 0) {
        var $row = $(this);
        var addRow = dtSource.fnGetData(this);
        // Se o click foi no header da coluna, n„o h· transferÍncia a fazer (de cabeÁalho)
        if (!addRow == null) {
            dtTarget.fnAddData(addRow);

            var index = dtSource.fnGetPosition(this); // get the table index
            dtSource.fnDeleteRow(index);

            // reapply sort
            dtTarget.fnSort([[idSort, adSort]]); // sort call by Qtd Registros
        }
    }

    var Retorno = {}
    Retorno.dtSource = dtSource;
    Retorno.dtTarget = dtTarget;

};

 function procSelecao(dtTarget,idAcordion) {
   
   var slistId = '';
   var slistNome = '';
   for (var i = 0; i < tbOpCelTarget.fnGetData().length; i++) {
       listId = listId + ';' + tbOpCelTarget.fnGetData(i, 0);
       slistNome = slistNome + ';' + tbOpCelTarget.fnGetData(i, 1);
    };

   slistId = slistId.substring(1); // zero-based
   slistNome = slistNome.substring(1); // zero-based

    if (idAcordion != null) 
    {
       // Set Header background color
       if (listId == '') {
          // nada selecionado: cor cinza
         idAcordion.css("background-color","rgb(243,243,243)");
         }
      else
         {
          // algo selecionado: cor laranja
          idAcordion.css("background-color","rgb(153,255,153)");
         };
     }

  var Retorno = {};
  Retorno.Ids = slistId;
  Retorno.Nomes = slistNome;

  return Retorno;

};


/* FunÁıes para Alimentar as combos de modelo */
function AlimentaComboAno(varDiv, varId, varOnChange, AnoIni, AnoFim) {
    var divTbResult = varDiv;
    divTbResult.empty();

    var sTableHtml = '<select class = "form-control" id="' + varId + '"';
    if (!varOnChange == '') { sTableHtml += ' onchange="' + varOnChange + '"' };
    sTableHtml += '><option value="">&nbsp;</option>';

    while (AnoIni <= AnoFim) {
        sTableHtml += '<option value="' + AnoIni.toString() + '">' + AnoIni.toString() + '</option>';
        AnoIni = AnoIni + 1;
    }
    sTableHtml += '</select>';

    divTbResult.append(sTableHtml);

};

function opcTodoSelectionada(lstFieldSel) {
    var retorno = false;
    var Campos = jsStringToArray(lstFieldSel, ",");
    retorno = (Campos.indexOf("ZZZ") >= 0);
    //alert(retorno);
    return retorno;
};

function ClienteSelecionado(pCodigo) {
    document.getElementById('txtCodigo').value = pCodigo;
    SearchCliente();
}   


function SearchCliente() {

    // Set input parameters
    var oPesquisa = {};
    oPesquisa.ListaCPFCNPJ = document.getElementById('txtCliCNPJ').value.replace(/[^0-9]/g, '');
    oPesquisa.Cli_id = document.getElementById('txtCodigo').value;

    $.ajax({

        url: "PesquisaBase.aspx/wmObterDataCliPJbyCNPJ",

        data: JSON.stringify({ 'oInputPesquisa': oPesquisa }),

        contentType: "application/json; charset=utf-8",
        dataType: "json",

        type: "POST",
        success: function (data) {

            // get return object values
            var oSearchReturn = data.d;

            if (oSearchReturn.msgErro.length > 0) {
                ModalMessage(oSearchReturn.msgErro)
            }
            else {
                document.getElementById('txtCodigo').value = oSearchReturn.codigo;
                document.getElementById('txtCliCNPJ').value = oSearchReturn.cliCNPJ;
                document.getElementById('txtCliRazao').value = oSearchReturn.cliRazao;
                document.getElementById('txtCliFant').value = oSearchReturn.cliFant;
                document.getElementById('txtContato').value = oSearchReturn.contato;
                document.getElementById('txtTelefone').value = oSearchReturn.telefone;
                document.getElementById('txtCliEndLgr').value = oSearchReturn.cliEndLgr;
                document.getElementById('txtCliEndNro').value = oSearchReturn.cliEndNro;
                document.getElementById('txtCliEndCpl').value = oSearchReturn.cliEndCpl;
                document.getElementById('txtCliEndBai').value = oSearchReturn.cliEndBai;
                document.getElementById('txtCliEndCep').value = oSearchReturn.cliEndCep;
                document.getElementById('txtCliEndMun').value = oSearchReturn.cliEndMun;
                document.getElementById('txtCliEndUF').value = oSearchReturn.cliEndUF;
                document.getElementById('txtEmail').value = oSearchReturn.cliEmail;

                $("#idCliente2").val(oSearchReturn.codigo).trigger("chosen:updated");

                document.getElementById('txtCliRazao').disabled = (!(oSearchReturn.codigo == ""));
                document.getElementById('txtCliFant').disabled =  (!(oSearchReturn.codigo == ""));
                document.getElementById('txtContato').disabled =  (!(oSearchReturn.codigo == ""));
                document.getElementById('txtTelefone').disabled =  (!(oSearchReturn.codigo == ""));
                document.getElementById('txtCliEndLgr').disabled = (!(oSearchReturn.codigo == ""));
                document.getElementById('txtCliEndNro').disabled =  (!(oSearchReturn.codigo == ""));
                document.getElementById('txtCliEndCpl').disabled =  (!(oSearchReturn.codigo == ""));
                document.getElementById('txtCliEndBai').disabled =  (!(oSearchReturn.codigo == ""));
                document.getElementById('txtCliEndCep').disabled =  (!(oSearchReturn.codigo == ""));
                document.getElementById('txtCliEndMun').disabled =  (!(oSearchReturn.codigo == ""));
                document.getElementById('txtCliEndUF').disabled =  (!(oSearchReturn.codigo == ""));
                document.getElementById('txtEmail').disabled = (!(oSearchReturn.codigo == ""));


            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            ModalMessage(jqXHR.responseText);
        }
    });
};


function LimparCliente() {

    document.getElementById('txtCodigo').value = "";
    document.getElementById('txtCliCNPJ').value = "";
    document.getElementById('txtCliRazao').value = "";
    document.getElementById('txtCliFant').value = "";
    document.getElementById('txtContato').value = "";
    document.getElementById('txtTelefone').value = "";
    document.getElementById('txtCliEndLgr').value = "";
    document.getElementById('txtCliEndNro').value = "";
    document.getElementById('txtCliEndCpl').value = "";
    document.getElementById('txtCliEndBai').value = "";
    document.getElementById('txtCliEndCep').value = "";
    document.getElementById('txtCliEndMun').value = "";
    document.getElementById('txtCliEndUF').value = "";
    document.getElementById('txtEmail').value = "";

    $("#idCliente2").val("").trigger("chosen:updated");

    document.getElementById('txtCliRazao').disabled = false;
    document.getElementById('txtCliFant').disabled = false;
    document.getElementById('txtContato').disabled = false;
    document.getElementById('txtTelefone').disabled = false;
    document.getElementById('txtCliEndLgr').disabled = false;
    document.getElementById('txtCliEndNro').disabled = false;
    document.getElementById('txtCliEndCpl').disabled = false;
    document.getElementById('txtCliEndBai').disabled = false;
    document.getElementById('txtCliEndCep').disabled = false;
    document.getElementById('txtCliEndMun').disabled = false;
    document.getElementById('txtCliEndUF').disabled = false;
    document.getElementById('txtEmail').disabled = false;

    $("[id*=hddCli_id]").val("0");
    $("[id*=hddTipoContrato]").val("0");

    var divNomeCliente = $("#divNomeCliente");
    divNomeCliente.empty();
   /* var xhtml = '<center><label><strong>   ' + mCodCli + ' - ' + mNomCli + '(' + mdscTipoContrato + ') </strong></label></center>'
    divNomeCliente.append(xhtml);*/

    document.getElementById('btnClosedivCliente').click();



}


function validUpdateCli() {

    // Set input parameters
    var oCliente = {};

    oCliente.cliCNPJ = document.getElementById('txtCliCNPJ').value.replace(/[^0-9]/g, '');
    oCliente.cliRazao = document.getElementById('txtCliRazao').value;
    oCliente.cliFant = document.getElementById('txtCliFant').value;
    oCliente.contato = document.getElementById('txtContato').value;
    oCliente.telefone = document.getElementById('txtTelefone').value;
    oCliente.cliEndLgr = document.getElementById('txtCliEndLgr').value;
    oCliente.cliEndNro = document.getElementById('txtCliEndNro').value;
    oCliente.cliEndCpl = document.getElementById('txtCliEndCpl').value;
    oCliente.cliEndBai = document.getElementById('txtCliEndBai').value;
    oCliente.cliEndCep = document.getElementById('txtCliEndCep').value;
    oCliente.cliEndMun = document.getElementById('txtCliEndMun').value;
    oCliente.cliEndUF = document.getElementById('txtCliEndUF').value;
    oCliente.cliEmail = document.getElementById('txtEmail').value;
    oCliente.codigo = document.getElementById('txtCodigo').value;

    $.ajax({

        url: "PesquisaBase.aspx/wmValidUpdateCli",

        data: JSON.stringify({ 'oCliente': oCliente }),

        contentType: "application/json; charset=utf-8",
        dataType: "json",

        type: "POST",
        success: function (data) {

            // get return object values
            var oSearchReturn = data.d;
            var mCodCli = oSearchReturn.codigo;
            var mNomCli = oCliente.cliRazao;
            var mTipoContrato = oSearchReturn.TipoContrato;
            var mdscTipoContrato = oSearchReturn.dscTipoContrato;

            if (oSearchReturn.status == 0) {
                if (!(oSearchReturn.msgRetorno == ""))
                    ModalMessage(oSearchReturn.msgRetorno);

                $("[id*=hddCli_id]").val(mCodCli);
                $("[id*=hddTipoContrato]").val(mTipoContrato);

                var divNomeCliente = $("#divNomeCliente");
                divNomeCliente.empty();
                var xhtml = '<center><label><strong>   ' + mCodCli + ' - ' + mNomCli + '(' +mdscTipoContrato + ') </strong></label></center>'
                divNomeCliente.append(xhtml);

               
            }
            else {
                ModalMessage(oSearchReturn.msgRetorno);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            ModalMessage(jqXHR.responseText);
        }
    });
};

function loadProposta() {

    document.getElementById('txtPropRazCli').value = document.getElementById('txtCliRazao').value;
    document.getElementById('txtPropContato').value = document.getElementById('txtContato').value;
    document.getElementById('txtPropEmail1').value = document.getElementById('txtEmail').value;

    /*var divPreco = document.getElementById('divPrecos').innerHTML;
    var nPos = divPreco.indexOf('</table>');
    if (nPos >= 0)
        divPreco = divPreco.substr(0, nPos + 8);

    var nPos = divPreco.indexOf('<table>');
    if (nPos >= 0)
        divPreco = divPreco.substr(nPos + 7);

    var filtros = HtmlTextoFiltros(textoFiltros());
    
    var mCorpo = '<label class="text blue bolder">Filtros:</label>' + filtros + htmlContagem + divPreco;

    var divCorpoProp = $("#divCorpoProp");
    divCorpoProp.empty();
    divCorpoProp.append(mCorpo);*/

};

function trataAcentuacao(strToReplace) {

    strSChar = "·‡„‚‰ÈËÍÎÌÏÓÔÛÚıÙˆ˙˘˚¸Á¡¿√¬ƒ…» ÀÕÃŒœ”“’÷‘⁄Ÿ€‹«";
    strNoSChars = "aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC";
    var newStr = "";
    for (var i = 0; i < strToReplace.length; i++) {
        if (strSChar.indexOf(strToReplace.charAt(i)) != -1) {
            newStr += strNoSChars.substr(strSChar.search(strToReplace.substr(i, 1)), 1);
        } else {
            newStr += strToReplace.substr(i, 1);
        }
    }

    return foldToASCII(newStr).toUpperCase();
};

function sendproposta(tipoPessoa,pIdTipoRegistro) {

    if ($("[id*=hddCli_id]").val() == "" || $("[id*=hddCli_id]").val() == "0") {
        ModalMessage('Por Favor, Selecione Primeiramente um Cliente para Gerar Proposta');
        return;
    }

   if ($("[id*=hddQtdRegExp]").val() == "" || $("[id*=hddQtdRegExp]").val() == "0") {
        ModalMessage('Contagem Nao Realizada ou Contagem Nao Retornou Registros');
        return;
    }
    
    var iReg = 0;
    var dtSource = $('#tbContagem').dataTable();

    if (dtSource.fnGetData(0) == null) {
        ModalMessage('Contagem Nao Realizada ou Contagem Nao Retornou Registros');
        return;
    }

    var mseqFields = dtSource.fnGetData(0).seqFields.split(",");
    var mseqHeader = dtSource.fnGetData(0).seqHeader.split(",");

    var htmlContagem = '<table style="width:60%"><tr style="background: #eee;">';
    for (i = 0; i < mseqHeader.length; i++) {
        htmlContagem = htmlContagem + '<th>' + mseqHeader[i] + '</th>';
    }
    htmlContagem = htmlContagem + '</tr>';

    while (dtSource.fnGetData().length > 0) {
        var oRow = dtSource.fnGetData(iReg);

        if (oRow == null)
            break;

        if (iReg % 2 == 0)
            htmlContagem = htmlContagem + "<tr style='background: #ACDCFA;'>";
        else
            htmlContagem = htmlContagem + "<tr style='background: #eee;'>";
          
        for (i = 0; i < mseqFields.length; i++) {
            htmlContagem = htmlContagem + '<td>' + eval('oRow.' + mseqFields[i]) + '</td>';
        }
        htmlContagem = htmlContagem + '</tr>';

        iReg = iReg + 1;

    }


    var oProposta = {};
    oProposta.idContagem = $("[id*=hddIdPesquisa]").val();
    oProposta.qtdRegistros = parseInt($("[id*=hddQtdRegExp]").val());
    oProposta.vlrUniRegistro = 0;
    oProposta.dstEmail1 = document.getElementById('txtPropEmail1').value;
    oProposta.dstEmail2 = ''; /* document.getElementById('txtPropEmail2').value;*/
    oProposta.htmlFiltros = HtmlTextoFiltros(textoFiltros());
    oProposta.htmlContagem = htmlContagem;
    oProposta.nroProsta = "";
    oProposta.Cli_id = $("[id*=hddCli_id]").val();
    oProposta.idusuario = $("[id*=hddIdUsuario]").val();
    oProposta.tipoPessoa = tipoPessoa;
    oProposta.idTipoRegistro = pIdTipoRegistro; 
    
    oProposta.obs = document.getElementById('txtpropObs').value;
    oProposta.diasPag = document.getElementById('cboDiasPag').value;

    if (document.getElementById('chkEnviaBoleto').checked)
        oProposta.enviaBoleto = 1;
    else
        oProposta.enviaBoleto = 0;


    $.ajax({

        url: "PesquisaBase.aspx/wmSendProposta",

        data: JSON.stringify({ 'oContagem': oProposta }),

        contentType: "application/json; charset=utf-8",
        dataType: "json",

        type: "POST",
        success: function (data) {

            // get return object values
            var mProposta = data.d;

            ModalMessage("Enviada Proposta " + mProposta);

            },

        error: function (jqXHR, textStatus, errorThrown) {
            ModalMessage(jqXHR.responseText);
        }
    });

}



