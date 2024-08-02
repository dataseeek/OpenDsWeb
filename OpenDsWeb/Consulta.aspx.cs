using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;
using System.IO;
using System.Text;
using Newtonsoft.Json;
using Microsoft.CSharp;
using System.Text.RegularExpressions;

namespace OpenDsWeb
{
    public partial class Consulta : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string cnpj = Request.QueryString["cnpj"];
            this.Master.ChangeTitle("Consultas");

            if (cnpj == null)
                this.hddCNPJ.Value = String.Empty;
            else
            {
                this.hddCNPJ.Value = cnpj;
            }
                

            

            // primeira vez
             if (!Page.IsPostBack)
             {

                this.hddContadoResult.Value = "0";
                this.hddPagAtual.Value = "0";
                this.hddHTMLConsulta.Value = "";

                
             };

        }


        #region doSearch

        [System.Web.Services.WebMethod]
        public static searchReturnPsqIdv_Open doSearch(inputPsqIdv_Open oInputPesquisa)
        {
            int idparametros = Convert.ToInt32(oInputPesquisa.IdParametros);
            if (idparametros > 11 || idparametros < 1)
            {   // força logout                
                HttpContext.Current.Session.Abandon();
                //System.Environment.Exit(0);
                throw new Exception("SESSAOEXPIRADA");
            }

            int idvia = 0; /* Via 0 - Site */

            int forcecompleto = 1;
            int tipoPesquisa = 2;
            int tipoPessoa = 2;

            StringBuilder oDocsPesquisa = new StringBuilder();

            switch (idparametros)
            {
                case 2: //CNPJ
                    tipoPessoa = 1;
                    oDocsPesquisa.Append(oInputPesquisa.ListaCPFCNPJ);
                    break;
                case 5: // Nome
                    tipoPessoa = 0;
                    break;
                default:
                    break;

            }

            StringBuilder agrupamentos = new StringBuilder();

            List<string> lstAgrup = new List<string>();

            if (idparametros == 5 || (idparametros == 6 && tipoPessoa == 12) || idparametros == 8 || idparametros == 9 || (idparametros == 10 && tipoPessoa == 12))
            {
                lstAgrup.Add("CPF"); 
                lstAgrup.Add("RAZ");
                lstAgrup.Add("TEM");
                lstAgrup.Add("RES");
            }
            else if (idparametros == 7 || (idparametros == 6 && tipoPessoa == 11) || (idparametros == 10 && tipoPessoa == 11) || idparametros == 11)
            {
                lstAgrup.Add("CGC");
                lstAgrup.Add("RAZ");
                lstAgrup.Add("END");
                lstAgrup.Add("TEL");
                lstAgrup.Add("CEL");
                lstAgrup.Add("EMJ");
                lstAgrup.Add("TMJ");
                lstAgrup.Add("STE");

            }


            else
            {
                List<PesqPJ.FieldPesquisa> CamposPesq = PesqPJ.CamposPesquisa(1, 0, 0);
                foreach (PesqPJ.FieldPesquisa item in CamposPesq)
                {
                    if ((item.pessoa == 0 || item.pessoa == tipoPessoa) && (item.uso == 0 || item.uso == 2) && (!(item.id == "VEI") || (idparametros == 3)))
                        lstAgrup.Add(item.id);
                }


                lstAgrup.Add("SIT");
                lstAgrup.Add("TMJ");
                lstAgrup.Add("LUA");
                lstAgrup.Add("CPS");

                if (tipoPessoa == 2)
                {
                    lstAgrup.Clear();
                    lstAgrup.Add("CPF");
                    lstAgrup.Add("TEM");
                    lstAgrup.Add("RAZ");
                    lstAgrup.Add("RES");
                    lstAgrup.Add("LKF");



                }
            }



            lstAgrup.Add("###");
            lstAgrup.Add("NEW");

            foreach (string item in lstAgrup)
            {
                if (!(agrupamentos.ToString() == String.Empty)) { agrupamentos.Append(","); }
                agrupamentos.Append(item);
            }

            var oSearchReturn = new searchReturnPsqIdv_Open();
            oSearchReturn.HabPF = 0;
           
            resultValidacao oResult;
            string filtros = "";
            string filtros2 = "";
            string filAdc = "";
            int qtdRegExp = 0;
            bool expAllReg = true;
            int tipoPJxPF = 0;

            if (oDocsPesquisa.ToString() == String.Empty && (idparametros == 4 || idparametros == 10 || idparametros == 3 || idparametros == 11 ))
            {
                // pesquisa por telefone nada retornou
                oResult = new resultValidacao();
                oResult.result = -2;
            }
            else
            {
                switch (tipoPessoa)
                {
                    case 1: // CNPJ
                        filAdc = "CGC(" + oDocsPesquisa.ToString() + ")";
                        tipoPJxPF = 1;
                        break;
                    case 2: //CPF 
                        filAdc = "CPF(" + oDocsPesquisa.ToString() + ")";
                        tipoPJxPF = 2;
                        break;
                    default:

                        switch (idparametros)
                        {
                          //  case 3: // Placa ou Renavam
                            //    filtros = "VRN(" + oInputPesquisa.Placa + ")";
                              //  tipoPessoa = 2;
                              //  break;
                            case 6: // Endereço
                                StringBuilder filEnd = new StringBuilder();
                                filEnd.Append("CEP(" + oInputPesquisa.CEP + ")");

                                if (!(oInputPesquisa.NroIni == String.Empty) && Convert.ToInt32(oInputPesquisa.NroIni) > 0)
                                { filEnd.Append(",NRI(" + oInputPesquisa.NroIni + ")"); }

                                if (!(oInputPesquisa.NroFim == String.Empty) && Convert.ToInt32(oInputPesquisa.NroFim) > 0)
                                { filEnd.Append(",NRF(" + oInputPesquisa.NroFim + ")"); }

                                filAdc = filEnd.ToString();
                                tipoPessoa = tipoPessoa - 10;
                                break;
                            case 5: // Nome
                                StringBuilder fil = new StringBuilder();
                                fil.Append("RZZ(" + oInputPesquisa.Nome + ")");

                                if (!(oInputPesquisa.Cidade == String.Empty))
                                {
                                    fil.Append(",MUN(" + oInputPesquisa.Cidade + ")");
                                }
                                else if (!(oInputPesquisa.Estado == String.Empty))
                                {
                                    fil.Append(",UF(" + oInputPesquisa.Estado + ")");
                                }

                                filtros = fil.ToString();
                                tipoPessoa = 2;
                                break;
                            case 7: // Razão Social
                                StringBuilder filRaz = new StringBuilder();
                                filRaz.Append("RZZ(" + oInputPesquisa.Nome + ")");

                                if (!(oInputPesquisa.Cidade == String.Empty))
                                {
                                    filRaz.Append(",MUN(" + oInputPesquisa.Cidade + ")");
                                }
                                else if (!(oInputPesquisa.Estado == String.Empty))
                                {
                                    filRaz.Append(",UF(" + oInputPesquisa.Estado + ")");
                                }

                                filtros = filRaz.ToString();
                                tipoPessoa = 1;
                                break;

                            case 8: // Vizinhos
                                qtdRegExp = 10;
                                filAdc = "!CPF(" + oInputPesquisa.ListaCPFCNPJ + ")";
                                filtros = "CEP(" + oInputPesquisa.CEP + "),NRI(" + oInputPesquisa.NroIni + "),NRF(" + oInputPesquisa.NroIni + ")";

                                StringBuilder NumeroSearch = new StringBuilder();
                                for (int i = 0; i < oInputPesquisa.NroIni.Length; i++)
                                {
                                    char digito = Convert.ToChar(oInputPesquisa.NroIni.Substring(i, 1));
                                    if (char.IsDigit(digito))
                                    {
                                        NumeroSearch.Append(digito.ToString());
                                    }

                                }
                                if (NumeroSearch.ToString() != string.Empty)
                                {
                                    int nroini = Convert.ToInt32(NumeroSearch.ToString()) - 50;
                                    if (nroini <= 0) { nroini = 1; }
                                    int nrofim = nroini + 100;

                                    filtros2 = "CEP(" + oInputPesquisa.CEP + "),NRI(" + nroini.ToString() + "),NRF(" + nrofim.ToString() + ")";

                                }
                                break;

                            case 9: // Parentes
                                qtdRegExp = 10;
                                filAdc = "!CPF(" + oInputPesquisa.ListaCPFCNPJ + ")";
                                filtros = "PCH(" + oInputPesquisa.Nome + "),MUN(" + oInputPesquisa.NroIni + ")";
                                filtros2 = "MAE(" + oInputPesquisa.Nome + "),MUN(" + oInputPesquisa.NroIni + ")";
                                break;

                          

                            default:
                                break;
                        }
                        break;

                }

                oResult = PesqPJ.ValidaPesquisa(tipoPessoa, 0, 0, 0, 0, 0, 0, 0, tipoPesquisa, agrupamentos.ToString(), filtros, filAdc, qtdRegExp, "", "", "", "", expAllReg);
            }
            if (oResult.result >= 0)
            {
                int nroPesquisa = 0;
                int nroPesquisaFim = 0;

                if (!(String.IsNullOrEmpty(oInputPesquisa.NroIni)))
                    nroPesquisa = Convert.ToInt32(oInputPesquisa.NroIni);

                if (!(String.IsNullOrEmpty(oInputPesquisa.NroFim)))
                    nroPesquisaFim = Convert.ToInt32(oInputPesquisa.NroFim);

                // nenhuma região seleciona, retorna duas colunas (id e nome)
                string ctextoFiltros = ((tipoPessoa == 1) ? "CNPJ" : "CPF") + ": " + filAdc;

                int midusuario = 0;

                PesqPJ.Pesquisa pesquisa;

                if (idparametros == 5)
                {
                    int imunid = 0;
                    string cUF = "";

                    if (!(oInputPesquisa.Cidade == String.Empty))
                    {
                        imunid = Convert.ToInt32(oInputPesquisa.Cidade);
                    }
                    else if (!(oInputPesquisa.Estado == String.Empty))
                    {
                        cUF = oInputPesquisa.Estado;
                    }
                    pesquisa = PesqPJ.ListaByNome(oInputPesquisa.Nome, cUF, imunid);

                }
                else if (idparametros == 7)
                {
                    int imunid = 0;
                    string cUF = "";

                    if (!(oInputPesquisa.Cidade == String.Empty))
                    {
                        imunid = Convert.ToInt32(oInputPesquisa.Cidade);
                    }
                    else if (!(oInputPesquisa.Estado == String.Empty))
                    {
                        cUF = oInputPesquisa.Estado;
                    }
                    pesquisa = PesqPJ.ListaByPJNome(oInputPesquisa.Nome, cUF, imunid);

                }

                else if (idparametros == 9)
                    pesquisa = PesqPJ.ListarParentes(oInputPesquisa.ListaCPFCNPJ, oInputPesquisa.Nome, nroPesquisa);               
                else if (idparametros == 6 && tipoPessoa == 2) //CORREÇÃO TIPO PESSOA = 2 PF TIPOPESSOA=1 PJ
                    pesquisa = PesqPJ.getPFbyEndereco(oInputPesquisa.CEP, nroPesquisa, nroPesquisaFim);              
              
                else if ((idparametros == 4 || idparametros == 10 || idparametros == 3 || idparametros == 11 ) && tipoPessoa == 1)
                    pesquisa = PesqPJ.ListaByCnpj(oDocsPesquisa.ToString());
                else
                    pesquisa = PesqPJ.Listar(tipoPessoa, midusuario, 0, idvia, tipoPesquisa, filtros, filAdc, agrupamentos.ToString(), "", ctextoFiltros, 0, 0, qtdRegExp, "", "", "", "", "", false);

             

                     oSearchReturn.lstRows = pesquisa.dados.ToList();
                    oSearchReturn.msgRetorno = "Consulta Realizada com Sucesso";
                    oSearchReturn.idPesquisa = pesquisa.id;
                


                switch (idparametros)
                {
                    case 5:
                        oSearchReturn.idHTML = 3;
                        break;
                    case 4:
                        if (tipoPessoa == 1)
                            oSearchReturn.idHTML = 4;
                        else
                            oSearchReturn.idHTML = 3;
                        break;
                    case 6:
                        if (tipoPessoa == 1)
                            oSearchReturn.idHTML = 4;
                        else
                            oSearchReturn.idHTML = 3;
                        break;

                    case 7:
                        oSearchReturn.idHTML = 4;
                        break;
                    case 8:
                        oSearchReturn.idHTML = 3;
                        break;
                    case 9:
                        oSearchReturn.idHTML = 3;
                        break;

                    case 10:
                        if (tipoPessoa == 1)
                            oSearchReturn.idHTML = 4;
                        else
                            oSearchReturn.idHTML = 3;
                        break;

                    case 11:
                        if (tipoPessoa == 1)
                            oSearchReturn.idHTML = 4;
                        else
                            oSearchReturn.idHTML = 3;
                        break;

                    case 3:
                        if (tipoPessoa == 1)
                            oSearchReturn.idHTML = 4;
                        else
                            oSearchReturn.idHTML = 3;
                        break;

                    default:
                        if (forcecompleto == 0 && (idparametros == 1 || idparametros == 2))
                        {
                            if (tipoPessoa == 1)
                                oSearchReturn.idHTML = 4;
                            else
                                oSearchReturn.idHTML = 3;
                            break;
                        }
                        else
                        {
                            oSearchReturn.idHTML = tipoPessoa;




                        }
                        break;
                }


                if (oSearchReturn.lstRows.Count == 0)
                {
                    oSearchReturn.lstRows = null;
                    oSearchReturn.status = -1;
                    oSearchReturn.msgRetorno = "Registro não foi encontrado em nossa base de dados";
                    oSearchReturn.sTableHeaders = "";
                    oSearchReturn.sTableFields = "";
                }
                else
                {
                    oSearchReturn.status = 1;
                    oSearchReturn.sTableHeaders = oSearchReturn.lstRows.First().seqHeader;
                    oSearchReturn.sTableFields = oSearchReturn.lstRows.First().seqFields;

                    if (tipoPJxPF == 1)
                    {
                        string strCNPJ = oDocsPesquisa.ToString();
                        int nPosComma = strCNPJ.IndexOf(',');
                        if (nPosComma >= 0)
                        {
                            strCNPJ = strCNPJ.Substring(0, nPosComma);
                        }
                        oSearchReturn.lstVinc = PFxPJ.getPFfromCNPJ(strCNPJ, 0);
                        oSearchReturn.lstVeic = null;
                        oSearchReturn.lstCNAEs = cnae.getListaCnaeSecundarioFromCNPJ(strCNPJ);
                        oSearchReturn.lstVincParentes = null;
                        oSearchReturn.lstHome = null;
                        oSearchReturn.dadosPF = null;
                        oSearchReturn.lstEndA = null;

                    }

                    else
                    {
                        oSearchReturn.lstVinc = null;
                        oSearchReturn.lstVincParentes = null;
                        oSearchReturn.lstVeic = null;
                        oSearchReturn.lstHome = null;
                        oSearchReturn.dadosPF = null;
                        oSearchReturn.lstEndA = null;
                    }

                }
            }
            else
            {
                // nenhuma região seleciona, retorna duas colunas (id e nome)
                oSearchReturn.lstRows = null;
                oSearchReturn.status = oResult.result;
                if (oResult.result == -2)
                    oSearchReturn.msgRetorno = "Não foram encontrados registros com os campos selecionados";
                else
                    oSearchReturn.msgRetorno = oResult.message;
                oSearchReturn.sTableHeaders = "";
                oSearchReturn.sTableFields = "";
            }

            return oSearchReturn;
        }


        #endregion

  





    } //Class consulta individual

    public class searchReturnPsqIdv_Open
    {
        public List<PesqPJ> lstRows;
        public List<PFxPJ> lstVinc;
        public List<PFxPJ> lstVincParentes;
        public List<PesqPJ> lstVeic;
        public List<PFxPJBasico> lstHome;
        public List<PesqPJ> dadosPF;
        public List<PesqPJ> lstEndA;
        public List<cnae> lstCNAEs;
        public int status;
        public string msgRetorno;
        public string sTableHeaders;
        public string sTableFields;
        public int idPesquisa;
        public int idHTML;
        public int HabPF;
    }

    public class inputPsqIdv_Open
    {
        public string TipoPessoa;
        public string IdUsuario;
        public string TipoContrato;
        public string QtdMaxPesq;
        public string TpLimPesq;
        public string QtdMaxExp;
        public string TpLimpExp;
        public string Cli_id;
        public string tipoPesquisa;
        public string ListaCPFCNPJ;
        public string telefone;
        public string IP;
        public string CEP;
        public string Nome;
        public string Cidade;
        public string Estado;
        public string IdParametros;
        public string Placa;
        public string NroIni;
        public string NroFim;
        public string ForceCompleto;
        public string Email;
        public string Site;
    }
}
