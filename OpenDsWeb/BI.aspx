<%@ Page Title="" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="BI.aspx.cs" Inherits="OpenDsWeb.BI" %>
<%@ MasterType virtualpath="Site.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .classFontDataTable { font-size: 12px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
    #progress_bar {
        margin: 10px 0;
        padding: 3px;
        border: 1px solid #000;
        font-size: 14px;
        clear: both;
        opacity: 0;
        -moz-transition: opacity 1s linear;
        -o-transition: opacity 1s linear;
        -webkit-transition: opacity 1s linear;
    }
    #progress_bar.loading {
        opacity: 1.0;
    }
    #progress_bar .percent {
        background-color: #99ccff;
        height: auto;
        width: 80px;
    }
    </style>

    <style>
    #pgb_EnrEmail {
        margin: 10px 0;
        padding: 3px;
        border: 1px solid #000;
        font-size: 14px;
        clear: both;
        opacity: 0;
        -moz-transition: opacity 1s linear;
        -o-transition: opacity 1s linear;
        -webkit-transition: opacity 1s linear;
    }
    #pgb_EnrEmail.loading {
        opacity: 1.0;
    }
    #pgb_EnrEmail .prc_eml {
        background-color: #99ccff;
        height: auto;
        width: 80px;
    }
    </style>

    <style>
    #pgb_EnrSite {
        margin: 10px 0;
        padding: 3px;
        border: 1px solid #000;
        font-size: 14px;
        clear: both;
        opacity: 0;
        -moz-transition: opacity 1s linear;
        -o-transition: opacity 1s linear;
        -webkit-transition: opacity 1s linear;
    }
    #pgb_EnrSite.loading {
        opacity: 1.0;
    }
    #pgb_EnrSite .prc_sit {
        background-color: #99ccff;
        height: auto;
        width: 80px;
    }
    </style>

    <style>
    #progbar_cep {
        margin: 10px 0;
        padding: 3px;
        border: 1px solid #000;
        font-size: 14px;
        clear: both;
        opacity: 0;
        -moz-transition: opacity 1s linear;
        -o-transition: opacity 1s linear;
        -webkit-transition: opacity 1s linear;
    }
    #progbar_cep.loading {
        opacity: 1.0;
    }
    #progbar_cep .prc_cep {
        background-color: #99ccff;
        height: auto;
        width: 80px;
    }
    </style>

    <style>
    #progbar_mun {
        margin: 10px 0;
        padding: 3px;
        border: 1px solid #000;
        font-size: 14px;
        clear: both;
        opacity: 0;
        -moz-transition: opacity 1s linear;
        -o-transition: opacity 1s linear;
        -webkit-transition: opacity 1s linear;
    }
    #progbar_mun.loading {
        opacity: 1.0;
    }
    #progbar_mun .prc_cnae {
        background-color: #99ccff;
        height: auto;
        width: 80px;
    }
    </style>
 
    <style>
  #progbar_cnae {
    margin: 10px 0;
    padding: 3px;
    border: 1px solid #000;
    font-size: 14px;
    clear: both;
    opacity: 0;
    -moz-transition: opacity 1s linear;
    -o-transition: opacity 1s linear;
    -webkit-transition: opacity 1s linear;
  }
  #progbar_cnae.loading {
    opacity: 1.0;
  }
  #progbar_cnae .prc_cnae {
    background-color: #99ccff;
    height: auto;
    width: 80px;
  }

 ¨td.table-cell-edit{
    background-color: lightgoldenrodyellow;
} 

 .select2-container {
min-width:540px;
}

 .select2-results__option[aria-selected=true] {
    display: none;
}

 .locked-tag .select2-selection__choice__remove{
  display: none!important;
}

  .visible-div-enriquecimento {

     margin-top:0px;
     visibility:visible;
 }

  .hidden-div-enriquecimento {

     margin-top:-275px;
     visibility:hidden;
 }

 </style>

    <!-- CSS ESPECIFICO DA PAGINA -->
    <link href="assets/libs/jquery-nice-select/nice-select.css" rel="stylesheet" type="text/css" />
    <link href="assets/libs/switchery/switchery.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/libs/multiselect/multi-select.css" rel="stylesheet" type="text/css" />
    <link href="assets/libs/select2/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/libs/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css" />
    <link href="assets/libs/dropzone/dropzone.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/libs/dropify/dropify.min.css" rel="stylesheet" type="text/css" />    
    <link href="assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.css" rel="stylesheet" type="text/css">
    <link href="assets/libs/flatpickr/flatpickr.min.css" rel="stylesheet" type="text/css">
    <link href="assets/libs/hopscotch/hopscotch.min.css" rel="stylesheet" type="text/css" />
   

       <!-- third party css -->
        <!-- third party css -->
        <link href="assets/libs/datatables/dataTables.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/datatables/responsive.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/datatables/buttons.bootstrap4.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/datatables/select.bootstrap4.css" rel="stylesheet" type="text/css" />

     <!-- JsGrid css -->
        <link href="assets/libs/jsgrid/jsgrid.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/libs/jsgrid/jsgrid-theme.css" rel="stylesheet" type="text/css" />

     <!-- Sweet Alert-->
        <link href="assets/libs/sweetalert2/sweetalert2.min.css" rel="stylesheet" type="text/css" />

    <!-- Custom box css -->
    <link href="assets/libs/custombox/custombox.min.css" rel="stylesheet"> 

     <link href="assets/libs/jquery-toast/jquery.toast.min.css" rel="stylesheet" type="text/css" />
   

    <!-- App css -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
    

     <!-- script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></!-->
    
    <div class="page-content" id="PesquisaBase">
       
         <h4 class="text-primary">Listas <small>>></small> Empresas</h4> 
         

         <ul class="list-inline topnav-menu float-right mb-1">   <!--   || class="dropdown notification-list" --> 
           <li class="list-inline-item" style="margin-top:7px">
              <div id="qtd_registros_auto"> </div>
           </li>
           <li class="list-inline-item" >
	         <a href="#cont" class="dropdown-toggle nav-user mr-0"  data-toggle="modal" data-target="#cont">
			    <div class="avatar-sm bg-success rounded">  
                <i class="fe-database avatar-title font-7 text-white" data-toggle="tooltip" data-placement="bottom" data-original-title="Clique para Efetuar Contagem Detalhada"></i>
                </div> 
	         </a>
		   </li> 
           <li class="list-inline-item">
             <a class="right-bar-toggle nav-user mr-0" id="btnFiltros" data-toggle="tooltip" data-placement="bottom" data-original-title="Ver Filtros Aplicados" role="button" aria-haspopup="false" aria-expanded="false">
               <div class="avatar-sm bg-success rounded"> 
               <i class="fe-filter avatar-title font-14 text-white"></i>     
              </div>
            </a>                        
          </li>
          <li class="list-inline-item">
             <a class="dropdown-toggle nav-user mr-0" id="btnRefresh" onClick="Refresh()" data-toggle="tooltip" data-placement="bottom" data-original-title="Limpar pesquisa" id="btnRefresh" role="button" aria-haspopup="false" aria-expanded="false">
               <div class="avatar-sm bg-info rounded">
                  <i class="fe-refresh-ccw avatar-title font-14 text-white"></i>      
                </div>
             </a>                        
          </li>
       </ul>

        <ul class="nav nav-tabs nav-fill navtab-bg nav-pills" id="myTab">
			<li class="nav-item">
				<a href="#regiao" data-toggle="tab" class="nav-link active" onclick="Contagem();">
                    <i class="fe-globe"></i>
					Região
				</a>
			</li>

			<li class="nav-item">
				<a href="#setor" data-toggle="tab" class="nav-link" onclick="Contagem();">
                    <i class="icon-wrench"></i>
					Atividade
				</a>
			</li>
            

               <li class="nav-item">
			    <a href="#export" data-toggle="tab" id="tabexport" class="nav-link" onclick="ContagemCompra();">
				    <!--i class="red icon-tag bigger-100"></i-->
                    <i class="ace-icon blue fa fa-shopping-cart bigger-100"></i>
				    Processar Contagem
				   
			    </a>
		    </li>

                <li class="nav-item" style="visibility:hidden">
			            <a href="#resultpesquisa" data-toggle="tab"  class="nav-link">
				         <i class="fe-check-circle"></i>
				    Exportar Resultado
				    
			    </a>
		    </li>
	    </ul>

		<div class="tab-content">

            <!-- Região Início -->
		    <div class="tab-pane in active" id="regiao">
                <!-- Accordion begin  -->                   
                <div class="accordion-style1 panel-group accordion-style2" id="accordion">
					<div class="panel panel-default a">	  
                        <div class="panel-heading" id="pnlEstado">
							<h4 class="panel-title">
								<button class="btn btn-block btn-primary waves-effect waves-light" type="button" aria-expanded="true" id="acbtnRegiao" href="#collapseOne" data-toggle="collapse" data-target="#collapseOne" data-parent="#accordion" onclick="CtrlClickAccordion('Estado', this);"> 
								<i class="fe-plus-circle"></i>
								&nbsp;ESTADOS
								</button>
							</h4>
						</div>
                                
                        <div class="panel-collapse collapse" id="collapseOne">                   
                          <div class="panel-body">
                               <div class="text-center w-75 m-auto">  
                              <div class="button-list">
                                 
                                 
                                    <button type="button" class="width-100 btn-sm btn-blue   pull-left"  id="Button40" onclick="dtSelectRegiao(1,$('#tbRegiaoSource').dataTable(),$('#tbRegiaoTarget').dataTable(),2,'desc');"> 
   	                                    Norte
                                    </button>
                                 
                                 
                                    <button type="button" class="width-100 btn-sm btn-blue  pull-right"  id="Button41" onclick="dtSelectRegiao(2,$('#tbRegiaoSource').dataTable(),$('#tbRegiaoTarget').dataTable(),2,'desc');">
   	                                  Nordeste
                                    </button>
                                 
                                 
                                   <button type="button" class="width-100 btn-sm btn-blue  pull-right"  id="Button42" onclick="dtSelectRegiao(3,$('#tbRegiaoSource').dataTable(),$('#tbRegiaoTarget').dataTable(),2,'desc');">
   	                                  Centro-Oeste
                                   </button>
                                 
                                 
                                    <button type="button" class="width-100 btn-sm btn-blue  pull-right"  id="Button43" onclick="dtSelectRegiao(4,$('#tbRegiaoSource').dataTable(),$('#tbRegiaoTarget').dataTable(),2,'desc');">
   	                                   Sudeste
                                    </button>
                                 
                                 
                                   <button type="button" class="width-100  btn-sm btn-blue pull-right"  id="Button44" onclick="dtSelectRegiao(5,$('#tbRegiaoSource').dataTable(),$('#tbRegiaoTarget').dataTable(),2,'desc');">
   	                                 Sul
                                   </button>

                                  <button type="button" class="width-30 btn-sm btn-danger float-right"  id="Button4" onclick="selectAll('UF',2);"> 
   	                                                    Limpar Seleção
                                   </button>
                                 
                                </div>
                                  <br /><br />
                              </div>
                             

	                             <!-- div class="table-header">
						           Disponíveis
						         </!-->
                              <!-- tableDDD ini -->
                           <div class="row">
                               <!-- DDD Source Begin -->
                               <div class="col-md-4"></div>
					           <div class="col-md-2 col-md-offset-4">
					             <div>
			                        <table id="tbRegiaoSource" class="table table-responsive table-bordered table-hover w-100 d-block d-md-table w-100 d-block d-md-table datatableuf">
                                      <thead>
			                          <tr>
                                        <th>Id</th>
				                        <th>UF</th>
				                        <th>Registros</th>
                                        <th>Registros</th>
				                      </tr>
				                    </thead>
		                              <tbody>
                                      <asp:Repeater ID="rptRegiaoSource" runat="server"  >
                                         <HeaderTemplate>
                                         </HeaderTemplate>
                                         <ItemTemplate>
                                           <tr>
                                             <td id='IdUsuario_<%#Eval("id") %>'><%# Eval("id")%></td>
                                             <td id='NmUsuario_<%#Eval("UF") %>'><%# Eval("UF")%></td>
                                             <td id='Email_<%#Eval("QtdRegistros") %>'><%# Eval("QtdRegistros")%></td>
                                              <td id='Registros_<%#Eval("NroRegistros") %>'><%# Eval("NroRegistros")%></td>
                                           </tr>
                                         </ItemTemplate>
                                      </asp:Repeater>
						            </tbody>
						            </table>
						         </div>
                             </div>
					
                               <!-- Regiao Source End -->

                               <!-- Regiao Target Begin -->
                               <div class="col-md-2 col-md-offset-6">
						
                                                       
                                   <div>
                                     <table id="tbRegiaoTarget" class="table  table-bordered table-hover w-100 d-block d-md-table datatableuf">
		                                <thead>
			                           <tr>
                                         <th>Id</th>
			                             <th>UF</th>
				                         <th>Registros</th>
                                         <th>Registros</th>
				                       </tr>
				                     </thead>
   	                                    <tbody>
                                       <asp:Repeater ID="rptRegiaoTarget" runat="server"  >
                                         <HeaderTemplate>
                                         </HeaderTemplate>
                                         <ItemTemplate>
                                       <tr>
                                         <td id='IdUsuario_<%#Eval("id") %>'><%# Eval("id")%></td>
                                         <td id='NmUsuario_<%#Eval("UF") %>'><%# Eval("UF")%></td>
                                         <td id='Email_<%#Eval("QtdRegistros") %>'><%# Eval("QtdRegistros")%></td>
                                          <td id='Registros_<%#Eval("NroRegistros") %>'><%# Eval("NroRegistros")%></td>
                                       </tr>
                                       </ItemTemplate>
                                       </asp:Repeater>
 		                             </tbody>
						             </table>
						          </div><!-- DIV TABLE -->	 

	                            </div><!-- DIV  -->	
                               </div><!-- DIV TABLE ROW -->
                     
                            </div><!-- PANEL BODY -->                                                                      
			        
                          </div>
                    </div>
                </div>
                <!-- Accordion end -->


                <div class="panel panel-default" >
                    <div class="panel-heading"" id="pnlDDD">  
                        <br />
                        <button class="btn btn-block btn-primary waves-effect waves-light" type="button" aria-expanded="true" id="acbtnDDD" href="#collapseTwo" data-toggle="collapse" data-target="#collapseTwo" data-parent="#accordion" onclick="CtrlClickAccordion('DDD', this);">  
                        <i class="fe-plus-circle"></i>
                            &nbsp;DDD
                        </button> 								 
			    </div>
                    <div class="panel-collapse collapse" id="collapseTwo">
                        <div class="panel-body">

                                         
                            <!-- DDD Begin -->
                            <!-- tableDDD ini -->
                            <div class="row">
                                             
                                          
                            <!-- DDD Source Begin -->
						    <div class="col-md-6">
							    <div class="table-header">
							    <hr />
							    </div>
                                <div class="table-responsive" id="divTbDDDSource">
							    </div>
						    </div>
                            <!-- DDD Source End -->

                            <!-- DDD Target Begin -->
						    <div class="col-md-6 col-md-offset-6">
							    <div class="table-header">
                            <br />
							    <button type="button" class="width-30 btn-sm btn-danger pull-right"  id="Button10" onclick="selectAll('DDD',2);"> 
   	                            Limpar Seleção
                            </button>
                                    <br /><br />
							    </div>
                                <div class="table-responsive" id="divTbDDDTarget">
                            </div>
                            </div>
                        </div> <!-- row --> 
                                    <!-- DDD Target End -->
                                               
                        </div>
				    </div>
			    </div> <!-- DDD End --> 
                
                </br>

               <div class="panel-heading"" id="pnlMSR">  
                <button class="btn btn-block btn-primary waves-effect waves-light" type="button" aria-expanded="true" id="acbtnMSR" href="#collapseMSR" data-toggle="collapse" data-target="#collapseMSR" data-parent="#accordion" onclick="CtrlClickAccordion('MSR', this);">  
                   <i class="fe-plus-circle"></i>
                      &nbsp;MESSOREGIÃO
                </button> 								 
              <div class="panel-collapse collapse" id="collapseMSR">
                <div class="panel-body">
                   <div class="row">
                       <div class="col-md-6">
					     <div class="table-header">
					         <hr />
						 </div>
                            <div class="table-responsive" id="divTbMSRSource"></div>
						</div>

                        <!-- MessoRegião Target Begin -->
	  	  	            <div class="col-md-6 col-md-offset-6">
					       <div class="table-header">
                           <br />
						  <button type="button" class="width-30 btn-sm btn-danger pull-right"  id="Button100" onclick="selectAll('MSR',2);"> 
                             Limpar Seleção
                          </button>
                          <br /><br />
	  			          </div>
                          <div class="table-responsive" id="divTbMSRTarget"> </div>
                         </div>
                       </div> <!-- row --> 
                       <!-- MessoRegiao Target End -->
                                               
                    </div>
 		           </div>
			     </div> <!-- Messoregiao End --> 

               
                <div class="panel panel-default" >
              <div class="panel-heading"" id="pnlMCR">  
                <br />
                <button class="btn btn-block btn-primary waves-effect waves-light" type="button" aria-expanded="true" id="acbtnMCR" href="#collapseMCR" data-toggle="collapse" data-target="#collapseMCR" data-parent="#accordion" onclick="CtrlClickAccordion('MCR', this);">  
                   <i class="fe-plus-circle"></i>
                      &nbsp;MICROREGIÃO
                </button> 								 
			  </div>
              <div class="panel-collapse collapse" id="collapseMCR">
                <div class="panel-body">
                   <div class="row">
                       <div class="col-md-6">
					     <div class="table-header">
					         <hr />
						 </div>
                         <div class="table-responsive" id="divTbMCRSource"></div>
						</div>

                        <!-- MicroRegião Target Begin -->
	  	  	            <div class="col-md-6 col-md-offset-6">
					       <div class="table-header">
                           <br />
						  <button type="button" class="width-30 btn-sm btn-danger pull-right"  id="Button10" onclick="selectAll('MCR',2);"> 
                             Limpar Seleção
                          </button>
                          <br /><br />
	  			          </div>
                          <div class="table-responsive" id="divTbMCRTarget">
                          </div>
                         </div>
                       </div> <!-- row --> 
                       <!-- MicroRegião Target End -->
                                               
                    </div>
 		           </div>
			     </div> <!-- MicroRegião End --> 


                </br>

                <div class="panel panel-default">
								   <div class="panel-heading"" id="pnlMunicipio">
								     
								       <button class="btn btn-block btn-primary waves-effect waves-light" type="button" aria-expanded="true"" id="acbtnMunicipio" href="#collapseThree" data-toggle="collapse"  data-target="#collapseThree" data-parent="#accordion" onclick="CtrlClickAccordion('Municipio', this);"> <!-- Customized by Filipe: do not close on other open: data-parent="#accordion" -->
								         <i class="fe-plus-circle" data-icon-show=" fe-arrow-down" data-icon-hide="icon-angle-down"></i>
								         &nbsp;MUNÍCIPIOS
									   </button>
									 
								   </div>
					               <div class="panel-collapse collapse" id="collapseThree">
					               
                                       <div class="panel-body">
                                          <br /> <br />
                                        <div class="col-md-12">
                                         <div class="col-md-3" >
                                          
                                              <input type="file" class="dropify" id="fluMUN" name="Arquivo" accept=".txt,.csv,.xls,.xlsx" data-max-file-size="1M">
                                                                                                                           
                                          </div>
                                            <div class="col-md-6" >
                                                <div id="divMUNErroImp">
                                                     </div>
                                             </div>
                                            <br />
                                            </div>
                                      <!-- Municipio Begin -->
                                      <!-- tableMunicipio ini -->
                               
                                   <div class="row">
                                   <!--    <div class="row">
                                            
                                        <!-- Municipio Source Begin -->
									     <div class="col-md-6">
										    <div class="table-header">	
                                                
                                                   
										    </div>
                                              <div class="table-responsive" id="divTbMunicipioSource">
										    </div>
									    </div>
                                       <!-- Municipio Source End -->
                                       <!-- Municipio Target Begin -->
									     <div class="col-md-6 col-md-offset-6">
									        <div class="table-header" id="divMunSelectAll">
										      <button type="button" class="width-30  btn-danger btn-sm pull-right"  id="Button6" onclick="selectAll('MUN',2);"> 
   	                                           Limpar Seleção
                                            </button>   <br /><br />
									        </div>

                                            <div class="table-responsive" id="divTbMunicipioTarget">
									        </div>

								        </div>
                                     </div>
                                   <!--    </div> row --> 
                                      <!-- Municipio Target End -->
                                      <!-- Municipio End -->
                                    </div>
								  </div>
                                </div>
                            

                 <br />
               
                 <div class="panel panel-default">
								     <div class="panel-heading"" id="pnlCEP">
								     
								       <button class="btn btn-block btn-primary waves-effect waves-light" type="button" aria-expanded="true" id="acbtnCEP" href="#collapseFour" data-toggle="collapse"  data-target="#collapseFour" data-parent="#accordion" onclick="CtrlClickAccordion('CEP', this);"> 
								          <i class="fe-plus-circle"></i>
								         &nbsp;FAIXA DE CEP
									   </button>
									 
								   </div>
					               <div class="panel-collapse collapse" id="collapseFour">
					                <div class="panel-body">

                                    <div class="row">
									   
									
                                        <div class="col-md-12">
                                         <div class="text-center w-75 m-auto">
				                             <div class="form-group">
                                                 <div class="col-md-6">
                            
                                             <br />
                            <input type="file" class="dropify" id="fluCEP" name="Arquivo" accept=".txt,.csv,.xls,.xlsx" data-max-file-size="1M">
                                            
                                             <br />
                            </div>
                        </div>
                     </div>
                    

                        <div class="text-center w-75 m-auto">                        
					        <div class="form-group col-md-4">                                                
                                <input data-toggle="input-mask"  id="idCepIni" data-mask-format="00000-000" maxlength="9" placeholder="CEP INICIAL" type="text" class="form-control" onchange="PesquisaDBAgrup(this.value,10)" />
                                  <span class="text-dark"><i class="fe-arrow-down"></i></span>
							     <input data-toggle="input-mask"  id="idCepFim" data-mask-format="00000-000" maxlength="9" placeholder="CEP FINAL" type="text" class="form-control" onchange="PesquisaDBAgrup(this.value,11)" />   				         
                           </div>
                        </div>    
                                            
                                            <br />
                   <button type="button" class="width-30  btn-danger btn-sm pull-right" id="btnLimpaCEP" onclick="idCepFim.value='';idCepIni.value='';PesquisaDBAgrup(this.value,10);PesquisaDBAgrup(this.value,11);"> Limpar</button>
				      
                                        
                                        </div>
                    

					                    </div>
                                        <br /><br />
                                    </div>
						    	 </div>
                               </div> <!-- PANEL DEFAULT -->


          </div>
            <!-- Região Fim  -->

           
            <!-- Atividade Economica Início -->
            <div class="tab-pane" id="setor">
              <div class="accordion-style1 panel-group accordion-style2" id="accordionEspecialidades" >
                <div class="panel panel-default">
	  			  <div class="panel-heading">
					 <h4 class="panel-title">
					   <button class="btn btn-block btn-primary waves-effect waves-light" type="button" data-toggle="collapse" data-parent="#accordion" id="acbtnRamo" href="#collapseAtividade" data-target="#collapseAtividade" onclick="CtrlClickAccordion('FUNC', this);">
	            	       <i class="fe-plus-circle"></i>
							  &nbsp;ATIVIDADE ECONÔMICA - CNAE
					   </button>
				     </h4>
				  </div>
			       <div class="panel-collapse collapse" id="collapseAtividade">
                     <div class="panel-body">
                       <div class="card-box">
                         <div class="col-md-12">
                           <div class="row">
                              <select class="multiple" style="width:75%" id="selDivisao" onchange="filtraDivisao();">
                              <option value="">FILTRAR DIVISAO CNAE</option><option value="01">01 - AGRICULTURA, PECUARIA E SERVICOS RELACIONADOS</option><option value="02">02 - PRODUCAO FLORESTAL</option><option value="03">03 - PESCA E AQUICULTURA</option><option value="05">05 - EXTRACAO DE CARVAO MINERAL</option><option value="06">06 - EXTRACAO DE PETROLEO E GAS NATURAL</option><option value="07">07 - EXTRACAO DE MINERAIS METALICOS</option><option value="08">08 - EXTRACAO DE MINERAIS NAO-METALICOS</option><option value="09">09 - ATIVIDADES DE APOIO A EXTRACAO DE MINERAIS</option><option value="10">10 - FABRICACAO DE PRODUTOS ALIMENTICIOS</option><option value="11">11 - FABRICACAO DE BEBIDAS</option><option value="12">12 - FABRICACAO DE PRODUTOS DO FUMO</option><option value="13">13 - FABRICACAO DE PRODUTOS TEXTEIS</option><option value="14">14 - CONFECCAO DE ARTIGOS DO VESTUARIO E ACESSORIOS</option><option value="15">15 - PREPARACAO DE COUROS E FABRICACAO DE ARTEFATOS DE COURO, ARTIGOS PARA VIAGEM E CALCADOS</option><option value="16">16 - FABRICACAO DE PRODUTOS DE MADEIRA</option><option value="17">17 - FABRICACAO DE CELULOSE, PAPEL E PRODUTOS DE PAPEL</option><option value="18">18 - IMPRESSAO E REPRODUCAO DE GRAVACOES</option><option value="19">19 - FABRICACAO DE COQUE, DE PRODUTOS DERIVADOS DO PETROLEO E DE BIOCOMBUSTIVEIS</option><option value="20">20 - FABRICACAO DE PRODUTOS QUIMICOS</option><option value="21">21 - FABRICACAO DE PRODUTOS FARMOQUIMICOS E FARMACEUTICOS</option><option value="22">22 - FABRICACAO DE PRODUTOS DE BORRACHA E DE MATERIAL PLASTICO</option><option value="23">23 - FABRICACAO DE PRODUTOS DE MINERAIS NAO-METALICOS</option><option value="24">24 - METALURGIA</option><option value="25">25 - FABRICACAO DE PRODUTOS DE METAL, EXCETO MAQUINAS E EQUIPAMENTOS</option><option value="26">26 - FABRICACAO DE EQUIPAMENTOS DE INFORMATICA, PRODUTOS ELETRONICOS E OPTICOS</option><option value="27">27 - FABRICACAO DE MAQUINAS, APARELHOS E MATERIAIS ELETRICOS</option><option value="28">28 - FABRICACAO DE MAQUINAS E EQUIPAMENTOS</option><option value="29">29 - FABRICACAO DE VEICULOS AUTOMOTORES, REBOQUES E CARROCERIAS</option><option value="30">30 - FABRICACAO DE OUTROS EQUIPAMENTOS DE TRANSPORTE, EXCETO VEICULOS AUTOMOTORES</option><option value="31">31 - FABRICACAO DE MOVEIS</option><option value="32">32 - FABRICACAO DE PRODUTOS DIVERSOS</option><option value="33">33 - MANUTENCAO, REPARACAO E INSTALACAO DE MAQUINAS E EQUIPAMENTOS</option><option value="35">35 - ELETRICIDADE, GAS E OUTRAS UTILIDADES</option><option value="36">36 - CAPTACAO, TRATAMENTO E DISTRIBUICAO DE AGUA</option><option value="37">37 - ESGOTO E ATIVIDADES RELACIONADAS</option><option value="38">38 - COLETA, TRATAMENTO E DISPOSICAO DE RESIDUOS; RECUPERACAO DE MATERIAIS</option><option value="39">39 - DESCONTAMINACAO E OUTROS SERVICOS DE GESTAO DE RESIDUOS</option><option value="41">41 - CONSTRUCAO DE EDIFICIOS</option><option value="42">42 - OBRAS DE INFRA-ESTRUTURA</option><option value="43">43 - SERVICOS ESPECIALIZADOS PARA CONSTRUCAO</option><option value="45">45 - COMERCIO E REPARACAO DE VEICULOS AUTOMOTORES E MOTOCICLETAS</option><option value="46">46 - COMERCIO POR ATACADO, EXCETO VEICULOS AUTOMOTORES E MOTOCICLETAS</option><option value="47">47 - COMERCIO VAREJISTA</option><option value="49">49 - TRANSPORTE TERRESTRE</option><option value="50">50 - TRANSPORTE AQUAVIARIO</option><option value="51">51 - TRANSPORTE AEREO</option><option value="52">52 - ARMAZENAMENTO E ATIVIDADES AUXILIARES DOS TRANSPORTES</option><option value="53">53 - CORREIO E OUTRAS ATIVIDADES DE ENTREGA</option><option value="55">55 - ALOJAMENTO</option><option value="56">56 - ALIMENTACAO</option><option value="58">58 - EDICAO E EDICAO INTEGRADA A IMPRESSAO</option><option value="59">59 - ATIVIDADES CINEMATOGRAFICAS, PRODUCAO DE VIDEOS E DE PROGRAMAS DE TELEVISAO; GRAVACAO DE SOM E EDICAO DE MUSICA</option><option value="60">60 - ATIVIDADES DE RADIO E DE TELEVISAO</option><option value="61">61 - TELECOMUNICACOES</option><option value="62">62 - ATIVIDADES DOS SERVICOS DE TECNOLOGIA DA INFORMACAO</option><option value="63">63 - ATIVIDADES DE PRESTACAO DE SERVICOS DE INFORMACAO</option><option value="64">64 - ATIVIDADES DE SERVICOS FINANCEIROS</option><option value="65">65 - SEGUROS, RESSEGUROS, PREVIDENCIA COMPLEMENTAR E PLANOS DE SAUDE</option><option value="66">66 - ATIVIDADES AUXILIARES DOS SERVICOS FINANCEIROS, SEGUROS, PREVIDENCIA COMPLEMENTAR E PLANOS DE SAUDE</option><option value="68">68 - ATIVIDADES IMOBILIARIAS</option><option value="69">69 - ATIVIDADES JURIDICAS, DE CONTABILIDADE E DE AUDITORIA</option><option value="70">70 - ATIVIDADES DE SEDES DE EMPRESAS E DE CONSULTORIA EM GESTAO EMPRESARIAL</option><option value="71">71 - SERVICOS DE ARQUITETURA E ENGENHARIA; TESTES E ANALISES TECNICAS</option><option value="72">72 - PESQUISA E DESENVOLVIMENTO CIENTIFICO</option><option value="73">73 - PUBLICIDADE E PESQUISA DE MERCADO</option><option value="74">74 - OUTRAS ATIVIDADES PROFISSIONAIS, CIENTIFICAS E TECNICAS</option><option value="75">75 - ATIVIDADES VETERINARIAS</option><option value="77">77 - ALUGUEIS NAO-IMOBILIARIOS E GESTAO DE ATIVOS INTANGIVEIS NAO-FINANCEIROS</option><option value="78">78 - SELECAO, AGENCIAMENTO E LOCACAO DE MAO-DE-OBRA</option><option value="79">79 - AGENCIAS DE VIAGENS, OPERADORES TURISTICOS E SERVICOS DE RESERVAS</option><option value="80">80 - ATIVIDADES DE VIGILANCIA, SEGURANCA E INVESTIGACAO</option><option value="81">81 - SERVICOS PARA EDIFICIOS E ATIVIDADES PAISAGISTICAS</option><option value="82">82 - SERVICOS DE ESCRITORIO, DE APOIO ADMINISTRATIVO E OUTROS SERVICOS PRESTADOS AS EMPRESAS</option><option value="84">84 - ADMINISTRACAO PUBLICA, DEFESA E SEGURIDADE SOCIAL</option><option value="85">85 - EDUCACAO</option><option value="86">86 - ATIVIDADES DE ATENCAO A SAUDE HUMANA</option><option value="87">87 - ATIVIDADES DE ATENCAO A SAUDE HUMANA INTEGRADAS COM ASSISTENCIA SOCIAL, PRESTADAS EM RESIDENCIAS COLETIVAS E PARTICULARES</option><option value="88">88 - SERVICOS DE ASSISTENCIA SOCIAL SEM ALOJAMENTO</option><option value="90">90 - ATIVIDADES ARTISTICAS, CRIATIVAS E DE ESPETACULOS</option><option value="91">91 - ATIVIDADES LIGADAS AO PATRIMONIO CULTURAL E AMBIENTAL</option><option value="92">92 - ATIVIDADES DE EXPLORACAO DE JOGOS DE AZAR E APOSTAS</option><option value="93">93 - ATIVIDADES ESPORTIVAS E DE RECREACAO E LAZER</option><option value="94">94 - ATIVIDADES DE ORGANIZACOES ASSOCIATIVAS</option><option value="95">95 - REPARACAO E MANUTENCAO DE EQUIPAMENTOS DE INFORMATICA E COMUNICACAO E DE OBJETOS PESSOAIS E DOMESTICOS</option><option value="96">96 - OUTRAS ATIVIDADES DE SERVICOS PESSOAIS</option><option value="97">97 - SERVICOS DOMESTICOS</option><option value="99">99 - ORGANISMOS INTERNACIONAIS E OUTRAS INSTITUICOES EXTRATERRITORIAIS</option></select>
                              <br /><br />
                              <select class="multiple" style="width:75%" id="selGrupo" onchange="filtraGrupo();">
                              <option value="">FILTRAR  GRUPO CNAE</option><option value="011">011 - PRODUCAO DE LAVOURAS TEMPORARIAS</option><option value="012">012 - HORTICULTURA E FLORICULTURA</option><option value="013">013 - PRODUCAO DE LAVOURAS PERMANENTES</option><option value="014">014 - PRODUCAO DE SEMENTES E MUDAS CERTIFICADAS</option><option value="015">015 - PECUARIA</option><option value="016">016 - ATIVIDADES DE APOIO A AGRICULTURA E A PECUARIA; ATIVIDADES DE POS-COLHEITA</option><option value="017">017 - CACA E SERVICOS RELACIONADOS</option><option value="021">021 - PRODUCAO FLORESTAL - FLORESTAS PLANTADAS</option><option value="022">022 - PRODUCAO FLORESTAL - FLORESTAS NATIVAS</option><option value="023">023 - ATIVIDADES DE APOIO A PRODUCAO FLORESTAL</option><option value="031">031 - PESCA</option><option value="032">032 - AQUICULTURA</option><option value="050">050 - EXTRACAO DE CARVAO MINERAL</option><option value="060">060 - EXTRACAO DE PETROLEO E GAS NATURAL</option><option value="071">071 - EXTRACAO DE MINERIO DE FERRO</option><option value="072">072 - EXTRACAO DE MINERAIS METALICOS NAO-FERROSOS</option><option value="081">081 - EXTRACAO DE PEDRA, AREIA E ARGILA</option><option value="089">089 - EXTRACAO DE OUTROS MINERAIS NAO-METALICOS</option><option value="091">091 - ATIVIDADES DE APOIO A EXTRACAO DE PETROLEO E GAS NATURAL</option><option value="099">099 - ATIVIDADES DE APOIO A EXTRACAO DE MINERAIS, EXCETO PETROLEO E GAS NATURAL</option><option value="101">101 - ABATE E FABRICACAO DE PRODUTOS DE CARNE</option><option value="102">102 - PRESERVACAO DO PESCADO E FABRICACAO DE PRODUTOS DO PESCADO</option><option value="103">103 - FABRICACAO DE CONSERVAS DE FRUTAS, LEGUMES E OUTROS VEGETAIS</option><option value="104">104 - FABRICACAO DE OLEOS E GORDURAS VEGETAIS E ANIMAIS</option><option value="105">105 - LATICINIOS</option><option value="106">106 - MOAGEM, FABRICACAO DE PRODUTOS AMILACEOS E DE ALIMENTOS PARA ANIMAIS</option><option value="107">107 - FABRICACAO E REFINO DE ACUCAR</option><option value="108">108 - TORREFACAO E MOAGEM DE CAFE</option><option value="109">109 - FABRICACAO DE OUTROS PRODUTOS ALIMENTICIOS</option><option value="111">111 - FABRICACAO DE BEBIDAS ALCOOLICAS</option><option value="112">112 - FABRICACAO DE BEBIDAS NAO-ALCOOLICAS</option><option value="121">121 - PROCESSAMENTO INDUSTRIAL DO FUMO</option><option value="122">122 - FABRICACAO DE PRODUTOS DO FUMO</option><option value="131">131 - PREPARACAO E FIACAO DE FIBRAS TEXTEIS</option><option value="132">132 - TECELAGEM, EXCETO MALHA</option><option value="133">133 - FABRICACAO DE TECIDOS DE MALHA</option><option value="134">134 - ACABAMENTOS EM FIOS, TECIDOS E ARTEFATOS TEXTEIS</option><option value="135">135 - FABRICACAO DE ARTEFATOS TEXTEIS, EXCETO VESTUARIO</option><option value="141">141 - CONFECCAO DE ARTIGOS DO VESTUARIO E ACESSORIOS</option><option value="142">142 - FABRICACAO DE ARTIGOS DE MALHARIA E TRICOTAGEM</option><option value="151">151 - CURTIMENTO E OUTRAS PREPARACOES DE COURO</option><option value="152">152 - FABRICACAO DE ARTIGOS PARA VIAGEM E DE ARTEFATOS DIVERSOS DE COURO</option><option value="153">153 - FABRICACAO DE CALCADOS</option><option value="154">154 - FABRICACAO DE PARTES PARA CALCADOS, DE QUALQUER MATERIAL</option><option value="161">161 - DESDOBRAMENTO DE MADEIRA</option><option value="162">162 - FABRICACAO DE PRODUTOS DE MADEIRA, CORTICA E MATERIAL TRANCADO, EXCETO MOVEIS</option><option value="171">171 - FABRICACAO DE CELULOSE E OUTRAS PASTAS PARA A FABRICACAO DE PAPEL</option><option value="172">172 - FABRICACAO DE PAPEL, CARTOLINA E PAPEL-CARTAO</option><option value="173">173 - FABRICACAO DE EMBALAGENS DE PAPEL, CARTOLINA, PAPEL-CARTAO E PAPELAO ONDULADO</option><option value="174">174 - FABRICACAO DE PRODUTOS DIVERSOS DE PAPEL, CARTOLINA, PAPEL-CARTAO E PAPELAO ONDULADO</option><option value="181">181 - ATIVIDADE DE IMPRESSAO</option><option value="182">182 - SERVICOS DE PRE-IMPRESSAO E ACABAMENTOS GRAFICOS</option><option value="183">183 - REPRODUCAO DE MATERIAIS GRAVADOS EM QUALQUER SUPORTE</option><option value="191">191 - COQUERIAS</option><option value="192">192 - FABRICACAO DE PRODUTOS DERIVADOS DO PETROLEO</option><option value="193">193 - FABRICACAO DE BIOCOMBUSTIVEIS</option><option value="201">201 - FABRICACAO DE PRODUTOS QUIMICOS INORGANICOS</option><option value="202">202 - FABRICACAO DE PRODUTOS QUIMICOS ORGANICOS</option><option value="203">203 - FABRICACAO DE RESINAS E ELASTOMEROS</option><option value="204">204 - FABRICACAO DE FIBRAS ARTIFICIAIS E SINTETICAS</option><option value="205">205 - FABRICACAO DE DEFENSIVOS AGRICOLAS E DESINFESTANTES DOMISSANITARIOS</option><option value="206">206 - FABRICACAO DE SABOES, DETERGENTES, PRODUTOS DE LIMPEZA, COSMETICOS, PRODUTOS DE PERFUMARIA E DE HIGIENE PESSOAL</option><option value="207">207 - FABRICACAO DE TINTAS, VERNIZES, ESMALTES, LACAS E PRODUTOS AFINS</option><option value="209">209 - FABRICACAO DE PRODUTOS E PREPARADOS QUIMICOS DIVERSOS</option><option value="211">211 - FABRICACAO DE PRODUTOS FARMOQUIMICOS</option><option value="212">212 - FABRICACAO DE PRODUTOS FARMACEUTICOS</option><option value="221">221 - FABRICACAO DE PRODUTOS DE BORRACHA</option><option value="222">222 - FABRICACAO DE PRODUTOS DE MATERIAL PLASTICO</option><option value="231">231 - FABRICACAO DE VIDRO E DE PRODUTOS DO VIDRO</option><option value="232">232 - FABRICACAO DE CIMENTO</option><option value="233">233 - FABRICACAO DE ARTEFATOS DE CONCRETO, CIMENTO, FIBROCIMENTO, GESSO E MATERIAIS SEMELHANTES</option><option value="234">234 - FABRICACAO DE PRODUTOS CERAMICOS</option><option value="239">239 - APARELHAMENTO DE PEDRAS E FABRICACAO DE OUTROS PRODUTOS DE MINERAIS NAO-METALICOS</option><option value="241">241 - PRODUCAO DE FERRO-GUSA E DE FERROLIGAS</option><option value="242">242 - SIDERURGIA</option><option value="243">243 - PRODUCAO DE TUBOS DE ACO, EXCETO TUBOS SEM COSTURA</option><option value="244">244 - METALURGIA DOS METAIS NAO-FERROSOS</option><option value="245">245 - FUNDICAO</option><option value="251">251 - FABRICACAO DE ESTRUTURAS METALICAS E OBRAS DE CALDEIRARIA PESADA</option><option value="252">252 - FABRICACAO DE TANQUES, RESERVATORIOS METALICOS E CALDEIRAS</option><option value="253">253 - FORJARIA, ESTAMPARIA, METALURGIA DO PO E SERVICOS DE TRATAMENTO DE METAIS</option><option value="254">254 - FABRICACAO DE ARTIGOS DE CUTELARIA, DE SERRALHERIA E FERRAMENTAS</option><option value="255">255 - FABRICACAO DE EQUIPAMENTO BELICO PESADO, ARMAS DE FOGO E MUNICOES</option><option value="259">259 - FABRICACAO DE PRODUTOS DE METAL NAO ESPECIFICADOS ANTERIORMENTE</option><option value="261">261 - FABRICACAO DE COMPONENTES ELETRONICOS</option><option value="262">262 - FABRICACAO DE EQUIPAMENTOS DE INFORMATICA E PERIFERICOS</option><option value="263">263 - FABRICACAO DE EQUIPAMENTOS DE COMUNICACAO</option><option value="264">264 - FABRICACAO DE APARELHOS DE RECEPCAO, REPRODUCAO, GRAVACAO E AMPLIFICACAO DE AUDIO E VIDEO</option><option value="265">265 - FABRICACAO DE APARELHOS E INSTRUMENTOS DE MEDIDA, TESTE E CONTROLE; CRONOMETROS E RELOGIOS</option><option value="266">266 - FABRICACAO DE APARELHOS ELETROMEDICOS E ELETROTERAPEUTICOS E EQUIPAMENTOS DE IRRADIACAO</option><option value="267">267 - FABRICACAO DE EQUIPAMENTOS E INSTRUMENTOS OPTICOS, FOTOGRAFICOS E CINEMATOGRAFICOS</option><option value="268">268 - FABRICACAO DE MIDIAS VIRGENS, MAGNETICAS E OPTICAS</option><option value="271">271 - FABRICACAO DE GERADORES, TRANSFORMADORES E MOTORES ELETRICOS</option><option value="272">272 - FABRICACAO DE PILHAS, BATERIAS E ACUMULADORES ELETRICOS</option><option value="273">273 - FABRICACAO DE EQUIPAMENTOS PARA DISTRIBUICAO E CONTROLE DE ENERGIA ELETRICA</option><option value="274">274 - FABRICACAO DE LAMPADAS E OUTROS EQUIPAMENTOS DE ILUMINACAO</option><option value="275">275 - FABRICACAO DE ELETRODOMESTICOS</option><option value="279">279 - FABRICACAO DE EQUIPAMENTOS E APARELHOS ELETRICOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="281">281 - FABRICACAO DE MOTORES, BOMBAS, COMPRESSORES E EQUIPAMENTOS DE TRANSMISSAO</option><option value="282">282 - FABRICACAO DE MAQUINAS E EQUIPAMENTOS DE USO GERAL</option><option value="283">283 - FABRICACAO DE TRATORES E DE MAQUINAS E EQUIPAMENTOS PARA A AGRICULTURA E PECUARIA</option><option value="284">284 - FABRICACAO DE MAQUINAS-FERRAMENTA</option><option value="285">285 - FABRICACAO DE MAQUINAS E EQUIPAMENTOS DE USO NA EXTRACAO MINERAL E NA CONSTRUCAO</option><option value="286">286 - FABRICACAO DE MAQUINAS E EQUIPAMENTOS DE USO INDUSTRIAL ESPECIFICO</option><option value="291">291 - FABRICACAO DE AUTOMOVEIS, CAMIONETAS E UTILITARIOS</option><option value="292">292 - FABRICACAO DE CAMINHOES E ONIBUS</option><option value="293">293 - FABRICACAO DE CABINES, CARROCERIAS E REBOQUES PARA VEICULOS AUTOMOTORES</option><option value="294">294 - FABRICACAO DE PECAS E ACESSORIOS PARA VEICULOS AUTOMOTORES</option><option value="295">295 - RECONDICIONAMENTO E RECUPERACAO DE MOTORES PARA VEICULOS AUTOMOTORES</option><option value="301">301 - CONSTRUCAO DE EMBARCACOES</option><option value="303">303 - FABRICACAO DE VEICULOS FERROVIARIOS</option><option value="304">304 - FABRICACAO DE AERONAVES</option><option value="305">305 - FABRICACAO DE VEICULOS MILITARES DE COMBATE</option><option value="309">309 - FABRICACAO DE EQUIPAMENTOS DE TRANSPORTE NAO ESPECIFICADOS ANTERIORMENTE</option><option value="310">310 - FABRICACAO DE MOVEIS</option><option value="321">321 - FABRICACAO DE ARTIGOS DE JOALHERIA, BIJUTERIA E SEMELHANTES</option><option value="322">322 - FABRICACAO DE INSTRUMENTOS MUSICAIS</option><option value="323">323 - FABRICACAO DE ARTEFATOS PARA PESCA E ESPORTE</option><option value="324">324 - FABRICACAO DE BRINQUEDOS E JOGOS RECREATIVOS</option><option value="325">325 - FABRICACAO DE INSTRUMENTOS E MATERIAIS PARA USO MEDICO E ODONTOLOGICO E DE ARTIGOS OPTICOS</option><option value="329">329 - FABRICACAO DE PRODUTOS DIVERSOS</option><option value="331">331 - MANUTENCAO E REPARACAO DE MAQUINAS E EQUIPAMENTOS</option><option value="332">332 - INSTALACAO DE MAQUINAS E EQUIPAMENTOS</option><option value="351">351 - GERACAO, TRANSMISSAO E DISTRIBUICAO DE ENERGIA ELETRICA</option><option value="352">352 - PRODUCAO E DISTRIBUICAO DE COMBUSTIVEIS GASOSOS POR REDES URBANAS</option><option value="353">353 - PRODUCAO E DISTRIBUICAO DE VAPOR, AGUA QUENTE E AR CONDICIONADO</option><option value="360">360 - CAPTACAO, TRATAMENTO E DISTRIBUICAO DE AGUA</option><option value="370">370 - ESGOTO E ATIVIDADES RELACIONADAS</option><option value="381">381 - COLETA DE RESIDUOS</option><option value="382">382 - TRATAMENTO E DISPOSICAO DE RESIDUOS</option><option value="383">383 - RECUPERACAO DE MATERIAIS</option><option value="390">390 - DESCONTAMINACAO E OUTROS SERVICOS DE GESTAO DE RESIDUOS</option><option value="411">411 - INCORPORACAO DE EMPREENDIMENTOS IMOBILIARIOS</option><option value="412">412 - CONSTRUCAO DE EDIFICIOS</option><option value="421">421 - CONSTRUCAO DE RODOVIAS, FERROVIAS, OBRAS URBANAS E OBRAS DE ARTE ESPECIAIS</option><option value="422">422 - OBRAS DE INFRA-ESTRUTURA PARA ENERGIA ELETRICA, TELECOMUNICACOES, AGUA, ESGOTO E TRANSPORTE POR DUTOS</option><option value="429">429 - CONSTRUCAO DE OUTRAS OBRAS DE INFRA-ESTRUTURA</option><option value="431">431 - DEMOLICAO E PREPARACAO DO TERRENO</option><option value="432">432 - INSTALACOES ELETRICAS, HIDRAULICAS E OUTRAS INSTALACOES EM CONSTRUCOES</option><option value="433">433 - OBRAS DE ACABAMENTO</option><option value="439">439 - OUTROS SERVICOS ESPECIALIZADOS PARA CONSTRUCAO</option><option value="451">451 - COMERCIO DE VEICULOS AUTOMOTORES</option><option value="452">452 - MANUTENCAO E REPARACAO DE VEICULOS AUTOMOTORES</option><option value="453">453 - COMERCIO DE PECAS E ACESSORIOS PARA VEICULOS AUTOMOTORES</option><option value="454">454 - COMERCIO, MANUTENCAO E REPARACAO DE MOTOCICLETAS, PECAS E ACESSORIOS</option><option value="461">461 - REPRESENTANTES COMERCIAIS E AGENTES DO COMERCIO, EXCETO DE VEICULOS AUTOMOTORES E MOTOCICLETAS</option><option value="462">462 - COMERCIO ATACADISTA DE MATERIAS-PRIMAS AGRICOLAS E ANIMAIS VIVOS</option><option value="463">463 - COMERCIO ATACADISTA ESPECIALIZADO EM PRODUTOS ALIMENTICIOS, BEBIDAS E FUMO</option><option value="464">464 - COMERCIO ATACADISTA DE PRODUTOS DE CONSUMO NAO-ALIMENTAR</option><option value="465">465 - COMERCIO ATACADISTA DE EQUIPAMENTOS E PRODUTOS DE TECNOLOGIAS DE INFORMACAO E COMUNICACAO</option><option value="466">466 - COMERCIO ATACADISTA DE MAQUINAS, APARELHOS E EQUIPAMENTOS, EXCETO DE TECNOLOGIAS DE INFORMACAO E COMUNICACAO</option><option value="467">467 - COMERCIO ATACADISTA DE MADEIRA, FERRAGENS, FERRAMENTAS, MATERIAL ELETRICO E MATERIAL DE CONSTRUCAO</option><option value="468">468 - COMERCIO ATACADISTA ESPECIALIZADO EM OUTROS PRODUTOS</option><option value="469">469 - COMERCIO ATACADISTA NAO-ESPECIALIZADO</option><option value="471">471 - COMERCIO VAREJISTA NAO-ESPECIALIZADO</option><option value="472">472 - COMERCIO VAREJISTA DE PRODUTOS ALIMENTICIOS, BEBIDAS E FUMO</option><option value="473">473 - COMERCIO VAREJISTA DE COMBUSTIVEIS PARA VEICULOS AUTOMOTORES</option><option value="474">474 - COMERCIO VAREJISTA DE MATERIAL DE CONSTRUCAO</option><option value="475">475 - COMERCIO VAREJISTA DE EQUIPAMENTOS DE INFORMATICA E COMUNICACAO; EQUIPAMENTOS E ARTIGOS DE USO DOMESTICO</option><option value="476">476 - COMERCIO VAREJISTA DE ARTIGOS CULTURAIS, RECREATIVOS E ESPORTIVOS</option><option value="477">477 - COMERCIO VAREJISTA DE PRODUTOS FARMACEUTICOS, PERFUMARIA E COSMETICOS E ARTIGOS MEDICOS, OPTICOS E ORTOPEDICOS</option><option value="478">478 - COMERCIO VAREJISTA DE PRODUTOS NOVOS NAO ESPECIFICADOS ANTERIORMENTE E DE PRODUTOS USADOS</option><option value="491">491 - TRANSPORTE FERROVIARIO E METROFERROVIARIO</option><option value="492">492 - TRANSPORTE RODOVIARIO DE PASSAGEIROS</option><option value="493">493 - TRANSPORTE RODOVIARIO DE CARGA</option><option value="494">494 - TRANSPORTE DUTOVIARIO</option><option value="495">495 - TRENS TURISTICOS, TELEFERICOS E SIMILARES</option><option value="501">501 - TRANSPORTE MARITIMO DE CABOTAGEM E LONGO CURSO</option><option value="502">502 - TRANSPORTE POR NAVEGACAO INTERIOR</option><option value="503">503 - NAVEGACAO DE APOIO</option><option value="509">509 - OUTROS TRANSPORTES AQUAVIARIOS</option><option value="511">511 - TRANSPORTE AEREO DE PASSAGEIROS</option><option value="512">512 - TRANSPORTE AEREO DE CARGA</option><option value="513">513 - TRANSPORTE ESPACIAL</option><option value="521">521 - ARMAZENAMENTO, CARGA E DESCARGA</option><option value="522">522 - ATIVIDADES AUXILIARES DOS TRANSPORTES TERRESTRES</option><option value="523">523 - ATIVIDADES AUXILIARES DOS TRANSPORTES AQUAVIARIOS</option><option value="524">524 - ATIVIDADES AUXILIARES DOS TRANSPORTES AEREOS</option><option value="525">525 - ATIVIDADES RELACIONADAS A ORGANIZACAO DO TRANSPORTE DE CARGA</option><option value="531">531 - ATIVIDADES DE CORREIO</option><option value="532">532 - ATIVIDADES DE MALOTE E DE ENTREGA</option><option value="551">551 - HOTEIS E SIMILARES</option><option value="559">559 - OUTROS TIPOS DE ALOJAMENTO NAO ESPECIFICADOS ANTERIORMENTE</option><option value="561">561 - RESTAURANTES E OUTROS SERVICOS DE ALIMENTACAO E BEBIDAS</option><option value="562">562 - SERVICOS DE CATERING, BUFE E OUTROS SERVICOS DE COMIDA PREPARADA</option><option value="581">581 - EDICAO DE LIVROS, JORNAIS, REVISTAS E OUTRAS ATIVIDADES DE EDICAO</option><option value="582">582 - EDICAO INTEGRADA A IMPRESSAO DE LIVROS, JORNAIS, REVISTAS E OUTRAS PUBLICACOES</option><option value="591">591 - ATIVIDADES CINEMATOGRAFICAS, PRODUCAO DE VIDEOS E DE PROGRAMAS DE TELEVISAO</option><option value="592">592 - ATIVIDADES DE GRAVACAO DE SOM E DE EDICAO DE MUSICA</option><option value="601">601 - ATIVIDADES DE RADIO</option><option value="602">602 - ATIVIDADES DE TELEVISAO</option><option value="611">611 - TELECOMUNICACOES POR FIO</option><option value="612">612 - TELECOMUNICACOES SEM FIO</option><option value="613">613 - TELECOMUNICACOES POR SATELITE</option><option value="614">614 - OPERADORAS DE TELEVISAO POR ASSINATURA</option><option value="619">619 - OUTRAS ATIVIDADES DE TELECOMUNICACOES</option><option value="620">620 - ATIVIDADES DOS SERVICOS DE TECNOLOGIA DA INFORMACAO</option><option value="631">631 - TRATAMENTO DE DADOS, HOSPEDAGEM NA INTERNET E OUTRAS ATIVIDADES RELACIONADAS</option><option value="639">639 - OUTRAS ATIVIDADES DE PRESTACAO DE SERVICOS DE INFORMACAO</option><option value="641">641 - BANCO CENTRAL</option><option value="642">642 - INTERMEDIACAO MONETARIA - DEPOSITOS A VISTA</option><option value="643">643 - INTERMEDIACAO NAO-MONETARIA - OUTROS INSTRUMENTOS DE CAPTACAO</option><option value="644">644 - ARRENDAMENTO MERCANTIL</option><option value="645">645 - SOCIEDADES DE CAPITALIZACAO</option><option value="646">646 - ATIVIDADES DE SOCIEDADES DE PARTICIPACAO</option><option value="647">647 - FUNDOS DE INVESTIMENTO</option><option value="649">649 - ATIVIDADES DE SERVICOS FINANCEIROS NAO ESPECIFICADAS ANTERIORMENTE</option><option value="651">651 - SEGUROS DE VIDA E NAO-VIDA</option><option value="652">652 - SEGUROS-SAUDE</option><option value="653">653 - RESSEGUROS</option><option value="654">654 - PREVIDENCIA COMPLEMENTAR</option><option value="655">655 - PLANOS DE SAUDE</option><option value="661">661 - ATIVIDADES AUXILIARES DOS SERVICOS FINANCEIROS</option><option value="662">662 - ATIVIDADES AUXILIARES DOS SEGUROS, DA PREVIDENCIA COMPLEMENTAR E DOS PLANOS DE SAUDE</option><option value="663">663 - ATIVIDADES DE ADMINISTRACAO DE FUNDOS POR CONTRATO OU COMISSAO</option><option value="681">681 - ATIVIDADES IMOBILIARIAS DE IMOVEIS PROPRIOS</option><option value="682">682 - ATIVIDADES IMOBILIARIAS POR CONTRATO OU COMISSAO</option><option value="691">691 - ATIVIDADES JURIDICAS</option><option value="692">692 - ATIVIDADES DE CONTABILIDADE, CONSULTORIA E AUDITORIA CONTABIL E TRIBUTARIA</option><option value="702">702 - ATIVIDADES DE CONSULTORIA EM GESTAO EMPRESARIAL</option><option value="711">711 - SERVICOS DE ARQUITETURA E ENGENHARIA E ATIVIDADES TECNICAS RELACIONADAS</option><option value="712">712 - TESTES E ANALISES TECNICAS</option><option value="721">721 - PESQUISA E DESENVOLVIMENTO EXPERIMENTAL EM CIENCIAS FISICAS E NATURAIS</option><option value="722">722 - PESQUISA E DESENVOLVIMENTO EXPERIMENTAL EM CIENCIAS SOCIAIS E HUMANAS</option><option value="731">731 - PUBLICIDADE</option><option value="732">732 - PESQUISAS DE MERCADO E DE OPINIAO PUBLICA</option><option value="741">741 - DESIGN E DECORACAO DE INTERIORES</option><option value="742">742 - ATIVIDADES FOTOGRAFICAS E SIMILARES</option><option value="749">749 - ATIVIDADES PROFISSIONAIS, CIENTIFICAS E TECNICAS NAO ESPECIFICADAS ANTERIORMENTE</option><option value="750">750 - ATIVIDADES VETERINARIAS</option><option value="771">771 - LOCACAO DE MEIOS DE TRANSPORTE SEM CONDUTOR</option><option value="772">772 - ALUGUEL DE OBJETOS PESSOAIS E DOMESTICOS</option><option value="773">773 - ALUGUEL DE MAQUINAS E EQUIPAMENTOS SEM OPERADOR</option><option value="774">774 - GESTAO DE ATIVOS INTANGIVEIS NAO-FINANCEIROS</option><option value="781">781 - SELECAO E AGENCIAMENTO DE MAO-DE-OBRA</option><option value="782">782 - LOCACAO DE MAO-DE-OBRA TEMPORARIA</option><option value="783">783 - FORNECIMENTO E GESTAO DE RECURSOS HUMANOS PARA TERCEIROS</option><option value="791">791 - AGENCIAS DE VIAGENS E OPERADORES TURISTICOS</option><option value="799">799 - SERVICOS DE RESERVAS E OUTROS SERVICOS DE TURISMO NAO ESPECIFICADOS ANTERIORMENTE</option><option value="801">801 - ATIVIDADES DE VIGILANCIA, SEGURANCA PRIVADA E TRANSPORTE DE VALORES</option><option value="802">802 - ATIVIDADES DE MONITORAMENTO DE SISTEMAS DE SEGURANCA</option><option value="803">803 - ATIVIDADES DE INVESTIGACAO PARTICULAR</option><option value="811">811 - SERVICOS COMBINADOS PARA APOIO A EDIFICIOS</option><option value="812">812 - ATIVIDADES DE LIMPEZA</option><option value="813">813 - ATIVIDADES PAISAGISTICAS</option><option value="821">821 - SERVICOS DE ESCRITORIO E APOIO ADMINISTRATIVO</option><option value="822">822 - ATIVIDADES DE TELEATENDIMENTO</option><option value="823">823 - ATIVIDADES DE ORGANIZACAO DE EVENTOS, EXCETO CULTURAIS E ESPORTIVOS</option><option value="829">829 - OUTRAS ATIVIDADES DE SERVICOS PRESTADOS PRINCIPALMENTE AS EMPRESAS</option><option value="841">841 - ADMINISTRACAO DO ESTADO E DA POLITICA ECONOMICA E SOCIAL</option><option value="842">842 - SERVICOS COLETIVOS PRESTADOS PELA ADMINISTRACAO PUBLICA</option><option value="843">843 - SEGURIDADE SOCIAL OBRIGATORIA</option><option value="851">851 - EDUCACAO INFANTIL E ENSINO FUNDAMENTAL</option><option value="852">852 - ENSINO MEDIO</option><option value="853">853 - EDUCACAO SUPERIOR</option><option value="854">854 - EDUCACAO PROFISSIONAL DE NIVEL TECNICO E TECNOLOGICO</option><option value="855">855 - SERVICOS AUXILIARES A EDUCACAO</option><option value="859">859 - OUTRAS ATIVIDADES DE ENSINO</option><option value="861">861 - ATIVIDADES DE ATENDIMENTO HOSPITALAR</option><option value="862">862 - SERVICOS MOVEIS DE ATENDIMENTO A URGENCIAS E DE REMOCAO DE PACIENTES</option><option value="863">863 - ATIVIDADES DE ATENCAO AMBULATORIAL EXECUTADAS POR MEDICOS E ODONTOLOGOS</option><option value="864">864 - ATIVIDADES DE SERVICOS DE COMPLEMENTACAO DIAGNOSTICA E TERAPEUTICA</option><option value="865">865 - ATIVIDADES DE PROFISSIONAIS DA AREA DE SAUDE, EXCETO MEDICOS E ODONTOLOGOS</option><option value="866">866 - ATIVIDADES DE APOIO A GESTAO DE SAUDE</option><option value="869">869 - ATIVIDADES DE ATENCAO A SAUDE HUMANA NAO ESPECIFICADAS ANTERIORMENTE</option><option value="871">871 - ATIVIDADES DE ASSISTENCIA A IDOSOS, DEFICIENTES FISICOS COM INFRA-ESTRUTURA E APOIO A PACIENTES PRESTADAS EM RESIDENCIAS COLETIVAS E PARTICULARES</option><option value="872">872 - ATIVIDADES DE ASSISTENCIA PSICOSSOCIAL E A SAUDE A PORTADORES DE DISTURBIOS PSIQUICOS, DEFICIENCIA MENTAL E DEPENDENCIA QUIMICA</option><option value="873">873 - ATIVIDADES DE ASSISTENCIA SOCIAL PRESTADAS EM RESIDENCIAS COLETIVAS E PARTICULARES</option><option value="880">880 - SERVICOS DE ASSISTENCIA SOCIAL SEM ALOJAMENTO</option><option value="900">900 - ATIVIDADES ARTISTICAS, CRIATIVAS E DE ESPETACULOS</option><option value="910">910 - ATIVIDADES LIGADAS AO PATRIMONIO CULTURAL E AMBIENTAL</option><option value="920">920 - ATIVIDADES DE EXPLORACAO DE JOGOS DE AZAR E APOSTAS</option><option value="931">931 - ATIVIDADES ESPORTIVAS</option><option value="932">932 - ATIVIDADES DE RECREACAO E LAZER</option><option value="941">941 - ATIVIDADES DE ORGANIZACOES ASSOCIATIVAS PATRONAIS, EMPRESARIAIS E PROFISSIONAIS</option><option value="942">942 - ATIVIDADES DE ORGANIZACOES SINDICAIS</option><option value="943">943 - ATIVIDADES DE ASSOCIACOES DE DEFESA DE DIREITOS SOCIAIS</option><option value="949">949 - ATIVIDADES DE ORGANIZACOES ASSOCIATIVAS NAO ESPECIFICADAS ANTERIORMENTE</option><option value="951">951 - REPARACAO E MANUTENCAO DE EQUIPAMENTOS DE INFORMATICA E COMUNICACAO</option><option value="952">952 - REPARACAO E MANUTENCAO DE OBJETOS E EQUIPAMENTOS PESSOAIS E DOMESTICOS</option><option value="960">960 - OUTRAS ATIVIDADES DE SERVICOS PESSOAIS</option><option value="970">970 - SERVICOS DOMESTICOS</option><option value="990">990 - ORGANISMOS INTERNACIONAIS E OUTRAS INSTITUICOES EXTRATERRITORIAIS</option></select>
                              <br /><br />
                              <select class="multiple" style="width:75%" id="selClasse" onchange="filtraClasse();">
                              <option value="">FILTRAR CLASSE CNAE</option><option value="01113">01113 - CULTIVO DE CEREAIS</option><option value="01121">01121 - CULTIVO DE ALGODAO HERBACEO E DE OUTRAS FIBRAS DE LAVOURA TEMPORARIA</option><option value="01130">01130 - CULTIVO DE CANA-DE-ACUCAR</option><option value="01148">01148 - CULTIVO DE FUMO</option><option value="01156">01156 - CULTIVO DE SOJA</option><option value="01164">01164 - CULTIVO DE OLEAGINOSAS DE LAVOURA TEMPORARIA, EXCETO SOJA</option><option value="01199">01199 - CULTIVO DE PLANTAS DE LAVOURA TEMPORARIA NAO ESPECIFICADAS ANTERIORMENTE</option><option value="01211">01211 - HORTICULTURA</option><option value="01229">01229 - FLORICULTURA</option><option value="01318">01318 - CULTIVO DE LARANJA</option><option value="01326">01326 - CULTIVO DE UVA</option><option value="01334">01334 - CULTIVO DE FRUTAS DE LAVOURA PERMANENTE, EXCETO LARANJA E UVA</option><option value="01342">01342 - CULTIVO DE CAFE</option><option value="01351">01351 - CULTIVO DE CACAU</option><option value="01393">01393 - CULTIVO DE PLANTAS DE LAVOURA PERMANENTE NAO ESPECIFICADAS ANTERIORMENTE</option><option value="01415">01415 - PRODUCAO DE SEMENTES CERTIFICADAS</option><option value="01423">01423 - PRODUCAO DE MUDAS E OUTRAS FORMAS DE PROPAGACAO VEGETAL, CERTIFICADAS</option><option value="01512">01512 - CRIACAO DE BOVINOS</option><option value="01521">01521 - CRIACAO DE OUTROS ANIMAIS DE GRANDE PORTE</option><option value="01539">01539 - CRIACAO DE CAPRINOS E OVINOS</option><option value="01547">01547 - CRIACAO DE SUINOS</option><option value="01555">01555 - CRIACAO DE AVES</option><option value="01598">01598 - CRIACAO DE ANIMAIS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="01610">01610 - ATIVIDADES DE APOIO A AGRICULTURA</option><option value="01628">01628 - ATIVIDADES DE APOIO A PECUARIA</option><option value="01636">01636 - ATIVIDADES DE POS-COLHEITA</option><option value="01709">01709 - CACA E SERVICOS RELACIONADOS</option><option value="02101">02101 - PRODUCAO FLORESTAL - FLORESTAS PLANTADAS</option><option value="02209">02209 - PRODUCAO FLORESTAL - FLORESTAS NATIVAS</option><option value="02306">02306 - ATIVIDADES DE APOIO A PRODUCAO FLORESTAL</option><option value="03116">03116 - PESCA EM AGUA SALGADA</option><option value="03124">03124 - PESCA EM AGUA DOCE</option><option value="03213">03213 - AQUICULTURA EM AGUA SALGADA E SALOBRA</option><option value="03221">03221 - AQUICULTURA EM AGUA DOCE</option><option value="05003">05003 - EXTRACAO DE CARVAO MINERAL</option><option value="06000">06000 - EXTRACAO DE PETROLEO E GAS NATURAL</option><option value="07103">07103 - EXTRACAO DE MINERIO DE FERRO</option><option value="07219">07219 - EXTRACAO DE MINERIO DE ALUMINIO</option><option value="07227">07227 - EXTRACAO DE MINERIO DE ESTANHO</option><option value="07235">07235 - EXTRACAO DE MINERIO DE MANGANES</option><option value="07243">07243 - EXTRACAO DE MINERIO DE METAIS PRECIOSOS</option><option value="07251">07251 - EXTRACAO DE MINERAIS RADIOATIVOS</option><option value="07294">07294 - EXTRACAO DE MINERAIS METALICOS NAO-FERROSOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="08100">08100 - EXTRACAO DE PEDRA, AREIA E ARGILA</option><option value="08916">08916 - EXTRACAO DE MINERAIS PARA FABRICACAO DE ADUBOS, FERTILIZANTES E OUTROS PRODUTOS QUIMICOS</option><option value="08924">08924 - EXTRACAO E REFINO DE SAL MARINHO E SAL-GEMA</option><option value="08932">08932 - EXTRACAO DE GEMAS (PEDRAS PRECIOSAS E SEMIPRECIOSAS)</option><option value="08991">08991 - EXTRACAO DE MINERAIS NAO-METALICOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="09106">09106 - ATIVIDADES DE APOIO A EXTRACAO DE PETROLEO E GAS NATURAL</option><option value="09904">09904 - ATIVIDADES DE APOIO A EXTRACAO DE MINERAIS, EXCETO PETROLEO E GAS NATURAL</option><option value="10112">10112 - ABATE DE RESES, EXCETO SUINOS</option><option value="10121">10121 - ABATE DE SUINOS, AVES E OUTROS PEQUENOS ANIMAIS</option><option value="10139">10139 - FABRICACAO DE PRODUTOS DE CARNE</option><option value="10201">10201 - PRESERVACAO DO PESCADO E FABRICACAO DE PRODUTOS DO PESCADO</option><option value="10317">10317 - FABRICACAO DE CONSERVAS DE FRUTAS</option><option value="10325">10325 - FABRICACAO DE CONSERVAS DE LEGUMES E OUTROS VEGETAIS</option><option value="10333">10333 - FABRICACAO DE SUCOS DE FRUTAS, HORTALICAS E LEGUMES</option><option value="10414">10414 - FABRICACAO DE OLEOS VEGETAIS EM BRUTO, EXCETO OLEO DE MILHO</option><option value="10422">10422 - FABRICACAO DE OLEOS VEGETAIS REFINADOS, EXCETO OLEO DE MILHO</option><option value="10431">10431 - FABRICACAO DE MARGARINA E OUTRAS GORDURAS VEGETAIS E DE OLEOS NAO-COMESTIVEIS DE ANIMAIS</option><option value="10511">10511 - PREPARACAO DO LEITE</option><option value="10520">10520 - FABRICACAO DE LATICINIOS</option><option value="10538">10538 - FABRICACAO DE SORVETES E OUTROS GELADOS COMESTIVEIS</option><option value="10619">10619 - BENEFICIAMENTO DE ARROZ E FABRICACAO DE PRODUTOS DO ARROZ</option><option value="10627">10627 - MOAGEM DE TRIGO E FABRICACAO DE DERIVADOS</option><option value="10635">10635 - FABRICACAO DE FARINHA DE MANDIOCA E DERIVADOS</option><option value="10643">10643 - FABRICACAO DE FARINHA DE MILHO E DERIVADOS, EXCETO OLEOS DE MILHO</option><option value="10651">10651 - FABRICACAO DE AMIDOS E FECULAS DE VEGETAIS E DE OLEOS DE MILHO</option><option value="10660">10660 - FABRICACAO DE ALIMENTOS PARA ANIMAIS</option><option value="10694">10694 - MOAGEM E FABRICACAO DE PRODUTOS DE ORIGEM VEGETAL NAO ESPECIFICADOS ANTERIORMENTE</option><option value="10716">10716 - FABRICACAO DE ACUCAR EM BRUTO</option><option value="10724">10724 - FABRICACAO DE ACUCAR REFINADO</option><option value="10813">10813 - TORREFACAO E MOAGEM DE CAFE</option><option value="10821">10821 - FABRICACAO DE PRODUTOS A BASE DE CAFE</option><option value="10911">10911 - FABRICACAO DE PRODUTOS DE PANIFICACAO</option><option value="10929">10929 - FABRICACAO DE BISCOITOS E BOLACHAS</option><option value="10937">10937 - FABRICACAO DE PRODUTOS DERIVADOS DO CACAU, DE CHOCOLATES E CONFEITOS</option><option value="10945">10945 - FABRICACAO DE MASSAS ALIMENTICIAS</option><option value="10953">10953 - FABRICACAO DE ESPECIARIAS, MOLHOS, TEMPEROS E CONDIMENTOS</option><option value="10961">10961 - FABRICACAO DE ALIMENTOS E PRATOS PRONTOS</option><option value="10996">10996 - FABRICACAO DE PRODUTOS ALIMENTICIOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="11119">11119 - FABRICACAO DE AGUARDENTES E OUTRAS BEBIDAS DESTILADAS</option><option value="11127">11127 - FABRICACAO DE VINHO</option><option value="11135">11135 - FABRICACAO DE MALTE, CERVEJAS E CHOPES</option><option value="11216">11216 - FABRICACAO DE AGUAS ENVASADAS</option><option value="11224">11224 - FABRICACAO DE REFRIGERANTES E DE OUTRAS BEBIDAS NAO-ALCOOLICAS</option><option value="12107">12107 - PROCESSAMENTO INDUSTRIAL DO FUMO</option><option value="12204">12204 - FABRICACAO DE PRODUTOS DO FUMO</option><option value="13111">13111 - PREPARACAO E FIACAO DE FIBRAS DE ALGODAO</option><option value="13120">13120 - PREPARACAO E FIACAO DE FIBRAS TEXTEIS NATURAIS, EXCETO ALGODAO</option><option value="13138">13138 - FIACAO DE FIBRAS ARTIFICIAIS E SINTETICAS</option><option value="13146">13146 - FABRICACAO DE LINHAS PARA COSTURAR E BORDAR</option><option value="13219">13219 - TECELAGEM DE FIOS DE ALGODAO</option><option value="13227">13227 - TECELAGEM DE FIOS DE FIBRAS TEXTEIS NATURAIS, EXCETO ALGODAO</option><option value="13235">13235 - TECELAGEM DE FIOS DE FIBRAS ARTIFICIAIS E SINTETICAS</option><option value="13308">13308 - FABRICACAO DE TECIDOS DE MALHA</option><option value="13405">13405 - ACABAMENTOS EM FIOS, TECIDOS E ARTEFATOS TEXTEIS</option><option value="13511">13511 - FABRICACAO DE ARTEFATOS TEXTEIS PARA USO DOMESTICO</option><option value="13529">13529 - FABRICACAO DE ARTEFATOS DE TAPECARIA</option><option value="13537">13537 - FABRICACAO DE ARTEFATOS DE CORDOARIA</option><option value="13545">13545 - FABRICACAO DE TECIDOS ESPECIAIS, INCLUSIVE ARTEFATOS</option><option value="13596">13596 - FABRICACAO DE OUTROS PRODUTOS TEXTEIS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="14118">14118 - CONFECCAO DE ROUPAS INTIMAS</option><option value="14126">14126 - CONFECCAO DE PECAS DO VESTUARIO, EXCETO ROUPAS INTIMAS</option><option value="14134">14134 - CONFECCAO DE ROUPAS PROFISSIONAIS</option><option value="14142">14142 - FABRICACAO DE ACESSORIOS DO VESTUARIO, EXCETO PARA SEGURANCA E PROTECAO</option><option value="14215">14215 - FABRICACAO DE MEIAS</option><option value="14223">14223 - FABRICACAO DE ARTIGOS DO VESTUARIO, PRODUZIDOS EM MALHARIAS E TRICOTAGENS, EXCETO MEIAS</option><option value="15106">15106 - CURTIMENTO E OUTRAS PREPARACOES DE COURO</option><option value="15211">15211 - FABRICACAO DE ARTIGOS PARA VIAGEM, BOLSAS E SEMELHANTES DE QUALQUER MATERIAL</option><option value="15297">15297 - FABRICACAO DE ARTEFATOS DE COURO NAO ESPECIFICADOS ANTERIORMENTE</option><option value="15319">15319 - FABRICACAO DE CALCADOS DE COURO</option><option value="15327">15327 - FABRICACAO DE TENIS DE QUALQUER MATERIAL</option><option value="15335">15335 - FABRICACAO DE CALCADOS DE MATERIAL SINTETICO</option><option value="15394">15394 - FABRICACAO DE CALCADOS DE MATERIAIS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="15408">15408 - FABRICACAO DE PARTES PARA CALCADOS, DE QUALQUER MATERIAL</option><option value="16102">16102 - DESDOBRAMENTO DE MADEIRA</option><option value="16218">16218 - FABRICACAO DE MADEIRA LAMINADA E DE CHAPAS DE MADEIRA COMPENSADA, PRENSADA E AGLOMERADA</option><option value="16226">16226 - FABRICACAO DE ESTRUTURAS DE MADEIRA E DE ARTIGOS DE CARPINTARIA PARA CONSTRUCAO</option><option value="16234">16234 - FABRICACAO DE ARTEFATOS DE TANOARIA E DE EMBALAGENS DE MADEIRA</option><option value="16293">16293 - FABRICACAO DE ARTEFATOS DE MADEIRA, PALHA, CORTICA, VIME E MATERIAL TRANCADO NAO ESPECIFICADOS ANTERIORMENTE, EXCETO MOVEIS</option><option value="17109">17109 - FABRICACAO DE CELULOSE E OUTRAS PASTAS PARA A FABRICACAO DE PAPEL</option><option value="17214">17214 - FABRICACAO DE PAPEL</option><option value="17222">17222 - FABRICACAO DE CARTOLINA E PAPEL-CARTAO</option><option value="17311">17311 - FABRICACAO DE EMBALAGENS DE PAPEL</option><option value="17320">17320 - FABRICACAO DE EMBALAGENS DE CARTOLINA E PAPEL-CARTAO</option><option value="17338">17338 - FABRICACAO DE CHAPAS E DE EMBALAGENS DE PAPELAO ONDULADO</option><option value="17419">17419 - FABRICACAO DE PRODUTOS DE PAPEL, CARTOLINA, PAPEL-CARTAO E PAPELAO ONDULADO PARA USO INDUSTRIAL, COMERCIAL E DE ESCRITORIO</option><option value="17427">17427 - FABRICACAO DE PRODUTOS DE PAPEL PARA USOS DOMESTICO E HIGIENICO-SANITARIO</option><option value="17494">17494 - FABRICACAO DE PRODUTOS DE PASTAS CELULOSICAS, PAPEL, CARTOLINA, PAPEL-CARTAO E PAPELAO ONDULADO NAO ESPECIFICADOS ANTERIORMENTE</option><option value="18113">18113 - IMPRESSAO DE JORNAIS, LIVROS, REVISTAS E OUTRAS PUBLICACOES PERIODICAS</option><option value="18121">18121 - IMPRESSAO DE MATERIAL DE SEGURANCA</option><option value="18130">18130 - IMPRESSAO DE MATERIAIS PARA OUTROS USOS</option><option value="18211">18211 - SERVICOS DE PRE-IMPRESSAO</option><option value="18229">18229 - SERVICOS DE ACABAMENTOS GRAFICOS</option><option value="18300">18300 - REPRODUCAO DE MATERIAIS GRAVADOS EM QUALQUER SUPORTE</option><option value="19101">19101 - COQUERIAS</option><option value="19217">19217 - FABRICACAO DE PRODUTOS DO REFINO DE PETROLEO</option><option value="19225">19225 - FABRICACAO DE PRODUTOS DERIVADOS DO PETROLEO, EXCETO PRODUTOS DO REFINO</option><option value="19314">19314 - FABRICACAO DE ALCOOL</option><option value="19322">19322 - FABRICACAO DE BIOCOMBUSTIVEIS, EXCETO ALCOOL</option><option value="20118">20118 - FABRICACAO DE CLORO E ALCALIS</option><option value="20126">20126 - FABRICACAO DE INTERMEDIARIOS PARA FERTILIZANTES</option><option value="20134">20134 - FABRICACAO DE ADUBOS E FERTILIZANTES</option><option value="20142">20142 - FABRICACAO DE GASES INDUSTRIAIS</option><option value="20193">20193 - FABRICACAO DE PRODUTOS QUIMICOS INORGANICOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="20215">20215 - FABRICACAO DE PRODUTOS PETROQUIMICOS BASICOS</option><option value="20223">20223 - FABRICACAO DE INTERMEDIARIOS PARA PLASTIFICANTES, RESINAS E FIBRAS</option><option value="20291">20291 - FABRICACAO DE PRODUTOS QUIMICOS ORGANICOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="20312">20312 - FABRICACAO DE RESINAS TERMOPLASTICAS</option><option value="20321">20321 - FABRICACAO DE RESINAS TERMOFIXAS</option><option value="20339">20339 - FABRICACAO DE ELASTOMEROS</option><option value="20401">20401 - FABRICACAO DE FIBRAS ARTIFICIAIS E SINTETICAS</option><option value="20517">20517 - FABRICACAO DE DEFENSIVOS AGRICOLAS</option><option value="20525">20525 - FABRICACAO DE DESINFESTANTES DOMISSANITARIOS</option><option value="20614">20614 - FABRICACAO DE SABOES E DETERGENTES SINTETICOS</option><option value="20622">20622 - FABRICACAO DE PRODUTOS DE LIMPEZA E POLIMENTO</option><option value="20631">20631 - FABRICACAO DE COSMETICOS, PRODUTOS DE PERFUMARIA E DE HIGIENE PESSOAL</option><option value="20711">20711 - FABRICACAO DE TINTAS, VERNIZES, ESMALTES E LACAS</option><option value="20720">20720 - FABRICACAO DE TINTAS DE IMPRESSAO</option><option value="20738">20738 - FABRICACAO DE IMPERMEABILIZANTES, SOLVENTES E PRODUTOS AFINS</option><option value="20916">20916 - FABRICACAO DE ADESIVOS E SELANTES</option><option value="20924">20924 - FABRICACAO DE EXPLOSIVOS</option><option value="20932">20932 - FABRICACAO DE ADITIVOS DE USO INDUSTRIAL</option><option value="20941">20941 - FABRICACAO DE CATALISADORES</option><option value="20991">20991 - FABRICACAO DE PRODUTOS QUIMICOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="21106">21106 - FABRICACAO DE PRODUTOS FARMOQUIMICOS</option><option value="21211">21211 - FABRICACAO DE MEDICAMENTOS PARA USO HUMANO</option><option value="21220">21220 - FABRICACAO DE MEDICAMENTOS PARA USO VETERINARIO</option><option value="21238">21238 - FABRICACAO DE PREPARACOES FARMACEUTICAS</option><option value="22111">22111 - FABRICACAO DE PNEUMATICOS E DE CAMARAS-DE-AR</option><option value="22129">22129 - REFORMA DE PNEUMATICOS USADOS</option><option value="22196">22196 - FABRICACAO DE ARTEFATOS DE BORRACHA NAO ESPECIFICADOS ANTERIORMENTE</option><option value="22218">22218 - FABRICACAO DE LAMINADOS PLANOS E TUBULARES DE MATERIAL PLASTICO</option><option value="22226">22226 - FABRICACAO DE EMBALAGENS DE MATERIAL PLASTICO</option><option value="22234">22234 - FABRICACAO DE TUBOS E ACESSORIOS DE MATERIAL PLASTICO PARA USO NA CONSTRUCAO</option><option value="22293">22293 - FABRICACAO DE ARTEFATOS DE MATERIAL PLASTICO NAO ESPECIFICADOS ANTERIORMENTE</option><option value="23117">23117 - FABRICACAO DE VIDRO PLANO E DE SEGURANCA</option><option value="23125">23125 - FABRICACAO DE EMBALAGENS DE VIDRO</option><option value="23192">23192 - FABRICACAO DE ARTIGOS DE VIDRO</option><option value="23206">23206 - FABRICACAO DE CIMENTO</option><option value="23303">23303 - FABRICACAO DE ARTEFATOS DE CONCRETO, CIMENTO, FIBROCIMENTO, GESSO E MATERIAIS SEMELHANTES</option><option value="23419">23419 - FABRICACAO DE PRODUTOS CERAMICOS REFRATARIOS</option><option value="23427">23427 - FABRICACAO DE PRODUTOS CERAMICOS NAO-REFRATARIOS PARA USO ESTRUTURAL NA CONSTRUCAO</option><option value="23494">23494 - FABRICACAO DE PRODUTOS CERAMICOS NAO-REFRATARIOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="23915">23915 - APARELHAMENTO E OUTROS TRABALHOS EM PEDRAS</option><option value="23923">23923 - FABRICACAO DE CAL E GESSO</option><option value="23991">23991 - FABRICACAO DE PRODUTOS DE MINERAIS NAO-METALICOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="24113">24113 - PRODUCAO DE FERRO-GUSA</option><option value="24121">24121 - PRODUCAO DE FERROLIGAS</option><option value="24211">24211 - PRODUCAO DE SEMI-ACABADOS DE ACO</option><option value="24229">24229 - PRODUCAO DE LAMINADOS PLANOS DE ACO</option><option value="24237">24237 - PRODUCAO DE LAMINADOS LONGOS DE ACO</option><option value="24245">24245 - PRODUCAO DE RELAMINADOS, TREFILADOS E PERFILADOS DE ACO</option><option value="24318">24318 - PRODUCAO DE TUBOS DE ACO COM COSTURA</option><option value="24393">24393 - PRODUCAO DE OUTROS TUBOS DE FERRO E ACO</option><option value="24415">24415 - METALURGIA DO ALUMINIO E SUAS LIGAS</option><option value="24423">24423 - METALURGIA DOS METAIS PRECIOSOS</option><option value="24431">24431 - METALURGIA DO COBRE</option><option value="24491">24491 - METALURGIA DOS METAIS NAO-FERROSOS E SUAS LIGAS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="24512">24512 - FUNDICAO DE FERRO E ACO</option><option value="24521">24521 - FUNDICAO DE METAIS NAO-FERROSOS E SUAS LIGAS</option><option value="25110">25110 - FABRICACAO DE ESTRUTURAS METALICAS</option><option value="25128">25128 - FABRICACAO DE ESQUADRIAS DE METAL</option><option value="25136">25136 - FABRICACAO DE OBRAS DE CALDEIRARIA PESADA</option><option value="25217">25217 - FABRICACAO DE TANQUES, RESERVATORIOS METALICOS E CALDEIRAS PARA AQUECIMENTO CENTRAL</option><option value="25225">25225 - FABRICACAO DE CALDEIRAS GERADORAS DE VAPOR, EXCETO PARA AQUECIMENTO CENTRAL E PARA VEICULOS</option><option value="25314">25314 - PRODUCAO DE FORJADOS DE ACO E DE METAIS NAO-FERROSOS E SUAS LIGAS</option><option value="25322">25322 - PRODUCAO DE ARTEFATOS ESTAMPADOS DE METAL; METALURGIA DO PO</option><option value="25390">25390 - SERVICOS DE USINAGEM, SOLDA, TRATAMENTO E REVESTIMENTO EM METAIS</option><option value="25411">25411 - FABRICACAO DE ARTIGOS DE CUTELARIA</option><option value="25420">25420 - FABRICACAO DE ARTIGOS DE SERRALHERIA, EXCETO ESQUADRIAS</option><option value="25438">25438 - FABRICACAO DE FERRAMENTAS</option><option value="25501">25501 - FABRICACAO DE EQUIPAMENTO BELICO PESADO, ARMAS DE FOGO E MUNICOES</option><option value="25918">25918 - FABRICACAO DE EMBALAGENS METALICAS</option><option value="25926">25926 - FABRICACAO DE PRODUTOS DE TREFILADOS DE METAL</option><option value="25934">25934 - FABRICACAO DE ARTIGOS DE METAL PARA USO DOMESTICO E PESSOAL</option><option value="25993">25993 - FABRICACAO DE PRODUTOS DE METAL NAO ESPECIFICADOS ANTERIORMENTE</option><option value="26108">26108 - FABRICACAO DE COMPONENTES ELETRONICOS</option><option value="26213">26213 - FABRICACAO DE EQUIPAMENTOS DE INFORMATICA</option><option value="26221">26221 - FABRICACAO DE PERIFERICOS PARA EQUIPAMENTOS DE INFORMATICA</option><option value="26311">26311 - FABRICACAO DE EQUIPAMENTOS TRANSMISSORES DE COMUNICACAO</option><option value="26329">26329 - FABRICACAO DE APARELHOS TELEFONICOS E DE OUTROS EQUIPAMENTOS DE COMUNICACAO</option><option value="26400">26400 - FABRICACAO DE APARELHOS DE RECEPCAO, REPRODUCAO, GRAVACAO E AMPLIFICACAO DE AUDIO E VIDEO</option><option value="26515">26515 - FABRICACAO DE APARELHOS E EQUIPAMENTOS DE MEDIDA, TESTE E CONTROLE</option><option value="26523">26523 - FABRICACAO DE CRONOMETROS E RELOGIOS</option><option value="26604">26604 - FABRICACAO DE APARELHOS ELETROMEDICOS E ELETROTERAPEUTICOS E EQUIPAMENTOS DE IRRADIACAO</option><option value="26701">26701 - FABRICACAO DE EQUIPAMENTOS E INSTRUMENTOS OPTICOS, FOTOGRAFICOS E CINEMATOGRAFICOS</option><option value="26809">26809 - FABRICACAO DE MIDIAS VIRGENS, MAGNETICAS E OPTICAS</option><option value="27104">27104 - FABRICACAO DE GERADORES, TRANSFORMADORES E MOTORES ELETRICOS</option><option value="27210">27210 - FABRICACAO DE PILHAS, BATERIAS E ACUMULADORES ELETRICOS, EXCETO PARA VEICULOS AUTOMOTORES</option><option value="27228">27228 - FABRICACAO DE BATERIAS E ACUMULADORES PARA VEICULOS AUTOMOTORES</option><option value="27317">27317 - FABRICACAO DE APARELHOS E EQUIPAMENTOS PARA DISTRIBUICAO E CONTROLE DE ENERGIA ELETRICA</option><option value="27325">27325 - FABRICACAO DE MATERIAL ELETRICO PARA INSTALACOES EM CIRCUITO DE CONSUMO</option><option value="27333">27333 - FABRICACAO DE FIOS, CABOS E CONDUTORES ELETRICOS ISOLADOS</option><option value="27406">27406 - FABRICACAO DE LAMPADAS E OUTROS EQUIPAMENTOS DE ILUMINACAO</option><option value="27511">27511 - FABRICACAO DE FOGOES, REFRIGERADORES E MAQUINAS DE LAVAR E SECAR PARA USO DOMESTICO</option><option value="27597">27597 - FABRICACAO DE APARELHOS ELETRODOMESTICOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="27902">27902 - FABRICACAO DE EQUIPAMENTOS E APARELHOS ELETRICOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="28119">28119 - FABRICACAO DE MOTORES E TURBINAS, EXCETO PARA AVIOES E VEICULOS RODOVIARIOS</option><option value="28127">28127 - FABRICACAO DE EQUIPAMENTOS HIDRAULICOS E PNEUMATICOS, EXCETO VALVULAS</option><option value="28135">28135 - FABRICACAO DE VALVULAS, REGISTROS E DISPOSITIVOS SEMELHANTES</option><option value="28143">28143 - FABRICACAO DE COMPRESSORES</option><option value="28151">28151 - FABRICACAO DE EQUIPAMENTOS DE TRANSMISSAO PARA FINS INDUSTRIAIS</option><option value="28216">28216 - FABRICACAO DE APARELHOS E EQUIPAMENTOS PARA INSTALACOES TERMICAS</option><option value="28224">28224 - FABRICACAO DE MAQUINAS, EQUIPAMENTOS E APARELHOS PARA TRANSPORTE E ELEVACAO DE CARGAS E PESSOAS</option><option value="28232">28232 - FABRICACAO DE MAQUINAS E APARELHOS DE REFRIGERACAO E VENTILACAO PARA USO INDUSTRIAL E COMERCIAL</option><option value="28241">28241 - FABRICACAO DE APARELHOS E EQUIPAMENTOS DE AR CONDICIONADO</option><option value="28259">28259 - FABRICACAO DE MAQUINAS E EQUIPAMENTOS PARA SANEAMENTO BASICO E AMBIENTAL</option><option value="28291">28291 - FABRICACAO DE MAQUINAS E EQUIPAMENTOS DE USO GERAL NAO ESPECIFICADOS ANTERIORMENTE</option><option value="28313">28313 - FABRICACAO DE TRATORES AGRICOLAS</option><option value="28321">28321 - FABRICACAO DE EQUIPAMENTOS PARA IRRIGACAO AGRICOLA</option><option value="28330">28330 - FABRICACAO DE MAQUINAS E EQUIPAMENTOS PARA A AGRICULTURA E PECUARIA, EXCETO PARA IRRIGACAO</option><option value="28402">28402 - FABRICACAO DE MAQUINAS-FERRAMENTA</option><option value="28518">28518 - FABRICACAO DE MAQUINAS E EQUIPAMENTOS PARA A PROSPECCAO E EXTRACAO DE PETROLEO</option><option value="28526">28526 - FABRICACAO DE OUTRAS MAQUINAS E EQUIPAMENTOS PARA USO NA EXTRACAO MINERAL, EXCETO NA EXTRACAO DE PETROLEO</option><option value="28534">28534 - FABRICACAO DE TRATORES, EXCETO AGRICOLAS</option><option value="28542">28542 - FABRICACAO DE MAQUINAS E EQUIPAMENTOS PARA TERRAPLENAGEM, PAVIMENTACAO E CONSTRUCAO, EXCETO TRATORES</option><option value="28615">28615 - FABRICACAO DE MAQUINAS PARA A INDUSTRIA METALURGICA, EXCETO MAQUINAS-FERRAMENTA</option><option value="28623">28623 - FABRICACAO DE MAQUINAS E EQUIPAMENTOS PARA AS INDUSTRIAS DE ALIMENTOS, BEBIDAS E FUMO</option><option value="28631">28631 - FABRICACAO DE MAQUINAS E EQUIPAMENTOS PARA A INDUSTRIA TEXTIL</option><option value="28640">28640 - FABRICACAO DE MAQUINAS E EQUIPAMENTOS PARA AS INDUSTRIAS DO VESTUARIO, DO COURO E DE CALCADOS</option><option value="28658">28658 - FABRICACAO DE MAQUINAS E EQUIPAMENTOS PARA AS INDUSTRIAS DE CELULOSE, PAPEL E PAPELAO E ARTEFATOS</option><option value="28666">28666 - FABRICACAO DE MAQUINAS E EQUIPAMENTOS PARA A INDUSTRIA DO PLASTICO</option><option value="28691">28691 - FABRICACAO DE MAQUINAS E EQUIPAMENTOS PARA USO INDUSTRIAL ESPECIFICO NAO ESPECIFICADOS ANTERIORMENTE</option><option value="29107">29107 - FABRICACAO DE AUTOMOVEIS, CAMIONETAS E UTILITARIOS</option><option value="29204">29204 - FABRICACAO DE CAMINHOES E ONIBUS</option><option value="29301">29301 - FABRICACAO DE CABINES, CARROCERIAS E REBOQUES PARA VEICULOS AUTOMOTORES</option><option value="29417">29417 - FABRICACAO DE PECAS E ACESSORIOS PARA O SISTEMA MOTOR DE VEICULOS AUTOMOTORES</option><option value="29425">29425 - FABRICACAO DE PECAS E ACESSORIOS PARA OS SISTEMAS DE MARCHA E TRANSMISSAO DE VEICULOS AUTOMOTORES</option><option value="29433">29433 - FABRICACAO DE PECAS E ACESSORIOS PARA O SISTEMA DE FREIOS DE VEICULOS AUTOMOTORES</option><option value="29441">29441 - FABRICACAO DE PECAS E ACESSORIOS PARA O SISTEMA DE DIRECAO E SUSPENSAO DE VEICULOS AUTOMOTORES</option><option value="29450">29450 - FABRICACAO DE MATERIAL ELETRICO E ELETRONICO PARA VEICULOS AUTOMOTORES, EXCETO BATERIAS</option><option value="29492">29492 - FABRICACAO DE PECAS E ACESSORIOS PARA VEICULOS AUTOMOTORES NAO ESPECIFICADOS ANTERIORMENTE</option><option value="29506">29506 - RECONDICIONAMENTO E RECUPERACAO DE MOTORES PARA VEICULOS AUTOMOTORES</option><option value="30113">30113 - CONSTRUCAO DE EMBARCACOES E ESTRUTURAS FLUTUANTES</option><option value="30121">30121 - CONSTRUCAO DE EMBARCACOES PARA ESPORTE E LAZER</option><option value="30318">30318 - FABRICACAO DE LOCOMOTIVAS, VAGOES E OUTROS MATERIAIS RODANTES</option><option value="30326">30326 - FABRICACAO DE PECAS E ACESSORIOS PARA VEICULOS FERROVIARIOS</option><option value="30415">30415 - FABRICACAO DE AERONAVES</option><option value="30423">30423 - FABRICACAO DE TURBINAS, MOTORES E OUTROS COMPONENTES E PECAS PARA AERONAVES</option><option value="30504">30504 - FABRICACAO DE VEICULOS MILITARES DE COMBATE</option><option value="30911">30911 - FABRICACAO DE MOTOCICLETAS</option><option value="30920">30920 - FABRICACAO DE BICICLETAS E TRICICLOS NAO-MOTORIZADOS</option><option value="30997">30997 - FABRICACAO DE EQUIPAMENTOS DE TRANSPORTE NAO ESPECIFICADOS ANTERIORMENTE</option><option value="31012">31012 - FABRICACAO DE MOVEIS COM PREDOMINANCIA DE MADEIRA</option><option value="31021">31021 - FABRICACAO DE MOVEIS COM PREDOMINANCIA DE METAL</option><option value="31039">31039 - FABRICACAO DE MOVEIS DE OUTROS MATERIAIS, EXCETO MADEIRA E METAL</option><option value="31047">31047 - FABRICACAO DE COLCHOES</option><option value="32116">32116 - LAPIDACAO DE GEMAS E FABRICACAO DE ARTEFATOS DE OURIVESARIA E JOALHERIA</option><option value="32124">32124 - FABRICACAO DE BIJUTERIAS E ARTEFATOS SEMELHANTES</option><option value="32205">32205 - FABRICACAO DE INSTRUMENTOS MUSICAIS</option><option value="32302">32302 - FABRICACAO DE ARTEFATOS PARA PESCA E ESPORTE</option><option value="32400">32400 - FABRICACAO DE BRINQUEDOS E JOGOS RECREATIVOS</option><option value="32507">32507 - FABRICACAO DE INSTRUMENTOS E MATERIAIS PARA USO MEDICO E ODONTOLOGICO E DE ARTIGOS OPTICOS</option><option value="32914">32914 - FABRICACAO DE ESCOVAS, PINCEIS E VASSOURAS</option><option value="32922">32922 - FABRICACAO DE EQUIPAMENTOS E ACESSORIOS PARA SEGURANCA E PROTECAO PESSOAL E PROFISSIONAL</option><option value="32990">32990 - FABRICACAO DE PRODUTOS DIVERSOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="33112">33112 - MANUTENCAO E REPARACAO DE TANQUES, RESERVATORIOS METALICOS E CALDEIRAS, EXCETO PARA VEICULOS</option><option value="33121">33121 - MANUTENCAO E REPARACAO DE EQUIPAMENTOS ELETRONICOS E OPTICOS</option><option value="33139">33139 - MANUTENCAO E REPARACAO DE MAQUINAS E EQUIPAMENTOS ELETRICOS</option><option value="33147">33147 - MANUTENCAO E REPARACAO DE MAQUINAS E EQUIPAMENTOS DA INDUSTRIA MECANICA</option><option value="33155">33155 - MANUTENCAO E REPARACAO DE VEICULOS FERROVIARIOS</option><option value="33163">33163 - MANUTENCAO E REPARACAO DE AERONAVES</option><option value="33171">33171 - MANUTENCAO E REPARACAO DE MAQUINAS E EQUIPAMENTOS</option><option value="33198">33198 - MANUTENCAO E REPARACAO DE EQUIPAMENTOS E PRODUTOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="33210">33210 - INSTALACAO DE MAQUINAS E EQUIPAMENTOS INDUSTRIAIS</option><option value="33295">33295 - INSTALACAO DE EQUIPAMENTOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="35115">35115 - GERACAO DE ENERGIA ELETRICA</option><option value="35123">35123 - TRANSMISSAO DE ENERGIA ELETRICA</option><option value="35131">35131 - COMERCIO ATACADISTA DE ENERGIA ELETRICA</option><option value="35140">35140 - DISTRIBUICAO DE ENERGIA ELETRICA</option><option value="35204">35204 - PRODUCAO DE GAS; PROCESSAMENTO DE GAS NATURAL; DISTRIBUICAO DE COMBUSTIVEIS GASOSOS POR REDES URBANAS</option><option value="35301">35301 - PRODUCAO E DISTRIBUICAO DE VAPOR, AGUA QUENTE E AR CONDICIONADO</option><option value="36006">36006 - CAPTACAO, TRATAMENTO E DISTRIBUICAO DE AGUA</option><option value="37011">37011 - GESTAO DE REDES DE ESGOTO</option><option value="37029">37029 - ATIVIDADES RELACIONADAS A ESGOTO, EXCETO A GESTAO DE REDES</option><option value="38114">38114 - COLETA DE RESIDUOS NAO-PERIGOSOS</option><option value="38122">38122 - COLETA DE RESIDUOS PERIGOSOS</option><option value="38211">38211 - TRATAMENTO E DISPOSICAO DE RESIDUOS NAO-PERIGOSOS</option><option value="38220">38220 - TRATAMENTO E DISPOSICAO DE RESIDUOS PERIGOSOS</option><option value="38319">38319 - RECUPERACAO DE MATERIAIS METALICOS</option><option value="38327">38327 - RECUPERACAO DE MATERIAIS PLASTICOS</option><option value="38394">38394 - RECUPERACAO DE MATERIAIS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="39005">39005 - DESCONTAMINACAO E OUTROS SERVICOS DE GESTAO DE RESIDUOS</option><option value="41107">41107 - INCORPORACAO DE EMPREENDIMENTOS IMOBILIARIOS</option><option value="41204">41204 - CONSTRUCAO DE EDIFICIOS</option><option value="42111">42111 - CONSTRUCAO DE RODOVIAS E FERROVIAS</option><option value="42120">42120 - CONSTRUCAO DE OBRAS DE ARTE ESPECIAIS</option><option value="42138">42138 - OBRAS DE URBANIZACAO - RUAS, PRACAS E CALCADAS</option><option value="42219">42219 - OBRAS PARA GERACAO E DISTRIBUICAO DE ENERGIA ELETRICA E PARA TELECOMUNICACOES</option><option value="42227">42227 - CONSTRUCAO DE REDES DE ABASTECIMENTO DE AGUA, COLETA DE ESGOTO E CONSTRUCOES CORRELATAS</option><option value="42235">42235 - CONSTRUCAO DE REDES DE TRANSPORTES POR DUTOS, EXCETO PARA AGUA E ESGOTO</option><option value="42910">42910 - OBRAS PORTUARIAS, MARITIMAS E FLUVIAIS</option><option value="42928">42928 - MONTAGEM DE INSTALACOES INDUSTRIAIS E DE ESTRUTURAS METALICAS</option><option value="42995">42995 - OBRAS DE ENGENHARIA CIVIL NAO ESPECIFICADAS ANTERIORMENTE</option><option value="43118">43118 - DEMOLICAO E PREPARACAO DE CANTEIROS DE OBRAS</option><option value="43126">43126 - PERFURACOES E SONDAGENS</option><option value="43134">43134 - OBRAS DE TERRAPLENAGEM</option><option value="43193">43193 - SERVICOS DE PREPARACAO DO TERRENO NAO ESPECIFICADOS ANTERIORMENTE</option><option value="43215">43215 - INSTALACOES ELETRICAS</option><option value="43223">43223 - INSTALACOES HIDRAULICAS, DE SISTEMAS DE VENTILACAO E REFRIGERACAO</option><option value="43291">43291 - OBRAS DE INSTALACOES EM CONSTRUCOES NAO ESPECIFICADAS ANTERIORMENTE</option><option value="43304">43304 - OBRAS DE ACABAMENTO</option><option value="43916">43916 - OBRAS DE FUNDACOES</option><option value="43991">43991 - SERVICOS ESPECIALIZADOS PARA CONSTRUCAO NAO ESPECIFICADOS ANTERIORMENTE</option><option value="45111">45111 - COMERCIO A VAREJO E POR ATACADO DE VEICULOS AUTOMOTORES</option><option value="45129">45129 - REPRESENTANTES COMERCIAIS E AGENTES DO COMERCIO DE VEICULOS AUTOMOTORES</option><option value="45200">45200 - MANUTENCAO E REPARACAO DE VEICULOS AUTOMOTORES</option><option value="45307">45307 - COMERCIO DE PECAS E ACESSORIOS PARA VEICULOS AUTOMOTORES</option><option value="45412">45412 - COMERCIO POR ATACADO E A VAREJO DE MOTOCICLETAS, PECAS E ACESSORIOS</option><option value="45421">45421 - REPRESENTANTES COMERCIAIS E AGENTES DO COMERCIO DE MOTOCICLETAS, PECAS E ACESSORIOS</option><option value="45439">45439 - MANUTENCAO E REPARACAO DE MOTOCICLETAS</option><option value="46117">46117 - REPRESENTANTES COMERCIAIS E AGENTES DO COMERCIO DE MATERIAS-PRIMAS AGRICOLAS E ANIMAIS VIVOS</option><option value="46125">46125 - REPRESENTANTES COMERCIAIS E AGENTES DO COMERCIO DE COMBUSTIVEIS, MINERAIS, PRODUTOS SIDERURGICOS E QUIMICOS</option><option value="46133">46133 - REPRESENTANTES COMERCIAIS E AGENTES DO COMERCIO DE MADEIRA, MATERIAL DE CONSTRUCAO E FERRAGENS</option><option value="46141">46141 - REPRESENTANTES COMERCIAIS E AGENTES DO COMERCIO DE MAQUINAS, EQUIPAMENTOS, EMBARCACOES E AERONAVES</option><option value="46150">46150 - REPRESENTANTES COMERCIAIS E AGENTES DO COMERCIO DE ELETRODOMESTICOS, MOVEIS E ARTIGOS DE USO DOMESTICO</option><option value="46168">46168 - REPRESENTANTES COMERCIAIS E AGENTES DO COMERCIO DE TEXTEIS, VESTUARIO, CALCADOS E ARTIGOS DE VIAGEM</option><option value="46176">46176 - REPRESENTANTES COMERCIAIS E AGENTES DO COMERCIO DE PRODUTOS ALIMENTICIOS, BEBIDAS E FUMO</option><option value="46184">46184 - REPRESENTANTES COMERCIAIS E AGENTES DO COMERCIO ESPECIALIZADO EM PRODUTOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="46192">46192 - REPRESENTANTES COMERCIAIS E AGENTES DO COMERCIO DE MERCADORIAS EM GERAL NAO ESPECIALIZADO</option><option value="46214">46214 - COMERCIO ATACADISTA DE CAFE EM GRAO</option><option value="46222">46222 - COMERCIO ATACADISTA DE SOJA</option><option value="46231">46231 - COMERCIO ATACADISTA DE ANIMAIS VIVOS, ALIMENTOS PARA ANIMAIS E MATERIAS-PRIMAS AGRICOLAS, EXCETO CAFE E SOJA</option><option value="46311">46311 - COMERCIO ATACADISTA DE LEITE E LATICINIOS</option><option value="46320">46320 - COMERCIO ATACADISTA DE CEREAIS E LEGUMINOSAS BENEFICIADOS, FARINHAS, AMIDOS E FECULAS</option><option value="46338">46338 - COMERCIO ATACADISTA DE HORTIFRUTIGRANJEIROS</option><option value="46346">46346 - COMERCIO ATACADISTA DE CARNES, PRODUTOS DA CARNE E PESCADO</option><option value="46354">46354 - COMERCIO ATACADISTA DE BEBIDAS</option><option value="46362">46362 - COMERCIO ATACADISTA DE PRODUTOS DO FUMO</option><option value="46371">46371 - COMERCIO ATACADISTA ESPECIALIZADO EM PRODUTOS ALIMENTICIOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="46397">46397 - COMERCIO ATACADISTA DE PRODUTOS ALIMENTICIOS EM GERAL</option><option value="46419">46419 - COMERCIO ATACADISTA DE TECIDOS, ARTEFATOS DE TECIDOS E DE ARMARINHO</option><option value="46427">46427 - COMERCIO ATACADISTA DE ARTIGOS DO VESTUARIO E ACESSORIOS</option><option value="46435">46435 - COMERCIO ATACADISTA DE CALCADOS E ARTIGOS DE VIAGEM</option><option value="46443">46443 - COMERCIO ATACADISTA DE PRODUTOS FARMACEUTICOS PARA USO HUMANO E VETERINARIO</option><option value="46451">46451 - COMERCIO ATACADISTA DE INSTRUMENTOS E MATERIAIS PARA USO MEDICO, CIRURGICO, ORTOPEDICO E ODONTOLOGICO</option><option value="46460">46460 - COMERCIO ATACADISTA DE COSMETICOS, PRODUTOS DE PERFUMARIA E DE HIGIENE PESSOAL</option><option value="46478">46478 - COMERCIO ATACADISTA DE ARTIGOS DE ESCRITORIO E DE PAPELARIA; LIVROS, JORNAIS E OUTRAS PUBLICACOES</option><option value="46494">46494 - COMERCIO ATACADISTA DE EQUIPAMENTOS E ARTIGOS DE USO PESSOAL E DOMESTICO NAO ESPECIFICADOS ANTERIORMENTE</option><option value="46516">46516 - COMERCIO ATACADISTA DE COMPUTADORES, PERIFERICOS E SUPRIMENTOS DE INFORMATICA</option><option value="46524">46524 - COMERCIO ATACADISTA DE COMPONENTES ELETRONICOS E EQUIPAMENTOS DE TELEFONIA E COMUNICACAO</option><option value="46613">46613 - COMERCIO ATACADISTA DE MAQUINAS, APARELHOS E EQUIPAMENTOS PARA USO AGROPECUARIO; PARTES E PECAS</option><option value="46621">46621 - COMERCIO ATACADISTA DE MAQUINAS, EQUIPAMENTOS PARA TERRAPLENAGEM, MINERACAO E CONSTRUCAO; PARTES E PECAS</option><option value="46630">46630 - COMERCIO ATACADISTA DE MAQUINAS E EQUIPAMENTOS PARA USO INDUSTRIAL; PARTES E PECAS</option><option value="46648">46648 - COMERCIO ATACADISTA DE MAQUINAS, APARELHOS E EQUIPAMENTOS PARA USO ODONTO-MEDICO-HOSPITALAR; PARTES E PECAS</option><option value="46656">46656 - COMERCIO ATACADISTA DE MAQUINAS E EQUIPAMENTOS PARA USO COMERCIAL; PARTES E PECAS</option><option value="46699">46699 - COMERCIO ATACADISTA DE MAQUINAS, APARELHOS E EQUIPAMENTOS NAO ESPECIFICADOS ANTERIORMENTE; PARTES E PECAS</option><option value="46711">46711 - COMERCIO ATACADISTA DE MADEIRA E PRODUTOS DERIVADOS</option><option value="46729">46729 - COMERCIO ATACADISTA DE FERRAGENS E FERRAMENTAS</option><option value="46737">46737 - COMERCIO ATACADISTA DE MATERIAL ELETRICO</option><option value="46745">46745 - COMERCIO ATACADISTA DE CIMENTO</option><option value="46796">46796 - COMERCIO ATACADISTA ESPECIALIZADO DE MATERIAIS DE CONSTRUCAO NAO ESPECIFICADOS ANTERIORMENTE E DE MATERIAIS DE CONSTRUCAO EM GERAL</option><option value="46818">46818 - COMERCIO ATACADISTA DE COMBUSTIVEIS SOLIDOS, LIQUIDOS E GASOSOS, EXCETO GAS NATURAL E GLP</option><option value="46826">46826 - COMERCIO ATACADISTA DE GAS LIQUEFEITO DE PETROLEO (GLP)</option><option value="46834">46834 - COMERCIO ATACADISTA DE DEFENSIVOS AGRICOLAS, ADUBOS, FERTILIZANTES E CORRETIVOS DO SOLO</option><option value="46842">46842 - COMERCIO ATACADISTA DE PRODUTOS QUIMICOS E PETROQUIMICOS, EXCETO AGROQUIMICOS</option><option value="46851">46851 - COMERCIO ATACADISTA DE PRODUTOS SIDERURGICOS E METALURGICOS, EXCETO PARA CONSTRUCAO</option><option value="46869">46869 - COMERCIO ATACADISTA DE PAPEL E PAPELAO EM BRUTO E DE EMBALAGENS</option><option value="46877">46877 - COMERCIO ATACADISTA DE RESIDUOS E SUCATAS</option><option value="46893">46893 - COMERCIO ATACADISTA ESPECIALIZADO DE OUTROS PRODUTOS INTERMEDIARIOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="46915">46915 - COMERCIO ATACADISTA DE MERCADORIAS EM GERAL, COM PREDOMINANCIA DE PRODUTOS ALIMENTICIOS</option><option value="46923">46923 - COMERCIO ATACADISTA DE MERCADORIAS EM GERAL, COM PREDOMINANCIA DE INSUMOS AGROPECUARIOS</option><option value="46931">46931 - COMERCIO ATACADISTA DE MERCADORIAS EM GERAL, SEM PREDOMINANCIA DE ALIMENTOS OU DE INSUMOS AGROPECUARIOS</option><option value="47113">47113 - COMERCIO VAREJISTA DE MERCADORIAS EM GERAL, COM PREDOMINANCIA DE PRODUTOS ALIMENTICIOS - HIPERMERCADOS E SUPERMERCADOS</option><option value="47121">47121 - COMERCIO VAREJISTA DE MERCADORIAS EM GERAL, COM PREDOMINANCIA DE PRODUTOS ALIMENTICIOS - MINIMERCADOS, MERCEARIAS E ARMAZENS</option><option value="47130">47130 - COMERCIO VAREJISTA DE MERCADORIAS EM GERAL, SEM PREDOMINANCIA DE PRODUTOS ALIMENTICIOS</option><option value="47211">47211 - COMERCIO VAREJISTA DE PRODUTOS DE PADARIA, LATICINIO, DOCES, BALAS E SEMELHANTES</option><option value="47229">47229 - COMERCIO VAREJISTA DE CARNES E PESCADOS - ACOUGUES E PEIXARIAS</option><option value="47237">47237 - COMERCIO VAREJISTA DE BEBIDAS</option><option value="47245">47245 - COMERCIO VAREJISTA DE HORTIFRUTIGRANJEIROS</option><option value="47296">47296 - COMERCIO VAREJISTA DE PRODUTOS ALIMENTICIOS EM GERAL OU ESPECIALIZADO EM PRODUTOS ALIMENTICIOS NAO ESPECIFICADOS ANTERIORMENTE; PRODUTOS DO FUMO</option><option value="47318">47318 - COMERCIO VAREJISTA DE COMBUSTIVEIS PARA VEICULOS AUTOMOTORES</option><option value="47326">47326 - COMERCIO VAREJISTA DE LUBRIFICANTES</option><option value="47415">47415 - COMERCIO VAREJISTA DE TINTAS E MATERIAIS PARA PINTURA</option><option value="47423">47423 - COMERCIO VAREJISTA DE MATERIAL ELETRICO</option><option value="47431">47431 - COMERCIO VAREJISTA DE VIDROS</option><option value="47440">47440 - COMERCIO VAREJISTA DE FERRAGENS, MADEIRA E MATERIAIS DE CONSTRUCAO</option><option value="47512">47512 - COMERCIO VAREJISTA ESPECIALIZADO DE EQUIPAMENTOS E SUPRIMENTOS DE INFORMATICA</option><option value="47521">47521 - COMERCIO VAREJISTA ESPECIALIZADO DE EQUIPAMENTOS DE TELEFONIA E COMUNICACAO</option><option value="47539">47539 - COMERCIO VAREJISTA ESPECIALIZADO DE ELETRODOMESTICOS E EQUIPAMENTOS DE AUDIO E VIDEO</option><option value="47547">47547 - COMERCIO VAREJISTA ESPECIALIZADO DE MOVEIS, COLCHOARIA E ARTIGOS DE ILUMINACAO</option><option value="47555">47555 - COMERCIO VAREJISTA ESPECIALIZADO DE TECIDOS E ARTIGOS DE CAMA, MESA E BANHO</option><option value="47563">47563 - COMERCIO VAREJISTA ESPECIALIZADO DE INSTRUMENTOS MUSICAIS E ACESSORIOS</option><option value="47571">47571 - COMERCIO VAREJISTA ESPECIALIZADO DE PECAS E ACESSORIOS PARA APARELHOS ELETROELETRONICOS PARA USO DOMESTICO, EXCETO INFORMATICA E COMUNICACAO</option><option value="47598">47598 - COMERCIO VAREJISTA DE ARTIGOS DE USO DOMESTICO NAO ESPECIFICADOS ANTERIORMENTE</option><option value="47610">47610 - COMERCIO VAREJISTA DE LIVROS, JORNAIS, REVISTAS E PAPELARIA</option><option value="47628">47628 - COMERCIO VAREJISTA DE DISCOS, CDS, DVDS E FITAS</option><option value="47636">47636 - COMERCIO VAREJISTA DE ARTIGOS RECREATIVOS E ESPORTIVOS</option><option value="47717">47717 - COMERCIO VAREJISTA DE PRODUTOS FARMACEUTICOS PARA USO HUMANO E VETERINARIO</option><option value="47725">47725 - COMERCIO VAREJISTA DE COSMETICOS, PRODUTOS DE PERFUMARIA E DE HIGIENE PESSOAL</option><option value="47733">47733 - COMERCIO VAREJISTA DE ARTIGOS MEDICOS E ORTOPEDICOS</option><option value="47741">47741 - COMERCIO VAREJISTA DE ARTIGOS DE OPTICA</option><option value="47814">47814 - COMERCIO VAREJISTA DE ARTIGOS DO VESTUARIO E ACESSORIOS</option><option value="47822">47822 - COMERCIO VAREJISTA DE CALCADOS E ARTIGOS DE VIAGEM</option><option value="47831">47831 - COMERCIO VAREJISTA DE JOIAS E RELOGIOS</option><option value="47849">47849 - COMERCIO VAREJISTA DE GAS LIQUEFEITO DE PETROLEO (GLP)</option><option value="47857">47857 - COMERCIO VAREJISTA DE ARTIGOS USADOS</option><option value="47890">47890 - COMERCIO VAREJISTA DE OUTROS PRODUTOS NOVOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="49116">49116 - TRANSPORTE FERROVIARIO DE CARGA</option><option value="49124">49124 - TRANSPORTE METROFERROVIARIO DE PASSAGEIROS</option><option value="49213">49213 - TRANSPORTE RODOVIARIO COLETIVO DE PASSAGEIROS, COM ITINERARIO FIXO, MUNICIPAL E EM REGIAO METROPOLITANA</option><option value="49221">49221 - TRANSPORTE RODOVIARIO COLETIVO DE PASSAGEIROS, COM ITINERARIO FIXO, INTERMUNICIPAL, INTERESTADUAL E INTERNACIONAL</option><option value="49230">49230 - TRANSPORTE RODOVIARIO DE TAXI</option><option value="49248">49248 - TRANSPORTE ESCOLAR</option><option value="49299">49299 - TRANSPORTE RODOVIARIO COLETIVO DE PASSAGEIROS, SOB REGIME DE FRETAMENTO, E OUTROS TRANSPORTES RODOVIARIOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="49302">49302 - TRANSPORTE RODOVIARIO DE CARGA</option><option value="49400">49400 - TRANSPORTE DUTOVIARIO</option><option value="49507">49507 - TRENS TURISTICOS, TELEFERICOS E SIMILARES</option><option value="50114">50114 - TRANSPORTE MARITIMO DE CABOTAGEM</option><option value="50122">50122 - TRANSPORTE MARITIMO DE LONGO CURSO</option><option value="50211">50211 - TRANSPORTE POR NAVEGACAO INTERIOR DE CARGA</option><option value="50220">50220 - TRANSPORTE POR NAVEGACAO INTERIOR DE PASSAGEIROS EM LINHAS REGULARES</option><option value="50301">50301 - NAVEGACAO DE APOIO</option><option value="50912">50912 - TRANSPORTE POR NAVEGACAO DE TRAVESSIA</option><option value="50998">50998 - TRANSPORTES AQUAVIARIOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="51111">51111 - TRANSPORTE AEREO DE PASSAGEIROS REGULAR</option><option value="51129">51129 - TRANSPORTE AEREO DE PASSAGEIROS NAO-REGULAR</option><option value="51200">51200 - TRANSPORTE AEREO DE CARGA</option><option value="51307">51307 - TRANSPORTE ESPACIAL</option><option value="52117">52117 - ARMAZENAMENTO</option><option value="52125">52125 - CARGA E DESCARGA</option><option value="52214">52214 - CONCESSIONARIAS DE RODOVIAS, PONTES, TUNEIS E SERVICOS RELACIONADOS</option><option value="52222">52222 - TERMINAIS RODOVIARIOS E FERROVIARIOS</option><option value="52231">52231 - ESTACIONAMENTO DE VEICULOS</option><option value="52290">52290 - ATIVIDADES AUXILIARES DOS TRANSPORTES TERRESTRES NAO ESPECIFICADAS ANTERIORMENTE</option><option value="52311">52311 - GESTAO DE PORTOS E TERMINAIS</option><option value="52320">52320 - ATIVIDADES DE AGENCIAMENTO MARITIMO</option><option value="52397">52397 - ATIVIDADES AUXILIARES DOS TRANSPORTES AQUAVIARIOS NAO ESPECIFICADAS ANTERIORMENTE</option><option value="52401">52401 - ATIVIDADES AUXILIARES DOS TRANSPORTES AEREOS</option><option value="52508">52508 - ATIVIDADES RELACIONADAS A ORGANIZACAO DO TRANSPORTE DE CARGA</option><option value="53105">53105 - ATIVIDADES DE CORREIO</option><option value="53202">53202 - ATIVIDADES DE MALOTE E DE ENTREGA</option><option value="55108">55108 - HOTEIS E SIMILARES</option><option value="55906">55906 - OUTROS TIPOS DE ALOJAMENTO NAO ESPECIFICADOS ANTERIORMENTE</option><option value="56112">56112 - RESTAURANTES E OUTROS ESTABELECIMENTOS DE SERVICOS DE ALIMENTACAO E BEBIDAS</option><option value="56121">56121 - SERVICOS AMBULANTES DE ALIMENTACAO</option><option value="56201">56201 - SERVICOS DE CATERING, BUFE E OUTROS SERVICOS DE COMIDA PREPARADA</option><option value="58115">58115 - EDICAO DE LIVROS</option><option value="58123">58123 - EDICAO DE JORNAIS</option><option value="58131">58131 - EDICAO DE REVISTAS</option><option value="58191">58191 - EDICAO DE CADASTROS, LISTAS E DE OUTROS PRODUTOS GRAFICOS</option><option value="58212">58212 - EDICAO INTEGRADA A IMPRESSAO DE LIVROS</option><option value="58221">58221 - EDICAO INTEGRADA A IMPRESSAO DE JORNAIS</option><option value="58239">58239 - EDICAO INTEGRADA A IMPRESSAO DE REVISTAS</option><option value="58298">58298 - EDICAO INTEGRADA A IMPRESSAO DE CADASTROS, LISTAS E DE OUTROS PRODUTOS GRAFICOS</option><option value="59111">59111 - ATIVIDADES DE PRODUCAO CINEMATOGRAFICA, DE VIDEOS E DE PROGRAMAS DE TELEVISAO</option><option value="59120">59120 - ATIVIDADES DE POS-PRODUCAO CINEMATOGRAFICA, DE VIDEOS E DE PROGRAMAS DE TELEVISAO</option><option value="59138">59138 - DISTRIBUICAO CINEMATOGRAFICA, DE VIDEO E DE PROGRAMAS DE TELEVISAO</option><option value="59146">59146 - ATIVIDADES DE EXIBICAO CINEMATOGRAFICA</option><option value="59201">59201 - ATIVIDADES DE GRAVACAO DE SOM E DE EDICAO DE MUSICA</option><option value="60101">60101 - ATIVIDADES DE RADIO</option><option value="60217">60217 - ATIVIDADES DE TELEVISAO ABERTA</option><option value="60225">60225 - PROGRAMADORAS E ATIVIDADES RELACIONADAS A TELEVISAO POR ASSINATURA</option><option value="61108">61108 - TELECOMUNICACOES POR FIO</option><option value="61205">61205 - TELECOMUNICACOES SEM FIO</option><option value="61302">61302 - TELECOMUNICACOES POR SATELITE</option><option value="61418">61418 - OPERADORAS DE TELEVISAO POR ASSINATURA POR CABO</option><option value="61426">61426 - OPERADORAS DE TELEVISAO POR ASSINATURA POR MICROONDAS</option><option value="61434">61434 - OPERADORAS DE TELEVISAO POR ASSINATURA POR SATELITE</option><option value="61906">61906 - OUTRAS ATIVIDADES DE TELECOMUNICACOES</option><option value="62015">62015 - DESENVOLVIMENTO DE PROGRAMAS DE COMPUTADOR SOB ENCOMENDA</option><option value="62023">62023 - DESENVOLVIMENTO E LICENCIAMENTO DE PROGRAMAS DE COMPUTADOR CUSTOMIZAVEIS</option><option value="62031">62031 - DESENVOLVIMENTO E LICENCIAMENTO DE PROGRAMAS DE COMPUTADOR NAO-CUSTOMIZAVEIS</option><option value="62040">62040 - CONSULTORIA EM TECNOLOGIA DA INFORMACAO</option><option value="62091">62091 - SUPORTE TECNICO, MANUTENCAO E OUTROS SERVICOS EM TECNOLOGIA DA INFORMACAO</option><option value="63119">63119 - TRATAMENTO DE DADOS, PROVEDORES DE SERVICOS DE APLICACAO E SERVICOS DE HOSPEDAGEM NA INTERNET</option><option value="63194">63194 - PORTAIS, PROVEDORES DE CONTEUDO E OUTROS SERVICOS DE INFORMACAO NA INTERNET</option><option value="63917">63917 - AGENCIAS DE NOTICIAS</option><option value="63992">63992 - OUTRAS ATIVIDADES DE PRESTACAO DE SERVICOS DE INFORMACAO NAO ESPECIFICADAS ANTERIORMENTE</option><option value="64107">64107 - BANCO CENTRAL</option><option value="64212">64212 - BANCOS COMERCIAIS</option><option value="64221">64221 - BANCOS MULTIPLOS, COM CARTEIRA COMERCIAL</option><option value="64239">64239 - CAIXAS ECONOMICAS</option><option value="64247">64247 - CREDITO COOPERATIVO</option><option value="64310">64310 - BANCOS MULTIPLOS, SEM CARTEIRA COMERCIAL</option><option value="64328">64328 - BANCOS DE INVESTIMENTO</option><option value="64336">64336 - BANCOS DE DESENVOLVIMENTO</option><option value="64344">64344 - AGENCIAS DE FOMENTO</option><option value="64352">64352 - CREDITO IMOBILIARIO</option><option value="64361">64361 - SOCIEDADES DE CREDITO, FINANCIAMENTO E INVESTIMENTO - FINANCEIRAS</option><option value="64379">64379 - SOCIEDADES DE CREDITO AO MICROEMPREENDEDOR</option><option value="64387">64387 - INTERMEDIACAO NAO-MONETARIA - OUTROS INSTRUMENTOS DE CAPTACAO</option><option value="64409">64409 - ARRENDAMENTO MERCANTIL</option><option value="64506">64506 - SOCIEDADES DE CAPITALIZACAO</option><option value="64611">64611 - HOLDINGS DE INSTITUICOES FINANCEIRAS</option><option value="64620">64620 - HOLDINGS DE INSTITUICOES NAO-FINANCEIRAS</option><option value="64638">64638 - OUTRAS SOCIEDADES DE PARTICIPACAO, EXCETO HOLDINGS</option><option value="64701">64701 - FUNDOS DE INVESTIMENTO</option><option value="64913">64913 - SOCIEDADES DE FOMENTO MERCANTIL - FACTORING</option><option value="64921">64921 - SECURITIZACAO DE CREDITOS</option><option value="64930">64930 - ADMINISTRACAO DE CONSORCIOS PARA AQUISICAO DE BENS E DIREITOS</option><option value="64999">64999 - OUTRAS ATIVIDADES DE SERVICOS FINANCEIROS NAO ESPECIFICADAS ANTERIORMENTE</option><option value="65111">65111 - SEGUROS DE VIDA</option><option value="65120">65120 - SEGUROS NAO-VIDA</option><option value="65201">65201 - SEGUROS-SAUDE</option><option value="65308">65308 - RESSEGUROS</option><option value="65413">65413 - PREVIDENCIA COMPLEMENTAR FECHADA</option><option value="65421">65421 - PREVIDENCIA COMPLEMENTAR ABERTA</option><option value="65502">65502 - PLANOS DE SAUDE</option><option value="66118">66118 - ADMINISTRACAO DE BOLSAS E MERCADOS DE BALCAO ORGANIZADOS</option><option value="66126">66126 - ATIVIDADES DE INTERMEDIARIOS EM TRANSACOES DE TITULOS, VALORES MOBILIARIOS E MERCADORIAS</option><option value="66134">66134 - ADMINISTRACAO DE CARTOES DE CREDITO</option><option value="66193">66193 - ATIVIDADES AUXILIARES DOS SERVICOS FINANCEIROS NAO ESPECIFICADAS ANTERIORMENTE</option><option value="66215">66215 - AVALIACAO DE RISCOS E PERDAS</option><option value="66223">66223 - CORRETORES E AGENTES DE SEGUROS, DE PLANOS DE PREVIDENCIA COMPLEMENTAR E DE SAUDE</option><option value="66291">66291 - ATIVIDADES AUXILIARES DOS SEGUROS, DA PREVIDENCIA COMPLEMENTAR E DOS PLANOS DE SAUDE NAO ESPECIFICADAS ANTERIORMENTE</option><option value="66304">66304 - ATIVIDADES DE ADMINISTRACAO DE FUNDOS POR CONTRATO OU COMISSAO</option><option value="68102">68102 - ATIVIDADES IMOBILIARIAS DE IMOVEIS PROPRIOS</option><option value="68218">68218 - INTERMEDIACAO NA COMPRA, VENDA E ALUGUEL DE IMOVEIS</option><option value="68226">68226 - GESTAO E ADMINISTRACAO DA PROPRIEDADE IMOBILIARIA*</option><option value="69117">69117 - ATIVIDADES JURIDICAS, EXCETO CARTORIOS</option><option value="69125">69125 - CARTORIOS</option><option value="69206">69206 - ATIVIDADES DE CONTABILIDADE, CONSULTORIA E AUDITORIA CONTABIL E TRIBUTARIA</option><option value="70204">70204 - ATIVIDADES DE CONSULTORIA EM GESTAO EMPRESARIAL</option><option value="71111">71111 - SERVICOS DE ARQUITETURA</option><option value="71120">71120 - SERVICOS DE ENGENHARIA</option><option value="71197">71197 - ATIVIDADES TECNICAS RELACIONADAS A ARQUITETURA E ENGENHARIA</option><option value="71201">71201 - TESTES E ANALISES TECNICAS</option><option value="72100">72100 - PESQUISA E DESENVOLVIMENTO EXPERIMENTAL EM CIENCIAS FISICAS E NATURAIS</option><option value="72207">72207 - PESQUISA E DESENVOLVIMENTO EXPERIMENTAL EM CIENCIAS SOCIAIS E HUMANAS</option><option value="73114">73114 - AGENCIAS DE PUBLICIDADE</option><option value="73122">73122 - AGENCIAMENTO DE ESPACOS PARA PUBLICIDADE, EXCETO EM VEICULOS DE COMUNICACAO</option><option value="73190">73190 - ATIVIDADES DE PUBLICIDADE NAO ESPECIFICADAS ANTERIORMENTE</option><option value="73203">73203 - PESQUISAS DE MERCADO E DE OPINIAO PUBLICA</option><option value="74102">74102 - DESIGN E DECORACAO DE INTERIORES</option><option value="74200">74200 - ATIVIDADES FOTOGRAFICAS E SIMILARES</option><option value="74901">74901 - ATIVIDADES PROFISSIONAIS, CIENTIFICAS E TECNICAS NAO ESPECIFICADAS ANTERIORMENTE</option><option value="75001">75001 - ATIVIDADES VETERINARIAS</option><option value="77110">77110 - LOCACAO DE AUTOMOVEIS SEM CONDUTOR</option><option value="77195">77195 - LOCACAO DE MEIOS DE TRANSPORTE, EXCETO AUTOMOVEIS, SEM CONDUTOR</option><option value="77217">77217 - ALUGUEL DE EQUIPAMENTOS RECREATIVOS E ESPORTIVOS</option><option value="77225">77225 - ALUGUEL DE FITAS DE VIDEO, DVDS E SIMILARES</option><option value="77233">77233 - ALUGUEL DE OBJETOS DO VESTUARIO, JOIAS E ACESSORIOS</option><option value="77292">77292 - ALUGUEL DE OBJETOS PESSOAIS E DOMESTICOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="77314">77314 - ALUGUEL DE MAQUINAS E EQUIPAMENTOS AGRICOLAS SEM OPERADOR</option><option value="77322">77322 - ALUGUEL DE MAQUINAS E EQUIPAMENTOS PARA CONSTRUCAO SEM OPERADOR</option><option value="77331">77331 - ALUGUEL DE MAQUINAS E EQUIPAMENTOS PARA ESCRITORIOS</option><option value="77390">77390 - ALUGUEL DE MAQUINAS E EQUIPAMENTOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="77403">77403 - GESTAO DE ATIVOS INTANGIVEIS NAO-FINANCEIROS</option><option value="78108">78108 - SELECAO E AGENCIAMENTO DE MAO-DE-OBRA</option><option value="78205">78205 - LOCACAO DE MAO-DE-OBRA TEMPORARIA</option><option value="78302">78302 - FORNECIMENTO E GESTAO DE RECURSOS HUMANOS PARA TERCEIROS</option><option value="79112">79112 - AGENCIAS DE VIAGENS</option><option value="79121">79121 - OPERADORES TURISTICOS</option><option value="79902">79902 - SERVICOS DE RESERVAS E OUTROS SERVICOS DE TURISMO NAO ESPECIFICADOS ANTERIORMENTE</option><option value="80111">80111 - ATIVIDADES DE VIGILANCIA E SEGURANCA PRIVADA</option><option value="80129">80129 - ATIVIDADES DE TRANSPORTE DE VALORES</option><option value="80200">80200 - ATIVIDADES DE MONITORAMENTO DE SISTEMAS DE SEGURANCA</option><option value="80307">80307 - ATIVIDADES DE INVESTIGACAO PARTICULAR</option><option value="81117">81117 - SERVICOS COMBINADOS PARA APOIO A EDIFICIOS, EXCETO CONDOMINIOS PREDIAIS</option><option value="81125">81125 - CONDOMINIOS PREDIAIS</option><option value="81214">81214 - LIMPEZA EM PREDIOS E EM DOMICILIOS</option><option value="81222">81222 - IMUNIZACAO E CONTROLE DE PRAGAS URBANAS</option><option value="81290">81290 - ATIVIDADES DE LIMPEZA NAO ESPECIFICADAS ANTERIORMENTE</option><option value="81303">81303 - ATIVIDADES PAISAGISTICAS</option><option value="82113">82113 - SERVICOS COMBINADOS DE ESCRITORIO E APOIO ADMINISTRATIVO</option><option value="82199">82199 - FOTOCOPIAS, PREPARACAO DE DOCUMENTOS E OUTROS SERVICOS ESPECIALIZADOS DE APOIO ADMINISTRATIVO</option><option value="82202">82202 - ATIVIDADES DE TELEATENDIMENTO</option><option value="82300">82300 - ATIVIDADES DE ORGANIZACAO DE EVENTOS, EXCETO CULTURAIS E ESPORTIVOS</option><option value="82911">82911 - ATIVIDADES DE COBRANCAS E INFORMACOES CADASTRAIS</option><option value="82920">82920 - ENVASAMENTO E EMPACOTAMENTO SOB CONTRATO</option><option value="82997">82997 - ATIVIDADES DE SERVICOS PRESTADOS PRINCIPALMENTE AS EMPRESAS NAO ESPECIFICADAS ANTERIORMENTE</option><option value="84116">84116 - ADMINISTRACAO PUBLICA EM GERAL</option><option value="84124">84124 - REGULACAO DAS ATIVIDADES DE SAUDE, EDUCACAO, SERVICOS CULTURAIS E OUTROS SERVICOS SOCIAIS</option><option value="84132">84132 - REGULACAO DAS ATIVIDADES ECONOMICAS</option><option value="84213">84213 - RELACOES EXTERIORES</option><option value="84221">84221 - DEFESA</option><option value="84230">84230 - JUSTICA</option><option value="84248">84248 - SEGURANCA E ORDEM PUBLICA</option><option value="84256">84256 - DEFESA CIVIL</option><option value="84302">84302 - SEGURIDADE SOCIAL OBRIGATORIA</option><option value="85112">85112 - EDUCACAO INFANTIL - CRECHE</option><option value="85121">85121 - EDUCACAO INFANTIL - PRE-ESCOLA</option><option value="85139">85139 - ENSINO FUNDAMENTAL</option><option value="85201">85201 - ENSINO MEDIO</option><option value="85317">85317 - EDUCACAO SUPERIOR - GRADUACAO</option><option value="85325">85325 - EDUCACAO SUPERIOR - GRADUACAO E POS-GRADUACAO</option><option value="85333">85333 - EDUCACAO SUPERIOR - POS-GRADUACAO E EXTENSAO</option><option value="85414">85414 - EDUCACAO PROFISSIONAL DE NIVEL TECNICO</option><option value="85422">85422 - EDUCACAO PROFISSIONAL DE NIVEL TECNOLOGICO</option><option value="85503">85503 - SERVICOS AUXILIARES A EDUCACAO</option><option value="85911">85911 - ENSINO DE ESPORTES</option><option value="85929">85929 - ENSINO DE ARTE E CULTURA</option><option value="85937">85937 - ENSINO DE IDIOMAS</option><option value="85996">85996 - ATIVIDADES DE ENSINO NAO ESPECIFICADAS ANTERIORMENTE</option><option value="86101">86101 - ATIVIDADES DE ATENDIMENTO HOSPITALAR</option><option value="86216">86216 - SERVICOS MOVEIS DE ATENDIMENTO A URGENCIAS</option><option value="86224">86224 - SERVICOS DE REMOCAO DE PACIENTES, EXCETO OS SERVICOS MOVEIS DE ATENDIMENTO A URGENCIAS</option><option value="86305">86305 - ATIVIDADES DE ATENCAO AMBULATORIAL EXECUTADAS POR MEDICOS E ODONTOLOGOS</option><option value="86402">86402 - ATIVIDADES DE SERVICOS DE COMPLEMENTACAO DIAGNOSTICA E TERAPEUTICA</option><option value="86500">86500 - ATIVIDADES DE PROFISSIONAIS DA AREA DE SAUDE, EXCETO MEDICOS E ODONTOLOGOS</option><option value="86607">86607 - ATIVIDADES DE APOIO A GESTAO DE SAUDE</option><option value="86909">86909 - ATIVIDADES DE ATENCAO A SAUDE HUMANA NAO ESPECIFICADAS ANTERIORMENTE</option><option value="87115">87115 - ATIVIDADES DE ASSISTENCIA A IDOSOS, DEFICIENTES FISICOS, IMUNODEPRIMIDOS E CONVALESCENTES PRESTADAS EM RESIDENCIAS COLETIVAS E PARTICULARES</option><option value="87123">87123 - ATIVIDADES DE FORNECIMENTO DE INFRA-ESTRUTURA DE APOIO E ASSISTENCIA A PACIENTE NO DOMICILIO</option><option value="87204">87204 - ATIVIDADES DE ASSISTENCIA PSICOSSOCIAL E A SAUDE A PORTADORES DE DISTURBIOS PSIQUICOS, DEFICIENCIA MENTAL E DEPENDENCIA QUIMICA</option><option value="87301">87301 - ATIVIDADES DE ASSISTENCIA SOCIAL PRESTADAS EM RESIDENCIAS COLETIVAS E PARTICULARES</option><option value="88006">88006 - SERVICOS DE ASSISTENCIA SOCIAL SEM ALOJAMENTO</option><option value="90019">90019 - ARTES CENICAS, ESPETACULOS E ATIVIDADES COMPLEMENTARES</option><option value="90027">90027 - CRIACAO ARTISTICA</option><option value="90035">90035 - GESTAO DE ESPACOS PARA ARTES CENICAS, ESPETACULOS E OUTRAS ATIVIDADES ARTISTICAS</option><option value="91015">91015 - ATIVIDADES DE BIBLIOTECAS E ARQUIVOS</option><option value="91023">91023 - ATIVIDADES DE MUSEUS E DE EXPLORACAO, RESTAURACAO ARTISTICA E CONSERVACAO DE LUGARES E PREDIOS HISTORICOS E ATRACOES SIMILARES</option><option value="91031">91031 - ATIVIDADES DE JARDINS BOTANICOS, ZOOLOGICOS, PARQUES NACIONAIS, RESERVAS ECOLOGICAS E AREAS DE PROTECAO AMBIENTAL</option><option value="92003">92003 - ATIVIDADES DE EXPLORACAO DE JOGOS DE AZAR E APOSTAS</option><option value="93115">93115 - GESTAO DE INSTALACOES DE ESPORTES</option><option value="93123">93123 - CLUBES SOCIAIS, ESPORTIVOS E SIMILARES</option><option value="93131">93131 - ATIVIDADES DE CONDICIONAMENTO FISICO</option><option value="93191">93191 - ATIVIDADES ESPORTIVAS NAO ESPECIFICADAS ANTERIORMENTE</option><option value="93212">93212 - PARQUES DE DIVERSAO E PARQUES TEMATICOS</option><option value="93298">93298 - ATIVIDADES DE RECREACAO E LAZER NAO ESPECIFICADAS ANTERIORMENTE</option><option value="94111">94111 - ATIVIDADES DE ORGANIZACOES ASSOCIATIVAS PATRONAIS E EMPRESARIAIS</option><option value="94120">94120 - ATIVIDADES DE ORGANIZACOES ASSOCIATIVAS PROFISSIONAIS</option><option value="94201">94201 - ATIVIDADES DE ORGANIZACOES SINDICAIS</option><option value="94308">94308 - ATIVIDADES DE ASSOCIACOES DE DEFESA DE DIREITOS SOCIAIS</option><option value="94910">94910 - ATIVIDADES DE ORGANIZACOES RELIGIOSAS</option><option value="94928">94928 - ATIVIDADES DE ORGANIZACOES POLITICAS</option><option value="94936">94936 - ATIVIDADES DE ORGANIZACOES ASSOCIATIVAS LIGADAS A CULTURA E A ARTE</option><option value="94995">94995 - ATIVIDADES ASSOCIATIVAS NAO ESPECIFICADAS ANTERIORMENTE</option><option value="95118">95118 - REPARACAO E MANUTENCAO DE COMPUTADORES E DE EQUIPAMENTOS PERIFERICOS</option><option value="95126">95126 - REPARACAO E MANUTENCAO DE EQUIPAMENTOS DE COMUNICACAO</option><option value="95215">95215 - REPARACAO E MANUTENCAO DE EQUIPAMENTOS ELETROELETRONICOS DE USO PESSOAL E DOMESTICO</option><option value="95291">95291 - REPARACAO E MANUTENCAO DE OBJETOS E EQUIPAMENTOS PESSOAIS E DOMESTICOS NAO ESPECIFICADOS ANTERIORMENTE</option><option value="96017">96017 - LAVANDERIAS, TINTURARIAS E TOALHEIROS</option><option value="96025">96025 - CABELEIREIROS E OUTRAS ATIVIDADES DE TRATAMENTO DE BELEZA</option><option value="96033">96033 - ATIVIDADES FUNERARIAS E SERVICOS RELACIONADOS</option><option value="96092">96092 - ATIVIDADES DE SERVICOS PESSOAIS NAO ESPECIFICADAS ANTERIORMENTE</option><option value="97005">97005 - SERVICOS DOMESTICOS</option><option value="99008">99008 - ORGANISMOS INTERNACIONAIS E OUTRAS INSTITUICOES EXTRATERRITORIAIS</option></select>
    	                     </p>
                           
                            </div>
                           <button type="button" class="width-30  btn-primary btn-sm"  id="btnAplicar" disabled onclick="selectAll('RAT',1);"> 
                             APLICAR SELEÇÃO
                           </button>
                           <button type="button" class="width-30  btn-info btn-sm"   onclick="LimpaFiltros();"> 
   	                          LIMPAR FILTROS 
                           </button>                        
				        </div>
                       </div>
                       <div class="row">
                          <!-- Ramo Source Begin -->
					      <div class="col-md-6">
	                        <div class="table-header"></div>
                            <div class="table-responsive">
                               <table id="tbRamoSource" class="table table-striped table-bordered table-hover w-100 d-block d-md-table datatableRamo">
	                             <thead>
	                               <tr>
                                     <th>CNAE</th>
		                             <th>Descrição</th>
			                         <th>Divisão</th>
                                     <th>Grupo</th>
                                     <th>Classe</th>
						           </tr>
							     </thead>
                                 <tbody>
                                   <asp:Repeater ID="rptRamoSource" runat="server"  >
                                   <HeaderTemplate></HeaderTemplate>
                                   <ItemTemplate>
                                      <tr>
                                     <td id='Cnae_<%#Eval("Id") %>'><%# Eval("Id")%></td>
                                     <td id='Atv_<%#Eval("Id") %>'><%# Eval("Nome")%></td>
                                     <td id='Div_<%#Eval("Id") %>'><%# Eval("divi")%> - <%# Eval("diviDesc")%></td>
                                     <td id='Gp_<%#Eval("Id") %>'><%# Eval("gp")%> - <%# Eval("gpDesc")%></td>
                                     <td id='Cls_<%#Eval("Id") %>'><%# Eval("cls")%> - <%# Eval("clsDesc")%></td>
                                     <td id='NmUsuario_<%#Eval("StrId") %>'><%# Eval("StrId")%></td>
                                 </tr>
                                   </ItemTemplate>
                                   </asp:Repeater>
							     </tbody>
						       </table>
				            </div>
				          </div>
                          <div class="col-md-6 col-md-offset-6">
		                    <div class="table-header"></div>
                            <div class="table-responsive">
  	                           <table id="tbRamoTarget" class="table table-bordered table-hover w-100 d-block d-md-table datatableRamo">
			      	             <thead>
				                   <tr>
                                     <th>CNAE</th>
		                             <th>Descrição</th>
                                     <th>Divisão</th>
                                     <th>Grupo</th>
                                     <th>Classe</th>
							       </tr>
						         </thead>
                                <tbody>
                                   <asp:Repeater ID="rptRamoTarget" runat="server"  >
                                   <HeaderTemplate></HeaderTemplate>
                                   <ItemTemplate>
						           <tr>
                                      <td id='Cnae_<%#Eval("Id") %>'><%# Eval("Id")%></td>
                                 <td id='Atv_<%#Eval("Id") %>'><%# Eval("Nome")%></td>
                                 <td id='Div_<%#Eval("Id") %>'><%# Eval("divi")%></td>
                                 <td id='Gp_<%#Eval("Id") %>'><%# Eval("gp")%></td>
                                 <td id='Cls_<%#Eval("Id") %>'><%# Eval("cls")%></td>
                                 <td id='NmUsuario_<%#Eval("StrId") %>'><%# Eval("StrId")%></td>
                              </tr>
                              </ItemTemplate>
                              </asp:Repeater>
						   </tbody>
				         </table>
				       </div>
                        <button type="button" class="width-30  btn-danger btn-sm pull-right"  id="Button16" onclick="selectAll('RAT',2);"> 
   	                                       EXCLUIR TODOS DA SELEÇÃO
                                       </button>
                    </div>
                    <!-- Ramo de Atividade Target End -->
                       </div>
                     </div>
                   </div>
		        </div>
		      </div>
		    </div>
            <!-- Atividade Econômica Fim  -->


            <!-- Exportação Inicio -->
            <div class="tab-pane" id="export">
               <br />
       			<span class="btn btn-lg btn-block btn-primary waves-effect waves-light" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Defina os últimos passos para exportar sua listagem">
                    Quantidade Contabilizada<i class="fe-layers avatar-title font-22 text-white"> </i> 
               </span>           
                <div class="card">
                   <div  class="card-box">
                     <span id="divsaldo"></span>
                     <div id="divPrecos"></div>
                  </div>
                   <br style="clear: left;" /> 
                </div>

            </div> 
                    
            <script type="text/javascript">

                function atualiza() {

                    $("[id*=hddValorParc]").val(parseInt(document.getElementById('TextCompra').value));
                    var divPreco = $("#divPrecos");
                    divPreco.empty();
                    var xhtml = htmlLstPrcRegistro($("[id*=hddListaPrecos]").val(), String($("#cboCampos").val()));
                    divPreco.append(xhtml);

                }
    </script>
           
       
            <!-- Contagem Inicio -->
           

      <div class="modal fade" tabindex="-1" style="display: none;"  id="cont">
        <div class="modal-dialog">
           <div class="modal-content">
               <div class="custom-modal-header">
               <h4 class="custom-modal-title bg-blue">CONTAGEM DETALHADA POR CAMPO  <i class="fe-check text-white "></i></h4>    
            </div>
            <div class="modal-body">
                <div class="row">
                      <div class="col-xl-10">
	                    <select multiple="multiple" class="multi-select"  style="width: 250%;"  id="cboAgrupamentos" data-placeholder="Clique aqui" >
					    <option value="UF">ESTADO</option>
					    <option value="DDD">DDD</option>
					    <option value="MUN">CIDADE</option>
					    <option value="BAI">BAIRRO</option>
					    <option value="CEP">CEP</option>
					    <option value="RAT">CNAE - ATIVIDADE</option>
                        <option value="MSR">MESSOREGIÃO</option>
                        <option value="MCR">MICROREGIÃO</option>
				       </select>
                     </div>
                </div>
                <div>
                  <br />
                  <button class="btn btn-danger btn-rounded float-md-left" data-dismiss="modal"><i class="icon-remove"></i>Cancelar</button>
                  <button href="#export" data-toggle="tab" type="button" class="btn btn-success btn-rounded float-right"  id="Button34" onclick='if ( $("[id*=hddCall]").val()=="0" ) { Contagem(); } else { DoSearchAjax(1); };tabext();'  data-dismiss="modal">                     
	                  OK - Executar contagem
                  </button>                                 
                </div>
            </div>                         
           </div>                      
        </div>
      </div>
           
       <div class="tab-pane" id="resultpesquisa">
                  <div class="clearfix">
                    <div class="row">
                      <div class="col-md-12">
                  
            <button type="button" class="btn btn-success waves-effect waves-light" id="btnExcel" disabled="disabled" onclick="FeedHiddenContagem(1);" runat="server" onserverclick="ExportResultsExcel"> 
 	        <i class="mdi mdi-file-excel mr-1"></i> EXPORTAR PLANILHA EXCEL
             </button>
                           
             <button type="button" class="btn btn-blue waves-effect waves-light"  id="btnCSV" disabled="disabled" onclick="FeedHiddenContagem(2);" runat="server" onserverclick="ExportResultsExcel"> 
               <i class="mdi mdi-file-delimited mr-1"></i> EXPORTAR CSV
             </button>

       
         
                       <br /><br />                       
					 </div>
                    </div>
                   </div>


            <div class="row">
                <div class="col-md-12">
		                  

                          <!-- Filipe 18/07/2014: Workaround para scroll horizontal após sort, etc. -->
                         <div class="table-responsive" id="divtbContagem" style="overflow-x: auto;">
	
		                      <table id="tbContagem" class="table table-striped table-bordered table-hover w-100 d-block d-md-table">
			                  <thead>
			                    <tr>
                                  <th style="display:none">Id</th>
			                      <th>Nome</th>
				                  <th>Registros</th>
				                </tr>
	  		 	              </thead>
  	                         <tbody>
						     </tbody>
						  </table>
					   </div>
                      </div><!-- DataTable -->
  	         </div>

              
      	    </div>

         <!-- Right Sidebar style="width:800px;" -->
        <div class="right-bar" >
            <div class="rightbar-title" >
                <a href="javascript:void(0);" class="right-bar-toggle float-right">
                    <i class="dripicons-cross noti-icon"></i>
                </a>
                <h5 class="m-0 text-white">FILTRO SELECIONADOS</h5>
                
            </div>
	  	    <div id="divTextoFiltros" style="overflow:scroll;" >         </div>  
        </div>
               
        <div class="rightbar-overlay"></div>
	
   </div>    <!-- PAGE CONTENT DIV -->


     </div>
    
      
 
  
  
            
    <!-- PAGE CONTENT ENDS -->
    <asp:HiddenField ID="hddTipoValidacao" runat="server"/>
    <asp:HiddenField ID="hddRegiaoTargetList" runat="server"/>
    <asp:HiddenField ID="hddListaRegiao" runat="server"/>    
    <asp:HiddenField ID="hddFiltros" runat="server"/>
    <asp:HiddenField ID="hddFiltrosX" runat="server"/>
    <asp:HiddenField ID="hddFiltrosPesquisa" runat="server"/>
    <asp:HiddenField ID="hddRegiaoTargetList2" runat="server"/>
    <asp:HiddenField ID="hddRegiaoOldList" runat="server" />
    <asp:HiddenField ID="hddUFChanged" runat="server"/>
    <asp:HiddenField ID="hddRamoTargetList" runat="server"/>
    <asp:HiddenField ID="hddListaRamo" runat="server" />
    <asp:HiddenField ID="hddPorteTargetList" runat="server"/>
    <asp:HiddenField ID="hddListaPorte" runat="server" />
    <asp:HiddenField ID="hddSetorTargetList" runat="server"/>
    <asp:HiddenField ID="hddEspecialidadeTargetList" runat="server"/>
    <asp:HiddenField ID="hddListaSetor" runat="server" />
    <asp:HiddenField ID="hddListaEspecialidade" runat="server" />
    <asp:HiddenField ID="hddQFI" runat="server"/>
    <asp:HiddenField ID="hddQFF" runat="server"/>
    <asp:HiddenField ID="hddQLI" runat="server"/>
    <asp:HiddenField ID="hddQLF" runat="server"/>
    <asp:HiddenField ID="hddEME" runat="server"/>
    <asp:HiddenField ID="hddWLE" runat="server"/>
    <asp:HiddenField ID="hddSTE" runat="server"/>
    <asp:HiddenField ID="hddCTN" runat="server"/>
    <asp:HiddenField ID="hddCTE" runat="server"/>
    <asp:HiddenField ID="hddECC" runat="server"/>
    <asp:HiddenField ID="hddCTC" runat="server"/>
    <asp:HiddenField ID="hddFXETargetList" runat="server"/>
    <asp:HiddenField ID="hddListaFXE" runat="server" />
    <asp:HiddenField ID="hddFXFTargetList" runat="server"/>
    <asp:HiddenField ID="hddListaFXF" runat="server" />
    <asp:HiddenField ID="hddTRBTargetList" runat="server"/>
    <asp:HiddenField ID="hddListaTRB" runat="server" />        
    <asp:HiddenField ID="hddDDDTargetList" runat="server"/>
    <asp:HiddenField ID="hddListaDDD" runat="server"/>
    <asp:HiddenField ID="hddDDDOldList" runat="server" />
    <asp:HiddenField ID="hddDDDChanged" runat="server"/>
    <asp:HiddenField ID="hddMSRTargetList" runat="server"/>
    <asp:HiddenField ID="hddListaMSR" runat="server"/>
    <asp:HiddenField ID="hddMSROldList" runat="server" />
    <asp:HiddenField ID="hddMSRChanged" runat="server"/>
    <asp:HiddenField ID="hddMCRTargetList" runat="server"/>
    <asp:HiddenField ID="hddListaMCR" runat="server"/>
    <asp:HiddenField ID="hddMCROldList" runat="server" />
    <asp:HiddenField ID="hddMCRChanged" runat="server"/>    
    <asp:HiddenField ID="hddMUNChanged" runat="server" />
    <asp:HiddenField ID="hddMunicipioTargetList" runat="server"/>
    <asp:HiddenField ID="hddListaMunicipio" runat="server" />
    <asp:HiddenField ID="hddFIC" runat="server"/>
    <asp:HiddenField ID="hddFFC" runat="server"/>
    <asp:HiddenField ID="hddListaCEP" runat="server"/>
    <asp:HiddenField ID="hddNmUsuario" runat="server"/>    
    <asp:HiddenField ID="hddTipoArquivo" runat="server"/>
    <asp:HiddenField ID="hddidOperacao" runat="server"/>
    <asp:HiddenField ID="hddtbContagem" runat="server"/>
    <asp:HiddenField ID="hddListaCPFCNPJ" runat="server"/>
    <asp:HiddenField ID="hddExcluiCPFCNPJ" runat="server"/>
    <asp:HiddenField ID="hddEnriquecimentoCPFCNPJ" runat="server"/>
    <asp:HiddenField ID="hddListaEmail" runat="server"/>
    <asp:HiddenField ID="hddExcluiEmail" runat="server"/>
    <asp:HiddenField ID="hddEnriquecimentoEmail" runat="server"/>
    <asp:HiddenField ID="hddListaDominio" runat="server"/>
    <asp:HiddenField ID="hddExcluiDominio" runat="server"/>
    <asp:HiddenField ID="hddEnriquecimentoDominio" runat="server"/>
    <asp:HiddenField ID="hddPalavraChave" runat="server"/>
    <asp:HiddenField ID="hddOrdemPalavraChave" runat="server"/>
    <asp:HiddenField ID="hddProtestos" runat="server"/>
    <asp:HiddenField ID="hddDividas" runat="server"/>
    <asp:HiddenField ID="hddQtdRegExp" runat="server"/>
    <asp:HiddenField ID="hddAllRegExp" runat="server" />
    <asp:HiddenField ID="hddIP"        runat="server" />
    <asp:HiddenField ID="hddOmiteValoresReais"  runat="server" />
    <asp:HiddenField ID="hddSolic"     runat="server" />
    <asp:HiddenField ID="hddProjeto"   runat="server" />
    <asp:HiddenField ID="hddPrazo"     runat="server" />
    <asp:HiddenField ID="hddObs"       runat="server" />
    <asp:HiddenField ID="hddListaPrecos" runat="server" />
    <asp:HiddenField ID="hddMatrizFilial" runat="server" />
    <asp:HiddenField ID="hddABI" runat="server" />
    <asp:HiddenField ID="hddABF" runat="server" />
    <asp:HiddenField ID="hddValorParc" runat="server" />
    <asp:HiddenField ID="hddIdPesquisa" runat="server" />
    <asp:HiddenField ID="hddWCL" runat="server" />
    <asp:HiddenField ID="hddWFU" runat="server" />
    <asp:HiddenField ID="hddWIE" runat="server" />
    <asp:HiddenField ID="hddWTL" runat="server" />
    <asp:HiddenField ID="hddWSD" runat="server"/>
    <asp:HiddenField ID="hddWEC" runat="server" />
    <asp:HiddenField ID="hddOpCelTargetList" runat="server"/>
    <asp:HiddenField ID="hddListaOpCel" runat="server" />
    <asp:HiddenField ID="hddOpTelTargetList" runat="server"/>
    <asp:HiddenField ID="hddListaOpTel" runat="server" />
    <asp:HiddenField ID="hddOperacaoTargetList" runat="server"/>
    <asp:HiddenField ID="hddListaOperacao" runat="server" />
    <asp:HiddenField ID="hddImpExpTargetList" runat="server"/>
    <asp:HiddenField ID="hddNJTargetList" runat="server"/>
    <asp:HiddenField ID="hddListaNJ" runat="server" />
    <asp:HiddenField ID="hddINDTargetList" runat="server"/>
    <asp:HiddenField ID="hddListaIND" runat="server" />
    <asp:HiddenField ID="hddRiscoTargetList" runat="server"/>
    <asp:HiddenField ID="hddListaRisco" runat="server" />
    <asp:HiddenField ID="hddListaImpExp" runat="server" />
    <asp:HiddenField ID="hddCall" runat="server" />
    <asp:HiddenField ID="hddSaudeTargetList" runat="server" />
    <asp:HiddenField ID="hddListaSaude" runat="server" />
    <asp:HiddenField ID="hddIVI"   runat="server"/>
    <asp:HiddenField ID="hddIVF"   runat="server"/>
    <asp:HiddenField ID="hddLMI"   runat="server"/>
    <asp:HiddenField ID="hddLMF"   runat="server"/>
    <asp:HiddenField ID="hddLAI"   runat="server"/>
    <asp:HiddenField ID="hddLAF"   runat="server"/>
    <asp:HiddenField ID="hddCSI"   runat="server"/>
    <asp:HiddenField ID="hddCSF"   runat="server"/>
    <asp:HiddenField ID="hddCboCNPJ"  runat="server"/>
    <asp:HiddenField ID="hddMEI"  runat="server"/>
    <asp:HiddenField ID="hddTOP1000"  runat="server"/>
    <asp:HiddenField ID="hddRCJ"  runat="server"/>
    <asp:HiddenField ID="hddVeiTipoTargetList" runat='server' />
    <asp:HiddenField ID="hddVeiTipoOldList" runat="server" />
    <asp:HiddenField ID="hddVeiTipoChanged" runat="server" />
    <asp:HiddenField ID="hddListaVeiTipo" runat='server' />
    <asp:HiddenField ID="hddVeiFabTargetList" runat='server' />
    <asp:HiddenField ID="hddListaVeiFab" runat='server' />
    <asp:HiddenField ID="hddVeiMarTargetLista" runat='server' />
    <asp:HiddenField ID="hddListaVeiMar" runat='server' />
    <asp:HiddenField ID="hddVeiModTargetList" runat='server' />
    <asp:HiddenField ID="hddListaVeiMod" runat='server' />
    <asp:HiddenField ID="hddVeiAnoIni" runat='server' />
    <asp:HiddenField ID="hddVeiAnoFim" runat='server' />
    <asp:HiddenField ID="hddWVE" runat="server" />
    <asp:HiddenField ID="hddWDeduplic" runat="server" />
    <asp:HiddenField ID="hddVeiFabOldList" runat="server" />
    <asp:HiddenField ID="hddVeiMarChanged" runat="server" />
    <asp:HiddenField ID="hddVeiMarOldList" runat="server" />
    <asp:HiddenField ID="hddVeiModChanged" runat="server" />
    <asp:HiddenField ID="hddCrmID" runat="server" />
    <asp:HiddenField ID="hddclifatordm" runat="server" />
    <asp:HiddenField ID="hddclifatorctt" runat="server" />
    <asp:HiddenField ID="hddInputPesquisa" runat="server" />


    <!-- JAVASCRIPTS -->
    <!-- page specific plugin scripts <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js" type="text/javascript"></script> -->
    
    
        
    <!-- Vendor js -->
    <script src="assets/js/vendor.min.js"></script>
      
    <script src="assets/js/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
    <script src="assets/js/chosen.jquery.min.js" type="text/javascript"></script>
    <script src="assets/js/jquery.autosize.min.js" type="text/javascript"></script>
    <script src="assets/js/jquery.inputlimiter.1.3.1.min.js" type="text/javascript"></script>   
    <script src="assets/js/jquery.maskMoney.js" type="text/javascript"></script>   
    <script src="https://npmcdn.com/flatpickr/dist/l10n/pt.js"></script>
        
    <!-- Modal-Effect -->
    <script src="assets/libs/custombox/custombox.min.js"></script>

   
      <!-- Sweet Alerts js -->
        <script src="assets/libs/sweetalert2/sweetalert2.min.js" type="text/javascript"></script>

        <!-- Sweet alert init js-->
        <script src="assets/js/pages/sweet-alerts.init.js"></script>


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
        <script src="assets/libs/pdfmake/pdfmake.min.js"></script>
        <script src="assets/libs/pdfmake/vfs_fonts.js"></script>

        <script src="assets/libs/jquery-toast/jquery.toast.min.js"></script>
        <script src="assets/js/pages/toastr.init.js"></script>
        <!-- JsGrid js -->
        <script src="assets/libs/jsgrid/jsgrid.min.js"></script>

        <!-- Double Scroll js -->
         <script src="assets/js/jquery.doubleScroll.js"></script>

        <!-- Init js -->
        <script src="assets/js/pages/jsgrid.init.js"></script>

      <!-- Datatables init -->
        <script src="assets/js/pages/datatables.init.js"></script>

     
        
    <!-- Filipe 09/08/2014: datatables translation -->
    <script src="assets/js/dataTables-pt-br.js" type="text/javascript"></script>

    <!-- Scripts template antigo necessários  -->
    <script src="assets/js/Mascara.js" type="text/javascript"></script>
    <script src="assets/js/AppFunctions.js" type="text/javascript"></script>
    <script src="assets/js/fold-to-ascii.js" type="text/javascript"></script>

    <!-- JS COMUNS -->
    <script src="assets/js/typeahead-bs2.min.js" type="text/javascript"></script>
    <script src="assets/js/bootbox.min.js" type="text/javascript"></script>
    <script src="assets/libs/multiselect/jquery.multi-select.js"  type="text/javascript"></script>
    <script src="assets/libs/select2/select2.min.js"></script>
    <script src="assets/libs/bootstrap-select/bootstrap-select.min.js"></script> 
    <script src="assets/libs/dropzone/dropzone.min.js"></script>
    <script src="assets/libs/dropify/dropify.min.js"></script>
    <script src="assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
    <script src="assets/libs/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
    <script src="assets/libs/jquery-nice-select/jquery.nice-select.min.js"></script>
     <script src="assets/libs/switchery/switchery.min.js"></script>
    <script src="assets/libs/jquery-mockjax/jquery.mockjax.min.js"></script>
    <script src="assets/libs/autocomplete/jquery.autocomplete.min.js"></script>
    <script src="assets/libs/flatpickr/flatpickr.min.js"></script>
   
    <script src="assets/libs/bootstrap-colorpicker/bootstrap-colorpicker.min.js"></script>
    <script src="assets/libs/clockpicker/bootstrap-clockpicker.min.js"></script>
    <script src="assets/js/jquery.maskedinput.min.js" type="text/javascript"></script>
    <script src="assets/libs/jquery-mask-plugin/jquery.mask.min.js"></script>
    <script src="assets/libs/autonumeric/autoNumeric-min.js"></script>
    <script src="https://npmcdn.com/flatpickr/dist/l10n/pt.js"></script>
        
    <!-- Tour page js -->
    <script src="assets/libs/hopscotch/hopscotch.min.js"></script>

    <!-- Init js-->
    <script src="assets/js/pages/form-fileuploads.init.js"></script>
    <script src="assets/js/pages/form-advanced.init.js"></script>  
    <script src="assets/js/pages/form-pickers.init.js"></script>
   <script src="assets/js/pages/form-masks.init.js"></script>
     
 <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.8.0/xlsx.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.8.0/jszip.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.10.8/xlsx.full.min.js"></script>

    <!-- Javascript de consulta veicular -->
    
    <script src="assets/js/apb_vec.js"></script>
   

  

    <script>

        function tabext() {
            $('#tabexport').tab('show')
        };

      
    </script>  

   
  

    <script>

        function extractHeader(ws,campo) {

            const header = [];

            var range = XLSX.utils.decode_range(ws["!ref"]);

            var linhas = range.e.r;


            const columnCount = range.e.c + 1
            for (let i = 0; i < columnCount; ++i) {

                header[i] = ws[`${XLSX.utils.encode_col(i)}1`].v;

                var r = confirm("Confirma o " + campo + " nesta coluna:  " + header[i]);
                if (r == true) {
                    alert("Selecionados os campos da coluna: " + header[i])
                    range.s.c = i;
                    range.s.r = 0;
                    range.e.c = i;
                    var retorno = XLSX.utils.encode_range(range);

                    break;
                }

            } // for

            return [retorno, linhas]
        }


        // Filipe 06/08/2014: Upload
        $(function () {

            if (window.FileReader) {

                $('#fluCNPJ').on('change', function (e) {

                   
                    var file = e.target.files[0];                 
                    var filename = document.getElementById('fluCNPJ').value;
                    var ext = filename.split('.').pop();

                        if ((ext == 'xls') || (ext == 'xlsx')) {

                            var reader = new FileReader();

                            reader.onload = function () {

                                var fileData = reader.result;

                                const rABS = !!reader.readAsBinaryString;
                                const wb = XLSX.read(fileData, { type: rABS ? 'binary' : 'array' });

                                /* Get first worksheet */
                                const wsname = wb.SheetNames[0];
                                const ws = wb.Sheets[wsname];
                                var refer = extractHeader(ws, 'CNPJ');
                                var linhas = refer[1];
                                var rang = refer[0];

                                ws['!ref'] = rang;

                                var rowObj = XLSX.utils.sheet_to_csv(ws, { blankrows: false, RS: "\r\n" });

                             

                                var sText = rowObj;
                                sText = sText.replace(/\r?\n/g, ",").replace(/[^0-9,]/g, "");

                             
                                PesquisaDBAgrup(sText, 12);

                            };

                            reader.readAsBinaryString(file);


                        }

                        else {

                        var reader = new FileReader();
                        reader.onload = function (e) {

                            // Acrescenta o resultado
                            reader.result.replace(/[^0-9]/g, "");
                            var sText = $('#txaCNPJ').val()
                            sText += ',';
                            sText += reader.result.replace(/\r?\n/g, ",");
                            // console.log(sText);
                            PesquisaDBAgrup(sText, 12);
                            

                        }
                        reader.readAsText(file);

                    }

                });

                $('#fluCEP').on('change', function (e) {

                   
                    var file = e.target.files[0];

                    var filename = document.getElementById('fluCEP').value;
                    var ext = filename.split('.').pop();
                    

                    if ((ext == 'xls') || (ext == 'xlsx')) {

                       var reader = new FileReader();

                        reader.onload = function () {

                            var fileData = reader.result;

                            const rABS = !!reader.readAsBinaryString;
                            const wb = XLSX.read(fileData, { type: rABS ? 'binary' : 'array' });

                            /* Get first worksheet */
                            const wsname = wb.SheetNames[0];
                            const ws = wb.Sheets[wsname];
                            var refer = extractHeader(ws,'CEP');
                            var linhas = refer[1];
                            var rang = refer[0];                          

                            ws['!ref'] = rang;

                            var rowObj = XLSX.utils.sheet_to_csv(ws, { blankrows: false, RS: "\r\n" });

                            //console.log(rowObj);

                            var sText = rowObj;
                            sText = sText.replace(/\r?\n/g, ",").replace(/[^0-9,]/g, "");
                            PesquisaDBAgrup(sText, 39);
                           

                        };

                        reader.readAsBinaryString(file);


                    }

                    else {

                        var reader = new FileReader();
                        reader.onload = function (e) {
                            var sText = reader.result.replace(/\r?\n/g, ",").replace(/[^0-9,]/g, "");
                            var sText = sText.replace(",,",",")
                            if (sText.slice(-1) == ",") {
                                sText = sText.slice(0, -1);
                            }

                            // console.log(sText);
                            PesquisaDBAgrup(sText, 39);
                            

                        }
                        reader.readAsText(file);

                    }

                });

                $('#fluCNAE').on('change', function (e) {

                    var file = e.target.files[0];

                    var filename = document.getElementById('fluCNAE').value;
                    var ext = filename.split('.').pop();
                    

                    if ((ext == 'xls') || (ext == 'xlsx')) {

                        var reader = new FileReader();

                        reader.onload = function () {

                            var fileData = reader.result;
                            
                            const rABS = !!reader.readAsBinaryString;
                            const wb = XLSX.read(fileData, { type: rABS ? 'binary' : 'array' });

                            /* Get first worksheet */
                            const wsname = wb.SheetNames[0];
                            const ws = wb.Sheets[wsname];
                            var refer = extractHeader(ws,'CNAE');
                            var linhas = refer[1];
                            var rang = refer[0];
                            
                            ws['!ref'] = rang;

                            var rowObj = XLSX.utils.sheet_to_csv(ws, { blankrows: false, RS: "\r\n" });

                            //console.log(rowObj);

                            var sText = rowObj;
                            sText = sText.replace(/\r?\n/g, ",").replace(/[^0-9,]/g, "");

                            //console.log(sText);

                            $body = $("body");
                            $body.addClass("loadfile");
                            
                            var arrData = sText.split(",");
                            dtSelectArrayCNAE($('#tbRamoSource').dataTable(), $('#tbRamoTarget').dataTable(), 1, 'asc', arrData, "divCNAEErroImp", 0);
                            SetTargetIds('Ramo');

                            $body.removeClass("loadfile");
                            

                            // sText += sText + rowObj.item[i] + ",";


                        };

                        reader.readAsBinaryString(file);


                    }

                    else { 


                    var reader = new FileReader();
                    reader.onload = function (e) {

                        $body = $("body");
                        $body.addClass("loadfile");

                        var sText = reader.result.replace(/\r?\n/g, ",").replace(/[^0-9,]/g, "");
                        var arrData = sText.split(",");
                        dtSelectArrayCNAE($('#tbRamoSource').dataTable(), $('#tbRamoTarget').dataTable(), 1, 'asc', arrData, "divCNAEErroImp", 0);
                        SetTargetIds('Ramo');

                        $body.removeClass("loadfile");

                    }
                    reader.readAsText(file);

                    }

                });

                $('#fluMUN').on('change', function (e) {
                    var file = e.target.files[0];


                    var filename = document.getElementById('fluMUN').value;
                    var ext = filename.split('.').pop();


                    if ((ext == 'xls') || (ext == 'xlsx')) {

                        var reader = new FileReader();

                        reader.onload = function () {

                            var fileData = reader.result;

                            const rABS = !!reader.readAsBinaryString;
                            const wb = XLSX.read(fileData, { type: rABS ? 'binary' : 'array' });

                            /* Get first worksheet */
                            const wsname = wb.SheetNames[0];
                            const ws = wb.Sheets[wsname];
                            var refer = extractHeader(ws, 'CIDADE');
                            var linhas = refer[1];
                            var rang = refer[0];

                            ws['!ref'] = rang;

                            var rowObj = XLSX.utils.sheet_to_csv(ws, { blankrows: false, RS: "\r\n" });

                           
                            var sText = rowObj;         

                            sText = sText.replace(/\r?\n/g, ",").toUpperCase();

                            sText = removeAcento(sText);                            

                            var arrData = sText.split(",");
                            
                            dtSelectArrayMunicipio($('#tbMunicipioSource').dataTable(), $('#tbMunicipioTarget').dataTable(), 1, 'asc', arrData, "divMUNErroImp");
                            SetTargetIds('Municipio');
                                                       
                            PesquisaDBAgrup(sText, 12);

                        };

                        reader.readAsBinaryString(file);


                    }

                    else {
                        var reader = new FileReader();
                        reader.onload = function (e) {

                            $body = $("body");
                            $body.addClass("loadfile");

                            var sText = reader.result.replace(/\r?\n/g, ",").toUpperCase();

                            sText = sText.replace(/ ,/g, ",");
                            sText = sText.replace(/, /g, ",");

                            sText = removeAcento(sText);
                            
                            var arrData = sText.split(",");
                            
                            dtSelectArrayMunicipio($('#tbMunicipioSource').dataTable(), $('#tbMunicipioTarget').dataTable(), 1, 'asc', arrData, "divMUNErroImp");
                            SetTargetIds('Municipio');

                            $body.removeClass("loadfile");

                        }
                        reader.readAsText(file, "windows-1252");
                    }

                });


                function removeAcento(text) {
                    text = text.replace(new RegExp('[ÁÀÂÃáãâà]', 'gi'), 'A');
                    text = text.replace(new RegExp('[ÉÈÊéê]', 'gi'), 'E');
                    text = text.replace(new RegExp('[ÍÌÎí]', 'gi'), 'I');
                    text = text.replace(new RegExp('[ÓÒÔÕóôõ]', 'gi'), 'O');
                    text = text.replace(new RegExp('[ÚÙÛú]', 'gi'), 'U');
                    text = text.replace(new RegExp('[Çç]', 'gi'), 'C');
                    return text;
                }


            } else {
                console.log("no support");
            }
        });
    </script>

	<script type="text/javascript">

        $(function () {
            $("#txtLMI").maskMoney({
                symbol: 'R$ ',
                showSymbol: true, thousands: '.', decimal: ',', symbolStay: true
            });
            $("#txtLMF").maskMoney({
                symbol: 'R$ ',
                showSymbol: true, thousands: '.', decimal: ',', symbolStay: true
            });

        })

        $(function () {
            $("#txtCSI").maskMoney({
                symbol: 'R$ ',
                showSymbol: true, thousands: '.', decimal: ',', symbolStay: true
            });
            $("#txtCSF").maskMoney({
                symbol: 'R$ ',
                showSymbol: true, thousands: '.', decimal: ',', symbolStay: true
            });

        })

       
        $().ready(function () {

            InitTables();

            $('.switchery-dedup').each(function () {
                new Switchery(this, { color: '#1bb99a', size: 'small' })
            });

            $('#cboAgrupamentos').multiSelect();
        });

        function ConfigSaidaPagina() {


            // atualiza atributo na window

            $(window).attr('clickDentro', false);

            $(window).on('beforeunload', function (event) {

                // $("[id*=btnExcel]").parents().is('#PesquisaBase')

                var bValAttr = $(this).attr('clickDentro');

                


                if ($(this).attr('clickDentro') == true)

                    return "Deseja mesmo sair?";





                // reset

                $(this).attr('clickDentro', false);



            });



        

            $("div[id*=PesquisaBase]").on('click', function (event) {



                // atualiza atributo na window

                $(window).attr('clickDentro', true);

            });
        }

        function InitTables() {


            var oTables = $('.datatable').dataTable({
                "bDestroy": true
                , "bPaginate": false
                , "bFilter": false
                , "bInfo": false
                , "aoColumns": [
                    { "bVisible": false } // id

                    , null //nome
                    , { "bVisible": false } //Qtd.Registros

                ]
                , aaSorting: [[1, 'asc']]  // initial sort by Descrição.

                // Filipe 09/08/2014: datatables translation
                , "oLanguage": DataTablesPortugues()
                , "iDisplayLength": 25
            });


            var oTables = $('.datatablefaixa').dataTable({
                "bDestroy": true
                , "bPaginate": false
                , "bFilter": false
                , "bInfo": false
                , "aoColumns": [
                    { "bVisible": false } // id

                    , null //nome
                    , { "bVisible": false } //Qtd.Registros

                ]
                , aaSorting: [[2, 'desc']]  // Valor Mínimo Faixa
                , "oLanguage": DataTablesPortugues()
                , "iDisplayLength": 25
            });


            var oTables = $('.datatableuf').dataTable({
                "bDestroy": true
                , "bPaginate": false
                , "bFilter": false
                , "bInfo": false
                , "aoColumns": [
                    { "bVisible": false } // id

                    , null //nome
                    , { "bVisible": false } // Qtd Registros (String)
                    , { "bVisible": false } // Qtd Registros (Integer)

                ]
                , aaSorting: [[3, 'desc']]  // initial sort by Qtde. de Registros
                // Filipe 09/08/2014: datatables translation
                , "oLanguage": DataTablesPortugues()
                , "iDisplayLength": 50
            });

            var oTablesRamo = $('.datatableRamo').dataTable({


                "bDestroy": true


                , "aoColumns": [
                    null // id
                    , null // nome
                    , { "bVisible": false } // divisao
                    , null // grupo
                    //, { "bVisible": false } 
                    //, { "bVisible": false } 
                    , null // classe
                   
                    
                    //, { "bVisible": false }// classe
                    , { "bVisible": false } // setor

                    

                ]  //SetorID

                , aaSorting: [[0, 'asc']]  // initial sort by Código QtdRegistros
                , "bSort": false


                // Filipe 09/08/2014: datatables translation
                , "oLanguage": DataTablesPortugues()
                , "iDisplayLength": 10
                , "orderCellsTop": true
                , "fixedHeader": true
              

            }); //var otable Datatable

            /*  Regiao Configuração dos Cliques */
            /*  Regiao Configuração dos Cliques */

            arrTables = ['Regiao'];
            /*  Teste para Loop  */
            for (i = 0; i < arrTables.length; i++) {
               
            var tipo = arrTables[i];
            var source = "#tb" + tipo + "Source";
            var target = "#tb" + tipo + "Target";             
            var tbSource = $(source).dataTable();
            var tbTarget = $(target).dataTable();
            var idx = 2;
            var ord = 'desc';

            tbSource.on('click', 'tr', function () {
                
                if (tbSource.fnGetData().length == 0)
                    return;

                var $row = $(this);
                var addRow = tbSource.fnGetData(this);
                tbTarget.css("background-color", "#FFFF99");
                                
                if (addRow == null)
                    return;

                tbTarget.fnAddData(addRow);

                var index = tbSource.fnGetPosition(this); // get the table index
                tbSource.fnDeleteRow(index);
                               
                tbTarget.fnSort([[idx, ord]]); // sort call by Qtd Registros
                SetTargetIds(tipo);


            });


            tbTarget.on('click', 'tr', function () {
               
                if (tbTarget.fnGetData().length == 0)
                    return;

                var $row = $(this);
                var addRow = tbTarget.fnGetData(this);
               
                if (addRow == null)
                    return;

                tbSource.fnAddData(addRow);

                var index = tbTarget.fnGetPosition(this);
                tbTarget.fnDeleteRow(index);                
                tbSource.fnSort([[idx, ord]]); 


                // Store Regiao target Ids in hidden field
                // ---------------------------------------

                SetTargetIds(tipo);

            });

            }


            /* Ramo de Atividade: Configuração dos Cliques */
            /*
            Ramo selection config
 
            */

            var tbRamoSource = $('#tbRamoSource').dataTable();
            var tbRamoTarget = $('#tbRamoTarget').dataTable();


            tbRamoSource.on('click', 'tr', function () {

                // se não houver dados
                if (tbRamoSource.fnGetData().length == 0)
                    return;


                var $row = $(this);
                var addRow = tbRamoSource.fnGetData(this);
                tbRamoTarget.css("background-color", "#FFFF99");

                // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                if (addRow == null)
                    return;


                tbRamoTarget.fnAddData(addRow);

                var index = tbRamoSource.fnGetPosition(this); // get the table index
                tbRamoSource.fnDeleteRow(index);

                // reapply sort
                tbRamoTarget.fnSort([[2, 'desc']]); // sort call by Qtd Registros


                // Store Ramo target Ids in hidden field
                // ---------------------------------------

                SetTargetIds('Ramo');


            });


            tbRamoTarget.on('click', 'tr', function () {
                // se não houver dados
                if (tbRamoTarget.fnGetData().length == 0)
                    return;

                var $row = $(this);
                var addRow = tbRamoTarget.fnGetData(this);
                // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                if (addRow == null)
                    return;


                tbRamoSource.fnAddData(addRow);

                var index = tbRamoTarget.fnGetPosition(this); // get the table index
                tbRamoTarget.fnDeleteRow(index);

                // reapply sort
                tbRamoSource.fnSort([[2, 'desc']]); // sort call by QtdRegistros


                // Store Ramo target Ids in hidden field
                // ---------------------------------------

                SetTargetIds('Ramo');

            });
            /* Ramo de Atividade - Fim */


        }; // InitTables function end

        function BlockPortes(tipo) {

            // Store Porte target Ids in hidden field
            // ---------------------------------------

            if (tipo == "Porte") {

                var sIdPorteList = '';
                sIdPorteList = $("[id*=hddPorteTargetList]").val();
                $("[id*=hddQFF]").val(''); $("[id*=hddQFI]").val('');
                $("[id*=hddFXETargetList]").val('');

                if (sIdPorteList == '') {

                    $('#acbtnPorte').css("background-color", "rgb(102,102,104)");
                    document.getElementById("acbtnFUNC").style.visibility = "visible";
                    document.getElementById("acbtnFXE").style.visibility = "visible";

                }
                else {

                    $('#acbtnPorte').css("background-color", "rgb(21, 212, 240)");
                    document.getElementById("acbtnFUNC").style.visibility = "hidden";
                    document.getElementById("acbtnFXE").style.visibility = "hidden";
                    $('#collapseFUNC').removeClass("show");
                    $('#collapseFXE').removeClass("show");
                }
            }
            else if (tipo == "FXE") {



                var sIdPorteList = '';
                sIdPorteList = $("[id*=hddFXETargetList]").val();
                $("[id*=hddQFF]").val(''); $("[id*=hddQFI]").val('');
                $("[id*=hddPorteTargetList]").val('');

                if (sIdPorteList == '') {
                    $('#txtqtdfunini').prop("disabled", false);
                    $('#txtqtdfunfim').prop("disabled", false);
                    $('#acbtnPorte').css("background-color", "rgb(102,102,104)");
                    document.getElementById("acbtnFUNC").style.visibility = "visible";
                    document.getElementById("acbtnPorte").style.visibility = "visible";

                }
                else {
                    $('#txtqtdfunini').prop("disabled", true);
                    $('#txtqtdfunfim').prop("disabled", true);
                    $('#acbtnPorte').css("background-color", "rgb(21, 212, 240)");
                    document.getElementById("acbtnFUNC").style.visibility = "hidden";
                    document.getElementById("acbtnPorte").style.visibility = "hidden";
                    $('#collapseFUNC').removeClass("show");
                    $('#collapsePorte').removeClass("show");
                }

            }
            else if (tipo == "Func") {

                $("[id*=hddFXETargetList]").val('');
                $("[id*=hddPorteTargetList]").val('');

                if ($("[id*=hddQFI]").val() == '' && $("[id*=hddQFF]").val() == '') {

                    document.getElementById("acbtnFUNC").style.visibility = "visible";
                    document.getElementById("acbtnPorte").style.visibility = "visible";
                    document.getElementById("acbtnFXE").style.visibility = "visible";
                }

                    else {
                document.getElementById("acbtnFUNC").style.visibility = "visible";
                document.getElementById("acbtnPorte").style.visibility = "hidden";
                document.getElementById("acbtnFXE").style.visibility = "hidden";
                $('#collapseFXE').removeClass("show");
                $('#collapsePorte').removeClass("show");
                }

            }


            if (tipo == "Ramo") {

                var sIdPorteList = '';
                sIdPorteList = $("[id*=hddRamoTargetList]").val();
                $("[id*=hddEspecialidadeTargetList]").val('');
                $("[id*=hddINDTargetList]").val('');

                if (sIdPorteList == '') {

                    
                    document.getElementById("acbtnIND").style.visibility = "visible";
                    document.getElementById("acbtnEspecialidade").style.visibility = "visible";

                }
                else {

                    
                    document.getElementById("acbtnIND").style.visibility = "hidden";
                    document.getElementById("acbtnEspecialidade").style.visibility = "hidden";
                    $('#collapseIND').removeClass("show");
                    $('#collapseEspecialidade').removeClass("show");
                }

            } else if (tipo == "IND")

            {

                var sIdPorteList = '';
                sIdPorteList = $("[id*=hddINDTargetList]").val();
                $("[id*=hddEspecialidadeTargetList]").val('');
                $("[id*=hddRamoTargetList]").val('');

                if (sIdPorteList == '') {


                    document.getElementById("acbtnRamo").style.visibility = "visible";
                    document.getElementById("acbtnEspecialidade").style.visibility = "visible";

                }
                else {


                    document.getElementById("acbtnRamo").style.visibility = "hidden";
                    document.getElementById("acbtnEspecialidade").style.visibility = "hidden";
                    $('#collapseAtividade').removeClass("show");
                    $('#collapseEspecialidade').removeClass("show");
                }

            }

            else if (tipo == "Especialidade") {

                var sIdPorteList = '';
                sIdPorteList = $("[id*=hddEspecialidadeTargetList]").val();
                $("[id*=hddINDTargetList]").val('');
                $("[id*=hddRamoTargetList]").val('');

                if (sIdPorteList == '') {


                    document.getElementById("acbtnRamo").style.visibility = "visible";
                    document.getElementById("acbtnIND").style.visibility = "visible";

                }
                else {


                    document.getElementById("acbtnRamo").style.visibility = "hidden";
                    document.getElementById("acbtnIND").style.visibility = "hidden";
                    $('#collapseAtividade').removeClass("show");
                    $('#collapseIND').removeClass("show");
                }

            }


                
        };

        function SetTargetIds(tipo) {

            // Store Target Ids in hidden field
            // ---------------------------------------


            var target = "#tb" + tipo + "Target";
            var lista = "[id*=hddLista" + tipo;
            var tag_lista = "[id*=hdd" + tipo + "TargetList]";
            var acbtn = "#acbtn" + tipo;
            var tbTarget = $(target).dataTable();



            var sIdList = '';
            var sNmList = '';            
            var sToastList = "<span class='badge badge-info'>" + tipo + '</span>';
            var valor = '';
            var botao = '';

            var ini = "<button type='button' class='btn btn-xs btn-blue rounded-pill waves-effect waves-light' onclick='Excluir(";
            var end = "<span class='btn-label-right'> <i class='mdi mdi-close-circle-outline'></i></span></button>";
            for (var i = 0; i < tbTarget.fnGetData().length; i++) {


                var Nome = tbTarget.fnGetData(i, 1);
                var ID = tbTarget.fnGetData(i, 0);
               
               
                if (tipo == "Regiao" || tipo == "Ramo")  // Campos String com Aspas
                    valor = "\"" + ID + "\"" + ",\"" + target + "\")'>";              
                else
                    valor = ID + ",\"" + target + "\")'>";

                if (tipo == "DDD") {
                    botao = ini + valor + ID + end;
                    sToastList = sToastList + ";" + ID;
                }
                else if (tipo == "NJ") {
                    var Desc = tbTarget.fnGetData(i, 2);
                    botao = ini + valor + Nome + " - " + Desc + end;
                    sToastList = sToastList + ";" + Desc;
                    ID = tbTarget.fnGetData(i, 1);
                }
                else if (tipo == "Ramo") {
                botao = ini + valor + ID + "-" + Nome + end;
                sToastList = sToastList + ";" + Nome;
                }
                else
                {
                    botao = ini + valor + Nome + end;
                    sToastList = sToastList + ";" + Nome;
                }


                sIdList = sIdList + ';' + ID;
                sNmList = sNmList + " " + botao;


            };

            // without first semicolon
            sIdList = sIdList.substring(1); // zero-based           
            sToastList = sToastList.replace(";", "");

            // set the hidden field value
            var filtrosPesquisa = $("[id*=hddFiltrosPesquisa]").val();
            
            $(tag_lista).val(sIdList);
            $(lista).val(sNmList);

            

            ResetFiltros(tipo, filtrosPesquisa);
           

            if (tipo == "Porte" || tipo == "FXE" ||  tipo == "Ramo" || tipo == "IND" || tipo == "Especialidade")
                BlockPortes(tipo);
           

            if (filtrosPesquisa.length > 0 && !(filtrosPesquisa .includes(tipo)) )
                $("[id*=hddFiltrosPesquisa]").val(filtrosPesquisa  + ";" + tipo);

            if (filtrosPesquisa.length == 0)
                $("[id*=hddFiltrosPesquisa]").val(tipo);

            filtrosPesquisa  = $("[id*=hddFiltrosPesquisa]").val();
            

         

            
            textoFiltrosNovo(filtrosPesquisa , sToastList);
            

        };

        function SetTargetIdsRegiao(tipo) {

            // Store Target Ids in hidden field
            // ---------------------------------------


            var target = "#tb" + tipo + "Target";
            var lista = "[id*=hddLista" + tipo;
            var tag_lista = "[id*=hdd" + tipo + "TargetList]";
            var acbtn = "#acbtn" + tipo;
            var tbTarget = $(target).dataTable();



            var sIdList = '';
            var sNmList = '';
            var sToastList = "<span class='badge badge-info'>" + tipo + '</span>';
            var valor = '';
            var botao = '';

            var ini = "<button type='button' class='btn btn-xs btn-blue rounded-pill waves-effect waves-light' onclick='Excluir(";
            var end = "<span class='btn-label-right'> <i class='mdi mdi-close-circle-outline'></i></span></button>";
            for (var i = 0; i < tbTarget.fnGetData().length; i++) {


                var Nome = tbTarget.fnGetData(i, 1);
                var ID = tbTarget.fnGetData(i, 0);


                if (tipo == "Regiao" || tipo == "Ramo")  // Campos String com Aspas
                    valor = "\"" + ID + "\"" + ",\"" + target + "\")'>";
                else
                    valor = ID + ",\"" + target + "\")'>";

                if (tipo == "DDD") {
                    botao = ini + valor + ID + end;
                    sToastList = sToastList + ";" + ID;
                }
                else if (tipo == "NJ") {
                    var Desc = tbTarget.fnGetData(i, 2);
                    botao = ini + valor + Nome + " - " + Desc + end;
                    sToastList = sToastList + ";" + Desc;
                }
                else {
                    botao = ini + valor + Nome + end;
                    sToastList = sToastList + ";" + Nome;
                }


                sIdList = sIdList + ';' + ID;
                sNmList = sNmList + " " + botao;


            };

            // without first semicolon
            sIdList = sIdList.substring(1); // zero-based           
            sToastList = sToastList.replace(";", "");

            // set the hidden field value
            var filtrosPesquisa = $("[id*=hddFiltrosPesquisa]").val();

            $(tag_lista).val(sIdList);
            $(lista).val(sNmList);

                                  

            if (tipo == "Porte" || tipo == "FXE" || tipo == "Ramo" || tipo == "IND" || tipo == "Especialidade")
                BlockPortes(tipo);


            if (filtrosPesquisa.length > 0 && !(filtrosPesquisa.includes(tipo)))
                $("[id*=hddFiltrosPesquisa]").val(filtrosPesquisa + ";" + tipo);

            if (filtrosPesquisa.length == 0)
                $("[id*=hddFiltrosPesquisa]").val(tipo);

            filtrosPesquisa = $("[id*=hddFiltrosPesquisa]").val();


            if (sIdList == '') {
                // nada selecionado: cor cinza
                $(acbtn).css("background-color", "rgb(102,102,104)");
            }
            else {
                // algo selecionado: cor laranja
                $(acbtn).css("background-color", "rgb(21, 212, 240)");
            };


            textoFiltrosNovo(filtrosPesquisa, sToastList);


        };

        function ResetFiltros(tipo,filtros) {
            
            if (tipo == "Regiao") {
                             
                filtros = ExcluirDDD(filtros);
                filtros = ExcluirMSR(filtros);
                filtros = ExcluirMCR(filtros);
                filtros = ExcluirMUN(filtros);
                                          
                document.getElementById("idCepIni").value = "";
                document.getElementById("idCepFim").value = "";
                

            }

            else if (tipo == "DDD") {

               
                filtros = ExcluirMSR(filtros);
                filtros = ExcluirMCR(filtros);
                filtros = ExcluirMUNDDD(filtros)
                document.getElementById("idCepIni").value = "";
                document.getElementById("idCepFim").value = "";


            } 

            else if (tipo == "MSR") {

                filtros = ExcluirMCR(filtros);
                filtros = ExcluirMUN(filtros);
                document.getElementById("idCepIni").value = "";
                document.getElementById("idCepFim").value = "";

            }

            else if (tipo == "MCR") {

                filtros = ExcluirMUN(filtros);              
                document.getElementById("idCepIni").value = "";
                document.getElementById("idCepFim").value = "";


            }

            else if (tipo == "Municipio") {
         
                document.getElementById("idCepIni").value = "";
                document.getElementById("idCepFim").value = "";

            }

           

           
           return filtros;
        }

        function ExcluirDDD(filtros){
            // Excluir DDD fora da Regiao
            var uf = $("[id*=hddRegiaoTargetList").val().split(";");
            var tableDDD = $("#tbDDDTarget").dataTable();
            var arrDDD = [];
            for (var d = 0; d < tableDDD.fnGetData().length; d++) {
                if (!uf.includes(tableDDD.fnGetData(d, 1)))
                    arrDDD.push(tableDDD.fnGetData(d, 0));
            }
            for (var x = 0; x < arrDDD.length; x++)
                ExcluirRegiao(arrDDD[x], "#tbDDDTarget");

            if (tableDDD.fnGetData().length == 0) {
                filtros.replace("DDD", "");
                filtros.replace(";;", ";");
            }

            return filtros;
        }

        function ExcluirMSR(filtros) {
            
            // Excluir MSR fora da Regiao
            var ddd = $("[id*=hddDDDTargetList").val().split(";");
            var tableMSR = $("#tbMSRTarget").dataTable();
            var arrMSR = [];
                    
            for (var msr = 0; msr < tableMSR.fnGetData().length; msr++) {
                var found = 0;
                for (var j = 0; j < ddd.length; j++) {

                    var item = tableMSR.fnGetData(msr, 2);                    
                    if (ddd[j] == item) {
                        found = 1;
                        break;
                    }
                }
               
                if (found == 0) {
                                     
                    arrMSR.push(tableMSR.fnGetData(msr, 0));
                }
                    
            }

            for (var msr = 0; msr < arrMSR.length; msr++)
                ExcluirRegiao(arrMSR[msr], "#tbMSRTarget");

            if (tableMSR.fnGetData().length == 0) {
                filtros.replace("MSR", "");
                filtros.replace(";;", ";");
            }

            return filtros;
        }

        function ExcluirMCR(filtros) {
            // Excluir DDD fora da Regiao
            var msr = $("[id*=hddMSRTargetList").val().split(";");
            var tableMCR = $("#tbMCRTarget").dataTable();
            var arrMCR = [];

          

            for (var mcr = 0; mcr  < tableMCR.fnGetData().length; mcr++) {

                var found = 0;
                for (var j = 0; j < msr.length; j++) {

                    var item = tableMCR.fnGetData(mcr, 2);
                    if (msr[j] == item) {
                        found = 1;
                        break;
                    }
                }

                if (found == 0) {                    
                    arrMCR.push(tableMCR.fnGetData(mcr, 0));
                }

            }
           
            for (var d = 0; d < arrMCR.length; d++)
                ExcluirRegiao(arrMCR[d], "#tbMCRTarget");

            if (tableMCR.fnGetData().length == 0) {
                filtros.replace("MCR", "");
                filtros.replace(";;", ";");
            }


            return filtros;
        }

        function ExcluirMUN(filtros) {
            // Excluir MUNICIPIO fora da Regiao
            var uf = $("[id*=hddRegiaoTargetList").val().split(";");
            var tableMUN = $("#tbMunicipioTarget").dataTable();
            var arrMUN = [];

            for (var d = 0; d < tableMUN.fnGetData().length; d++) {
                
                if (!uf.includes(tableMUN.fnGetData(d, 2)))
                    //alert(tableMUN.fnGetData(d, 2));
                    arrMUN.push(tableMUN.fnGetData(d, 0));
            }
            for (var x = 0; x < arrMUN.length; x++)
                ExcluirRegiao(arrMUN[x], "#tbMunicipioTarget");

            if (tableMUN.fnGetData().length == 0) {
                filtros.replace("MUN", "");
                filtros.replace(";;", ";");
            }

            return filtros;
        }

        function ExcluirMUNDDD(filtros) {
            // Excluir MUNICIPIO fora da Regiao
            var ddd = $("[id*=hddDDDTargetList").val().split(";");
            var tableMUN = $("#tbMunicipioTarget").dataTable();
            var arrMUN = [];

            for (var d = 0; d < tableMUN.fnGetData().length; d++) {

                if (!ddd.includes(tableMUN.fnGetData(d, 3)))
                    //alert(tableMUN.fnGetData(d, 2));
                    arrMUN.push(tableMUN.fnGetData(d, 0));
            }
            for (var x = 0; x < arrMUN.length; x++)
                ExcluirRegiao(arrMUN[x], "#tbMunicipioTarget");

            if (tableMUN.fnGetData().length == 0) {
                filtros.replace("MUN", "");
                filtros.replace(";;", ";");
            }

            return filtros;
        }

        function Excluir(idvalor, list) {

            
            var source = list.replace('Target', 'Source');           
            var table = $(list).dataTable();           
            var table2 = $(source).dataTable();
           
            for (var i = 0; i < table.fnGetData().length; i++) {
                
                if (table.fnGetData(i, 0) == idvalor) {
                    var addRow = table.fnGetData(i);
                    table.fnDeleteRow(i);
                    table2.fnAddData(addRow);
                }
                
            }
                                
            tipo = list.substring(3, 30);
            tipo = tipo.replace("Target", "");
            
            SetTargetIds(tipo);
          
            
           
        }

        function ExcluirRegiao(idvalor, list) {


            var source = list.replace('Target', 'Source');
            var table = $(list).dataTable();
            var table2 = $(source).dataTable();

            for (var i = 0; i < table.fnGetData().length; i++) {

                if (table.fnGetData(i, 0) == idvalor) {
                    var addRow = table.fnGetData(i);
                    table.fnDeleteRow(i);
                    table2.fnAddData(addRow);
                }

            }

            tipo = list.substring(3, 30);
            tipo = tipo.replace("Target", "");

            SetTargetIdsRegiao(tipo);

         }

        function filtraRamoBySetor() {
            var oTable = $('#tbRamoSource').dataTable();
            var filtros = $("[id*=hddSetorTargetList]").val();

            
            if (filtros == '') {
                oTable.fnFilter('', 5, true);
                document.getElementById("selClasse").disabled = false;
                document.getElementById("selGrupo").disabled = false;
                document.getElementById("selDivisao").disabled = false;
            }
            else {
                oTable.fnFilter(filtros.replace(/;/g, "|"), 5, true);
                document.getElementById("selClasse").disabled = true;
                document.getElementById("selGrupo").disabled = true;
                document.getElementById("selDivisao").disabled = true;
            }
            
        }
        
        function LimpaFiltros() {

            var oTable = $('#tbRamoSource').dataTable();
            document.getElementById("btnAplicar").disabled = true;

            oTable.fnFilter('', 3, true);
            oTable.fnFilter('', 4, true);
            oTable.fnFilter('', 2, true);

            var options1 = $("#selGrupo option");
            var options2 = $("#selClasse option");
            var options3 = $("#selDvisao option");


            for (var i = 1; i < options1.length; i++) { $(options1[i]).css("display", "block"); }
            for (var i = 1; i < options2.length; i++) { $(options2[i]).css("display", "block"); }
            for (var i = 1; i < options3.length; i++) { $(options3[i]).css("display", "block"); }

            $("#selClasse").prop('selectedIndex', 0);
            $("#selGrupo").prop('selectedIndex', 0);
            $("#selDivisao").prop('selectedIndex', 0);

        } // Limpa Pre-Filtros 

        function aplicarFiltroCnae() {
            if (confirm("Deseja Aplicar o Filtro?")) {
                selectAll('RAT', 1);
            }
        }

        function filtraDivisao() {

            var oTable = $('#tbRamoSource').dataTable();
            document.getElementById("btnAplicar").disabled = false;
            var filtros = document.getElementById('selDivisao').value;
            var options1 = $("#selGrupo option");
            var options2 = $("#selClasse option");


            for (var i = 1; i < options1.length; i++) { $(options1[i]).css("display", "block"); }
            for (var i = 1; i < options2.length; i++) { $(options2[i]).css("display", "block"); }

            if (filtros == '') {

                oTable.fnFilter('', 2, true);  // 2 divisao, 3 Grupo, 4 Classe


            }



            else {

                oTable.fnFilter(filtros.replace(/;/g, "|"), 2, true);

                for (var i = 1; i < options1.length; i++) {
                    if (options1[i].value.substring(0, 2) !== filtros)
                        $(options1[i]).css("display", "none");
                    else
                        $(options1[i]).css("display", "block");

                } //for

                for (var i = 1; i < options2.length; i++) {
                    if (options2[i].value.substring(0, 3) !== filtros)
                        $(options2[i]).css("display", "none");
                    else
                        $(options2[i]).css("display", "block");
                } //for

                $("#selClasse").prop('selectedIndex', 0);
                $("#selGrupo").prop('selectedIndex', 0);
                oTable.fnFilter('', 3, true);
                oTable.fnFilter('', 4, true);

                aplicarFiltroCnae();

            } // else

        } // function

        function filtraGrupo() {
            var oTable = $('#tbRamoSource').dataTable();
            document.getElementById("btnAplicar").disabled = false;
            var filtros = document.getElementById('selGrupo').value;
            var options1 = $("#selClasse option");
               for (var i = 1; i < options1.length; i++) { $(options1[i]).css("display", "block"); }



            if (filtros == '') {

                oTable.fnFilter('', 3, true);


            }
            // 2 divisao, 3 Grupo, 4 Classe


            else {
                

                oTable.fnFilter(filtros.replace(/;/g, "|"), 3, true);


                for (var i = 1; i < options1.length; i++) {
                    if (options1[i].value.substring(0, 3) !== filtros)
                        $(options1[i]).css("display", "none");
                    else
                        $(options1[i]).css("display", "block");
                } //for
                $("#selClasse").prop('selectedIndex', 0);
                oTable.fnFilter('', 4, true);

                aplicarFiltroCnae();
            } //else
        }

        function filtraClasse() {
            var oTable = $('#tbRamoSource').dataTable();
            document.getElementById("btnAplicar").disabled = false;
            var filtros = document.getElementById('selClasse').value;
            if (filtros == '')
                oTable.fnFilter('', 4, true);

            // 2 divisao, 3 Grupo, 4 Classe


            else {

                oTable.fnFilter(filtros.replace(/;/g, "|"), 4, true);
                aplicarFiltroCnae();
            }


        }

        function PesquisaDBAgrup(data, idAgrup) {
            switch (idAgrup) {
                case 1:
                    $("[id*=hddVeiAnoIni]").val(data); break;
                case 2:
                    $("[id*=hddVeiAnoFim]").val(data); break;
                case 3:
                    if (data)
                        $("[id*=hddWVE]").val("<>");
                    else
                        $("[id*=hddWVE]").val("");
                    
                    $('#chkeWVE').prop("checked", data);
                    break;
                case 4:
                    $("[id*=hddQFI]").val(data);
                    BlockPortes("Func");
                    break;                    
                case 5:
                    $("[id*=hddQFF]").val(data);
                    BlockPortes("Func");
                    break;
                case 6:
                    if (data)
                        $("[id*=hddEME]").val("<>");
                    else
                        $("[id*=hddEME]").val("");
                    break;
                case 7:
                    if (data)
                        $("[id*=hddSTE]").val("<>");
                    else
                        $("[id*=hddSTE]").val("");
                    
                    $('#chkeSTE').prop("checked", data);
                    break;
                case 8:
                    if (data)
                        $("[id*=hddCTN]").val("<>");
                    else
                        $("[id*=hddCTN]").val("");
                   
                    $('#chkeCTN').prop("checked", data);
                    break;
                case 9:
                    if (data)
                        $("[id*=hddCTE]").val("<>");
                    else
                        $("[id*=hddCTE]").val("");
                  
                    $('#chkeCTE').prop("checked", data);
                    break;
                case 99:
                    if (data)
                        $("[id*=hddCTC]").val("<>");
                    else
                        $("[id*=hddCTC]").val("");
                   
                    $('#chkeCTC').prop("checked", data);
                    break;
                case 98:
                   
                    if (data)
                        $("[id*=hddECC]").val("<>");
                    else
                        $("[id*=hddECC]").val("");
                  
                    $('#chkcECC').prop("false", data);
                    break;
                case 10:
                    $("[id*=hddFIC]").val(data.replace(/\D/g, "")); break;
                case 11:
                    $("[id*=hddFFC]").val(data.replace(/\D/g, "")); break;
                case 12:
                    $("[id*=hddListaEmail]").val('');
                    $("[id*=hddListaDominio]").val('');
                    $("[id*=hddListaCPFCNPJ]").val('');
                    if ($("[id*=hddEnriquecimentoEmail]").val() == "true" || $("[id*=hddExcluiEmail]").val() == "true") {
                        $("[id*=hddListaEmail]").val(data);
                    }
                    else if ($("[id*=hddEnriquecimentoDominio]").val() == "true" || $("[id*=hddExcluiDominio]").val() == "true") {
                        $("[id*=hddListaDominio]").val(data);
                    }
                    else if ($("[id*=hddEnriquecimentoCPFCNPJ]").val() == "true" || $("[id*=hddExcluiCPFCNPJ]").val() == "true") {
                        $("[id*=hddListaCPFCNPJ]").val(data);
                    }
                    

                    break;
                case 13:
                    
                    if (data > 0 && data < 7) {
                        document.getElementById("divFluCNPJ").style.visibility = "visible";
                        document.getElementById("divFluCNPJ").classList.remove("hidden-div-enriquecimento");
                    }
                    else {
                        document.getElementById("divFluCNPJ").style.visibility = "hidden";
                        document.getElementById("divFluCNPJ").classList.add("hidden-div-enriquecimento");
                    }
                    if (data == 1)
                        $("[id*=hddEnriquecimentoCPFCNPJ]").val("true");                    
                    else
                        $("[id*=hddEnriquecimentoCPFCNPJ]").val("false");

                    if (data == 2)
                        $("[id*=hddExcluiCPFCNPJ]").val("true");
                    else
                        $("[id*=hddExcluiCPFCNPJ]").val("false");

                    if (data == 3)
                        $("[id*=hddEnriquecimentoEmail]").val("true");
                    else
                        $("[id*=hddEnriquecimentoEmail]").val("false");

                    if (data == 4)
                        $("[id*=hddExcluiEmail]").val("true");
                    else
                        $("[id*=hddExcluiEmail]").val("false");

                    if (data == 5)
                        $("[id*=hddEnriquecimentoDominio]").val("true");
                    else
                        $("[id*=hddEnriquecimentoDominio]").val("false");

                    if (data == 6)
                        $("[id*=hddExcluiDominio]").val("true");
                    else
                        $("[id*=hddExcluiDominio]").val("false");                    
                    break;

                case 14:
                    $("[id*=hddPalavraChave]").val(data); break;
                case 97:
                    $("[id*=hddOrdemPalavraChave]").val(data); break;

                case 15:
                    if (data == "NAO") {
                        $("[id*=hddProtestos]").val("");
                        $('#tipoProtesto_chosen').prop("disabled", true);
                    }
                    else {
                        $("[id*=hddProtestos]").val("NAO");
                        $('#tipoProtesto').prop("disabled", false);
                        $('#tipoProtesto').val("NAO");
                        $('#tipoProtesto').focus();
                    }
                    break;
                case 16:
                    $("[id*=hddProtestos]").val(data); break;
                case 17:
                    if (data == "NAO") {
                        $("[id*=hddDividas]").val("");
                        $('#tipoDividas').prop("disabled", true);
                    }
                    else {
                        $("[id*=hddDividas]").val("NAO");
                        $('#tipoDividas').prop("disabled", false);
                        $('#tipoDividas').val("NAO");
                        $('#tipoDividas').focus();
                    }
                    break;
                case 18:
                    $("[id*=hddDividas]").val(data); break;
                case 19:
                    $("[id*=hddQtdRegExp]").val(data); break;
                case 20:
                    if (data)
                        $("[id*=hddWCL]").val("<>");
                    else
                        $("[id*=hddWCL]").val("");
                    $('#chkeWCL').prop("checked", data);
                 
                    break;
                case 21:
                    if (data)
                        $("[id*=hddWFU]").val("<>");
                    else
                        $("[id*=hddWFU]").val("");
                    $('#chkeWFU').prop("checked", data);
                    
                    break;
                case 22:
                    if (data)
                        $("[id*=hddWIE]").val("<>");
                    else
                        $("[id*=hddWIE]").val("");
                    $('#chkeWIE').prop("checked", data);
                
                    break;
                case 23:
                    if (data)
                        $("[id*=hddWSD]").val("<>");
                    else
                        $("[id*=hddWSD]").val("");
                    $('#chkeWSD').prop("checked", data);
                    break;
                case 24:
                    if (data)
                        $("[id*=hddWEC]").val("<>");
                    else
                        $("[id*=hddWEC]").val("");
                    break;

                case 25:
                    $("[id*=hddAllRegExp]").val(data); break;
                case 26:
                    $("[id*=hddSolic]").val(data); break;
                case 27:
                    $("[id*=hddProjeto]").val(data); break;
                case 28:
                    $("[id*=hddObs]").val(data); break;
                case 29:
                    $("[id*=hddPrazo]").val(data); break;
                case 30:
                    if (data)
                        $("[id*=hddMatrizFilial]").val("MATRIZ");
                    else
                        $("[id*=hddMatrizFilial]").val("");
                    $('#chkeMatrizFilial').prop("checked", data);
                    break;
                case 31:
                    var divPreco = $("#divPrecos");
                    divPreco.empty();
                    var xhtml = htmlLstPrcRegistro($("[id*=hddListaPrecos]").val(), String($("#cboCampos").val()));
                    divPreco.append(xhtml);


                    break;
                case 32:
                    if (data.length >= 8 && data.length <= 10)
                        $("[id*=hddABI]").val(data);
                    else
                        $("[id*=hddABI]").val("");
                    break;
                case 33:
                    if (data.length >= 8 && data.length <= 10)
                        $("[id*=hddABF]").val(data);
                    else
                        $("[id*=hddABF]").val("");
                    break;
                case 34:
                    if (parseInt(data.replace(/\D/g, "")) > 0)
                        $("[id*=hddIVI]").val(data);
                    else
                        $("[id*=hddIVI]").val("");

                    break;
                case 35:
                    if (parseInt(data.replace(/\D/g, "")) > 0)
                        $("[id*=hddIVF]").val(data);
                    else
                        $("[id*=hddIVF]").val("");
                    break;

                case 36:

                    $("[id*=hddTOP1000]").val(data); break;

                case 37:

                   

                    for (index = 0; index < $("#cboCampos option").length; index++) {
                        
                        $('#cboCampos option').eq(index).attr('selected', 'selected');
                        
                         
                        $('#cboCampos').chosen().change();
                        $("#cboCampos").trigger("chosen:updated");

                    };
                    break;
                case 38:
                    if (data)
                        $("[id*=hddWTL]").val("<>");
                    else
                        $("[id*=hddWTL]").val("");
                
                    $('#chkeWTL').prop("checked", data);
                    break;
                case 39:
                    $("[id*=hddListaCEP]").val(data); break;                
                   

                case 50:

                    cbos = $('#selCbo').val().toString();
                    
                    $("[id*=hddCboCNPJ]").val(cbos); break;
                case 41:
                    $("[id*=hddObrigContato]").val(data);

                    if (data == "2") {
                        // document.getElementById('selCbo').disabled = true;
                        HabOptionContatos(false);
                    }
                    else {
                        // document.getElementById('selCbo').disabled = false;
                        HabOptionContatos(true);
                    }

                    break;

                case 42:
                    if (parseInt(data.replace(/\D/g, "")) > 0)
                        $("[id*=hddLAI]").val(data);
                    else
                        $("[id*=hddLAI]").val("");

                    break;
                case 43:
                    if (parseInt(data.replace(/\D/g, "")) > 0)
                        $("[id*=hddLAF]").val(data);
                    else
                        $("[id*=hddLAF]").val("");
                    break;
                case 51:
                    $("[id*=hddQLI]").val(data); break;
                case 52:
                    $("[id*=hddQLF]").val(data); break;
                case 53:
                    $("[id*=hddCSI]").val(data); break;
                case 54:
                    $("[id*=hddCSF]").val(data); break;
                case 55:
                    if (data)
                        $("[id*=hddWLE]").val("<>");
                    else
                        $("[id*=hddWLE]").val("");
                    break;
                case 56:
                    
                    $("[id*=hddMEI]").val(data); break;

                case 57:
                    $("[id*=hddRCJ]").val(data); break;
                case 58:
                    if (data) {
                        $("[id*=hddWDeduplic]").val("1");
                        Contagem();
                    }                    else {
                    $("[id*=hddWDeduplic]").val("0");                    
                    }
                    $('#chkDeduplic').prop("checked", data);
                    $('#chkDeduplic2').prop("checked", data);
                    break;

            }

            if (idAgrup != 31) {

                var filtros = $("[id*=hddFiltrosPesquisa]").val();          
                textoFiltrosNovo(filtros);
            }

            
        };

        function HabOptionContatos(pHab) {

           

            if (pHab) {

                $('#chkcCTE').prop('checked', false);
               

                document.getElementById("chkcCTE").disabled = true;              

                PesquisaDBAgrup(false, 9);
                PesquisaDBAgrup(false, 99);
            } else {

                document.getElementById("chkcCTE").disabled = false;
                

            }
            
                     


        }

        function textoFiltrosNovo(filtros, toast_lista) {

           

            var txtFiltros = '';
            var txtFiltrosAdd = '';
            var txtFiltrosToast = '';

            if (filtros) {
            var arrFiltros = filtros.split(";");

           
            var len = arrFiltros.length;
            

            var tag_lista = '';

            for (var i = 0; i < len; i++)

            {              
                // alert(arrFiltros[i]);
                tag_lista = "[id*=hdd" + arrFiltros[i] + "TargetList]";
                lista = "[id*=hddLista" + arrFiltros[i] + "]";
               
               
                
            if ($(tag_lista).val().length > 0) {
                txtFiltros = txtFiltros + '| <span class="badge badge-success">' + arrFiltros[i] + '</span>' + $(lista).val();
                

                }

                }

            }

            txtFiltrosAdd = SelectItens();

            txtFiltros = txtFiltros + " <br />" + txtFiltrosAdd;

            if (toast_lista === undefined)
                txtFiltrosToast = '<span class="badge badge-success"> UPDATE </span><br /> ' + txtFiltrosAdd;
            else
                txtFiltrosToast = '<span class="badge badge-success"> UPDATE </span><br /> ' + toast_lista;

            txtFiltros = txtFiltros.substring(1);
            
            $("[id*=hddFiltrosX]").val(txtFiltros);
          

            $.toast().reset('all');

            var divtxtFiltros = $("#divTextoFiltros");
            var divAtual = document.getElementById('divTextoFiltros').innerHTML;            

            divtxtFiltros.empty();
            var divNova = HtmlTextoFiltros(txtFiltros);
            var divToast = HtmlTextoFiltros(txtFiltrosToast);

            divtxtFiltros.append('<p style="font-size:22px">' + divNova + '</p>');

            if (divNova !== divAtual) {

                $.toast({
                    text: "<span class='badge badge-white'>Filtros</span> " + divToast,
                    maxOpened: 2,
                    autoDismiss: true,
                    timeout: 7000,


                });
            }

            
            return txtFiltros;

            }

        function SelectItens() {


            var txtFiltros = '';

            var ini = "<button type='button' class='btn btn-xs btn-success rounded-pill waves-effect waves-light'onclick=document.getElementById('";
            var mid = "').click();>";
            var end = "<span class='btn-label-right'> <i class='mdi mdi-close-circle-outline'></i></span></button>";

            if ($("[id*=hddFIC]").val().length > 0 || $("[id*=hddFFC]").val().length > 0) {

                txtFiltros = txtFiltros + "| " + ini + "btnLimpaCEP" + mid + "CEP " + $("[id*=hddFIC]").val() + " A " + $("[id*=hddFFC]").val() + end + "</span> ";
            }


            if ($("[id*=hddQFI]").val().length > 0 || $("[id*=hddQFF]").val().length > 0) {

                txtFiltros = txtFiltros + "| " + ini + "btnLimpaFunc" + mid + "Funcionários " + $("[id*=hddQFI]").val() + " A " + $("[id*=hddQFF]").val() + end + "</span> ";
            }

            if ($("[id*=hddQLI]").val().length > 0 || $("[id*=hddQLF]").val().length > 0) {

                txtFiltros = txtFiltros + "| " + ini + "btnLimpaFiliais" + mid + "Filiais " + $("[id*=hddQLI]").val() + " A " + $("[id*=hddQLF]").val() + end + "</span> ";
            }

            if ($("[id*=hddCSI]").val().length > 0 || $("[id*=hddCSF]").val().length > 0) {
                txtFiltros = txtFiltros + "| " + ini + "btnLimpaCapital" + mid + "Capital Social " + $("[id*=hddCSI]").val() + " ATÉ " + $("[id*=hddCSF]").val() + end + "</span> ";
            }


            if ($("[id*=hddMEI").val().length > 0) {

                if ($("[id*=hddMEI").val() == "1")
                    txtFiltros = txtFiltros + "| " + ini + "optMEISIM" + mid + "MEI - FILTRAR SOMENTE MEI" + end + "</span> ";
                else
                    txtFiltros = txtFiltros + "| " + ini + "optMEINAO" + mid + "MEI - DESCONSIDERAR" + end + "</span> ";

            }

            if ($("[id*=hddTOP1000").val().length > 0) {

                if ($("[id*=hddTOP1000").val() == "1")
                    txtFiltros = txtFiltros + "| " + ini + "optTOP1000SIM" + mid + "TOP 1000 - FILTRAR SOMENTE TOP 1000" + end + "</span> ";
                else
                    txtFiltros = txtFiltros + "| " + ini + "optTOP1000NAO" + mid + "TOP 1000 - DESCONSIDERAR" + end + "</span> ";

            }

            if ($("[id*=hddRCJ").val().length > 0) {

                if ($("[id*=hddRCJ").val() == "1")
                    txtFiltros = txtFiltros + "| " + ini + "optRCJSIM" + mid + "RECUPERAO JUDICIAL - FILTRAR COM" + end + "</span> ";
                else
                    txtFiltros = txtFiltros + "| " + ini + "optRCJNAO" + mid + "RECUPERAO JUDICIAL - DESCONSIDERAR" + end + "</span> ";

            }
            if ($("[id*=hddWLE]").val() == "<>") {
                txtFiltros = txtFiltros + " " + ini + "chkcWLE" + mid + "Linkedin" + end + "</span> <br /> ";
            }

            if ($("[id*=hddSTE]").val() == "<>") {
                txtFiltros = txtFiltros + " " + ini + "chkcSTE" + mid + "Website" + end + "</span>  <br />  ";
            }

            if ($("[id*=hddMatrizFilial]").val().length > 0) {
                txtFiltros = txtFiltros + " " + ini + "chkcMatrizFilial" + mid + "Somente Matriz" + end + "</span>   <br /> ";
            }

            if ($("[id*=hddCTN]").val() == "<>")
                txtFiltros = txtFiltros + " " + ini + "chkCTN" + mid + "Contatos Executivos" + end + "</span>   <br /> ";


            if ($("[id*=hddCTE]").val() == "<>")
                txtFiltros = txtFiltros + " " + ini + "chkcCTE" + mid + "E-mails" + end + "</span>  <br />  ";

            if ($("[id*=hddCTC]").val() == "<>")
                txtFiltros = txtFiltros + " <span class='badge badge-success'><b>Com E-mail Corporativo</b></span>  <br />  ";

            if ($("[id*=hddECC]").val() == "<>")
                txtFiltros = txtFiltros + " <span class='badge badge-success'><b>Contatos Com E-mail Corporativo</b></span>  <br />  ";

            if ($("[id*=hddWTL]").val() == "<>")
                txtFiltros = txtFiltros + " " + ini + "chkcWTL" + mid + "Telefone" + end + "</span> <br />   ";

            if ($("[id*=hddWCL]").val() == "<>")
                txtFiltros = txtFiltros + " " + ini + "chkcWCL" + mid + "Celular" + end + "</span> <br />  ";

            if ($("[id*=hddWFU]").val() == "<>")
                txtFiltros = txtFiltros + " <span class='badge badge-success'>Com Número de Funcionários</span>  <br /> ";

            if ($("[id*=hddWIE]").val() == "<>")
                txtFiltros = txtFiltros + " <span class='badge badge-success'>Com Inscrição Estadual</span> ";

            if ($("[id*=hddWSD]").val() == "<>") {
                txtFiltros = txtFiltros + "| " + ini + "chkcWSD" + mid + "Plano de Saúde" + end + "</span> ";
            }
                      

            if ($("[id*=hddWEC]").val() == "<>") {
                txtFiltros = txtFiltros + "| " + ini + "chkWEC" + mid + "E-COMMERCE" + end + "</span> ";
            }

            if ($("[id*=hddWVE]").val() == "<>") {
                txtFiltros = txtFiltros + "| <span class='badge badge-success'>Com Veículo</span> ";
            }

            if ($("[id*=hddWDeduplic]").val() == "0") {
                txtFiltros = txtFiltros + "|Sem De-duplicação de histórico e delist";
            }

            if ($("[id*=hddWDeduplic]").val() == "1") {
                txtFiltros = txtFiltros + "| Incluir De-duplicação de histório e delist";
            }

            if ($("[id*=hddExcluiCPFCNPJ]").val() == "true") {
                if ($("[id*=hddListaCPFCNPJ]").val().length > 0)
                    txtFiltros = txtFiltros + "|<span class='badge badge-success'> CNPJs (Excluir e De-duplicar) Arquivo</span> ";
                else {
                    txtFiltros = txtFiltros + "|<span class='badge badge-warning'> CNPJs (Excluir e De-duplicar) Falta arquivo</span> ";
                    $('#acbtnEnDe').css("background-color", "rgb(21, 212, 240)");
                        }
            }

            if ($("[id*=hddEnriquecimentoCPFCNPJ]").val() == "true") {
                if ($("[id*=hddListaCPFCNPJ]").val().length > 0)
                    txtFiltros = txtFiltros + "|<span class='badge badge-success'> CNPJs (Incluir e Enriquecer) Com Arquivo</span> ";
                else {
                    txtFiltros = txtFiltros + "|<span class='badge badge-warning'> CNPJs (Incluir e Enriquecer) Falta arquivo</span> ";
                    $('#acbtEnDe').css("background-color", "rgb(21, 212, 240)");
                }
            }

            if ($("[id*=hddExcluiEmail]").val() == "true") {
                if ($("[id*=hddListaEmail]").val().length > 0)
                    txtFiltros = txtFiltros + "|<span class='badge badge-success'> E-mails (Excluir e De-duplicar) Com Arquivo</span> ";
                else {
                    txtFiltros = txtFiltros + "|<span class='badge badge-warning'> E-mails (Excluir e De-duplicar) Falta arquivo</span> ";
                    $('#acbtEnDe').css("background-color", "rgb(21, 212, 240)");
                }
            }


            if ($("[id*=hddEnriquecimentoEmail]").val() == "true") {
                if ($("[id*=hddListaEmail]").val().length > 0)
                    txtFiltros = txtFiltros + "|<span class='badge badge-success'> E-mails (Incluir e Enriquecer) Com Arquivo</span> ";
                else {
                    txtFiltros = txtFiltros + "|<span class='badge badge-warning'> E-mails (Incluir e Enriquecer) Falta arquivo</span> ";
                    $('#acbtEnDe').css("background-color", "rgb(21, 212, 240)");
                }
            }

            if ($("[id*=hddExcluiDominio]").val() == "true") {
                if ($("[id*=hddListaDominio]").val().length > 0)
                    txtFiltros = txtFiltros + "|<span class='badge badge-success'> Dominios (Excluir e De-duplicar) Com Arquivo</span> ";
                else {
                    txtFiltros = txtFiltros + "|<span class='badge badge-warning'> Dominios (Excluir e De-duplicar) Falta arquivo</span> ";
                    $('#acbtEnDe').css("background-color", "rgb(21, 212, 240)");
                }
            }


            if ($("[id*=hddEnriquecimentoDominio]").val() == "true") {
                if ($("[id*=hddListaDominio]").val().length > 0)
                    txtFiltros = txtFiltros + "|<span class='badge badge-success'> Dominios (Incluir e Enriquecer) Com Arquivo</span> ";
                else {
                    txtFiltros = txtFiltros + "|<span class='badge badge-warning'> Dominios (Incluir e Enriquecer) Falta arquivo</span> ";
                    $('#acbtEnDe').css("background-color", "rgb(21, 212, 240)");
                }
            }


            if ($("[id*=hddListaCEP]").val().length > 0) {
                txtFiltros = txtFiltros + "|<span class='badge badge-warning'> CEP: SELEÇÃO DE ARQUIVO</span> ";
            }

          

            if ($("[id*=hddPalavraChave]").val().length > 0) {

                txtFiltros = txtFiltros + "| " + ini + "btnPC" + mid + "<b>Palavra Chave: </b> " + $("[id*=hddPalavraChave]").val() + end;               

                if ($("[id*=hddOrdemPalavraChave]").val() == "2")
                    txtFiltros = txtFiltros + " (Em Qualquer Parte do Nome) </span> ";
                else 
                    txtFiltros = txtFiltros + " (No Início do Nome) </span> ";

            }



            if ($("[id*=hddABI]").val().length > 0 || $("[id*=hddABF]").val().length > 0) {
                txtFiltros = txtFiltros + "|<span class='badge badge-success'>Abertura </span> ";
                {
                    if ($("[id*=hddABI]").val().length == 0)
                        txtFiltros = txtFiltros + "Até " + $("[id*=hddABF]").val();
                    else if ($("[id*=hddABF]").val().length == 0)
                        txtFiltros = txtFiltros + " <span class='badge badge-blue'> À Partir de " + $("[id*=hddABI]").val() + "</span> ";
                    else
                        txtFiltros = txtFiltros + " <span class='badge badge-blue'> Entre " + $("[id*=hddABI]").val() + " e " + $("[id*=hddABF]").val() + "</span>  ";
                }
                $('#acbtnOutInfoPJ').className = "btn btn-block btn-primary waves-effect waves-light";
            }


            return txtFiltros;

           


        };

        function HtmlTextoFiltros(textoFiltros) {



            // var txtHtml = '<p style="font-size:20px">';
            var txtHtml = '';
            var item = '';
            var nPosChar = textoFiltros.indexOf("|");
            while (nPosChar >= 0) {
                txtHtml = txtHtml + iTemHtmlTexto(textoFiltros.substring(0, nPosChar)) + '<br/>';
                textoFiltros = textoFiltros.substring(nPosChar + 1);
                nPosChar = textoFiltros.indexOf("|");
            }
            txtHtml = txtHtml + iTemHtmlTexto(textoFiltros) + '<br/>';
            // txtHtml = txtHtml + '</p>';


            return txtHtml;
        };

        function iTemHtmlTexto(pStrItem) {
            var nPosChar = pStrItem.indexOf(": ");
            if (nPosChar < 0)
                itemHtml = '<span class="label label-primary"><i class="ace-icon fa fa-check-square-o bigger"></i> ' + pStrItem + '</span>';
            else
                itemHtml = '<span class="label label-primary"><i class="ace-icon fa fa-check-square-o bigger"></i> ' + pStrItem.substring(0, nPosChar + 1) + pStrItem.substring(nPosChar + 1).replace("; ", ", ") + '</span>';

            return itemHtml;
        };

        function removeTags(str) {

            

            if ((str === null) || (str === ''))
                return false;
            
            // Regular expression to identify HTML tags in
            // the input string. Replacing the identified
            // HTML tag with a null string.
            return str.replace(/(<([^>]+)>)/ig, '');

        };

        function objFiltrosAgrup() {
            var oPesquisa = {};
            oPesquisa.LstIdRegiao = $("[id*=hddRegiaoTargetList]").val();
            oPesquisa.LstIdDDD = $("[id*=hddDDDTargetList]").val();
            oPesquisa.LstIdMSR = $("[id*=hddMSRTargetList]").val();
            oPesquisa.LstIdMCR = $("[id*=hddMCRTargetList]").val();
            oPesquisa.LstIdMUN = $("[id*=hddMunicipioTargetList]").val();
            oPesquisa.LstIdRamo = $("[id*=hddRamoTargetList]").val();
            oPesquisa.LstIdPorte = $("[id*=hddPorteTargetList]").val();
            oPesquisa.LstIdFXE = $("[id*=hddFXETargetList]").val();
            oPesquisa.LstIdFXF = $("[id*=hddFXFTargetList]").val();
            oPesquisa.LstIdTRB = $("[id*=hddTRBTargetList]").val();
            oPesquisa.LstIdSetor = $("[id*=hddSetorTargetList]").val();
            oPesquisa.LstIdEspecialidade = $("[id*=hddEspecialidadeTargetList]").val();
            oPesquisa.Saude = $("[id*=hddSaudeTargetList]").val();
            oPesquisa.Agrupamentos = $("#cboAgrupamentos").val();
            oPesquisa.Campos = $("#cboCampos").val();
            oPesquisa.QFI = $("[id*=hddQFI]").val();
            oPesquisa.QFF = $("[id*=hddQFF]").val();
            oPesquisa.QLI = $("[id*=hddQLI]").val();
            oPesquisa.QLF = $("[id*=hddQLF]").val();
            oPesquisa.EME = $("[id*=hddEME]").val();
            oPesquisa.WLE = $("[id*=hddWLE]").val();
            oPesquisa.STE = $("[id*=hddSTE]").val();
            oPesquisa.CTN = $("[id*=hddCTN]").val();
            oPesquisa.WCL = $("[id*=hddWCL]").val();
            oPesquisa.WTL = $("[id*=hddWTL]").val();
            oPesquisa.CTE = $("[id*=hddCTE]").val();
            oPesquisa.CTC = $("[id*=hddCTC]").val();
            oPesquisa.ECC = $("[id*=hddECC]").val();
            oPesquisa.FIC = $("[id*=hddFIC]").val();
            oPesquisa.FFC = $("[id*=hddFFC]").val();
            oPesquisa.CEP = $("[id*=hddListaCEP]").val();


            oPesquisa.ExcluiCPFCNPJ = $("[id*=hddExcluiCPFCNPJ]").val();
            if ($("[id*=hddExcluiCPFCNPJ]").val() == "true" || $("[id*=hddEnriquecimentoCPFCNPJ]").val() == "true")
                oPesquisa.ListaCPFCNPJ = $("[id*=hddListaCPFCNPJ]").val();
            else
                oPesquisa.ListaCPFCNPJ = "";

            oPesquisa.ExcluiEmail = $("[id*=hddExcluiEmail]").val();
            if ($("[id*=hddExcluiEmail]").val() == "true" || $("[id*=hddEnriquecimentoEmail]").val() == "true")
                oPesquisa.ListaEmail = $("[id*=hddListaEmail]").val();
            else
                oPesquisa.ListaEmail = "";

            oPesquisa.ExcluiDominio = $("[id*=hddExcluiDominio]").val();
            if ($("[id*=hddExcluiDominio]").val() == "true" || $("[id*=hddEnriquecimentoDominio]").val() == "true")
                oPesquisa.ListaDominio = $("[id*=hddListaDominio]").val();
            else
                oPesquisa.ListaDominio = "";


            if ($("[id*=hddPalavraChave]").val() == '')
                oPesquisa.PalavraChave = '';
            else 
                oPesquisa.PalavraChave = '[' + $("[id*=hddOrdemPalavraChave]").val() + "]" +  $("[id*=hddPalavraChave]").val();


            oPesquisa.Dividas = $("[id*=hddDividas]").val();
            oPesquisa.Protestos = $("[id*=hddProtestos]").val();
            oPesquisa.IVI = $("[id*=hddIVI]").val().replace(/\D/g, "");
            oPesquisa.IVF = $("[id*=hddIVF]").val().replace(/\D/g, "");
            oPesquisa.LMI = $("[id*=hddLMI]").val().replace(/\D/g, "");
            oPesquisa.LMF = $("[id*=hddLMF]").val().replace(/\D/g, "");
            oPesquisa.CSI = $("[id*=hddCSI]").val().replace(/\D/g, "");
            oPesquisa.CSF = $("[id*=hddCSF]").val().replace(/\D/g, "");
            oPesquisa.LAI = $("[id*=hddLAI]").val().replace(/\D/g, "");
            oPesquisa.LAF = $("[id*=hddLAF]").val().replace(/\D/g, "");
            oPesquisa.QtdRegExp = $("[id*=hddQtdRegExp]").val();
            oPesquisa.AllRegExp = $("[id*=hddAllRegExp]").val();
            oPesquisa.IP = $("[id*=hddIP]").val();
            oPesquisa.Solic = $("[id*=hddSolic]").val();
            oPesquisa.Projeto = $("[id*=hddProjeto]").val();
            oPesquisa.Obs = $("[id*=hddObs]").val();
            oPesquisa.Prazo = $("[id*=hddPrazo]").val();
            oPesquisa.MTZ = $("[id*=hddMatrizFilial]").val();
            oPesquisa.WSD = $("[id*=hddWSD]").val();
            oPesquisa.WEC = $("[id*=hddWEC]").val();
            oPesquisa.ABI = $("[id*=hddABI]").val();
            oPesquisa.ABF = $("[id*=hddABF]").val();
            oPesquisa.WCL = $("[id*=hddWCL]").val();
            oPesquisa.WFU = $("[id*=hddWFU]").val();
            oPesquisa.WIE = $("[id*=hddWIE]").val();
            oPesquisa.WVE = $("[id*=hddWVE]").val();
            oPesquisa.MEI = $("[id*=hddMEI]").val();
            oPesquisa.TOP1000 = $("[id*=hddTOP1000]").val();
            oPesquisa.RCJ = $("[id*=hddRCJ]").val();
            oPesquisa.OpCel = $("[id*=hddOpCelTargetList]").val();
            oPesquisa.OpTel = $("[id*=hddOpTelTargetList]").val();
            oPesquisa.Operacao = $("[id*=hddOperacaoTargetList]").val();
            oPesquisa.NJ = $("[id*=hddNJTargetList]").val();
            oPesquisa.IND = $("[id*=hddINDTargetList]").val();
            oPesquisa.RSJ = $("[id*=hddRiscoTargetList]").val();
            oPesquisa.IPE = $("[id*=hddImpExpTargetList]").val();
            oPesquisa.VTP = $("[id*=hddVeiTipoTargetList]").val();
            oPesquisa.VFB = $("[id*=hddVeiFabTargetList]").val();
            oPesquisa.VMR = $("[id*=hddVeiMarTargetList]").val();
            oPesquisa.VMD = $("[id*=hddVeiModTargetList]").val();
            oPesquisa.VAI = $("[id*=hddVeiAnoIni]").val();
            oPesquisa.VAF = $("[id*=hddVeiAnoFim]").val();
            oPesquisa.email = $("#cliEmail").val();
            oPesquisa.crmid = $("#MainContent_crmId").val();
            oPesquisa.WDDL = $("[id*=hddWDeduplic]").val();


            oPesquisa.textoFiltros = removeTags($("[id*=hddFiltrosX]").val());
            return oPesquisa;
        };
        
        async function Contagem() {

            var oPesquisa = $("[id*=hddInputPesquisa]").val();

            var novaPesquisa = objFiltrosAgrup();
            var nPesquisa = JSON.stringify(novaPesquisa);

            if (nPesquisa == oPesquisa) {
                return;
            }
            else {
                $("[id*=hddInputPesquisa]").val(JSON.stringify(novaPesquisa));
            }

            var oPesquisa = objFiltrosAgrup();           
            const result = await   $.ajax({
                    url: "BI.aspx/doContagemAsync",
                    data: JSON.stringify({ 'oInputPesquisa': novaPesquisa }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",                      
                    type: "POST",   
                    global: false,
                    success: function (data) {

                        $("[id*=hddValorParc]").val(data.d);

                        var divTbResultAuto = $("#qtd_registros_auto");
                        divTbResultAuto.empty();
                        var iQtd = data.d;

                        if (iQtd == '0') {
                            var xTableHtml = '<b><h5 class="alert alert-danger"> Nenhum registro. Refaça ou remova filtros</b></h5>';
                        }
                        else { var xTableHtml = '<b><h5 class="alert alert-success"><i class="ace-icon fa fa-check-square-o bigger"></i> ' + iQtd + ' registros disponíveis</b></h5>'; };
                        divTbResultAuto.append(xTableHtml);

                        
                        var xQtd = data.d.replace(/\./g, "");                        
                     


                },
                error: function (jqXHR, textStatus, errorThrown) {
                    var mhRef = '/Login.aspx?erro=TIPOEXCESSOAINVALIDO' + "&msg=" + 'jqXHR.responseJSON.ExceptionType IS NULL'; if (jqXHR.responseJSON.ExceptionType != null) { mhRef = '/Login.aspx?erro=' + jqXHR.responseJSON.ExceptionType + "&msg=" + jqXHR.responseJSON.Message; window.location.href = mhRef;}
                }

           });


        }

        function ContagemCompra() {
            var oPesquisa = objFiltrosAgrup();
          $.ajax({
                url: "BI.aspx/doContagem",
                data: JSON.stringify({ 'oInputPesquisa': oPesquisa }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: "POST",               
                success: function (data) {

                    $("[id*=hddValorParc]").val(data.d.quantidade);

                    var divTbResultAuto = $("#qtd_registros_auto");
                    divTbResultAuto.empty();
                    var iQtd = data.d.quantidade;

                    if (iQtd == '0') {
                        var xTableHtml = '<b><h5 class="alert alert-danger"> Nenhum registro. Refaça ou remova filtros</b></h5>';
                    }
                    else
                    {

                        var xTableHtml = '<b><h5 class="alert alert-success"><i class="ace-icon fa fa-check-square-o bigger"></i> ' + iQtd + ' registros disponíveis</b></h5>';
                    };

                    divTbResultAuto.append(xTableHtml);

                    var divPreco = $("#divPrecos");
                    divPreco.empty();
                    var xhtml = htmlLstPrcRegistro($("[id*=hddListaPrecos]").val(), String($("#cboCampos").val()));
                    divPreco.append(xhtml);

              },
              error: function (jqXHR, textStatus, errorThrown) {
                  var mhRef = '/Login.aspx?erro=TIPOEXCESSOAINVALIDO' + "&msg=" + 'jqXHR.responseJSON.ExceptionType IS NULL'; if (jqXHR.responseJSON.ExceptionType != null) { mhRef = '/Login.aspx?erro=' + jqXHR.responseJSON.ExceptionType + "&msg=" + jqXHR.responseJSON.Message; window.location.href = mhRef;}


              }

            });


        }

        function DoGeraArquivo() {
            $.ajax({
                url: "BI.aspx/ExportToSpreadsheet",
                data: JSON.stringify({ 'table': $('#tbContagem').DataTable() }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                type: "POST",
                success: function (data) { var syx = 1; }
                ,
                error: function (jqXHR, textStatus, errorThrown) {
                    var mhRef = '/Login.aspx?erro=TIPOEXCESSOAINVALIDO' + "&msg=" + 'jqXHR.responseJSON.ExceptionType IS NULL'; if (jqXHR.responseJSON.ExceptionType != null) { mhRef = '/Login.aspx?erro=' + jqXHR.responseJSON.ExceptionType + "&msg=" + jqXHR.responseJSON.Message; window.location.href = mhRef;}
                }
            });
        }

        function selectAll(sigla, tipo) {
            switch (sigla) {
                case 'UF':
                    if (tipo == 1)
                        dtSelectAll($('#tbRegiaoSource').dataTable(), $('#tbRegiaoTarget').dataTable(), 2, 'desc');
                    else
                        dtSelectAll($('#tbRegiaoTarget').dataTable(), $('#tbRegiaoSource').dataTable(), 2, 'desc');

                    SetTargetIds('Regiao');
                    break;

                case 'DDD':
                    if (tipo == 1)
                        dtSelectAll($('#tbDDDSource').dataTable(), $('#tbDDDTarget').dataTable(), 0, 'asc');
                    else
                        dtSelectAll($('#tbDDDTarget').dataTable(), $('#tbDDDSource').dataTable(), 0, 'asc');

                    SetTargetIds('DDD');
                    break;

                case 'MSR':
                    if (tipo == 1)
                        dtSelectAll($('#tbMSRSource').dataTable(), $('#tbMSRTarget').dataTable(), 0, 'asc');
                    else
                        dtSelectAll($('#tbMSRTarget').dataTable(), $('#tbMSRSource').dataTable(), 0, 'asc');

                    SetTargetIds('MSR');
                    break;

                case 'MCR':
                    if (tipo == 1)
                        dtSelectAll($('#tbMCRSource').dataTable(), $('#tbMCRTarget').dataTable(), 0, 'asc');
                    else
                        dtSelectAll($('#tbMCRTarget').dataTable(), $('#tbMCRSource').dataTable(), 0, 'asc');

                    SetTargetIds('MCR');
                    break;

                case 'MUN':
                    if (tipo == 1) 
                        dtSelectAll($('#tbMunicipioSource').dataTable(), $('#tbMunicipioTarget').dataTable(), 3, 'desc');
                    else
                        dtSelectAll($('#tbMunicipioTarget').dataTable(), $('#tbMunicipioSource').dataTable(), 3, 'desc');

                    SetTargetIds('Municipio');
                    break;

                case 'RAT':
                    if (tipo == 1) {

                       
                        table1 = $('#tbRamoSource').dataTable();
                        var dt = table1.api().rows({ filter: 'applied' }).data();

                      
                        for (i = 0; i < dt.length; i++) {
                            $('#tbRamoSource tbody tr:eq(0)').click();

                        }

                                             
                    }
                    else
                        dtSelectAll($('#tbRamoTarget').dataTable(), $('#tbRamoSource').dataTable(), 2, 'desc');

                    SetTargetIds('Ramo');
                    BlockPortes('Ramo');
                    break;

                case 'PRT':
                    if (tipo == 1)
                        dtSelectAll($('#tbPorteSource').dataTable(), $('#tbPorteTarget').dataTable(), 2, 'desc');
                    else
                        dtSelectAll($('#tbPorteTarget').dataTable(), $('#tbPorteSource').dataTable(), 2, 'desc');
                    BlockPortes('Porte');
                    SetTargetIds('Porte');
                    break;

                case 'FXE':
                    if (tipo == 1)
                        dtSelectAll($('#tbFXESource').dataTable(), $('#tbFXETarget').dataTable(), 2, 'desc');
                    else
                        dtSelectAll($('#tbFXETarget').dataTable(), $('#tbFXESource').dataTable(), 2, 'desc');
                    BlockPortes('Porte');
                    SetTargetIds('FXE');
                    break;

                case 'FXF':
                    if (tipo == 1)
                        dtSelectAll($('#tbFXFSource').dataTable(), $('#tbFXFTarget').dataTable(), 2, 'desc');
                    else
                        dtSelectAll($('#tbFXFTarget').dataTable(), $('#tbFXFSource').dataTable(), 2, 'desc');

                    SetTargetIds('FXF');
                    break;

                case 'TRB':
                    if (tipo == 1)
                        dtSelectAll($('#tbTRBSource').dataTable(), $('#tbTRBTarget').dataTable(), 1, 'asc');
                    else
                        dtSelectAll($('#tbTRBTarget').dataTable(), $('#tbTRBSource').dataTable(), 1, 'asc');

                    SetTargetIds('TRB');
                    break;


                case 'SET':
                    if (tipo == 1)
                        dtSelectAll($('#tbSetorSource').dataTable(), $('#tbSetorTarget').dataTable(), 2, 'desc');
                    else
                        dtSelectAll($('#tbSetorTarget').dataTable(), $('#tbSetorSource').dataTable(), 2, 'desc');

                    SetTargetIds('Setor');
                    break;


                case 'ESP':
                    if (tipo == 1)
                        dtSelectAll($('#tbEspecialidadeSource').dataTable(), $('#tbEspecialidadeTarget').dataTable(), 2, 'desc');
                    else
                        dtSelectAll($('#tbEspecialidadeTarget').dataTable(), $('#tbEspecialidadeSource').dataTable(), 2, 'desc');

                    SetTargetIds('Especialidade');
                    break;

              
                case 'NJ':
                    if (tipo == 1)
                        dtSelectAll($('#tbNJSource').dataTable(), $('#tbNJTarget').dataTable(), 1, 'asc');
                    else
                        dtSelectAll($('#tbNJTarget').dataTable(), $('#tbNJSource').dataTable(), 1, 'asc');

                    SetTargetIds('NJ');
                    break;

                case 'IPE':
                    if (tipo == 1)
                        dtSelectAll($('#tbImpExpSource').dataTable(), $('#tbImpExpTarget').dataTable(), 0, 'asc');
                    else
                        dtSelectAll($('#tbImpExpTarget').dataTable(), $('#tbImpExpSource').dataTable(), 0, 'asc');

                    SetTargetIds('ImpExp');
                    break;

                case 'VTP':
                    if (tipo == 1)
                        dtSelectAll($('#tbTpVeiSource').dataTable(), $('#tbTpVeiTarget').dataTable(), 1, 'asc');
                    else
                        dtSelectAll($('#tbTpVeiTarget').dataTable(), $('#tbTpVeiSource').dataTable(), 1, 'asc');

                    SetVeiTipoTargetIds();
                    break;

                case 'VFB':
                    if (tipo == 1)
                        dtSelectAll($('#tbFabrSource').dataTable(), $('#tbFabrTarget').dataTable(), 1, 'asc');
                    else
                        dtSelectAll($('#tbFabrTarget').dataTable(), $('#tbFabrSource').dataTable(), 1, 'asc');

                    SetVeiFabTargetIds();
                    break;

                case 'VMR':
                    if (tipo == 1)
                        dtSelectAll($('#tbMarcaSource').dataTable(), $('#tbMarcaTarget').dataTable(), 1, 'asc');
                    else
                        dtSelectAll($('#tbMarcaTarget').dataTable(), $('#tbMarcaSource').dataTable(), 1, 'asc');

                    SetMarcaTargetIds();
                    break;

                case 'VMD':
                    if (tipo == 1)
                        dtSelectAll($('#tbModeloSource').dataTable(), $('#tbModeloTarget').dataTable(), 1, 'asc');
                    else
                        dtSelectAll($('#tbModeloTarget').dataTable(), $('#tbModeloSource').dataTable(), 1, 'asc');

                    SetModeloTargetIds();
                    break;

                case 'SAU':
                    if (tipo == 1)
                        dtSelectAll($('#tbSaudeSource').dataTable(), $('#tbSaudeTarget').dataTable(), 1, 'asc');
                    else
                        dtSelectAll($('#tbSaudeTarget').dataTable(), $('#tbSaudeSource').dataTable(), 1, 'asc');

                    SetTargetIds('Saude');
                    break;

              
              


            }
        }

        function dtSelectCnae(dtTarget, idSort, strSort) {

         
            dtSourceFilter = $('#tbRamoSource').DataTable().rows({ filter: 'applied' }).click();
            dtSource = $('#tbRamoSource').dataTable();

        
            for (i = 0; i <= dtSourceFilter.length; i++) {
                var addRow = dtSourceFilter[i];
                dtTarget.fnAddData(addRow);
                // dtSourceFilter.fnDeleteRow(addRow);
            }
            if (idSort >= 0)
                dtTarget.fnSort([[idSort, strSort]]);
        }

        function dtSelectAll(dtSource, dtTarget, idSort, strSort) {


            while (dtSource.fnGetData().length > 0) {
                var addRow = dtSource.fnGetData(0);
                dtTarget.fnAddData(addRow);
                dtSource.fnDeleteRow(0);
            }
            if (idSort >= 0)
                dtTarget.fnSort([[idSort, strSort]]);
        }

        function dtSelectRegiao(idRegiao, dtSource, dtTarget, idSort, strSort) {

            /* idRegiao: 1.Norte, 2.Nordeste, 3.Centro-Oeste, 4.Sudeste, 5.Sul */

            var arrRegiao = [
                "AM,RO,RR,PA,TO,AC,AP",
                "BA,MA,PE,CE,AL,RN,SE,PB,PI",
                "DF,GO,MT,MS",
                "SP,RJ,MG,ES",
                "RS,SC,PR"
            ]

            var iRegiao = 0;

            while (dtSource.fnGetData().length > 0) {
                var addRow = dtSource.fnGetData(iRegiao);

                if (addRow == null)
                    break;

                var cUF = addRow.toString().substr(0, 2);
                if (arrRegiao[idRegiao - 1].indexOf(cUF) >= 0) {
                    dtTarget.fnAddData(addRow);
                    dtSource.fnDeleteRow(iRegiao);
                }
                else
                    iRegiao = iRegiao + 1;

            }
            if (idSort >= 0)
                dtTarget.fnSort([[idSort, strSort]]);

            
            SetTargetIds('Regiao');
           

        }

        function FeedHiddenContagem(tipoArquivo) {

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
            $("[id*=hddTipoArquivo]").val(tipoArquivo);

        }


        function DoSearchAjax(tipoPesquisa) {


            // tipoPesquisa: 1.Contagem   2.Exportação  3.Confirmação
            $("[id*=hddidOperacao]").val(tipoPesquisa);

            var oPesquisa = objFiltrosAgrup();
            oPesquisa.tipoPesquisa = tipoPesquisa;

            $.ajax({

                url: "BI.aspx/doSearch",

                data: JSON.stringify({ 'oInputPesquisa': oPesquisa }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",

                type: "POST",
                success: function (data) {

                  
                    var oSearchReturn = data.d;

                    console.log(oSearchReturn);


                    if (oSearchReturn.status == 0) {
                        bootbox.confirm(oSearchReturn.msgRetorno, function (result) {
                            if (result) {
                                DoSearchAjax(3);
                            }
                        });
                    }
                    else if (oSearchReturn.status < 0) { ModalMessage(oSearchReturn.msgRetorno); }
                    else {


                        $("[id*=hddIdPesquisa]").val(oSearchReturn.idPesquisa);

                        
                        if (tipoPesquisa == 3) {

                            document.getElementById("MainContent_btnExportarPlanilha").click();

                        }
                        else {
                        


                            $('.nav-tabs a[href="#resultpesquisa"]').tab('show');
                            $("[id*=btnExcel]").removeAttr("disabled");
                            $("[id*=btnCSV]").removeAttr("disabled");
                            $("[id*=btnTXT]").removeAttr("disabled");



                            // clean table 
                            var divTbResult = $("#divtbContagem");
                            divTbResult.empty();

                            // set column headers begin
                            var sTableHtml = '<table id="tbContagem" class="table table-striped table-bordered table-hover w-100 d-block d-md-table"><thead><tr>';

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
                                var element = { mDataProp: aTableFields[i], sClass: "classFontDataTable" };
                                varColumns.push(element);
                            };



                            // config results dataTable
                            // ------------------------
                            var oTables = $('#tbContagem').DataTable({


                                "bDestroy": true
                                , "aaData": oSearchReturn.lstRows  //data.d
                                , "aoColumns": varColumns
                                , aaSorting: [[1, 'desc']] // initial sort by Qtd

                                , "oLanguage": DataTablesPortugues()
                                , "iDisplayLength": 10




                            });




                            // Workaround (kind of): correct show of recent formed table
                            $('#tbContagem').dataTable().fnAdjustColumnSizing();


                       }
                           

                    }

                }
                ,
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseJSON.Message);
                    /*
                    var mhRef = '/Login.aspx?erro=TIPOEXCESSOAINVALIDO' + "&msg=" + 'jqXHR.responseJSON.ExceptionType IS NULL'; if (jqXHR.responseJSON.ExceptionType != null) { mhRef = '/Login.aspx?erro=' + jqXHR.responseJSON.ExceptionType + "&msg=" + jqXHR.responseJSON.Message; window.location.href = mhRef; }
                    */
                }

            });

        };

        function copiarTextoFiltros() {
            navigator.clipboard.writeText(textofiltros());
        }

        function CtrlClickAccordion(sAccordionItemName, objSource) {
         
         

            if ($(objSource).hasClass('active')) {
                $(objSource).removeClass('active');
                $(objSource).removeClass("btn-light").addClass("btn-primary");
                $(objSource).find(".fe-minus-circle").removeClass("fe-minus-circle").addClass("fe-plus-circle");
            }
            else {

              
                $(".accordion-toggle").removeClass('active');
                $(objSource).addClass('active');                
                $(objSource).find(".fe-plus-circle").removeClass("fe-plus-circle").addClass("fe-minus-circle");


                if (sAccordionItemName == 'DDD') {
                    if (!($("[id*=hddRegiaoTargetList]").val() == $("[id*=hddRegiaoOldList]").val())
                        || $("[id*=hddDDDChanged]").val() == "0")

                        {  $("[id*=hddRegiaoOldList]").val($("[id*=hddRegiaoTargetList]").val());
                           $("[id*=hddDDDOldList]").val(".");
                           DoSearchAjaxDDD();
                        }
                    }

                else if (sAccordionItemName == 'MSR') {
                    if (!($("[id*=hddRegiaoTargetList]").val() == $("[id*=hddRegiaoOldList]").val())
                        || !($("[id*=hddDDDTargetList]").val() == $("[id*=hddDDDOldList]").val())
                        || $("[id*=hddMSRChanged]").val() == "0")
                    {
                        $("[id*=hddRegiaoOldList]").val($("[id*=hddRegiaoTargetList]").val());
                        $("[id*=hddDDDOldList]").val($("[id*=hddDDDTargetList]").val());
                        $("[id*=hddMSROldList]").val(".");
                        DoSearchAjaxMSR();
                    }
                }

                else if (sAccordionItemName == 'MCR') {
                    if (!($("[id*=hddRegiaoTargetList]").val() == $("[id*=hddRegiaoOldList]").val())
                        || !($("[id*=hddDDDTargetList]").val() == $("[id*=hddDDDOldList]").val())
                        || !($("[id*=hddMSRTargetList]").val() == $("[id*=hddMSROldList]").val())
                        || $("[id*=hddMSCRhanged]").val() == "0") {
                        $("[id*=hddRegiaoOldList]").val($("[id*=hddRegiaoTargetList]").val());
                        $("[id*=hddDDDOldList]").val($("[id*=hddDDDTargetList]").val());
                        $("[id*=hddMSROldList]").val($("[id*=hddMSRTargetList]").val());
                        $("[id*=hddMCROldList]").val(".");
                        DoSearchAjaxMCR();
                    }
                }

                else if (sAccordionItemName == 'Municipio') {
                    if (!($("[id*=hddRegiaoTargetList]").val() == $("[id*=hddRegiaoOldList]").val())
                        || !($("[id*=hddDDDTargetList]").val() == $("[id*=hddDDDOldList]").val())
                        || !($("[id*=hddMSRTargetList]").val() == $("[id*=hddMSROldList]").val())
                        || !($("[id*=hddMCRTargetList]").val() == $("[id*=hddMCROldList]").val())
                        || $("[id*=hddMUNChanged]").val() == "0")

                    {
                        $("[id*=hddRegiaoOldList]").val($("[id*=hddRegiaoTargetList]").val());
                        $("[id*=hddDDDOldList]").val($("[id*=hddDDDTargetList]").val());
                        $("[id*=hddMSROldList]").val($("[id*=hddMSRTargetList]").val());
                        $("[id*=hddMCROldList]").val($("[id*=hddMCRTargetList]").val());
                        $("[id*=hddMUNOldList]").val(".");

                        if (!$("[id*=hddMCRTargetList]").val() == '') {
                            // mSelectAll = 1;
                            mSelectAll = 0;
                        }
                        else
                            mSelectAll = 0;

                        DoSearchAjaxMunicipio(mSelectAll);

                     

                    }
                }


                else if (sAccordionItemName == 'Modelo')
                {
                    if (!($("[id*=hddVeiFabTargetList]").val() == $("[id*=hddVeiFabOldList]").val())
                        || !($("[id*=hddVeiTipoTargetList]").val() == $("[id*=hddVeiMarOldList]").val()) || $("[id*=hddVeiModChanged]").val() == "0") {
                        $("[id*=hddVeiFabOldList]").val($("[id*=hddVeiFabTargetList]").val());
                        $("[id*=hddVeiMarOldList]").val($("[id*=hddVeiTipoTargetList]").val());
                        DoSearchAjaxModelo();
                    }
                }
                else if (sAccordionItemName == 'Fabr')
                {
                    if (!($("[id*=hddVeiTipoTargetList]").val() == $("[id*=hddVeiTipoOldList]").val()) || $("[id*=hddVeiTipoChanged]").val() == "0")
                        {
                        $("[id*=hddVeiTipoOldList]").val($("[id*=hddVeiTipoTargetList]").val());
                        $("[id*=hddVeiTipoChanged]").val("1");
                            DoSearchAjaxFabricante();
                       }
                }

            }

            Contagem();
        };


        function DoSearchAjaxEstado() {

            // Set input parameters
            var oPesquisa = {};
            oPesquisa.lstIdRegiao = $("[id*=hddRegiaoTargetList]").val();



            $.ajax({

                url: "BI.aspx/doSearchEstado",

                data: JSON.stringify({ 'oInputPesquisa': oPesquisa }),

                contentType: "application/json; charset=utf-8",
                dataType: "json",

                type: "POST",
                success: function (data) {

                    /*
                        Filipe 18/06/2014: Results Datatable dynamic columns
                    */

                    // get return object values
                    var oSearchReturn = data.d;


                    // clean table 
                    var divTbResult = $("#divEstadoSource");
                    divTbResult.empty();


                    // set column headers begin
                    var sTableHtml = '<table id="tbEstadoSource" class="table table-striped table-bordered table-hover w-100 d-block d-md-table"><thead><tr>';


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
                        var element = { mDataProp: aTableFields[i] };
                        varColumns.push(element);
                    };



                    // config results dataTable
                    // ------------------------

                    var oTables = $('#tbEstadoSource').DataTable({


                        "bDestroy": true

                        // Customized by Filipe 10/06/2014: Number of columns must match the <td> count
                        // in order to avoid the message:
                        // Unable to get property 'className' of undefined or null reference


                        , "aaData": oSearchReturn.lstRows  //data.d
                        , "aoColumns": varColumns

                        , aaSorting: [[1, 'asc']]  // initial sort by Name

                        // Filipe 09/08/2014: datatables translation
                        , "oLanguage": DataTablesPortugues()

                        , "iDisplayLength": 50

                    });

                }
                ,
                error: function (jqXHR, textStatus, errorThrown) {
                    swal("Sessão Expirada");
                    var mhRef = '/Login.aspx?erro=TIPOEXCESSOAINVALIDO' + "&msg=" + 'jqXHR.responseJSON.ExceptionType IS NULL'; if (jqXHR.responseJSON.ExceptionType != null) { mhRef = '/Login.aspx?erro=' + jqXHR.responseJSON.ExceptionType + "&msg=" + jqXHR.responseJSON.Message; window.location.href = mhRef;}
                }
            });

        };


        function DoSearchAjaxDDD() {

            // Set input parameters
            var oPesquisa = {};
            oPesquisa.LstIdRegiao = $("[id*=hddRegiaoTargetList]").val();

            $.ajax({

                url: "BI.aspx/doSearchDDD",

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

                    // clean table 
                    var divTbResult = $("#divTbDDDSource");
                    divTbResult.empty();

                    // set column headers begin
                    var sTableHtml = '<table id="tbDDDSource" class="table table-striped table-bordered table-hover w-100 d-block d-md-table"><thead><tr>';

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
                        if (i == 2)
                            var element = { mDataProp: aTableFields[i], iDataSort: 3, bVisible: false };
                        else if (i == 3)
                            var element = { mDataProp: aTableFields[i], bVisible: false };
                        else
                            var element = { mDataProp: aTableFields[i] };
                        varColumns.push(element);
                    };

                    $("[id*=hddDDDChanged]").val("1");

                    // config results dataTable
                    // ------------------------
                    var oTbDDDSource = $('#tbDDDSource').dataTable({
                        "bDestroy": true
                       

                        , "aaData": oSearchReturn.lstRows  //data.d
                        , "aoColumns": varColumns
                        , aaSorting: [[3, 'desc']]  // initial sort by ddd

                        // Filipe 09/08/2014: datatables translation
                        , "oLanguage": DataTablesPortugues()
                        , "iDisplayLength": 25


                    });

                    //
                    // Configuração da Table Target
                    //
                    // clean table 
                    var divTbResult = $("#divTbDDDTarget");
                    divTbResult.empty();

                    // set column headers begin
                    var xTableHtml = '<table id="tbDDDTarget" class="table table-bordered table-hover w-100 d-block d-md-table"><thead><tr>';

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
                    var oTbDDDTarget = $('#tbDDDTarget').dataTable({
                        "bDestroy": true
                        // Customized by Filipe 10/06/2014: Number of columns must match the <td> count
                        // in order to avoid the message:
                        // Unable to get property 'className' of undefined or null reference
                        , "aaData": oSearchReturn.lstEmpty  //data.d
                        , "aoColumns": varColumns
                        , aaSorting: [[0, 'asc']]  // initial sort by ddd

                        // Filipe 09/08/2014: datatables translation
                        , "oLanguage": DataTablesPortugues()
                        , "iDisplayLength": 50


                    });

                    oTbDDDSource.on('click', 'tr', function () {
                        ;
                        // se não houver dados
                        if (oTbDDDSource.fnGetData().length == 0)
                            return;

                        var $row = $(this);
                        var addRow = oTbDDDSource.fnGetData(this);
                        oTbDDDTarget.css("background-color", "#FFFF99");

                        // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                        if (addRow == null)
                            return;

                        oTbDDDTarget.fnAddData(addRow);

                        var index = oTbDDDSource.fnGetPosition(this); // get the table index
                        oTbDDDSource.fnDeleteRow(index);

                        // reapply sort
                        oTbDDDTarget.fnSort([[1, 'desc']]); // sort call by qtd Registros
                        SetTargetIds('DDD');
                    });

                    oTbDDDTarget.on('click', 'tr', function () {
                        // se não houver dados
                        if (oTbDDDTarget.fnGetData().length == 0)
                            return;

                        var $row = $(this);
                        var addRow = oTbDDDTarget.fnGetData(this);
                        // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                        if (addRow == null)
                            return;

                        oTbDDDSource.fnAddData(addRow);

                        var index = oTbDDDTarget.fnGetPosition(this); // get the table index
                        oTbDDDTarget.fnDeleteRow(index);

                        // reapply sort
                        oTbDDDSource.fnSort([[1, 'desc']]); // sort call by qtd Registros

                        SetTargetIds('DDD');

                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    swal("Sessão Expirada");
                    var mhRef = '/Login.aspx?erro=TIPOEXCESSOAINVALIDO' + "&msg=" + 'jqXHR.responseJSON.ExceptionType IS NULL'; if (jqXHR.responseJSON.ExceptionType != null) { mhRef = '/Login.aspx?erro=' + jqXHR.responseJSON.ExceptionType + "&msg=" + jqXHR.responseJSON.Message; window.location.href = mhRef;}
                }
            });
        };


        function DoSearchAjaxMSR() {

            var oPesquisa = {};
            oPesquisa.lstIdRegiao = $("[id*=hddRegiaoTargetList]").val();
            oPesquisa.lstIdDDD = $("[id*=hddDDDTargetList]").val();

            $.ajax({

                url: "BI.aspx/doSearchMSR",

                data: JSON.stringify({ 'oInputPesquisa': oPesquisa }),

                contentType: "application/json; charset=utf-8",
                dataType: "json",

                type: "POST",
                success: function (data) {

                    var oSearchReturn = data.d;

                    // clean table 
                    var divMSRSelectAll = $("#divMSRSelectAll");
                    divMSRSelectAll.empty();

                    var sSelectAll = '<div class="row">';
                    sSelectAll += '<div class="col-xs-6">';
                    sSelectAll += '<button type="button" class="width-30 btn-primary pull-right"  onclick="selectAll(' + "'MSR'" + ',1);">';
                    sSelectAll += 'Selecionar Todos';
                    sSelectAll += '</button>';
                    sSelectAll += '</div>';
                    sSelectAll += '<div class="col-xs-6">';
                    sSelectAll += '<button type="button" class="width-30  btn-danger float-right" onclick="selectAll(' + "'MSR'" + ',2);">';
                    sSelectAll += 'Limpar Seleção';
                    sSelectAll += '</button>';
                    sSelectAll += '</div>';
                    sSelectAll += '</div>';
                    sSelectAll += '<br />';
                    divMSRSelectAll.append(sSelectAll);

                    // clean table 
                    var divTbResult = $("#divTbMSRSource");
                    divTbResult.empty();


                    // set column headers begin
                    var sTableHtml = '<table id="tbMSRSource" class="table table-striped table-bordered table-hover w-100 d-block d-md-table"><thead><tr>';


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

                        if (i == 0)
                            // first column invisible
                            var element = { mDataProp: aTableFields[i], bVisible: false };
                        else
                            var element = { mDataProp: aTableFields[i] };

                        varColumns.push(element);
                    };

                    $("[id*=hddMSRChanged]").val("1");

                    // config results dataTable
                    // ------------------------

                    var oTbMSRSource = $('#tbMSRSource').dataTable({

                        "bDestroy": true
                        , "aaData": oSearchReturn.lstRows  //data.d
                        , "aoColumns": varColumns
                        ,  aaSorting: [[2, 'asc']]  // initial sort by name
                        , "oLanguage": DataTablesPortugues()
                        , "iDisplayLength": 25

                    });


                    //
                    // Configuração da Table Target
                    //
                    // clean table 
                    var divTbResult = $("#divTbMSRTarget");
                    divTbResult.empty();

                    // set column headers begin
                    var xTableHtml = '<table id="tbMSRTarget" class="table table-bordered table-hover w-100 d-block d-md-table"><thead><tr>';

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
                    var oTbMSRTarget = $('#tbMSRTarget').dataTable({
                        "bDestroy": true
                        , "aaData": oSearchReturn.lstEmpty  //data.d
                        , "aoColumns": varColumns
                        , aaSorting: [[2, 'asc']]  // initial sort by nome
                        , "oLanguage": DataTablesPortugues()
                        , "iDisplayLength": 25


                    });

                    oTbMSRSource.on('click', 'tr', function () {
                        // se não houver dados
                        if (oTbMSRSource.fnGetData().length == 0)
                            return;

                        var $row = $(this);
                        var addRow = oTbMSRSource.fnGetData(this);
                        oTbMSRTarget.css("background-color", "#FFFF99");

                        // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                        if (addRow == null)
                            return;

                        oTbMSRTarget.fnAddData(addRow);

                        var index = oTbMSRSource.fnGetPosition(this); // get the table index
                        oTbMSRSource.fnDeleteRow(index);

                        // reapply sort
                        oTbMSRSource.fnSort([[2, 'asc']]); // sort call by nome
                        SetTargetIds('MSR');
                    });

                    oTbMSRTarget.on('click', 'tr', function () {
                        // se não houver dados
                        if (oTbMSRTarget.fnGetData().length == 0)
                            return;

                        var $row = $(this);
                        var addRow = oTbMSRTarget.fnGetData(this);
                        // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                        if (addRow == null)
                            return;

                        oTbMSRSource.fnAddData(addRow);

                        var index = oTbMSRTarget.fnGetPosition(this); // get the table index
                        oTbMSRTarget.fnDeleteRow(index);

                        // reapply sort
                        oTbMSRSource.fnSort([[2, 'asc']]); // sort call by nome

                        SetTargetIds('MSR');
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    swal("Sessão Expirada");
                    var mhRef = '/Login.aspx?erro=TIPOEXCESSOAINVALIDO' + "&msg=" + 'jqXHR.responseJSON.ExceptionType IS NULL'; if (jqXHR.responseJSON.ExceptionType != null) { mhRef = '/Login.aspx?erro=' + jqXHR.responseJSON.ExceptionType + "&msg=" + jqXHR.responseJSON.Message; window.location.href = mhRef;}
                }
            });
        };


        function DoSearchAjaxMCR() {

            var oPesquisa = {};
            oPesquisa.lstIdRegiao = $("[id*=hddRegiaoTargetList]").val();
            oPesquisa.lstIdDDD = $("[id*=hddDDDTargetList]").val();
            oPesquisa.lstIdMSR = $("[id*=hddMSRTargetList]").val();

            $.ajax({

                url: "BI.aspx/doSearchMCR",

                data: JSON.stringify({ 'oInputPesquisa': oPesquisa }),

                contentType: "application/json; charset=utf-8",
                dataType: "json",

                type: "POST",
                success: function (data) {

                    var oSearchReturn = data.d;

                    // clean table 
                    var divMCRSelectAll = $("#divMCRSelectAll");
                    divMCRSelectAll.empty();

                    var sSelectAll = '<div class="row">';
                    sSelectAll += '<div class="col-xs-6">';
                    sSelectAll += '<button type="button" class="width-30 btn-primary pull-right"  id="Button45" onclick="selectAll(' + "'MCR'" + ',1);">';
                    sSelectAll += 'Selecionar Todos';
                    sSelectAll += '</button>';
                    sSelectAll += '</div>';
                    sSelectAll += '<div class="col-xs-6">';
                    sSelectAll += '<button type="button" class="width-30  btn-danger float-right"  id="Button46" onclick="selectAll(' + "'MCR'" + ',2);">';
                    sSelectAll += 'Limpar Seleção';
                    sSelectAll += '</button>';
                    sSelectAll += '</div>';
                    sSelectAll += '</div>';
                    sSelectAll += '<br />';
                    divMCRSelectAll.append(sSelectAll);

                    // clean table 
                    var divTbResult = $("#divTbMCRSource");
                    divTbResult.empty();


                    // set column headers begin
                    var sTableHtml = '<table id="tbMCRSource" class="table table-striped table-bordered table-hover w-100 d-block d-md-table"><thead><tr>';


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

                        if (i == 0 || i == 2)
                            // first column invisible
                            var element = { mDataProp: aTableFields[i], bVisible: false };
                        else
                            var element = { mDataProp: aTableFields[i] };

                        varColumns.push(element);
                    };

                    $("[id*=hddMCRChanged]").val("1");

                    // config results dataTable
                    // ------------------------

                    var oTbMCRSource = $('#tbMCRSource').dataTable({

                        "bDestroy": true
                        , "aaData": oSearchReturn.lstRows  //data.d
                        , "aoColumns": varColumns
                        , aaSorting: [[3, 'desc']]  // initial sort by nome
                        , "iDisplayLength": 25

                    });


                    //
                    // Configuração da Table Target
                    //
                    // clean table 
                    var divTbResult = $("#divTbMCRTarget");
                    divTbResult.empty();

                    // set column headers begin
                    var xTableHtml = '<table id="tbMCRTarget" class="table table-bordered table-hover w-100 d-block d-md-table"><thead><tr>';

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
                    var oTbMCRTarget = $('#tbMCRTarget').dataTable({
                        "bDestroy": true
                        , "aaData": oSearchReturn.lstEmpty  //data.d
                        , "aoColumns": varColumns
                        , aaSorting: [[1, 'asc']]  // initial sort by nome
                        , "oLanguage": DataTablesPortugues()
                        , "iDisplayLength": 25


                    });

                    oTbMCRSource.on('click', 'tr', function () {
                        // se não houver dados
                        if (oTbMCRSource.fnGetData().length == 0)
                            return;

                        var $row = $(this);
                        var addRow = oTbMCRSource.fnGetData(this);
                        oTbMCRTarget.css("background-color", "#FFFF99");

                        // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                        if (addRow == null)
                            return;

                        oTbMCRTarget.fnAddData(addRow);

                        var index = oTbMCRSource.fnGetPosition(this); // get the table index

                        oTbMCRSource.fnDeleteRow(index);

                        // reapply sort
                        oTbMCRTarget.fnSort([[1, 'asc']]); // sort call by nome
                        SetTargetIds('MCR');
                    });

                    oTbMCRTarget.on('click', 'tr', function () {
                        // se não houver dados
                        if (oTbMCRTarget.fnGetData().length == 0)
                            return;

                        var $row = $(this);
                        var addRow = oTbMCRTarget.fnGetData(this);
                        // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                        if (addRow == null)
                            return;

                        oTbMCRSource.fnAddData(addRow);

                        var index = oTbMCRTarget.fnGetPosition(this); // get the table index
                        oTbMCRTarget.fnDeleteRow(index);

                        // reapply sort
                        oTbMCRSource.fnSort([[1, 'desc']]); // sort call by nome

                        SetTargetIds('MCR');
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    swal("Sessão Expirada");
                    var mhRef = '/Login.aspx?erro=TIPOEXCESSOAINVALIDO' + "&msg=" + 'jqXHR.responseJSON.ExceptionType IS NULL'; if (jqXHR.responseJSON.ExceptionType != null) { mhRef = '/Login.aspx?erro=' + jqXHR.responseJSON.ExceptionType + "&msg=" + jqXHR.responseJSON.Message; window.location.href = mhRef;}
                }
            });
        };


        function DoSearchAjaxMunicipio(pSelectAll) {

            // Set input parameters
            var oPesquisa = {};
            oPesquisa.lstIdRegiao = $("[id*=hddRegiaoTargetList]").val();
            oPesquisa.lstIdDDD = $("[id*=hddDDDTargetList]").val();
            oPesquisa.lstIdMSR = $("[id*=hddMSRTargetList]").val();
            oPesquisa.lstIdMCR = $("[id*=hddMCRTargetList]").val();

            $.ajax({

                url: "BI.aspx/doSearchMunicipio",

                data: JSON.stringify({ 'oInputPesquisa': oPesquisa }),

                contentType: "application/json; charset=utf-8",
                dataType: "json",

                type: "POST",
                success: function (data) {

                    /*
                        Filipe 18/06/2014: Results Datatable dynamic columns
                    */

                    // get return object values
                    var oSearchReturn = data.d;


                    // clean table 
                    var divMunSelectAll = $("#divMunSelectAll");
                    divMunSelectAll.empty();


                    if (!$("[id*=hddRegiaoTargetList]").val() == "" ||
                        !$("[id*=hddDDDTargetList]").val() == "" ||
                        !$("[id*=hddMSRTargetList]").val() == "" ||
                        !$("[id*=hddMCRTargetList]").val() == "")

                    {

                        var sSelectAll = '<div class="row">';
                        sSelectAll += '<div class="col-xs-6">';
                        sSelectAll += '<button type="button" class="width-30 btn-primary pull-right"  id="btnSelectAllMun" onclick="selectAll(' + "'MUN'" + ',1);">';
                        sSelectAll += 'Selecionar Todos';
                        sSelectAll += '</button>';
                        sSelectAll += '</div>';
                        sSelectAll += '<div class="col-xs-6">';
                        sSelectAll += '<button type="button" class="width-30  btn-danger float-right"  id="btnLimparMun" onclick="selectAll(' + "'MUN'" + ',2);">';
                        sSelectAll += 'Limpar Seleção';
                        sSelectAll += '</button>';
                        sSelectAll += '</div>';
                        sSelectAll += '</div>';
                        sSelectAll += '<br />';
                        divMunSelectAll.append(sSelectAll);
                    }

                    // clean table 
                    var divTbResult = $("#divTbMunicipioSource");
                    divTbResult.empty();


                    // set column headers begin
                    var sTableHtml = '<table id="tbMunicipioSource" class="table table-striped table-bordered table-hover w-100 d-block d-md-table"><thead><tr>';


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

                        if (i == 0 || i > 3)
                            // first column invisible
                            var element = { mDataProp: aTableFields[i], bVisible: false };
                        //else if (i==3)
                        //  var element = { mDataProp: aTableFields[i] , iDataSort: 4};
                        else
                            var element = { mDataProp: aTableFields[i] };

                        varColumns.push(element);
                    };

                    $("[id*=hddMUNChanged]").val("1");

                    // config results dataTable
                    // ------------------------

                    var oTbMunicipioSource = $('#tbMunicipioSource').dataTable({


                        "bDestroy": true

                        // Customized by Filipe 10/06/2014: Number of columns must match the <td> count
                        // in order to avoid the message:
                        // Unable to get property 'className' of undefined or null reference


                        , "aaData": oSearchReturn.lstRows  //data.d
                        , "aoColumns": varColumns

                        , aaSorting: [[5, 'desc']]  // initial sort by qtdREgistros

                        // Filipe 09/08/2014: datatables translation
                        , "oLanguage": DataTablesPortugues()
                        , "iDisplayLength": 100


                    });


                    //
                    // Configuração da Table Target
                    //
                    // clean table 
                    var divTbResult = $("#divTbMunicipioTarget");
                    divTbResult.empty();

                    // set column headers begin
                    var xTableHtml = '<table id="tbMunicipioTarget" class="table table-bordered table-hover w-100 d-block d-md-table"><thead><tr>';

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
                    var oTbMunicipioTarget = $('#tbMunicipioTarget').dataTable({
                        "bDestroy": true
                        // Customized by Filipe 10/06/2014: Number of columns must match the <td> count
                        // in order to avoid the message:
                        // Unable to get property 'className' of undefined or null reference
                        , "aaData": oSearchReturn.lstEmpty  //data.d
                        , "aoColumns": varColumns
                        , aaSorting: [[3, 'asc']]  // initial sort by qtd REgistros

                        // Filipe 09/08/2014: datatables translation
                        , "oLanguage": DataTablesPortugues()
                        , "iDisplayLength": 100


                    });

                    oTbMunicipioSource.on('click', 'tr', function () {
                        ;
                        // se não houver dados
                        if (oTbMunicipioSource.fnGetData().length == 0)
                            return;

                        var $row = $(this);
                        var addRow = oTbMunicipioSource.fnGetData(this);
                        oTbMunicipioTarget.css("background-color", "#FFFF99");

                        // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                        if (addRow == null)
                            return;

                        oTbMunicipioTarget.fnAddData(addRow);

                        var index = oTbMunicipioSource.fnGetPosition(this); // get the table index
                        oTbMunicipioSource.fnDeleteRow(index);

                        // reapply sort
                        oTbMunicipioTarget.fnSort([[0, 'asc']]); // sort call by ddd
                        SetTargetIds("Municipio");
                    });

                    oTbMunicipioTarget.on('click', 'tr', function () {
                        // se não houver dados
                        if (oTbMunicipioTarget.fnGetData().length == 0)
                            return;

                        var $row = $(this);
                        var addRow = oTbMunicipioTarget.fnGetData(this);
                        // Se o click foi no header da coluna, não há transferência a fazer (de cabeçalho)
                        if (addRow == null)
                            return;

                        oTbMunicipioSource.fnAddData(addRow);

                        var index = oTbMunicipioTarget.fnGetPosition(this); // get the table index
                        oTbMunicipioTarget.fnDeleteRow(index);

                        // reapply sort
                        oTbMunicipioSource.fnSort([[3, 'desc']]); // sort call by Qtd Registros

                       //SetMunicipioTargetIds();
                        SetTargetIds("Municipio");

                    });

                    if (pSelectAll == 1) { selectAll('MUN', 1); }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    swal("Sessão Expirada");
                    var mhRef = '/Login.aspx?erro=TIPOEXCESSOAINVALIDO' + "&msg=" + 'jqXHR.responseJSON.ExceptionType IS NULL'; if (jqXHR.responseJSON.ExceptionType != null) { mhRef = '/Login.aspx?erro=' + jqXHR.responseJSON.ExceptionType + "&msg=" + jqXHR.responseJSON.Message; window.location.href = mhRef;}
                }
            });

           

        };


        function dtSelectArray(dtSource, dtTarget, idSort, strSort, arrData, divErros, idrow) {

            /* var dtSource = $('#tbRegiaoSource').dataTable();
             var dtTarget = $('#tbRegiaoTarget').dataTable();*/

            var id = 0;

            while (!(dtSource.fnGetData(id) == null)) {
                var addRow = dtSource.fnGetData(id);
                var posicao = arrData.indexOf(addRow[idrow]);



                if (posicao >= 0) {
                    dtTarget.fnAddData(addRow);
                    dtSource.fnDeleteRow(id);
                    arrData.splice(posicao, 1);
                }
                else { id = id + 1; }

            }
            if (idSort >= 0)
                dtTarget.fnSort([[idSort, strSort]]);

            var divErros = $("#" + divErros);
            divErros.empty();

            if (arrData.length > 0) { divErros.append("Códigos Não Encontrados: " + arrData.toString()); }

        }

        function dtSelectArrayCNAE(dtSource, dtTarget, idSort, strSort, arrData, divErros, idrow) {

            /* var dtSource = $('#tbRegiaoSource').dataTable();
             var dtTarget = $('#tbRegiaoTarget').dataTable();*/

            var id = 0;

            while (!(dtSource.fnGetData(id) == null)) {
                var addRow = dtSource.fnGetData(id);

                var posicao = arrData.indexOf(addRow[idrow]);
                if (posicao < 0)
                    posicao = arrData.indexOf(addRow[idrow].substr(0, 6));
                if (posicao < 0)
                    posicao = arrData.indexOf(addRow[idrow].substr(0, 5));
                if (posicao < 0)
                    posicao = arrData.indexOf(addRow[idrow].substr(0, 4));
                if (posicao < 0)
                    posicao = arrData.indexOf(addRow[idrow].substr(0, 3));
                if (posicao < 0)
                    posicao = arrData.indexOf(addRow[idrow].substr(0, 2));
                if (posicao < 0)
                    posicao = arrData.indexOf(addRow[idrow].substr(0, 1));


                if (posicao >= 0) {
                    dtTarget.fnAddData(addRow);
                    dtSource.fnDeleteRow(id);
                    // arrData.splice(posicao,1);
                }
                else {
                    id = id + 1;
                }

            }
            if (idSort >= 0)
                dtTarget.fnSort([[idSort, strSort]]);

            var divErros = $("#" + divErros);
            divErros.empty();

            /*if (arrData.length > 0)
               { divErros.append( "Códigos Não Encontrados: " + arrData.toString() ); }*/

        }

        function dtSelectArrayMunicipio(dtSource, dtTarget, idSort, strSort, arrData, divErros) {

            var id = 0;

            while (!(dtSource.fnGetData(id) == null)) {
                var addRow = dtSource.fnGetData(id);

                

                var posicao = arrData.indexOf(addRow.Nome.toUpperCase());

                if (posicao >= 0) {
                    dtTarget.fnAddData(addRow);
                    dtSource.fnDeleteRow(id);
                    arrData.splice(posicao, 1);
                }
                else { id = id + 1; }

            }
            if (idSort >= 0)
                dtTarget.fnSort([[idSort, strSort]]);

            var divErros = $("#" + divErros);
            divErros.empty();

            if (arrData.length > 0) { divErros.append("Códigos Não Encontrados: " + arrData.toString()); }

        }

        function htmlLstPrcRegistro(lstPrecos, lstFieldSel) {
            var retorno = '';
            var htmlret = '';

           

            if ($("[id*=hddOmiteValoresReais]").val() == "0") {
                var ArrLista = jsStringToArray(lstPrecos, ",");
               
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


                    htmlret = htmlret + '<table class="table table-striped table-bordered">';
                   

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
                        htmlret = htmlret + '<h4 class="header red lighter smaller"><i class="fe-check smaller-80"></i> SELECIONE A QUANTIDADE: <input size="10" type="text" onkeypress="return somenteNumeros(event)" onblur="atualiza()" id="TextCompra" placeholder="" value=' + qtdx + '></h4>';
                        htmlret = htmlret + '<center> <a href="#modal-form" data-animation="push" data-plugin="custommodal" data-overlayColor="#38414a" class="btn btn-block btn-success" style="width:30%" data-toggle="modal" id="confirma" onclick="validate()"><i class="ace-icon fa fa-shopping-cart bigger-110"></i><span> Consumir Dados (Exportar) </span></a></center>'
                    }


                    htmlret = htmlret + '<hr><center><span style="font-size:10px">- Valores em Reais <br /> - Valor total referente a quantidade de todos os registros disponiveis.<br /> - A quantidade de registros pode ser alterada no campo acima ou confirmacao de seu pedido.</span></center>';



                }
            }
            else {

                var qtdp = $("[id*=hddValorParc]").val();
                var qtd = qtdp.replace(/\./g, "");
                var qtdx = parseInt(qtd);
                var valorp = parseInt(qtd) * (vlrTotal * taxaConv);

                htmlret = htmlret + '<h4 class="header red lighter smaller"><i class="ace-icon fa fa-retweet smaller-80"></i> QUANTIDADE CONTABILIZADA: <input size="10" type="text" onkeypress="return somenteNumeros(event)" id="TextCompra" placeholder="" value=' + qtdx + '></h4>';

            }
            return htmlret
        }

        function somenteNumeros(e) {
            var tecla = (window.event) ? event.keyCode : e.which;
            if ((tecla > 47 && tecla < 58)) return true;
            else {
                if (tecla == 8 || tecla == 0) return true;
                else return false;
            }
        };

        function DisplayTextoRightBar(dataDisplay, Sigla, Maximo) {

            console.log("dataDisplay: " + dataDisplay);
            console.log("Sigla: " + Sigla);

            const estados = dataDisplay.split(";");

            var textoDisplay = '<b>' + Sigla + ":</b>";

            var icntLinha = 0;

            for (var i = 0; i < estados.length; i++) {

                if (i > 0)
                   textoDisplay = textoDisplay + ',';

                if (icntLinha >= Maximo) {
                    icntLinha = 0;
                    textoDisplay = textoDisplay + '</br>';
                }
  
                textoDisplay = textoDisplay + estados[i];
                icntLinha = icntLinha + 1;

            };
            
            return textoDisplay;
        };

        function DisplayTextoRightBarSelect(dataDisplay, Sigla) {

            const estados = dataDisplay.split(";");

            var textoDisplay = '<select><option>' + Sigla + "</option>";

            for (var i = 0; i < estados.length; i++) {

                textoDisplay = textoDisplay + "<option>" + estados[i] + "</option>";

            };
            textoDisplay = textoDisplay + '</select>';

            

            return textoDisplay;
        };

        function download_table_as_csv(table_id, separator = ',') {
            // Select rows from table_id
            var rows = document.querySelectorAll('table#' + table_id + ' tr');
            var rowsTotal = document.querySelectorAll('table#' + table_id + ' tr').length;

            var tabela = $('table#' + table_id).DataTable();

            tabela.page('next').draw('page');
            /// table.page('next').draw('page');

            // Construct csv
            var csv = [];
            for (var i = 0; i < rows.length; i++) {
                var row = [], cols = rows[i].querySelectorAll('td, th');
                for (var j = 0; j < cols.length; j++) {
                    // Clean innertext to remove multiple spaces and jumpline (break csv)
                    var data = cols[j].innerText.replace(/(\r\n|\n|\r)/gm, '').replace(/(\s\s)/gm, ' ')
                    // Escape double-quote with double-double-quote (see https://stackoverflow.com/questions/17808511/properly-escape-a-double-quote-in-csv)
                    data = data.replace(/"/g, '""');
                    // Push escaped string
                    row.push('"' + data + '"');
                }
                csv.push(row.join(separator));
            }
            var csv_string = csv.join('\n');
            // Download it
            var filename = 'export_' + table_id + '_' + new Date().toLocaleDateString() + '.csv';
            var link = document.createElement('a');
            link.style.display = 'none';
            link.setAttribute('target', '_blank');
            link.setAttribute('href', 'data:text/csv;charset=utf-8,' + encodeURIComponent(csv_string));
            link.setAttribute('download', filename);
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }


        $(".flatpickr-input").flatpickr({
            "locale": "pt", // locale for this instance only
            dateFormat: "d/m/Y"
        });


        $('#accordion-style').on('click', function (ev) {
            var target = $('input', ev.target);
            var which = parseInt(target.val());
            if (which == 2) $('#accordion').addClass('accordion-style2');
            else $('#accordion').removeClass('accordion-style2');
        });


        $('#id-disable-check').on('click', function () {
            var inp = $('#form-input-readonly').get(0);
            if (inp.hasAttribute('disabled')) {
                inp.setAttribute('readonly', 'true');
                inp.removeAttribute('disabled');
                inp.value = "This text field is readonly!";
            }
            else {
                inp.setAttribute('disabled', 'disabled');
                inp.removeAttribute('readonly');
                inp.value = "This text field is disabled!";
            }
        });


        $(".chosen-select").chosen();
        $('#chosen-multiple-style').on('click', function (e) {
            var target = $(e.target).find('input[type=radio]');
            var which = parseInt(target.val());
            if (which == 2) $('#form-field-select-4').addClass('tag-input-style');
            else $('#form-field-select-4').removeClass('tag-input-style');
        });


        $('[data-rel=tooltip]').tooltip({ container: 'body' });
        $('[data-rel=popover]').popover({ container: 'body' });

        $('textarea[class*=autosize]').autosize({ append: "\n" });
        $('textarea.limited').inputlimiter({
            remText: '%n character%s remaining...',
            limitText: 'max allowed : %n.'
        });

        $.mask.definitions['~'] = '[+-]';
        $('.input-mask-date').mask('99/99/9999');
        $('.input-mask-cep').mask('99999-999');
        $('.input-mask-phone').mask('(999) 999-9999');
        //$('.input-mask-integer').mask('~9.99 ~9.99 999');
        $('.input-mask-integer').mask('?999999');
        $('.input-mask-valor').mask('999.999.999,99');
        $(".input-mask-product").mask("a*-999-a999", { placeholder: " ", completed: function () { alert("You typed the following: " + this.val()); } });

    

        $('#modal-form').on('shown.bs.modal', function () {
            $(this).find('.chosen-container').each(function () {
                $(this).find('a:first-child').css('width', '210px');
                $(this).find('.chosen-drop').css('width', '210px');
                $(this).find('.chosen-search input').css('width', '200px');
            });

            var vldStrCampos = $("#cboCampos").val();
            var iPosVei = -1;

            var divAlertChangeQtdReg = $("#AlertChangeQtdReg");
            divAlertChangeQtdReg.empty();


            if (vldStrCampos != null) { iPosVei = vldStrCampos.indexOf("VEI"); }

            if (iPosVei >= 0) { $('#chkeWVE').prop('checked', true); }

            if ((!$('#chkeMatrizFilial').is(':checked') == $('#chkcMatrizFilial').is(':checked')) ||
                (!$('#chkeWTL').is(':checked') == $('#chkcWTL').is(':checked')) ||
                (!$('#chkeCTE').is(':checked') == $('#chkcCTE').is(':checked')) ||
                (!$('#chkeCTC').is(':checked') == $('#chkcCTC').is(':checked')) ||
                (!$('#chkeEME').is(':checked') == $('#chkcEME').is(':checked')) ||
                (!$('#chkeSTE').is(':checked') == $('#chkcSTE').is(':checked')) ||
                (!$('#chkeCTN').is(':checked') == $('#chkcCTN').is(':checked')) ||
                (!$('#chkeWCL').is(':checked') == $('#chkcWCL').is(':checked')) ||
                (!$('#chkeWFU').is(':checked') == $('#chkcWFU').is(':checked')) ||
                (!$('#chkeWIE').is(':checked') == $('#chkcWIE').is(':checked')) ||
                (!$('#chkeWSD').is(':checked') == $('#chkcWSD').is(':checked')) ||
                (!$('#chkeWVE').is(':checked') == $('#chkcWVE').is(':checked'))) {
                $('#chkcMatrizFilial').prop('checked', $('#chkeMatrizFilial').is(':checked'));

                $('#chkcWTL').prop('checked', $('#chkeWTL').is(':checked'));
                $('#chkcCTE').prop('checked', $('#chkeCTE').is(':checked'));
                $('#chkcCTC').prop('checked', $('#chkeCTC').is(':checked'));
                $('#chkcEME').prop('checked', $('#chkeEME').is(':checked'));
                $('#chkcSTE').prop('checked', $('#chkeSTE').is(':checked'));
                $('#chkcCTN').prop('checked', $('#chkeCTN').is(':checked'));
                $('#chkcWCL').prop('checked', $('#chkeWCL').is(':checked'));
                $('#chkcWFU').prop('checked', $('#chkeWFU').is(':checked'));
                $('#chkcWIE').prop('checked', $('#chkeWIE').is(':checked'));
                $('#chkcWVE').prop('checked', $('#chkeWVE').is(':checked'));
                $('#chkcWSD').prop('checked', $('#chkeWSD').is(':checked'));

                PesquisaDBAgrup($('#chkeWVE').is(':checked'), 3);

               
                var xHtmlAlertChangeQtdReg = '<div class="alert alert-danger"><button type="button" class="close" data-dismiss="alert" id="btnFechar">  Fechar <i class="ace-icon fa fa-times bigger"></i> </button> Atenção! Inclusão de campos obrigatórios.<br /> Quantidade total de registros foi recalculada.</div>';
                divAlertChangeQtdReg.append(xHtmlAlertChangeQtdReg);

                setTimeout(Fecha, 8000);
                function Fecha() { $("#btnFechar").click(); }

            }


        })


        $('#divProposta').on('shown.bs.modal', function () {
            $(this).find('.chosen-container').each(function () {
                $(this).find('a:first-child').css('width', '610px');
                $(this).find('.chosen-drop').css('width', '610px');
                $(this).find('.chosen-search input').css('width', '600px');
            })
        });


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


            });
            swal.showLoading();



        });



        $(document).ajaxComplete(function () {

            swal.close();


        });

    </script>

</asp:Content>

