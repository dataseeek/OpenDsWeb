<%@ Page validateRequest="false" Title="" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="Consulta.aspx.cs" Inherits="OpenDsWeb.Consulta" %>
<%@ MasterType virtualpath="Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 
  <style>
  
   input[type=text], input[type=url], input[type=email], input[type=password], input[type=tel] {
  -webkit-appearance: none; -moz-appearance: none;
  display: block;
  margin: 0;
  width: 100%; height: 40px;
  line-height: 40px; font-size: 17px;
  border: 1px solid #bbb;
  }


  my-body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            position: relative;
            /* Ensure positioning relative for absolute tooltips */
        }


      .circle {
          width: 90px;
          height: 90px;
          border-radius: 50%;
          display: inline-flex;
          justify-content: center;
          align-items: center;
          margin: 10px;
          position: absolute;
          cursor: pointer;
          transition: transform 0.3s ease;
          transition: left 0.05s, top 0.05s;
      }

          .circle img {
              max-width: 100%;
              max-height: 100%;
          }

        .tool-tip {
            position: absolute;
            padding: 8px;
            margin-top: -20px;
            font-size: 1em;
            background: #ddd;
            position: absolute;
            border-radius: 5px;
            pointer-events: none;
            /* Prevent the tooltip from being interactive */
            opacity: 0;
            transition: opacity 0.3s;
        }

        .tool-tip mark {
            font-weight: 600;
            margin-left: 0.2em;
            background-color: transparent;
            color: inherit !important;
        }

        .tool-tip span {
            display: block;
        }

    </style>

      <!-- D3 js
            <script src="assets/js/d3.v7.js"></script> 
           <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/4.9.1/d3.min.js"></script>
          -->
    <script src="https://unpkg.com/d3@5.9.7/dist/d3.min.js"></script>
   
   
       
    
 <!-- CSS ESPECIFICO DA PAGINA  -->

   
    

        <link href="assets/libs/jquery-nice-select/nice-select.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/switchery/switchery.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/multiselect/multi-select.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/select2/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/switchery/switchery.min.css" rel="stylesheet" type="text/css">
        <link href="assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css">
        <link href="assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css">
        <link href="assets/libs/jquery-toast/jquery.toast.min.css" rel="stylesheet" type="text/css" />


          <!-- Custom box css -->
        <link href="assets/libs/custombox/custombox.min.css" rel="stylesheet"> 

        <!-- App css -->
     
         <link href="assets/css/bootstrap5.min.css" rel="stylesheet" type="text/css" / >
    <link href="assets/css/app.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/icons.css" rel="stylesheet" type="text/css" />
   

    <br />

<div class="col-md-12" id="body">
    <div class="card-box">
      <div class="row">
        
   <ul class="nav nav-tabs nav-bordered">
	 <li class="nav-item"><a href="#cnpj" data-toggle="tab" class="nav-link active"><i class="mdi mdi-code-equal"></i> CNPJ</a></li>
     <li class="nav-item"><a href="#razao" data-toggle="tab" class="nav-link"><i class="mdi mdi-domain"></i> Razão Social/Nome Fantasia</a></li>
   </ul>
         
     </div>


       <div class="row">
           <div class="tab-content" style="width: 99%;">
              <div class="tab-pane in active" id="cnpj">
         <div class="col-md-5">
                                        <div class="form-group mb-3">
                                           <label><b>Consulta por CNPJ</b></label>
                                                <div class="input-group">
                                                    <input type="text" id="txtCNPJ" class="form-control" data-mask-format="00.000.000/0000-00"  data-reverse="true" maxlength="18" data-toggle="input-mask"  placeholder="Digite o CNPJ aqui..." aria-label="Digite o CNPJ aqui...">
                                                    <div class="input-group-append">
                                                        <button class="btn btn-success waves-effect waves-light" id="btnCNPJ" type="button" onclick="Pesquisar(2,'','','');">Consultar</button>
                                                    </div>
                                                </div>
                                            </div>         
                              </div> 
      </div>
              <div class="tab-pane" id="razao">
         <div class="row">
           <div class="col-md-5">
                                        <div class="form-group mb-3">
                                           <label><b>Consulta por Razão Social ou Nome Fantasia</b></label>
                                                <div class="input-group">
                                                    <input type="text" id="txtRazao" class="form-control"  placeholder="Digite a Razão social ou parte dela..." aria-label="Digite a Razão social ou parte dela.....">
                                                    <div class="input-group-append">
                                                        <button class="btn btn-success waves-effect waves-light" id="btnRazao" type="button" onclick="Pesquisar(7,'','','');">Consultar</button>
                                                    </div>
                                                </div>
                                            </div>         
                              </div>  

           
          
             <div class="col-md-1"></div>
               <div class="col-md-3">
             <label for="cboUFRazao"><b>Opcional: UF</b></label><br />
             <select name="state" class="form-control" data-toggle="select2" id="cboUFRazao" runat="server" onchange="SetValor(4,this.value);">
			   <option value="">&nbsp;</option>
			   <option value="AC">AC</option>
			   <option value="AL">AL</option>
			   <option value="AM">AM</option>
			   <option value="AP">AP</option>
			   <option value="BA">BA</option>
			   <option value="CE">CE</option>
			   <option value="DF">DF</option>
			   <option value="ES">ES</option>
			   <option value="GO">GO</option>
			   <option value="MA">MA</option>
			   <option value="MG">MG</option>
			   <option value="MT">MT</option>
			   <option value="MS">MS</option>
			   <option value="PA">PA</option>
			   <option value="PB">PB</option>
			   <option value="PE">PE</option>
			   <option value="PR">PR</option>
			   <option value="PI">PI</option>
			   <option value="RJ">RJ</option>
			   <option value="RN">RN</option>
			   <option value="RO">RO</option>
			   <option value="RR">RR</option>
			   <option value="RS">RS</option>
			   <option value="SE">SE</option>
			   <option value="SP">SP</option>
			   <option value="SC">SC</option>
			   <option value="TO">TO</option>
			</select>
           
           </div>
         </div>

      </div>
           </div>
       </div>
    </div>
    <div class="col-md-12">
        <div class="row">
           <div class="col-md-12"  id="resultAjax"></div>
        </div>
    </div>
  </div>

  <asp:HiddenField ID="hddIdPesquisa" runat="server"/>
  <asp:HiddenField ID="hddTipoArquivo" runat="server"/>

  <asp:HiddenField ID="hddTipoContrato" runat="server"/>
  <asp:HiddenField ID="hddQtdMaxPesq" runat="server"/>
  <asp:HiddenField ID="hddTpLimPesq" runat="server"/>
  <asp:HiddenField ID="hddQtdMaxExp" runat="server"/>
  <asp:HiddenField ID="hddTpLimExp" runat="server"/>

  <asp:HiddenField ID="hddIP"        runat="server" />
  <asp:HiddenField ID="hddCidade" runat="server" />
  <asp:HiddenField ID="hddEstado" runat="server" />
  <asp:HiddenField ID="hddCidPJ" runat="server" />
  <asp:HiddenField ID="hddUFPJ" runat="server" />
  <asp:HiddenField ID="hddContadoResult" runat="server" />
  <asp:HiddenField ID="hddPagAtual" runat="server" />
  <asp:HiddenField ID="hddHTMLConsulta" runat="server" />
  <asp:HiddenField ID="hddNetwork" runat="server"/>
  <asp:HiddenField ID="hddJson" runat="server"/>
  <asp:HiddenField ID="hddCNPJ" runat="server"/>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        
   <script src="assets/js/vendor.min.js"></script>
          

             
       <script src="assets/js/chosen.jquery.min.js" type="text/javascript"></script>
       <script src="assets/js/jquery.autosize.min.js" type="text/javascript"></script>
       <script src="assets/js/jquery.inputlimiter.1.3.1.min.js" type="text/javascript"></script>
       <script src="assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
       <script src="assets/js/jquery.dataTables.bootstrap.js" type="text/javascript"></script>
       <script src="assets/js/jquery.maskMoney.js" type="text/javascript"></script>   
        
      
          <!-- Sweet Alert-->
        <link href="assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />
		
		 <!-- Sweet Alerts js -->
        <script src="assets/libs/sweetalert2/sweetalert2.min.js" type="text/javascript"></script>

        <!-- Sweet alert init js-->
        <script src="assets/js/pages/sweet-alerts.init.js"></script>
        
        <!-- Modal-Effect -->
       <script src="assets/libs/custombox/custombox.min.js"></script>
            
   		        
       <!-- Filipe 09/08/2014: datatables translation -->
       <script src="assets/js/dataTables-pt-br.js" type="text/javascript"></script>

        <!-- Scripts template antigo necessários  -->
        <script src="assets/js/Mascara.js" type="text/javascript"></script>
		<script src="assets/js/AppFunctions.js" type="text/javascript"></script>
        <script src="assets/js/fold-to-ascii.js" type="text/javascript"></script>
        

    <!-- JS COMUNS -->
    <script src="assets/js/jquery.autosize.min.js" type="text/javascript"></script>
      <script src="assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
	  <script src="assets/js/bootbox.min.js" type="text/javascript"></script>
	  <script src="assets/libs/multiselect/jquery.multi-select.js"></script>
      <script src="assets/libs/select2/select2.min.js"></script>
      <script src="assets/libs/bootstrap-select/bootstrap-select.min.js"></script> 
      <script src="assets/libs/dropzone/dropzone.min.js"></script>
      <script src="assets/libs/dropify/dropify.min.js"></script>
      <script src="assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
      <script src="assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
      <script src="assets/libs/jquery-nice-select/jquery.nice-select.min.js"></script>
       <script src="assets/libs/pdfmake/pdfmake.min.js"></script>
       <script src="assets/libs/pdfmake/vfs_fonts.js"></script>
      
      <script src="assets/libs/autocomplete/jquery.autocomplete.min.js"></script>
       <script src="assets/libs/flatpickr/flatpickr.min.js"></script>
      <script src="assets/libs/bootstrap-colorpicker/bootstrap-colorpicker.min.js"></script>
      <script src="assets/libs/clockpicker/bootstrap-clockpicker.min.js"></script>
      <script src="assets/js/jquery.maskedinput.min.js" type="text/javascript"></script>
      <script src="assets/libs/jquery-toast/jquery.toast.min.js"></script>
      <script src="assets/libs/parsleyjs/parsley.min.js"></script>
      <!-- Plugins js -->
        <script src="assets/libs/jquery-mask-plugin/jquery.mask.min.js"></script>
        <script src="assets/libs/autonumeric/autoNumeric-min.js"></script>
    
    <!-- Plugin js-->
       <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.min.js"></script>

        <!-- Validation init js
        <script src="assets/js/pages/form-validation.init.js"></script> -->
      
        <script src="assets/js/pages/toastr.init.js"></script>
     
       <!-- Init js-->
        <script src="assets/js/pages/form-masks.init.js"></script>

      <script src="assets/js/pages/form-advanced.init.js"></script> 

     <!-- network graph js  e css -->
    <script src="https://unpkg.com/d3@5.9.7/dist/d3.min.js"></script>
    <link rel="stylesheet" href="assets/css/network-graph.css" />
    <script src="assets/js/network-graph.js?v=09042024a"></script>

    <script type="text/javascript">
       function checkChanged(element) {

                                        
                      if (element.checked == true ) {

                          $("#btnCPF").prop('disabled', false);

                          $('#txtCPF').keypress(function (e) {
                              if (e.keyCode == 13)
                                  $('#btnCPF').click();
                          });

                        
                      } else {
                          $("#btnCPF").prop('disabled', true);
                        
                          $("#chkOk").prop('checked', false);
                      };
                  }
     </script>

 	 <script type="text/javascript">
        jQuery(function($) {
		 $.mask.definitions['#']='[ 0123456789]';
				$('.input-mask-cpf').mask('999.999.999-99');
				$('.input-mask-foneBrasil').mask('(99) 99999999#');
                $('.input-mask-cnpj').mask('99.999.999/9999-99');
             
        }) ;

        $(function () {
            $("#txtNroIni").maskMoney({ symbol: 'R$ ', thousands:'.',
                showSymbol: false, precision: 0
            });

            $("#txtNroFim").maskMoney({ symbol: 'R$ ', thousands: '.',
                showSymbol: false, precision: 0
            });
        });


        function SetValor(id, data) {
            if (id == 1)
                $("[id*=hddCidade]").val(data);
            else if (id == 2)
                $("[id*=hddEstado]").val(data);
            else if (id == 3)
                $("[id*=hddCidPJ]").val(data);
            else if (id == 4)
                $("[id*=hddUFPJ]").val(data);

        }


            function RegistraCall(tel) {

                if (!(tel == ''))

                {
                    alert(tel);
                    location.href = 'tel:' + tel;


                };

                

            }

             function Pesquisar(tipoPesquisa, pDocumento, pNomeCep, pNro) {


    var mNextPage = 0;
    var CEP = "";
    var Nome = "";
    var Cidade = "";
    var Estado = "";
    var nTipoPessoa = "2";
    var Documento = "";
    var Renavam = "";
    var nroIni = "";
    var nroFim = "";
  
    var addhistoricoPage = 1;
    var addBrancos = 1;
    var mEmail = "";
    var mSite = "";
    var mTagScroll = "";
    if (pDocumento == "" || pNomeCep == "" || pNro == "")
        addBrancos = 0;

    switch (tipoPesquisa) {
        case 2: //CNPJ
            {
                var nTipoPessoa = "1";
                var Documento;

                if (pDocumento.length > 0) {
                    Documento = pDocumento;
                    
                }
                else {
                    console.log($('#txtCNPJ').val());
                    if ($('#txtCNPJ').val() == "") {
                        alert("CNPJ Não Informado!");
                        return;
                    }

                    if (($('#txtCNPJ').val().length > 0) && !validarCNPJ($('#txtCNPJ').val())) {
                        alert("CNPJ Inválido!");
                        return
                    }
                    Documento = $('#txtCNPJ').val();
                }
                
            }
            break;

        case 7: //Razão Social

            {
                if ($('#txtRazao').val() == "") {
                    alert("Razão Social Não Informada!");
                    return;
                }

                if ($('#txtRazao').val().length < 3) {
                    alert("Informe no Mínimo 3 Caracteres para Razão Social!");
                    return;
                }


                var nTipoPessoa = "1";
                var Nome = $('#txtRazao').val();
                var Cidade = $("[id*=hddCidPJ]").val();
                var Estado = $("[id*=hddUFPJ]").val();
            }
            break;



        default:
            {
                var nTipoPessoa = "2";
                var Documento = "";
            }
    }

    var oPesquisa = {};    
    
    oPesquisa.ListaCPFCNPJ = Documento.replace(/[^\d]+/g, '');
    oPesquisa.Nome = Nome;
    oPesquisa.TipoPessoa = nTipoPessoa;
    oPesquisa.IdParametros = tipoPesquisa;
    oPesquisa.Cidade = Cidade;
    oPesquisa.Estado = Estado;

 
    $.ajax({

        url: "Consulta.aspx/doSearch",

        data: JSON.stringify({ 'oInputPesquisa': oPesquisa }),
        contentType: "application/json",
        dataType: "json",       
        type: "POST",
        global: false,
        success: function (data) {

       
            var oSearchReturn = data.d;

            if (oSearchReturn.status == 0) {
                bootbox.confirm(oSearchReturn.msgRetorno, function (result) {
                    if (result) {
                        Pesquisar(3);   }
                });
            }
            else if (oSearchReturn.status < 0)
            { alert(oSearchReturn.msgRetorno); }
            else {

                // clean HTML 
                // var divResultPesquisa = $("#resultAjax");
                // divResultPesquisa.empty();

                var divParViz = "</br><div class='row' id='Vizinhos-Parentes-"
                if (oSearchReturn.idHTML == 2) {
                    mNextPage = parseInt($("[id*=hddContadoResult]").val()) + 1;
                    divParViz += mNextPage.toString();
                }
                else {
                    divParViz += $("[id*=hddPagAtual]").val();

                }
                divParViz += "'>";


                // FORMATAR RESULTADO CONFORME TIPO DE PESQUISA
                switch (oSearchReturn.idHTML) {
                    case 1: // CNPJ
                        $('#network').html(data);
                        var sTableHtml = HTMLConsultaCNPJ(oSearchReturn.lstRows, oSearchReturn.lstVinc, oSearchReturn.lstCNAEs );
                        break;
                    case 4: // Lista de PJ
                        var sTableHtml = HTMListaPJ(oSearchReturn.lstRows);
                        break;
                    default:
                        var sTableHtml = "";
                        break;
                }

                $("[id*=hddIdPesquisa]").val(oSearchReturn.idPesquisa);

                


                var mContador = parseInt($("[id*=hddContadoResult]").val()) + addhistoricoPage;
                var mHTMLNext = "";

                if (addhistoricoPage > 0) {
                    $("[id*=hddContadoResult]").val(mContador.toString());
                    $("[id*=hddPagAtual]").val(mContador.toString());

                    var mIdResult = "[PAGINA-" + mContador.toString() + "]";
                }
                else {
                    var mIdResult = "";

                    /*
                    mNextPage = parseInt($("[id*=hddPagAtual]").val()) + 1;
                    var mStrNextPage = "[PAGINA-" + mNextPage.toString() + "]";

                    alert("Next Page: [" + mStrNextPage + "]");
                    */

                    var nPosNextPage = $("[id*=hddHTMLConsulta]").val().indexOf(divParViz);

                    // alert(nPosNextPage);

                    if (nPosNextPage >= 0) {
                        mHTMLNext = $("[id*=hddHTMLConsulta]").val().substr(nPosNextPage);

                        var nPosRemove = mHTMLNext.indexOf("</button></div></div>");

                        if (nPosRemove >= 0) {
                            mHTMLNext = mHTMLNext.substr(nPosRemove + 21);
                        }


                        $("[id*=hddHTMLConsulta]").val($("[id*=hddHTMLConsulta]").val().substr(0, nPosNextPage));
                    }
                }

                $("[id*=hddHTMLConsulta]").val($("[id*=hddHTMLConsulta]").val() + mIdResult + sTableHtml + mHTMLNext);

                // divResultPesquisa.append(mDivResult + sTableHtml + mBrancos + mBrancos + mBrancos + "</div>");


                rolaScroll(parseInt($("[id*=hddPagAtual]").val()));

                botoesNav();

                if (!mTagScroll == "") {
                    var nTopx = document.getElementById(mTagScroll).offsetTop;
                    document.getElementById(mTagScroll).scrollTop = nTopx;
                }

                $("[id*=btnExcel]").removeAttr("disabled");
                $("[id*=btnCSV]").removeAttr("disabled");
                $("[id*=btnTXT]").removeAttr("disabled");

                /*
                if (mTagScroll == "") {
                    var coordenada = $('#divsaldoCliente').offset().top;
                    $('body,html').animate({ scrollTop: coordenada }, 400);
                }
                */
            }

        }
                ,
        error: function (jqXHR, textStatus, errorThrown) {
            var mhRef = '/Login.aspx?erro=TIPOEXCESSOAINVALIDO' + "&msg=" + 'jqXHR.responseJSON.ExceptionType IS NULL'; if (jqXHR.responseJSON.ExceptionType != null) { mhRef = '/Login.aspx?erro=' + jqXHR.responseJSON.ExceptionType + "&msg=" + jqXHR.responseJSON.Message; window.location.href = mhRef;}
        }

    });

    if (!(tipoPesquisa == 9))
         { $(this).scrollTop(10); }
     
         
 }
                               
             function HTMLConsultaCNPJ(oRegistrosPJ,oRegVinc,oRegCNAEs) {

     var cHTML = "";

     
    
     

     for (var i = 0; i < oRegistrosPJ.length; i++) {

         
               

         var mCnpjAtual = oRegistrosPJ[i].cnpj.trim();

         cHTML += '<div class="col-md-12"><div class="card-box ribbon-box"><div class="row"><div id="navegacao"></div></div><div class="ribbon ribbon-primary float-left"><i class="mdi mdi-alert-circle-outline"></i><span> ' + oRegistrosPJ[i].razao.trim() + '</span></div><div class="ribbon-content">';
         cHTML += '<a href="#"   onclick="window.print()" value="PDF"><img style="width:50px"  src="assets/img/pdf-download.png" /> </a>';

         if (!(oRegistrosPJ[i].situacao.trim() == 'ATIVA'))
             cHTML += "<button type='button' class='btn btn-danger waves-effect waves-light'><span class='btn-label'><i class='mdi mdi-alert-circle-outline'></i> EMPRESA " + oRegistrosPJ[i].situacao.trim() + "</button><br /><br />";
         else
             cHTML += "<button type='button' class='btn btn-success waves-effect waves-light'><span class='btn-label'><i class='mdi mdi-check-circle-outline'></i> EMPRESA " + oRegistrosPJ[i].situacao.trim() + "</button><br /><br />";

         cHTML += '</div> ';


         // Formulário Linha 1

         cHTML += ' <div class="row g-2">'

         cHTML += '<div class="col-md-4"> <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputCNPJ" value="';

         if (!(oRegistrosPJ[i].cnpj == '')) { cHTML += oRegistrosPJ[i].cnpj.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputCNPJ" style="font-size: 16px;">CNPJ</label></div></div>';

         cHTML += '<div class="col-md-8">  <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputNome" value="';

         if (!(oRegistrosPJ[i].razao == '')) { cHTML += oRegistrosPJ[i].razao.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputNome" style="font-size: 16px;"> Razão Social </label> </div> </div> </div>    <br /> ';



         // Formulário Linha 2

         cHTML += ' <div class="row g-2">'

         cHTML += '<div class="col-md-4">  <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputIE" value="';

         if (!(oRegistrosPJ[i].ie == '')) { cHTML += oRegistrosPJ[i].ie.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputIE" style="font-size: 16px;"> Inscrição Estadual </label> </div> </div>   ';

         cHTML += '<div class="col-md-8"> <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputFant" value="';

         if (!(oRegistrosPJ[i].fantasia == '')) { cHTML += oRegistrosPJ[i].fantasia.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputFant" style="font-size: 16px;">Nome Fantasia</label></div></div></div> <br /> ';





         // Formulário Linha 3

         cHTML += ' <div class="row g-3">'

         cHTML += '<div class="col-md-4"> <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputAbertura" value="';

         if (!(oRegistrosPJ[i].abertura == '')) { cHTML += oRegistrosPJ[i].abertura.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inpuAbertura" style="font-size: 16px;">Data de Abertura</label></div></div>';


         cHTML += '<div class="col-md-4"> <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputMei" value="';

         if (!(oRegistrosPJ[i].mei == '')) { cHTML += oRegistrosPJ[i].mei.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inpuMei" style="font-size: 16px;">MEI</label></div></div>';



         cHTML += '<div class="col-md-4">  <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputDS" value="';

         if (!(oRegistrosPJ[i].data_situacao == '')) { cHTML += oRegistrosPJ[i].data_situacao.trim() + ' - ' + oRegistrosPJ[i].motivo_situacao.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputDS" style="font-size: 16px;"> Data Situação e Motivo </label> </div> </div> </div>    <br />     ';



         // Formulário Linha 4

         cHTML += ' <div class="row g-2">'

         cHTML += '<div class="col-md-6"> <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputSetor" value="';

         if (!(oRegistrosPJ[i].setor == '')) { cHTML += oRegistrosPJ[i].setor.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputSetor" style="font-size: 16px;">Setor</label></div></div>';



         cHTML += '<div class="col-md-6">  <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputFunc" value="';

         if (!(oRegistrosPJ[i].nrofuncionario == '')) { cHTML += oRegistrosPJ[i].nrofuncionario.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputFunc" style="font-size: 16px;"> # Funcionários </label> </div> </div> </div>       <br />  ';


         // Formulário Linha 5

         cHTML += ' <div class="row g-2">'

         cHTML += '<div class="col-md-6"> <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputmtz" value="';

         if (!(oRegistrosPJ[i].mtz == '')) { cHTML += oRegistrosPJ[i].mtz.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputmtz" style="font-size: 16px;"> Tipo </label></div></div>';



         cHTML += '<div class="col-md-6">  <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputFiliais" value="';

         if (!(oRegistrosPJ[i].filiais == '')) { cHTML += oRegistrosPJ[i].filiais.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputFiliais" style="font-size: 16px;"> # Filiais </label> </div> </div> </div>      <br />  ';


         // Formulário Linha 6

         cHTML += ' <div class="row g-2">'

         cHTML += '<div class="col-md-6"> <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputPorte" value="';

         if (!(oRegistrosPJ[i].porte == '')) { cHTML += oRegistrosPJ[i].porte.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputPorte" style="font-size: 16px;"> Tipo </label></div></div>';

         /*

         cHTML += '<div class="col-md-6">  <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputff" value="';

         if (!(oRegistrosPJ[i].ff == '')) { cHTML += oRegistrosPJ[i].ff.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputff" style="font-size: 16px;"> Faixa de Faturamento Anual (R$)</label> </div> </div> </div>   <br /> ';

         cHTML += ' <div class="row g-2">'

         cHTML += '<div class="col-md-4">  <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputmarketshare" value=" ';

         if (!(oRegistrosPJ[i].marketshare == '')) { cHTML += oRegistrosPJ[i].marketshare.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputmarketshare" style="font-size: 16px;"> Market Share </label> </div> </div>   ';


         cHTML += '<div class="col-md-4">  <div class="form-floating"> <input type="text" class="form-control" disabled="" id="media_faturamento_cnae" value=" ';

         if (!(oRegistrosPJ[i].media_faturamento_cnae == '')) { cHTML += oRegistrosPJ[i].media_faturamento_cnae.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="media_faturamento_cnae" style="font-size: 16px;"> Média Faturamento CNAE </label> </div> </div>   ';


         cHTML += '<div class="col-md-4">  <div class="form-floating"> <input type="text" class="form-control" disabled="" id="qtde_empresas_cnae" value=" ';

         if (!(oRegistrosPJ[i].qtde_empresas_cnae == '')) { cHTML += oRegistrosPJ[i].qtde_empresas_cnae.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="media_faturamento_cnae" style="font-size: 16px;"> Qtde.Empresas no mesmo CNAE </label> </div> </div> </div>   <br />   ';

*/

         // Formulário Linha 7

         cHTML += ' <div class="row g-2">'

         cHTML += '<div class="col-md-6"> <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputnj" value="';

         if (!(oRegistrosPJ[i].nj == '')) { cHTML += oRegistrosPJ[i].nj.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputnj" style="font-size: 16px;"> Natureza Jurídica </label></div></div>';



         cHTML += '<div class="col-md-6">  <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputcapital" value="R$ ';

         if (!(oRegistrosPJ[i].capital == '')) { cHTML += new Intl.NumberFormat('en-DE').format(oRegistrosPJ[i].capital.trim()); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputcapital" style="font-size: 16px;"> Capital Social </label> </div> </div> </div>    <br />  ';


         // Formulário Linha 9 # Endereço completo

         cHTML += ' <div class="row g-1">'

         cHTML += '<div class="col-md-12"> <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputEndereco" value="';

         if (!(oRegistrosPJ[i].endereco == '')) {

             cHTML += oRegistrosPJ[i].endereco.trim() + " , " + oRegistrosPJ[i].nro.trim() + "  " + oRegistrosPJ[i].compl.trim() + " - " + oRegistrosPJ[i].bairro.trim() + " - " + oRegistrosPJ[i].cidade.trim() + "- CEP: " + oRegistrosPJ[i].cep.trim() + " - " + oRegistrosPJ[i].uf.trim();


             var gMapsEndereco = oRegistrosPJ[i].endereco.trim();
             if (!(oRegistrosPJ[i].nro == '')) { gMapsEndereco += "," + oRegistrosPJ[i].nro.trim(); }
             if (!(oRegistrosPJ[i].bairro == '')) { gMapsEndereco += "," + oRegistrosPJ[i].bairro.trim(); }
             if (!(oRegistrosPJ[i].cidade == '')) { gMapsEndereco += "," + oRegistrosPJ[i].cidade.trim(); }
             if (!(oRegistrosPJ[i].uf == '')) { gMapsEndereco += "," + oRegistrosPJ[i].uf.trim(); }


         }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputEndereco" style="font-size: 16px;"> Endereço </label></div></div>';

         cHTML += ' </div>    <br />  ';



         // Formulário Linha 8

         cHTML += ' <div class="row g-2">'

         cHTML += '<div class="col-md-4"> <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputcnae" value="';

         if (!(oRegistrosPJ[i].cnae == '')) { cHTML += oRegistrosPJ[i].cnae.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputcnae" style="font-size: 16px;"> CNAE Principal </label></div></div>';



         cHTML += '<div class="col-md-8">  <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputcnae_desc" value="';

         if (!(oRegistrosPJ[i].cnae_desc == '')) { cHTML += oRegistrosPJ[i].cnae_desc.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputcnae_desc" style="font-size: 16px;"> Descrição CNAE </label> </div> </div> </div>    <br /> ';




         /*

         // Formulário Linha 10

         cHTML += ' <div class="row g-2">'

         cHTML += '<div class="col-md-6"> <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputLatLong" value="';

         if (!(oRegistrosPJ[i].latitude == null) && !(oRegistrosPJ[i].longitude == null)) { cHTML += oRegistrosPJ[i].latitude.trim() + ' , ' + oRegistrosPJ[i].longitude.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputLatLong" style="font-size: 16px;"> Latitude Longitude </label></div></div>';



         cHTML += '<div class="col-md-6">  <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputindustria" value="';

         if (!(oRegistrosPJ[i].industria == '')) { cHTML += oRegistrosPJ[i].industria.trim(); }

         cHTML += '">';

         cHTML += '<label class="cs-input-crm" for="inputindustria" style="font-size: 16px;"> Indústria ( Tipo ) </label> </div> </div> </div>   <br />  ';


         // Formulário Linha 11  // TELEFONES

         cHTML += ' <div class="row g-2">'

         cHTML += '<div class="col-md-4"> <div class="input-group input-group-merge">  <button class="btn btn-primary" type="button" data-toggle="tooltip" title="Telefone #1">TEL #1</button><input type="text" disabled class="form-control" id="inputTel1" value="';

         if (!(oRegistrosPJ[i].tel1 == null)) { cHTML += oRegistrosPJ[i].tel1; }

         cHTML += '"/>';

         cHTML += '<div class="input-group-text">' + '<a href="#"  onclick="RegistraCall(' + oRegistrosPJ[i].tel1 + ');"><i class="mdi mdi-phone text-blue" style="font-size: 14px;"></i></a> </div>';

         cHTML += '</div></div>';



         cHTML += '<div class="col-md-4"> <div class="input-group input-group-merge">  <button class="btn btn-primary" type="button" data-toggle="tooltip" title="Telefone #2">TEL #2</button><input type="text" disabled class="form-control" id="inputTel2" value="';

         if (!(oRegistrosPJ[i].tel2 == null)) { cHTML += oRegistrosPJ[i].tel2; }

         cHTML += '"/>';

         cHTML += '<div class="input-group-text">' + '<a href="#"  onclick="RegistraCall(' + oRegistrosPJ[i].tel2 + ');"><i class="mdi mdi-phone text-blue" style="font-size: 14px;"></i></a> </div>';

         cHTML += '</div></div>';



         cHTML += '<div class="col-md-4"> <div class="input-group input-group-merge">  <button class="btn btn-primary" type="button" data-toggle="tooltip" title="Telefone #3">TEL #3</button><input type="text"  disabled class="form-control" id="inputTel3" value="';

         if (!(oRegistrosPJ[i].tel3 == null)) { cHTML += oRegistrosPJ[i].tel3; }

         cHTML += '"/>';

         cHTML += '<div class="input-group-text">' + '<a href="#"  onclick="RegistraCall(' + oRegistrosPJ[i].tel3 + ');"><i class="mdi mdi-phone text-blue" style="font-size: 14px;"></i></a> </div>';

         cHTML += '</div></div>';

         cHTML += '<br />';
         */


         // Formulário Linha 12  // EMAILS

         /*

             cHTML += ' <div class="row g-2">'

             cHTML += '<div class="col-md-6"> <div class="input-group input-group-merge">  <button class="btn btn-primary" type="button" data-toggle="tooltip" title="E-mail">E-MAIL</button><input type="text" disabled class="form-control" id="inputEmail" value="';

             cHTML += oRegistrosPJ[i].email;

             cHTML += '"/>';

             cHTML += '<div class="input-group-text">' + '<a href="mailto:' + oRegistrosPJ[i].email + '"><i class="mdi mdi-email text-blue" style="font-size: 14px;"></i></a> </div>';


             cHTML += '</div></div>';



             cHTML += '<div class="col-md-6"> <div class="input-group input-group-merge">  <button class="btn btn-primary" type="button" data-toggle="tooltip" title="Website">WebSite</button><input type="text" disabled class="form-control" id="inputWebsite" value="';

             cHTML += oRegistrosPJ[i].site;

             cHTML += '"/>';

         cHTML += '<div class="input-group-text">' + '<a href="' + oRegistrosPJ[i].site + '" target="_blank"><i class="fe-globe text-blue" style="font-size: 14px;"></i></a> </div>';
            

             cHTML += '</div></div></div>    <br /><br />';

        */

         // Formulário Linha 13  // Facebook

         /*
         if (!(oRegistrosPJ[i].facebook == '')) {

             cHTML += ' <div class="row g-2">'

             cHTML += '<div class="col-md-8"> <div class="input-group input-group-merge">  <button class="btn btn-primary" type="button" data-toggle="tooltip" title="Facebook">Facebook</button><input type="text" disabled class="form-control" id="inputFacebook" value="';

             cHTML += oRegistrosPJ[i].Facebook;

             cHTML += '"/>';

             cHTML += '<div class="input-group-text">' + '<a href="' + oRegistrosPJ[i].Facebook + '" target="_blank"><i class="mdi mdi-facebook text-blue" style="font-size: 14px;"></i></a> </div>';

             cHTML += '</div></div></div>    <br />';

         }
         */

         /*

         if (!(oRegistrosPJ[i].linkedin_company == '')) {


             cHTML += ' <div class="row g-2">'

             cHTML += '<div class="col-md-8"> <div class="input-group input-group-merge">  <button class="btn btn-primary" type="button" data-toggle="tooltip" title="Linkedin">Linkedin</button><input type="text" disabled class="form-control" id="inputLinkedin" value="';

             cHTML += oRegistrosPJ[i].linkedin_company ;

             cHTML += '"/>';

             cHTML += '<div class="input-group-text">' + '<a href="' + oRegistrosPJ[i].linkedin_company  + '" target="_blank"><i class="mdi mdi-linkedin text-blue" style="font-size: 14px;"></i></a> </div>';

             cHTML += '</div></div>';



             cHTML += '<div class="col-md-4">  <div class="input-group"> <input type="text" class="form-control" disabled="" id="inputSegs" value="';

            if (!(oRegistrosPJ[i].seguidores == '')) { cHTML += oRegistrosPJ[i].seguidores.trim(); }

            cHTML += ' Seguidores ">';

            cHTML += ' </div> </div> </div>   <br />  ';



             cHTML += ' <div class="row g-2">'

             cHTML += '<div class="col-md-12"> <div class="input-group input-group-merge">  <button class="btn btn-primary" type="button" data-toggle="tooltip" title="linkedin_contatos">Contatos no Linkedin</button><input type="text" disabled class="form-control" id="inputLinkedinCont" value="';

             cHTML += oRegistrosPJ[i].linkedin_contatos;

             cHTML += '"/>';

             cHTML += '<div class="input-group-text">' + '<a href="' + oRegistrosPJ[i].linkedin_contatos + '" target="_blank""><i class="mdi mdi-linkedin text-blue" style="font-size: 14px;"></i></a> </div>';

             cHTML += '</div></div></div>   <br /> ';

             /*
             if (!(oRegistrosPJ[i].especialidades == '')) {
             cHTML += ' <div class="row g-2">'

             cHTML += '<div class="col-md-6">  <div class="form-floating"> <input type="text" class="form-control" disabled="" id="inputespecialidades" value="';

             if (!(oRegistrosPJ[i].especialidades  == '')) { cHTML += oRegistrosPJ[i].especialidades.trim(); }

             cHTML += '">';

             cHTML += '<label class="cs-input-crm" for="inputespecialidades" style="font-size: 16px;"> Especialidades da empresa </label> </div> </div> </div>   <br />  ';

             }
             */

     
     

         // CNAES
          if (oRegCNAEs.length > 0)  {
             cHTML += '<br /><button type="button" class="btn btn-primary btn-rounded waves-effect waves-light"> <span class="btn-label"><i class="mdi mdi-briefcase-search"></i></span>ATIVIDADES SECUNDÁRIAS</button><br /><br />';    
             cHTML += "<div class='table-responsive'>";
             cHTML += "<table class='table table-striped table-bordered table-hover'><thead>";
             cHTML += "<tr><th>CNAE</th><th>Atividade</th></tr></thead><tbody>";

              for (var k = 0; k < oRegCNAEs.length; k++) {

                  cHTML += "<tr>";
                  cHTML += "<td>" + oRegCNAEs[k].codigo.trim() + "</td>";
                  cHTML += "<td>" + oRegCNAEs[k].nome.trim() + "</td>";
                  cHTML += "<td>";

              }

              cHTML += "</div></div></div>";

              cHTML += "</tbody></table></div>";

          }



     }
     return cHTML;
    
 }

             function HTMListaPJ(oRegistrosPJ) {

     var cHTML = "<div class='col-md-11'><div class='row'><div id='navegacao'></div></div<div class='table-responsive'>";
     cHTML += "<table class='table table-striped table-bordered table-hover'  style='background-color: white;'><thead>";
     cHTML += "<tr><th>CNPJ</th><th>Razão Social</th><th>UF</th><th>Endereco?</th><th>Telefone?</th><th>Email?</th><th></th></tr></thead><tbody>";

     var wImg = '<img src="\\assets\\img\\';

     for (var i = 0; i < oRegistrosPJ.length; i++) {

         cHTML += "<tr>";
         cHTML += "<td>" + oRegistrosPJ[i].cnpj.trim().substring(0,9) + "******" + "</td>";
         cHTML += "<td>" + oRegistrosPJ[i].razao.trim() + "</td>";         
         cHTML += "<td>" + oRegistrosPJ[i].uf.trim() + "</td>";

        if ((oRegistrosPJ[i].tem_end.trim() == 'Sim')) { cHTML += "<td><div class='avatar-sm bg-success rounded'><i class='fe-check-circle avatar-title font-22 text-white'></i></td></div>"; } else { cHTML += "<td><div class='avatar-sm bg-danger rounded'><i class='fe-x-circle avatar-title font-22 text-white'></i></div></td>"; } 
        if ((oRegistrosPJ[i].tem_tel.trim() == 'Sim')) { cHTML += "<td><div class='avatar-sm bg-success rounded'><i class='fe-check-circle avatar-title font-22 text-white'></i></td></div>"; } else { cHTML += "<td><div class='avatar-sm bg-danger rounded'><i class='fe-x-circle avatar-title font-22 text-white'></i></div></td>"; } 
        if ((oRegistrosPJ[i].tem_eml.trim() == 'Sim')) { cHTML += "<td><div class='avatar-sm bg-success rounded'><i class='fe-check-circle avatar-title font-22 text-white'></i></td></div>"; } else { cHTML += "<td><div class='avatar-sm bg-danger rounded'><i class='fe-x-circle avatar-title font-22 text-white'></i></div></td>"; } 
        
         cHTML += "<td>";
         cHTML += "<button type='button' class='btn-success pull-left' onclick='Pesquisar(2,";
         cHTML += '"' + oRegistrosPJ[i].cnpj.trim() + '"," "," "';
         cHTML += ");'>Consultar</button>";
         cHTML += "</td>";
         cHTML += "</tr>";
     }

     cHTML += "</tbody></table></div></div>";

     return cHTML;

 }

 function rolaScroll(pNroPag) {

     var HTMLConsulta = "";

     var mSearchBegin = '[PAGINA-' + pNroPag.toString() + ']';
     var mSearchEnd = '[PAGINA-' + (pNroPag+1).toString() + ']';

     var nPosBegin = $("[id*=hddHTMLConsulta]").val().indexOf(mSearchBegin);
     var nPosEnd = $("[id*=hddHTMLConsulta]").val().indexOf(mSearchEnd);

     var nPosStart = nPosBegin + 10;
     if (pNroPag > 9) {nPosStart = nPosStart + 1; }
     if (pNroPag > 99) { nPosStart = nPosStart + 1; }
     if (pNroPag > 999) { nPosStart = nPosStart + 1; }

     if (nPosEnd < 0) {
         HTMLConsulta = $("[id*=hddHTMLConsulta]").val().substr(nPosStart)
     }
     else {
         var nQtChar = nPosEnd - nPosStart;
         HTMLConsulta = $("[id*=hddHTMLConsulta]").val().substr(nPosStart,nQtChar)
     }

     var divResultPesquisa = $("#resultAjax");
     divResultPesquisa.empty();
     divResultPesquisa.append('');
     divResultPesquisa.append(HTMLConsulta);
     window.scrollTo({ top: 0, behavior: 'smooth' });

  

 }

 function botoesNav() {
   var HtmlNav = '';
   var mTotPag = parseInt($("[id*=hddContadoResult]").val());
   var mAtuPag = parseInt($("[id*=hddPagAtual]").val());
   
   
   if (mTotPag > 1)
   {
      

     HtmlNav =  HtmlNav + '<div class="col-md-11">';
      HtmlNav =  HtmlNav + '<div class="btn-group mb-2">';
       if (mAtuPag > 1) {
           HtmlNav = HtmlNav + '<button type="button" id="btnPreviou" class="btn btn-primary float-right" onclick="ChangePage(-1);"> << </button>';
           
       }

       if (mAtuPag > 1) { 
            window.location.hash = "#" + mAtuPag.toString(); 
       }

       

      if (mAtuPag < mTotPag)
           HtmlNav = HtmlNav + '<button type="button" id="btnNext" class="btn btn-primary float-right" onclick="ChangePage(1);"> >> </button>';

       HtmlNav = HtmlNav + '</div>';
       HtmlNav = HtmlNav + '</div>';
       
     
  }

   var divNavegacao = $("#navegacao");
  divNavegacao.empty();
  divNavegacao.append(HtmlNav);

 }

 function ChangePage(pProxOrAnt) {
     var mAtuPag = parseInt($("[id*=hddPagAtual]").val()) + pProxOrAnt;
     $("[id*=hddPagAtual]").val(mAtuPag.toString());
     rolaScroll(mAtuPag);
     botoesNav();
 }


function trataTelefoneVoip(DDD, telefone)
{
    var retorno;

    if (telefone.Length > 9)
    {
        retorno = "0" + telefone;
    }
    else
    {
        retorno = "0" + DDD + telefone;
    }

    return retorno;

}


        function FeedHiddenContagem(tipoArquivo) {

           /* var oTable = $('#tbContagem').dataTable();
            var iTableRowCount = oTable.fnGetData().length;

            var oTableRows = [];
            for (var i = 0; i < iTableRowCount; i++) {
                var oRow =  oTable.fnGetData(i);
                oTableRows.push(oRow);
            };

            var oRowsJson = JSON.stringify(oTableRows);

            $("[id*=hddtbContagem]").val(oRowsJson);*/

            $("[id*=hddTipoArquivo]").val(tipoArquivo);

       }
        </script>



    <script>
                    $body = $("body");
            
      $(document).ajaxSend(function () {

               
            

                Swal({
                      title: 'Consulta em andamento...',
                      html: 'Os robôs estão trabalhando nisso... ',
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

        $(".chosen-select").chosen();

        
      $( document ).ready(function () {

          window.onhashchange = function (event) {        

              if (window.history && window.history.pushState && window.location.hash == "#network-map") {

                  $(window).on('popstate', function () {
                      $('#modal-network').modal('hide');
                  });
              }
              else if (window.location.hash) {
                  var hash = window.location.hash.split("#")
                  var page = parseInt(hash[1]);
                  //alert(page);
                  this.rolaScroll(page);
              }

           
          }

            $('#txtCNPJ').keypress(function(e){
                 if(e.keyCode==13)
             $('#btnCNPJ').click(); });

             $('#txtNome').keypress(function(e){
                 if(e.keyCode==13)
             $('#btnNome').click(); });

             $('#txtRazao').keypress(function(e){
                 if(e.keyCode==13)
             $('#btnRazao').click(); });

          if ($("[id*=hddCNPJ]").val() != '') {

              var cnpj = $("[id*=hddCNPJ]").val();                            
              Pesquisar(2, cnpj, '', '');
          }
         
      });
       

    </script>

</asp:Content>
