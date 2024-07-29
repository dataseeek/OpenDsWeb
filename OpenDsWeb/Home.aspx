<%@ Page Title="" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="OpenDsWeb.Home" %>

<%@ MasterType VirtualPath="Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <!-- CSS ESPECIFICO DA PAGINA -->
        <link href="assets/libs/jquery-nice-select/nice-select.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/switchery/switchery.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/multiselect/multi-select.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/select2/select2.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/dropzone/dropzone.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/dropify/dropify.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/switchery/switchery.min.css" rel="stylesheet" type="text/css">        
        <link href="assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css">

     <link href="assets/libs/datatables/select.bootstrap4.css" rel="stylesheet" type="text/css" />
    <link href="assets/libs/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
    <link href="assets/libs/datatables/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
    <link href="assets/libs/datatables/buttons.bootstrap4.css" rel="stylesheet" type="text/css" />
    

        <!-- Sweet Alert-->
        <link href="assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />

          <!-- Custom box css -->
        <link href="assets/libs/custombox/custombox.min.css" rel="stylesheet"> 

        <!-- App css -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/app.min.css" rel="stylesheet" type="text/css" />

    <style>

      .dropdown-content {
    right: 0;
    left: auto;
}
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <hr /><br />
     
    <!-- container -->

    <asp:HiddenField ID="hddUsr_nome" runat="server" />
    <asp:HiddenField ID="hddUsr_Token" runat="server" />
    <asp:HiddenField ID="hddUsr_Email" runat="server" />
    <asp:HiddenField ID="hddUsr_Tel" runat="server" />   
    <asp:HiddenField ID="hddUsr_CNPJ" runat="server" />  
    <asp:HiddenField ID="hddTipoContrato" runat="server" />
    <asp:HiddenField ID="hddHasNewClient" runat="server" />
    <asp:HiddenField ID="hddHasPgtoAberto" runat="server" />
    <asp:HiddenField ID="hddVlrCredito" runat="server" />
    <asp:HiddenField ID="hddBlackList" runat="server" />
    <asp:HiddenField ID="hddListaValida" runat="server" />


    <!-- JAVASCRIPTS -->
    <!-- page specific plugin scripts
        
           <script src="assets/js/modernizr.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script> 
        
        -->
    <link href="assets/libs/dropzone/dropzone.min.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>

    <!-- Vendor js -->
    <script src="assets/js/vendor.min.js"></script>
                      

    <script src="assets/js/chosen.jquery.min.js" type="text/javascript"></script>
    <script src="assets/js/jquery.autosize.min.js" type="text/javascript"></script>
    <script src="assets/js/jquery.inputlimiter.1.3.1.min.js" type="text/javascript"></script>
    <script src="assets/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="assets/js/jquery.dataTables.bootstrap.js" type="text/javascript"></script>
    <script src="assets/js/jquery.maskMoney.js" type="text/javascript"></script>

    <!-- Modal-Effect -->
    <script src="assets/libs/custombox/custombox.min.js"></script>

    <!-- Filipe 09/08/2014: datatables translation -->
    <script src="assets/js/dataTables-pt-br.js" type="text/javascript"></script>

    <!-- Scripts template antigo necessários  -->
    <script src="assets/js/Mascara.js" type="text/javascript"></script>
    <script src="assets/js/AppFunctions.js" type="text/javascript"></script>
    <script src="assets/js/fold-to-ascii.js" type="text/javascript"></script>

    <!-- JS COMUNS -->
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
    <!-- script src="assets/libs/jquery-mockjax/jquery.mockjax.min.js"></-->
    <script src="assets/libs/autocomplete/jquery.autocomplete.min.js"></script>
    <script src="assets/libs/flatpickr/flatpickr.min.js"></script>
    <script src="assets/libs/bootstrap-colorpicker/bootstrap-colorpicker.min.js"></script>
    <script src="assets/libs/clockpicker/bootstrap-clockpicker.min.js"></script>
    <script src="assets/js/jquery.maskedinput.min.js" type="text/javascript"></script>

       <!-- Sweet Alert-->
        <link href="assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />
		
		 <!-- Sweet Alerts js -->
        <script src="assets/libs/sweetalert2/sweetalert2.min.js" type="text/javascript"></script>

        <!-- Sweet alert init js-->
        <script src="assets/js/pages/sweet-alerts.init.js"></script>

    <!-- Init js-->
    <script src="assets/js/pages/form-fileuploads.init.js"></script>
    <script src="assets/js/pages/form-advanced.init.js"></script>
    <script src="assets/js/pages/form-pickers.init.js"></script>

     <!-- third party js -->
    <script src="assets/libs/datatables/jquery.dataTables.js"></script>
    <script src="assets/libs/datatables/dataTables.bootstrap4.js"></script>
    <script src="assets/libs/datatables/dataTables.responsive.min.js"></script>
    <script src="assets/libs/datatables/responsive.bootstrap4.min.js"></script>
    <script src="assets/libs/datatables/dataTables.buttons.min.js"></script>
    <script src="assets/libs/datatables/buttons.bootstrap4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="assets/libs/datatables/buttons.html5.min.js"></script>
    <script src="assets/libs/datatables/buttons.flash.min.js"></script>
    <script src="assets/libs/datatables/buttons.print.min.js"></script>
    <script src="assets/libs/datatables/dataTables.keyTable.min.js"></script>
    <script src="assets/libs/datatables/dataTables.select.min.js"></script>

    <script src="assets/js/Mascara.js" type="text/javascript"></script>

     <script>
        $(document).ready(function () {
        });
     </script>

  <script type="text/javascript">   

      function ShowHidePass() {
          var x = document.getElementById("inputToken");
          if (x.type === "password") {
              x.type = "text";
              document.getElementById("txtShow").innerText = "Esconder";
          } else {
              x.type = "password";
              document.getElementById("txtShow").innerText = "Ver";
          }
      }


      function vCNPJ(el) {

          btnOK = document.getElementById('btnAtualizar');

          if (!validarCNPJ(el.value)) {
              var dCNPJ = el.value;
              document.getElementById("divCNPJvalido").innerHTML = '<small class="text-danger"><b> CNPJ Inválido: ' + dCNPJ + '</b> </small>';
              //alert("CNPJ inválido!" + el.value);  
              btnOK.disabled = true;

              // apaga o valor
              el.value = "";
          } else {

              document.getElementById("divCNPJvalido").innerHTML = '<small class="text-success"><b> CNPJ Válido </b> </small>';
              btnOK.disabled = false;

          }
      }

function copyToClipboard(element) {


    var x = document.getElementById(element);
    if (x.type === "password") {
        x.type = "text";
        document.getElementById("txtShow").innerText = "Esconder";
    } 
    var copyText = document.getElementById(element);
    /* Select the text field */
  copyText.select();

  /* Copy the text inside the text field */
  document.execCommand("copy");
  /* Alert the copied text */
          document.getElementById("btnCopy").innerText = "Copiado";
          
}
  </script>

    <script type="text/javascript">

        $(document).ready(function () {

            InitTables();

        });



        function InitTables() {
            
        }


    </script>

   

    <script>
        $body = $("body");
    </script>


   


</asp:Content>

