using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using Newtonsoft.Json;
using System.Threading.Tasks;


namespace OpenDsWeb
{
    public partial class BI : System.Web.UI.Page
    {


        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {

            this.Master.ChangeTitle("Listas Pessoa Jurídica");
           
         
            // primeira vez
            if (!Page.IsPostBack)
            {   
                ConfigRegiao();
                ConfigRamo();

                hddTipoArquivo.Value = "0";
                hddidOperacao.Value = "0";
                hddPrazo.Value = "VISTA";
                hddRegiaoTargetList.Value = "";
                hddRegiaoOldList.Value = ".";
                hddDDDOldList.Value = ".";
                hddDDDTargetList.Value = "";
                hddMunicipioTargetList.Value = "";
                hddDDDChanged.Value = "0";
                hddMUNChanged.Value = "0";
                hddMSRChanged.Value = "0";
                hddMCRChanged.Value = "0";
                hddMatrizFilial.Value = "";
                hddIdPesquisa.Value = "0";
                hddidOperacao.Value = "";
                hddVeiFabOldList.Value = "";
                hddCboCNPJ.Value = "";
                hddVeiMarChanged.Value = "0";
                hddVeiMarOldList.Value = "";
                hddVeiTipoOldList.Value = "";
                hddVeiTipoChanged.Value = "0";
                hddVeiModChanged.Value = "0";
                hddOrdemPalavraChave.Value = "2";
                hddWDeduplic.Value = "1";
                hddInputPesquisa.Value = "";
                


            };

        }
        #endregion

        void ExecutaPesquisa()
        {

             StringBuilder agrupamentos = new StringBuilder();            

            string filtros;
            filtros = Util.TrataFiltro(hddRamoTargetList.Value, "RAT", "");
            filtros = Util.TrataFiltro(hddRegiaoTargetList.Value, "UF", filtros);
        }


        void ConfigRegiao() 
        {
            var arrRegiaoTarget = hddRegiaoTargetList.Value.Split(';');

            rptRegiaoTarget.DataSource = Regioes.Listar().Where(Regiao => arrRegiaoTarget.Contains(Regiao.id.ToString())).ToList();
            rptRegiaoTarget.DataBind();

            rptRegiaoSource.DataSource = Regioes.Listar().Where(Regiao => !arrRegiaoTarget.Contains(Regiao.id.ToString())).ToList();
            rptRegiaoSource.DataBind();
        }


        void ConfigRamo()
        {



            // Listar apenas as selecionadas na tabela dos selecionados
            // --------------------------------------------------------



            var arrramoTarget = hddRamoTargetList.Value.Split(';');

            
            rptRamoTarget.DataSource = RamoAtv.Listar().Where(ramo => arrramoTarget.Contains(ramo.Id.ToString())).ToList();
            rptRamoTarget.DataBind();

                       
            rptRamoSource.DataSource = RamoAtv.Listar().Where(ramo => !arrramoTarget.Contains(ramo.Id.ToString())).ToList();
            rptRamoSource.DataBind();




        }


        #region btnPesquisar_Click
        protected void btnPesquisar_Click(object sender, EventArgs e)
        {

            ConfigRegiao();
            ConfigRamo();
            ExecutaPesquisa();

        }
        #endregion

        #region ExportExcel

        protected void ExportResultsExcel(object sender, EventArgs e)
        {
            DataTable table;
            bool createFile;

            if (Convert.ToInt16(hddidOperacao.Value) == 2 || Convert.ToInt16(hddidOperacao.Value) == 3)
            {
                 table = new DataTable();
                 createFile = false;
            }
            else
            {
                createFile = true;
                string sJsonData = hddtbContagem.Value;

                // convert json to class
                //---------------------

                var lstJson = ((Newtonsoft.Json.Linq.JArray)JsonConvert.DeserializeObject(sJsonData)).ToList();
                var lstPesqPJ = new List<PesqPJ>();


                if (lstJson.Count == 0)
                    return;

                for (int i = 0; i < lstJson.Count; i += 1)
                {
                    lstPesqPJ.Add(JsonConvert.DeserializeObject<PesqPJ>(lstJson[i].ToString()));
                };


                // converter lista para datatable
                // ------------------------------

                // Convert to DataTable.
                table = Util.ToDataTable(lstPesqPJ.ToList());

                // obtém lista de colunas habilitadas no client
                String[] arrFields = lstPesqPJ[0].seqFields.Split(',');

                // lista de campos a deletar
                var lstFieldsToDelete = new List<String>();

                // Obtém colunas a remover (não-exibidas no client)
                for (int i = 0; i < table.Columns.Count; i += 1)
                {
                    if (!arrFields.Contains(table.Columns[i].ColumnName))
                    {
                        // adiciona à lista de colunas a remover
                        lstFieldsToDelete.Add(table.Columns[i].ColumnName);
                    }
                };


                // remove colunas não-exibidas no client
                for (int i = 0; i < lstFieldsToDelete.Count; i += 1)
                {
                    // remove a coluna
                    table.Columns.Remove(lstFieldsToDelete[i]);
                };


                // obtém título de colunas habilitadas no client
                String[] arrFieldsCaption = lstPesqPJ[0].seqHeader.Split(',');

                // configura título das colunas exibidas no client
                for (int i = 0; i < arrFieldsCaption.Length; i += 1)
                {
                    // remove a coluna
                    //table.Columns[i].Caption = arrFieldsCaption[i];
                    table.Columns[i].ColumnName = arrFieldsCaption[i];
                };

            }

            // Export to Spreadsheet
            ExportToSpreadsheet(table, Convert.ToInt16(hddTipoArquivo.Value), Convert.ToInt16(hddidOperacao.Value), Convert.ToInt32(hddIdPesquisa.Value), createFile, true );

        }

        #endregion
        
        #region doSearch

        [System.Web.Services.WebMethod]
        public static searchReturnPesquisa doSearch(inputPesquisa oInputPesquisa)
        {
            int idvia = 0; /* Via 0 - Site */
           
            int tipoPesquisa = Convert.ToInt16(oInputPesquisa.tipoPesquisa);

            string filtros = TrataFiltrosPJ(oInputPesquisa);
            string filAdc = TrataFiltrosAdicionais(oInputPesquisa);

            StringBuilder agrupamentos = new StringBuilder();
            List<string> lstAgrup;
            if (Convert.ToInt16(oInputPesquisa.tipoPesquisa) == 2 || Convert.ToInt16(oInputPesquisa.tipoPesquisa) == 3) // Exportação
                if (oInputPesquisa.Campos == null)
                    lstAgrup = new List<string>();
                else
                {
                    if (oInputPesquisa.Campos.Contains("ZZZ"))
                    {
                        lstAgrup = new List<string>();
                        List<PesqPJ.FieldPesquisa> CamposPesq = PesqPJ.CamposPesquisa(1, 0, 0);
                        foreach (PesqPJ.FieldPesquisa item in CamposPesq)
                        {
                            if ((item.pessoa == 0 || item.pessoa == 1) && (item.uso == 0 || item.uso == 2))
                                lstAgrup.Add(item.id);
                        }
                    }
                    else
                        lstAgrup = oInputPesquisa.Campos;
                }
            else
                lstAgrup = oInputPesquisa.Agrupamentos;

            if (lstAgrup == null) 
                agrupamentos.Append("");
            else
                foreach (string aitem in lstAgrup)
                {
                    if (agrupamentos.Length > 0) agrupamentos.Append(",");
                    agrupamentos.Append(aitem);
                }


            var oSearchReturn = new searchReturnPesquisa();
            bool expAllReg;
            if (oInputPesquisa.AllRegExp == "true")
            { expAllReg = true;
        

            }
            else
            { expAllReg = false; }


            if (tipoPesquisa == 3) tipoPesquisa = 2;
            int qtdRegExp = 0;
            if ( ! (oInputPesquisa.QtdRegExp == String.Empty) )
                qtdRegExp = Convert.ToInt32(oInputPesquisa.QtdRegExp);

            resultValidacao oResult;

            if (Convert.ToInt16(oInputPesquisa.tipoPesquisa) == 3)
                {
                    oResult = new resultValidacao();
                    oResult.result = 1;
                }
            else
                 oResult = PesqPJ.ValidaPesquisa(0, 0, 0,0, 0, 0, 0, tipoPesquisa, agrupamentos.ToString(), filtros, filAdc, qtdRegExp, oInputPesquisa.Solic, oInputPesquisa.Projeto, oInputPesquisa.Prazo, oInputPesquisa.Obs, expAllReg);


            if (oResult.result > 0)
            {
                string ctextoFiltros = oInputPesquisa.textoFiltros.Replace("|", ". ").Replace(";", ",");

                if (agrupamentos.ToString().IndexOf("CGC") < 0  && tipoPesquisa==2 ) 
                   agrupamentos.Append(",CGC");

                PesqPJ.Pesquisa pesquisa = PesqPJ.Listar(0, 0, idvia, tipoPesquisa, filtros, filAdc, agrupamentos.ToString(), "", ctextoFiltros, 0, 0, qtdRegExp, oInputPesquisa.IP, oInputPesquisa.Solic, oInputPesquisa.Projeto, oInputPesquisa.Prazo, oInputPesquisa.Obs, expAllReg);
                if (tipoPesquisa == 2 && pesquisa.dataDtb.Rows.Count > 0)
                   for (int i = 1; i <= 2; i++) { ExportToSpreadsheet(pesquisa.dataDtb, i, tipoPesquisa, pesquisa.id, true, false); }

                oSearchReturn.lstRows = pesquisa.dados.ToList();
                oSearchReturn.idPesquisa = pesquisa.id;

                if (oSearchReturn.lstRows.Count == 0)
                {
                    oSearchReturn.lstRows = null;
                    oSearchReturn.status = -1;
                    oSearchReturn.msgRetorno = (Convert.ToInt16(oInputPesquisa.tipoPesquisa) == 2) ? "Não foram encontrados registros com os campos selecionados" : "Sem Dados para Contagem";
                    oSearchReturn.sTableHeaders = "";
                    oSearchReturn.sTableFields = "";
                }
              
               else 
                  { oSearchReturn.status = 1;
                    oSearchReturn.msgRetorno = "Consulta OK";
                    oSearchReturn.sTableHeaders = oSearchReturn.lstRows.First().seqHeader;
                    oSearchReturn.sTableFields = oSearchReturn.lstRows.First().seqFields;

                  }
            }
            else
            {
               // nenhuma região seleciona, retorna duas colunas (id e nome)
               oSearchReturn.lstRows = null;
               oSearchReturn.status = oResult.result;
               if (oResult.result == -2)
                   oSearchReturn.msgRetorno = (Convert.ToInt16(oInputPesquisa.tipoPesquisa) == 2) ? "Não foram encontrados registros com os campos selecionados" : "Sem Dados para Contagem";
               else if (oResult.result == -9)
                { 
                    string line1 = "";

                    line1 = "Tipo de Pesquisa:" + tipoPesquisa + "<br /> - Filtros: " + filtros + "<br /> - Filtros Adc " + filAdc + "<br /> - Agrupamentos: " + agrupamentos.ToString() + "<br /> -  Qtd: " + qtdRegExp.ToString();

                    //System.Threading.Tasks.Task.Run(() => Email.EnviaEmailC(user.IdUsuario, user.Cli_id, "ricardo.frasson@dataseek.com.br", htmlfile, lst));
                    oSearchReturn.msgRetorno = "Limite de exportação para usuário.  Um e-mail foi enviado ao administrador do sistema para exportação dos registros.";

                }
                else
                   oSearchReturn.msgRetorno = oResult.message;
               oSearchReturn.sTableHeaders = "";
               oSearchReturn.sTableFields = "";
            }

            return oSearchReturn;
        }


        #endregion

        #region doSearchDDD


        [System.Web.Services.WebMethod]
        public static searchReturnDDD doSearchDDD(inputPesquisa oInputPesquisa)
        {

            string filtros = Util.TrataFiltro(oInputPesquisa.LstIdRegiao, "UF", "");

            // prepara obtenção do usuário a partir do login
            List<DDD> lstDDD = null;
            lstDDD = DDD.Listar(filtros);   /*.Where(Regiao => Regiao.IdUsuario >= 3).ToList();*/
            
            // Teste de número variável de colunas
            var oSearchReturn = new searchReturnDDD();

            
            // nenhuma região seleciona, retorna duas colunas (id e nome)
            oSearchReturn.lstRows = lstDDD.ToList();
            oSearchReturn.lstEmpty = null;
            oSearchReturn.sTableHeaders = "DDD,UF,Registros,Registros";
            oSearchReturn.sTableFields = "ddd,uf,QtdRegistros,NroRegistros";

            return oSearchReturn;

        }


        #endregion

        #region doSearchMSR


        [System.Web.Services.WebMethod]
        public static searchReturndMSR doSearchMSR(inputPesquisa oInputPesquisa)
        {

            string filtros = Util.TrataFiltro(oInputPesquisa.LstIdRegiao, "UF", "");
            filtros = Util.TrataFiltro(oInputPesquisa.LstIdDDD, "DDD", filtros);


            // prepara obtenção do usuário a partir do login
            List<mesoregiao> lstMSR = null;
            lstMSR = mesoregiao.Listar(1,filtros);   /*.Where(Regiao => Regiao.IdUsuario >= 3).ToList();*/

            // Teste de número variável de colunas
            var oSearchReturn = new searchReturndMSR();


            // nenhuma região seleciona, retorna duas colunas (id e nome)
            oSearchReturn.lstRows = lstMSR.ToList();
            oSearchReturn.lstEmpty = null;
            oSearchReturn.sTableHeaders = "Id,MessoRegião,DDD,UF";
            oSearchReturn.sTableFields = "idmeso,nmmeso,ddd,uf";

            return oSearchReturn;

        }


        #endregion

        #region doSearchMCR


        [System.Web.Services.WebMethod]
        public static searchReturndMCR doSearchMCR(inputPesquisa oInputPesquisa)
        {

            string filtros = Util.TrataFiltro(oInputPesquisa.LstIdRegiao, "UF", "");
            filtros = Util.TrataFiltro(oInputPesquisa.LstIdDDD, "DDD", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.LstIdMSR, "MSR", filtros);


            // prepara obtenção do usuário a partir do login
            List<microregiao> lstMCR = null;
            lstMCR = microregiao.Listar(1, filtros);   /*.Where(Regiao => Regiao.IdUsuario >= 3).ToList();*/

            // Teste de número variável de colunas
            var oSearchReturn = new searchReturndMCR();


            // nenhuma região seleciona, retorna duas colunas (id e nome)
            oSearchReturn.lstRows = lstMCR.ToList();
            oSearchReturn.lstEmpty = null;
            oSearchReturn.sTableHeaders = "Id,MicroRegião,Id,MessoRegião,DDD,UF";
            oSearchReturn.sTableFields = "idmicro,nmmicro,idmeso,nmmeso,ddd,uf";

            return oSearchReturn;

        }


        #endregion

        #region doSearchMunicipio


        [System.Web.Services.WebMethod]
        public static searchReturnMunicipio doSearchMunicipio(inputPesquisa oInputPesquisa)
        {
            string filtros = Util.TrataFiltro(oInputPesquisa.LstIdRegiao, "UF", "");
            filtros = Util.TrataFiltro(oInputPesquisa.LstIdDDD, "DDD",filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.LstIdMSR, "MSR", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.LstIdMCR, "MCR", filtros);


            // prepara obtenção do usuário a partir do login
            List<Municipio> lstMUN = null;
            lstMUN = Municipio.Listar(filtros);   /*.Where(Regiao => Regiao.IdUsuario >= 3).ToList();*/

            // Teste de número variável de colunas
            var oSearchReturn = new searchReturnMunicipio();


            // nenhuma região seleciona, retorna duas colunas (id e nome)
            oSearchReturn.lstRows = lstMUN.ToList();
            oSearchReturn.lstEmpty = null;
            oSearchReturn.sTableHeaders = "Id,Município,UF,DDD,Registros,Registros";
            oSearchReturn.sTableFields = "id,Nome,UF,DDD,QtdRegistros,NroRegistros";

            return oSearchReturn;

        }


        #endregion

        #region doContagem

        [System.Web.Services.WebMethod]
        public static string doContagemAsync(inputPesquisa oInputPesquisa)
        {

            string filtros = TrataFiltrosPJ(oInputPesquisa);
            string filAdc = TrataFiltrosAdicionais(oInputPesquisa);


            Task<string> resultado = Task.Run(() =>
            {
                string r = PesqPJ.ContagemAsync(1, filtros, filAdc, 0).ToString("#,###,##0");
                return r;
            });

            return resultado.Result;



        }

        [System.Web.Services.WebMethod]
        public static searchReturnPesquisa doContagem(inputPesquisa oInputPesquisa)
        {

            string filtros = TrataFiltrosPJ(oInputPesquisa);
            string filAdc = TrataFiltrosAdicionais(oInputPesquisa);

            var oSearchReturn = new searchReturnPesquisa();
            oSearchReturn.idPesquisa = 0;
            oSearchReturn.status = 1;
            oSearchReturn.msgRetorno = "Consulta OK";
            oSearchReturn.sTableHeaders = String.Empty;
            oSearchReturn.sTableFields = String.Empty;

            oSearchReturn.quantidade = PesqPJ.Contagem(1, filtros, filAdc, 0).ToString("#,###,##0");

            return oSearchReturn;


        }

        #endregion  



        private static string TrataFiltrosPJ(inputPesquisa oInputPesquisa)
        {

            string filtros;
            filtros = Util.TrataFiltro(oInputPesquisa.LstIdRamo, "RAT", "");
            filtros = Util.TrataFiltro(oInputPesquisa.LstIdRegiao, "UF", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.LstIdDDD, "DDD", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.LstIdMUN, "MUN", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.LstIdMCR, "MCR", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.LstIdMSR, "MSR", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.MTZ, "MTZ", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.WCL, "WCL", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.WTL, "WTL", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.WFU, "WFU", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.WIE, "WIE", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.Saude, "SAU", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.WSD, "WSD", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.WEC, "WEC", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.DeptoContato, "CTT", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.CboCNPJ, "CBJ", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.MEI, "MEI", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.TOP1000, "TOP", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.RCJ, "RCJ", filtros);

            filtros = Util.TrataFiltro(oInputPesquisa.WDDL, "DDL", filtros);

            if (!(oInputPesquisa.DeptoContato == String.Empty))
               oInputPesquisa.Campos.Add("CTT");

           
            if (!(oInputPesquisa.CboCNPJ == String.Empty))                
                oInputPesquisa.Campos.Add("CBJ");

            string vlrimovel;
            if (oInputPesquisa.IVI == String.Empty)
                vlrimovel = "";
            else
                vlrimovel = (Convert.ToInt32(oInputPesquisa.IVI) / 100).ToString();
            filtros = Util.TrataFiltro(vlrimovel, "IVI", filtros);

            if (oInputPesquisa.IVF == String.Empty)
                vlrimovel = "";
            else
                vlrimovel = (Convert.ToInt32(oInputPesquisa.IVF) / 100).ToString();
            filtros = Util.TrataFiltro(vlrimovel, "IVF", filtros);


            string lucromensal;
            if (oInputPesquisa.LMI == String.Empty)
                lucromensal = "";
            else
                lucromensal = (Convert.ToInt32(oInputPesquisa.LMI) / 100).ToString();
            filtros = Util.TrataFiltro(lucromensal, "LMI", filtros);

            if (oInputPesquisa.LMF == String.Empty)
                lucromensal = "";
            else
                lucromensal = (Convert.ToInt32(oInputPesquisa.LMF) / 100).ToString();
            filtros = Util.TrataFiltro(lucromensal, "LMF", filtros);

            string capitalsocial;
            if (oInputPesquisa.CSI == String.Empty)
                capitalsocial = "";
            else
                capitalsocial = (Convert.ToInt32(oInputPesquisa.CSI) / 100).ToString();
            filtros = Util.TrataFiltro(capitalsocial, "CSI", filtros);

            if (oInputPesquisa.CSF == String.Empty)
                capitalsocial = "";
            else
                capitalsocial = (Convert.ToInt32(oInputPesquisa.CSF) / 100).ToString();
            filtros = Util.TrataFiltro(capitalsocial, "CSF", filtros);


            string lucroanual;
            if (oInputPesquisa.LAI == String.Empty)
                lucroanual = "";
            else
                lucroanual = (Convert.ToInt64(oInputPesquisa.LAI) / 100).ToString();
            filtros = Util.TrataFiltro(lucroanual, "LAI", filtros);

            if (oInputPesquisa.LAF == String.Empty)
                lucroanual = "";
            else
                lucroanual = (Convert.ToInt64(oInputPesquisa.LAF) / 100).ToString();
            filtros = Util.TrataFiltro(lucroanual, "LAF", filtros);


            /* Veículos */
            filtros = Util.TrataFiltro(oInputPesquisa.VTP, "VTP", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.VFB, "VFB", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.VMR, "VMR", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.VMD, "VMD", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.VAI, "VAI", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.VAF, "VAF", filtros);
            filtros = Util.TrataFiltro(oInputPesquisa.WVE, "WVE", filtros);

            /* cAMPOS abi E abf, PODEM vir no formato DD-MM-AAAA */
            string abi = oInputPesquisa.ABI;
            if (!(abi == String.Empty))
            {
              if (abi.Length < 10)
                  if ( Convert.ToInt16(abi.Substring(6, 2)) >= 30 )
                     abi = "19" + abi.Substring(6, 2) + "-" + abi.Substring(3, 2) + "-" + abi.Substring(0, 2);
                  else  
                     abi = "20" + abi.Substring(6, 2) + "-" + abi.Substring(3, 2) + "-" + abi.Substring(0, 2);
 
              else   
                  abi = abi.Substring(6, 4) + "-" + abi.Substring(3, 2) + "-" + abi.Substring(0, 2);

              filtros = Util.TrataFiltro(abi, "ABI", filtros);
            }

            string abf = oInputPesquisa.ABF;
            if (!(abf == String.Empty))
            {
                if (abf.Length < 10)
                    if (Convert.ToInt16(abf.Substring(6, 2)) >= 30)
                        abf = "19" + abf.Substring(6, 2) + "-" + abf.Substring(3, 2) + "-" + abf.Substring(0, 2);
                    else
                        abf = "20" + abf.Substring(6, 2) + "-" + abf.Substring(3, 2) + "-" + abf.Substring(0, 2);
                else   
                    abf = abf.Substring(6, 4) + "-" + abf.Substring(3, 2) + "-" + abf.Substring(0, 2);

                filtros = Util.TrataFiltro(abf, "ABF", filtros);
            }


            
            return filtros;
        }


        private static string TrataFiltrosAdicionais(inputPesquisa oInputPesquisa)
        {
            string filtros;
            StringBuilder filtroCPFCNPJ = new StringBuilder();
            char[] chrFiltro = oInputPesquisa.ListaCPFCNPJ.ToCharArray();

            foreach (var letra in chrFiltro)
            {
                if (char.IsDigit(letra))
                 {
                    filtroCPFCNPJ.Append(letra);
                 }
                else if (letra.ToString() == "," || letra.ToString() == ";")
                {
                    filtroCPFCNPJ.Append(";");
                }
            }


            StringBuilder filtroCEP = new StringBuilder();
            char[] chrFilCEP = oInputPesquisa.CEP.ToCharArray();

            foreach (var letra in chrFilCEP)
            {
                if (char.IsDigit(letra))
                {
                    filtroCEP.Append(letra);
                }
                else if (letra.ToString() == "," || letra.ToString() == ";")
                {
                    filtroCEP.Append(";");
                }
            }

            if (filtroCPFCNPJ.Length > 0)
                filtros = Util.TrataFiltro(filtroCPFCNPJ.ToString(), "CGC", "", oInputPesquisa.ExcluiCPFCNPJ == "true" ? 1 : 0);
            else
                filtros = "";

            if (filtroCEP.Length > 0)
                filtros = Util.TrataFiltro(oInputPesquisa.CEP, "CEP", filtros);

            if (oInputPesquisa.ListaEmail.Length > 0)
               filtros = Util.TrataFiltro(oInputPesquisa.ListaEmail.ToString(), "EML", filtros, oInputPesquisa.ExcluiEmail == "true" ? 1 : 0);

            if (oInputPesquisa.ListaDominio.Length > 0)
                filtros = Util.TrataFiltro(oInputPesquisa.ListaDominio.ToString(), "DOM", filtros, oInputPesquisa.ExcluiDominio == "true" ? 1 : 0);

            return filtros;
        }

        public class inputPesquisa
        {
            public string LstIdRegiao;
            public string LstIdFabr;
            public string lstIdMarca;
            public string lstIdTipo;
            public string LstIdDDD;
            public string LstIdMSR;
            public string LstIdMCR;
            public string LstIdMUN;
            public string LstIdRamo;
            public string LstIdPorte;
            public string LstIdFXE;
            public string LstIdFXF;
            public string LstIdTRB;
            public string LstIdSetor;
            public string LstIdEspecialidade;
            public List<string> Campos;
            public List<string> Agrupamentos;
            public string QFI;
            public string QFF;
            public string QLI;
            public string QLF;
            public string EME;
            public string WLE;
            public string STE;
            public string CTN;
            public string CTE;
            public string ECC;
            public string CTC;            
            public string FIC;
            public string FFC;
            public string CEP;
            public string IdUsuario;
            public string TipoContrato;
            public string QtdMaxPesq;
            public string TpLimPesq;
            public string QtdMaxExp;
            public string TpLimpExp;
            public string Cli_id;
            public string OpCel;
            public string OpTel;
            public string Operacao;
            public string NJ;
            public string IND;
            public string RSJ;
            public string IPE;
            public string tipoPesquisa;
            public string ListaCPFCNPJ;
            public string ExcluiCPFCNPJ;
            public string ListaEmail;
            public string ExcluiEmail;
            public string ListaDominio;
            public string ExcluiDominio;
            public string PalavraChave;
            public string Protestos;
            public string Dividas;
            public string textoFiltros;
            public string QtdRegExp;
            public string AllRegExp;
            public string IP;
            public string Solic;
            public string Projeto;
            public string Obs;
            public string Prazo;
            public string MTZ;
            public string ABI;
            public string ABF;
            public string WCL;
            public string WTL;
            public string WFU;
            public string WIE;
            public string VTP;
            public string VFB;
            public string VMR;
            public string VMD;
            public string VAI;
            public string VAF;
            public string WVE;
            public string WSD;
            public string WEC;
            public string Saude;
            public string IVI;
            public string IVF;
            public string LMI;
            public string LMF;
            public string CSI;
            public string CSF;
            public string LAI;
            public string LAF;
            public string MEI;
            public string TOP1000;
            public string RCJ;
            public string CboCNPJ;
            public string DeptoContato;
            public string email;
            public string crmid;
            public string WDDL;

            public inputPesquisa()
            {
                this.LstIdRegiao = "";
                this.LstIdFabr = "";
                this.lstIdMarca = "";
                this.lstIdTipo = "";
                this.LstIdDDD = "";
                this.LstIdMUN = "";
                this.LstIdRamo = "";
                this.LstIdPorte = "";
                this.LstIdFXE = "";
                this.LstIdFXF = "";
                this.LstIdTRB = "";
                this.LstIdSetor = "";
                this.LstIdEspecialidade = "";
                this.QFI = "";
                this.QFF = "";
                this.QLI = "";
                this.QLF = "";
                this.EME = "";
                this.WLE = "";
                this.STE = "";
                this.CTN = "";
                this.CTE = "";
                this.ECC = "";
                this.CTC = "";
                this.FIC = "";
                this.FFC = "";
                this.CEP = "";
                this.IdUsuario = "";
                this.TipoContrato = "";
                this.QtdMaxPesq = "";
                this.TpLimPesq = "";
                this.QtdMaxExp = "";
                this.TpLimpExp = "";
                this.Cli_id = "";
                this.OpCel = "";
                this.OpTel = "";
                this.Operacao = "";
                this.NJ = "";
                this.IND = "";
                this.RSJ = ""; 
                this.IPE = "";
                this.tipoPesquisa = "";
                this.ListaCPFCNPJ = "";
                this.ExcluiCPFCNPJ = "";
                this.ListaEmail = "";
                this.ExcluiEmail = "";
                this.ListaDominio = "";
                this.ExcluiDominio = "";
                this.PalavraChave = "";
                this.Protestos = "";
                this.Dividas = "";
                this.textoFiltros = "";
                this.QtdRegExp = "";
                this.AllRegExp = "";
                this.IP = "";
                this.Solic = "";
                this.Projeto = "";
                this.Obs = "";
                this.Prazo = "";
                this.MTZ = "";
                this.ABI = "";
                this.ABF = "";
                this.WCL = "";
                this.WTL = "";
                this.WFU = "";
                this.WIE = "";
                this.VTP = "";
                this.VFB = "";
                this.VMR = "";
                this.VMD = "";
                this.VAI = "";
                this.VAF = "";
                this.WVE = "";
                this.WSD = "";
                this.WEC = "";
                this.Saude = "";
                this.IVI = "";
                this.IVF = "";
                this.LMI = "";
                this.LMF = "";
                this.CSI = "";
                this.CSF = "";
                this.LAI = "";
                this.LAF = "";
                this.DeptoContato = "";
                this.CboCNPJ = "";
                this.email = "";
                this.crmid = "";
                this.MEI = "";
                this.TOP1000 = "";
                this.RCJ = "";
                this.WDDL = "";
            }

        }

        public class searchReturnDDD
        {
            public List<DDD> lstRows;
            public List<DDD> lstEmpty;
            public string sTableHeaders;
            public string sTableFields;
        }

        public class searchReturndMSR
        {
            public List<mesoregiao> lstRows;
            public List<mesoregiao> lstEmpty;
            public string sTableHeaders;
            public string sTableFields;

        }

        public class searchReturndMCR
        {
            public List<microregiao> lstRows;
            public List<microregiao> lstEmpty;
            public string sTableHeaders;
            public string sTableFields;

        }

        public class searchReturnMunicipio
        {
            public List<Municipio> lstRows;
            public List<Municipio> lstEmpty;
            public string sTableHeaders;
            public string sTableFields;
        }

        public class searchReturnPesquisa
        {
            public List<PesqPJ> lstRows;
            public int status;
            public string msgRetorno;
            public string sTableHeaders;
            public string sTableFields;
            public int idPesquisa;
            public string codigo;
            public string TipoContrato;
            public string dscTipoContrato;
            public string quantidade;
        }


        public class searchReturnCliente
        {
            public string cliCNPJ;
            public string cliRazao;
            public string cliFant;
            public string cliEndLgr;
            public string cliEndNro;
            public string cliEndCpl;
            public string cliEndBai;
            public string cliEndCep;
            public string cliEndMun;
            public string cliEndUF;
            public string contato;
            public string cliEmail;
            public string telefone;
            public string msgErro;
            public string codigo;
            public string TipoContrato;
            public string dscTipoContrato;

            public searchReturnCliente()
            {
                cliCNPJ = "";
                cliRazao = "";
                cliFant = "";
                cliEndLgr = "";
                cliEndNro = "";
                cliEndCpl = "";
                cliEndBai = "";
                cliEndCep = "";
                cliEndMun = "";
                cliEndUF = "";
                contato = "";
                cliEmail = "";
                telefone = "";
                msgErro = "";
                codigo = "";
                TipoContrato = "0";
                dscTipoContrato = "Não Definido";
            }
        }

        public class PropByContagem
        {
            public string idContagem;
            public int qtdRegistros;
            public int idTipoRegistro; /*1.Pessoa Jurídica, 2.Pessoa Física*/
            public int enviaBoleto;
            public string dstEmail1;
            public string dstEmail2;
            public string htmlFiltros;
            public string htmlContagem;
            public string nroProposta;
            public string Cli_id;
            public string idusuario;
            public string tipoPessoa;
            public string obs;
            public string diasPag;

            public PropByContagem()
            {
                idContagem = "";
                qtdRegistros = 0;
                idTipoRegistro = 0;
                dstEmail1 = "";
                dstEmail2 = "";
                htmlFiltros = "";
                htmlContagem = "";
                nroProposta = "";
                Cli_id = "";
                idusuario = "";
                tipoPessoa = "";
                obs = "";
                diasPag = "";
                enviaBoleto = 0;
            }

        }

        protected void ExportarPlanilha(object sender, EventArgs e)
        {
            Util.DownloadArquivo(1, 2, Convert.ToInt32(hddIdPesquisa.Value));
        }




        [System.Web.Services.WebMethod]
        public static void ExportToSpreadsheet(DataTable table, int tipoArquivo, int tpOper, int idArquivo, bool createFile, bool Download)
        {
            Util.ExportarArquivos(table, tipoArquivo, tpOper, idArquivo, createFile, Download);
        }

        protected void Limpar(object sender, EventArgs e)
        {
            Response.Redirect("PesquisaBase.aspx");
        }

    }


}