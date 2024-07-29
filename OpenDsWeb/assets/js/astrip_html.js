 <div class="tab-pane" id="regiao">
                <!-- Accordion begin  -->                   
                <div class="accordion-style1 panel-group accordion-style2" id="accordion">
					<div class="panel panel-default a">	  
                        <div class="panel-heading" id="pnlEstado">
							<h4 class="panel-title">
								<button class="btn btn-block btn-primary waves-effect waves-light" type="button" aria-expanded="true" id="acbtnEstado" href="#collapseOne" data-toggle="collapse" data-target="#collapseOne" data-parent="#accordion" onclick="CtrlClickAccordion('Estado', this);"> 
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
			                        <table id="tbRegiaoSource" class="table table-striped table-bordered table-hover w-100 d-block d-md-table w-100 d-block d-md-table datatableuf">
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
						  <button type="button" class="width-30 btn-sm btn-danger pull-right"  id="Button10" onclick="selectAll('MSR',2);"> 
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
								     
								       <button class="btn btn-block btn-primary waves-effect waves-light" type="button" aria-expanded="true"" id="acbtnMUN" href="#collapseThree" data-toggle="collapse"  data-target="#collapseThree" data-parent="#accordion" onclick="CtrlClickAccordion('Municipio', this);"> <!-- Customized by Filipe: do not close on other open: data-parent="#accordion" -->
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