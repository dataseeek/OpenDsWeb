using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Globalization;

namespace OpenDsWeb
{
    public class PesqPJ
    {
        private string Cpf;
        private string Cnpj;

        public string id { get; set; }
        public string idlista { get; set; }
            
        public string seqFields { get; set; }
        public string seqHeader { get; set; }

        public string cnpj
        {
            get
            {
                return this.Cnpj;
            }
            set
            {
                if (!string.IsNullOrEmpty(value))
                {
                    string aux = value.Trim().PadLeft(14, '0');
                    this.Cnpj = aux.Substring(0, 2) + "." + aux.Substring(2, 3) + "." + aux.Substring(5, 3) + "/" + aux.Substring(8, 4) + "-" + aux.Substring(12, 2);
                }
            }
        }

        public object cnpjvinc { get; private set; }

        public string cpf
        {
            get
            {
                return this.Cpf;
            }
            set
            {
                if (!string.IsNullOrEmpty(value))
                {
                    string aux = value.Trim().PadLeft(11, '0');
                    this.Cpf = aux.Substring(0, 3) + "." + aux.Substring(3, 3) + "." + aux.Substring(6, 3) + "-" + aux.Substring(9, 2);
                }
            }
        }

        public string nm { get; set; }
        public string razao { get; set; }
        public string fantasia { get; set; }
        public string sexo { get; set; }
        public string dtnasc { get; set; }
        public int idade { get; set; }
        public string Idade { get; set; }
        public string endereco { get; set; }
        public string nro { get; set; }
        public string compl { get; set; }
        public string bairro { get; set; }
        public string idcidade { get; set; }
        public string cidade { get; set; }
        public string mesoregiao { get; set; }
        public string microregiao { get; set; }
        public string uf { get; set; }
        public string cep { get; set; }
        public string ddd { get; set; }
        public string latitude { get; set; }
        public string longitude { get; set; }
        public string tel1 { get; set; }
        public string tel2 { get; set; }
        public string tel3 { get; set; }
        public string tel4 { get; set; }
        public string tel5 { get; set; }

        public string tel1_valido { get; set; }
        public string tel2_valido { get; set; }
        public string tel3_valido { get; set; }
        public string email_website { get; set; }

        public string operadora { get; set; }
        public string cel1 { get; set; }
        public string cel2 { get; set; }
        public string cel3 { get; set; }
        public string opcel { get; set; }
        public string email { get; set; }
        public string email2 { get; set; }
        public string site { get; set; }
        public string abertura { get; set; }
        public string nomecontato { get; set; }
        public string nomecontato2 { get; set; }
        public string nomecontato3 { get; set; }

        public string cargocontato { get; set; }
        public string cargocontato2 { get; set; }
        public string cargocontato3 { get; set; }

        public string celcontato { get; set; }
        public string celcontato2 { get; set; }
        public string celcontato3 { get; set; }
        public string qt_socios { get; set; }

        public string emailAdc { get; set; }
        public string cnae { get; set; }
        public string cnae_desc { get; set; }
        public string cnae2 { get; set; }
        public string cnae2_desc { get; set; }
        public string idcargo { get; set; }
        public string cargo { get; set; }
        public string idporte { get; set; }
        public string porte { get; set; }
        public string nrofuncionario { get; set; }
        public string fe { get; set; }
        public string idsetor { get; set; }
        public string setor { get; set; }
        public string tributacao { get; set; }
        public string especialidades { get; set; }
        public string regime { get; set; }
        public string situacao { get; set; }
        public string capital { get; set; }
        public string mtz { get; set; }
        public string nj { get; set; }
        public string ie { get; set; }
        public string ff { get; set; }
        public string escnom { get; set; }
        public string ecvnom { get; set; }
        public string cbo { get; set; }
        public string obito { get; set; }
        public string prfnom { get; set; }
        public string clsnom { get; set; }
        public string bancos { get; set; }
        public string cartao { get; set; }
        public string divfed { get; set; }
        public string protestos { get; set; }
        public string cartorio { get; set; }
        public string saude { get; set; }
        public string servicos { get; set; }
        public string servoper { get; set; }
        public string veirenavam { get; set; }
        public string veiano { get; set; }
        public string veinomemod { get; set; }
        public string veinomemarca { get; set; }
        public string veinomefab { get; set; }
        public string veinometipo { get; set; }
        public string veiplaca { get; set; }
        public string veidataincl { get; set; }
        public string renda { get; set; }
        public string pis { get; set; }
        public string scoretel1 { get; set; }
        public string score { get; set; }
        public string faixa { get; set; }
        public string estciv { get; set; }
        public string profissao { get; set; }
        public string operacao { get; set; }
        public string classerisco { get; set; }
        public string fpublico { get; set; }
        public string tituloeleitor { get; set; }
        public string zona { get; set; }
        public string secao { get; set; }
        public string tipobeneficio { get; set; }
        public string esp { get; set; }
        public string agencia { get; set; }
        public string tipobanco { get; set; }
        public string emailhash { get; set; }

        public int QtdRegistros { get; set; }
        public int QtdEnderecos { get; set; }
        public int QtdTelefones { get; set; }
        public int QtdCelular { get; set; }
        public int QtdEmail { get; set; }
        public int QtdSite { get; set; }
        public int QtdDtNasc { get; set; }
        public int QtdEmpresaVinc { get; set; }
        public int QtdContatos { get; set; }
        public int QtdObitos { get; set; }
        public int QtdSocios { get; set; }
        public int QtdSPE { get; set; }
        public int QtdMae { get; set; }
        public int QtdCBO { get; set; }
        public int QtdEscola { get; set; }

        public string dominio { get; set; }
        public string ecommsite { get; set; }
        public string imvemp { get; set; }
        public string imvvlr { get; set; }
        public string lucromes { get; set; }
        public string lucroano { get; set; }
        public string fieid { get; set; }
        public string fieidnom { get; set; }
        public string tem_end { get; set; }
        public string tem_tel { get; set; }
        public string tem_cel { get; set; }
        public string tem_mae { get; set; }
        public string tem_dtn { get; set; }
        public string tem_obt { get; set; }
        public string tem_eml { get; set; }
        public string fxrenda { get; set; }
        public string mae { get; set; }
        public string empresa_razao { get; set; }
        public string empresa_cidade { get; set; }
        public string empresa_uf { get; set; }
        public string empresa_ddd { get; set; }
        public string empresa_tel1 { get; set; }
        public string empresa_tel2 { get; set; }
        public string empresa_tel3 { get; set; }
        public string empresa_tel4 { get; set; }
        public string empresa_tel5 { get; set; }
        public string empresa_email { get; set; }
        public string empresa_email2 { get; set; }

        public string empresa_contato_depto { get; set; }
        public string empresa_contato_nivel { get; set; }
        public int emrpesa_contato_deptoid { get; set; }

        public string empresa_contato1_cpf { get; set; }
        public string empresa_contato1_nome { get; set; }
        public string empresa_contato1_cargo { get; set; }
        public string empresa_contato1_participacao { get; set; }
        public string empresa_contato1_dataentrada { get; set; }
        public string empresa_contato1_ddd { get; set; }
        public string empresa_contato1_telefone { get; set; }
        public string empresa_contato1_celular { get; set; }
        public string empresa_contato1_email { get; set; }
        public string empresa_contato1_cbo { get; set; }
        public string empresa_contato1_linkedin { get; set; }

        public string empresa_contato2_cpf { get; set; }
        public string empresa_contato2_nome { get; set; }
        public string empresa_contato2_cargo { get; set; }
        public string empresa_contato2_participacao { get; set; }
        public string empresa_contato2_dataentrada { get; set; }
        public string empresa_contato2_ddd { get; set; }
        public string empresa_contato2_telefone { get; set; }
        public string empresa_contato2_celular { get; set; }
        public string empresa_contato2_email { get; set; }
        public string empresa_contato2_cbo { get; set; }
        public string empresa_contato2_link { get; set; }

        public string empresa_contato3_cpf { get; set; }
        public string empresa_contato3_nome { get; set; }
        public string empresa_contato3_cargo { get; set; }
        public string empresa_contato3_participacao { get; set; }
        public string empresa_contato3_dataentrada { get; set; }
        public string empresa_contato3_ddd { get; set; }
        public string empresa_contato3_telefone { get; set; }
        public string empresa_contato3_celular { get; set; }
        public string empresa_contato3_email { get; set; }
        public string empresa_contato3_cbo { get; set; }
        public string empresa_contato3_link { get; set; }

        public string empresa_contato4_cpf { get; set; }
        public string empresa_contato4_nome { get; set; }
        public string empresa_contato4_cargo { get; set; }
        public string empresa_contato4_participacao { get; set; }
        public string empresa_contato4_dataentrada { get; set; }
        public string empresa_contato4_ddd { get; set; }
        public string empresa_contato4_telefone { get; set; }
        public string empresa_contato4_celular { get; set; }
        public string empresa_contato4_email { get; set; }
        public string empresa_contato4_cbo { get; set; }
        public string empresa_contato4_link { get; set; }

        public string empresa_contato5_cpf { get; set; }
        public string empresa_contato5_nome { get; set; }
        public string empresa_contato5_cargo { get; set; }
        public string empresa_contato5_participacao { get; set; }
        public string empresa_contato5_dataentrada { get; set; }
        public string empresa_contato5_ddd { get; set; }
        public string empresa_contato5_telefone { get; set; }
        public string empresa_contato5_celular { get; set; }
        public string empresa_contato5_email { get; set; }
        public string empresa_contato5_cbo { get; set; }
        public string empresa_contato5_link { get; set; }
        public string mei { get; set; }
        public string top1000 { get; set; }
        public string marketshare { get; set; }
        public string media_faturamento_cnae { get; set; }
        public string qtde_empresas_cnae { get; set; }
        public string industria { get; set; }
        public string ecorp { get; set; }
        public string filiais { get; set; }
        public string facebook { get; set; }
        public string seguidores { get; set; }
        public string linkedin_company { get; set; }
        public string linkedin_contatos { get; set; }
        public string linkedin_pessoa { get; set; }
        public string especialidade { get; set; }

        public string data_situacao { get; set; }
        public string motivo_situacao { get; set; }

        public struct FieldPesquisa
        {
            public string id;
            public string nome;
            public int pessoa; /* 1.PJ  2.PF  0.Ambas*/
            public int uso; /* 1.Contagem  2.Exportação 0.Ambos */
        }

        public struct Pesquisa
        {
            public List<PesqPJ> dados;
            public string campos;
            public int id;
            public DataTable dataDtb;
        }



        public static string registroHtml(PesqPJ registro)


        {

            StringBuilder retorno = new StringBuilder();

            retorno.Append("<table class='table table-striped table-hover dataTable'>");

            if (!(registro.cpf == null)) { retorno.Append("<tr><td><strong>CPF</strong><br />" + registro.cpf.Trim() + "</td>"); }

            if (!(registro.cnpj == null)) { retorno.Append("<tr><td><strong>CNPJ</strong><br />" + registro.cnpj.Trim() + "</td>"); }

            if (!(registro.razao == null)) { retorno.Append("<td><strong>Nome</strong><br />" + registro.razao.Trim() + "</td>"); }

            if (!(registro.fantasia == null)) { retorno.Append("<td><strong>Nome Fantasia</strong><br />" + registro.fantasia.Trim() + "</td>"); }

            if (!(registro.abertura == null)) { retorno.Append("<td><strong>Data de abertura</strong><br />" + registro.abertura.Trim() + "</td>"); }

            if (!(registro.setor == null)) { retorno.Append("<td><strong>Setor</strong><br />" + registro.setor.Trim() + "</td>"); }

            if (!(registro.especialidades == null)) { retorno.Append("<td><strong>Especialidades</strong><br />" + registro.especialidades.Trim() + "</td>"); }

            if (!(registro.latitude == null)) { retorno.Append("<td><strong>Latitude</strong><br />" + registro.latitude.Trim() + "</td>"); }

            if (!(registro.longitude == null)) { retorno.Append("<td><strong>Longitude</strong><br />" + registro.longitude.Trim() + "</td>"); }

            if (!(registro.data_situacao == null)) { retorno.Append("<td><strong>Data da Situacao</strong><br />" + registro.data_situacao.Trim() + "</td>"); }

            if (!(registro.motivo_situacao == null)) { retorno.Append("<td><strong>Motivo da Situacao</strong><br />" + registro.motivo_situacao.Trim() + "</td>"); }

            if (!(registro.fe == null)) { retorno.Append("<td><strong>Faixa de Empregados</strong><br />" + registro.fe.Trim() + "</td>"); }

            if (!(registro.ff == null)) { retorno.Append("<td><strong>Faixa de Faturamento</strong><br />" + registro.ff.Trim() + "</td>"); }

            if (!(registro.tributacao == null)) { retorno.Append("<td><strong>Tributação</strong><br />" + registro.tributacao.Trim() + "</td>"); }


            if (!(registro.situacao == null)) { retorno.Append("<td><strong>Situação</strong><br />" + registro.situacao.Trim() + "</td></tr>"); }

            if (!(registro.sexo == null)) { retorno.Append("<td><strong>Sexo</strong><br /> " + registro.sexo.Trim() + "</td>"); }

            if (!(registro.dtnasc == null)) { retorno.Append("<td><strong>Data de Nascimento</strong><br />" + registro.dtnasc.Trim() + "</td>"); }

            if (!(registro.Idade == null)) { retorno.Append("<td><strong>Idade</strong><br />" + registro.Idade.Trim() + "</td>"); }

            if (!(registro.clsnom == null)) { retorno.Append("<td><strong>Classe Social</strong><br />" + registro.clsnom.Trim() + "</td>"); }

            if (!(registro.prfnom == null)) { retorno.Append("<td><strong>Ocupação</strong><br />" + registro.prfnom.Trim() + "</td></tr>"); }

            if (!(registro.endereco == null)) { retorno.Append("<tr><td><strong>Endereço</strong><br />" + registro.endereco.Trim() + "</td>"); }

            if (!(registro.nro == null)) { retorno.Append("<td><strong>Número</strong><br />" + registro.nro.Trim() + "</td>"); }

            if (!(registro.compl == null)) { retorno.Append("<td><strong>Complemento</strong><br />" + registro.compl.Trim() + "</td>"); }

            if (!(registro.bairro == null)) { retorno.Append("<td><strong>Bairro</strong><br />" + registro.bairro.Trim() + "</td>"); }

            if (!(registro.cidade == null)) { retorno.Append("<td><strong>Cidade</strong><br />" + registro.cidade.Trim() + "</td>"); }

            if (!(registro.mesoregiao == null)) { retorno.Append("<td><strong>MesoRegiao</strong><br />" + registro.mesoregiao.Trim() + "</td>"); }

            if (!(registro.microregiao == null)) { retorno.Append("<td><strong>MicroRegiao</strong><br />" + registro.microregiao.Trim() + "</td>"); }

            if (!(registro.uf == null)) { retorno.Append("<td><strong>Estado</strong><br />" + registro.uf.Trim() + "</td>"); }

            if (!(registro.cep == null)) { retorno.Append("<td><strong>CEP</strong><br />" + registro.cep.Trim() + "</td></tr>"); }

            if (!(registro.ddd == null)) { retorno.Append("<tr><td><strong>DDD</strong><br />" + registro.ddd.Trim() + "</td>"); }

            if (!(registro.tel1 == null)) { retorno.Append("<td><strong>Telefone1</strong><br /><a href='sip:" + trataTelefoneVoip(registro.ddd.Trim(), registro.tel1.Trim()) + "'>" + registro.ddd.Trim() + "-" + registro.tel1.Trim() + "</td>"); }

            if (!(registro.scoretel1 == null)) { retorno.Append("<td><strong>Score</strong><br />" + registro.scoretel1.Trim() + "</td></tr>"); }

            if (!(registro.tel2 == null)) { retorno.Append("<td><strong>Telefone2</strong><br /><a href='sip:" + trataTelefoneVoip(registro.ddd.Trim(), registro.tel2.Trim()) + "'>" + registro.tel2.Trim() + "</td>"); }

            if (!(registro.tel3 == null)) { retorno.Append("<td><strong>Telefone3</strong><br /><a href='sip:" + trataTelefoneVoip(registro.ddd.Trim(), registro.tel3.Trim()) + "'>" + registro.tel3.Trim() + "</td>"); }

            if (!(registro.tel4 == null)) { retorno.Append("<td><strong>Telefone4</strong><br /><a href='sip:" + trataTelefoneVoip(registro.ddd.Trim(), registro.tel4.Trim()) + "'>" + registro.tel4.Trim() + "</td>"); }

            if (!(registro.tel5 == null)) { retorno.Append("<td><strong>Telefone5</strong><br /><a href='sip:" + trataTelefoneVoip(registro.ddd.Trim(), registro.tel5.Trim()) + "'>" + registro.tel5.Trim() + "</td>"); }

            if (!(registro.operadora == null)) { retorno.Append("<td><strong>Operadora</strong><br />" + registro.operadora.Trim() + "</td></tr>"); }

            if (!(registro.cel1 == null)) { retorno.Append("<tr><td><strong>Celular 1</strong><br /><a href='sip:" + trataTelefoneVoip("", registro.cel1.Trim()) + "'>" + registro.cel1.Trim() + "</td>"); }

            if (!(registro.cel2 == null)) { retorno.Append("<td><strong>Celular 2</strong><br /><a href='sip:" + trataTelefoneVoip("", registro.cel2.Trim()) + "'>" + registro.cel2.Trim() + "</td>"); }

            if (!(registro.cel3 == null)) { retorno.Append("<td><strong>Celular 3</strong><br /><a href='sip:" + trataTelefoneVoip("", registro.cel3.Trim()) + "'>" + registro.cel3.Trim() + "</td>"); }

            if (!(registro.opcel == null)) { retorno.Append("<td><strong>Operadora Celular</strong><br />" + registro.opcel.Trim() + "</td>"); }

            if (!(registro.email == null)) { retorno.Append("<td><strong>Email</strong><br /><a href='mailto:" + registro.email.Trim() + "'>" + registro.email.Trim() + "</a></td>"); }

            if (!(registro.email2 == null)) { retorno.Append("<td><strong>Email 2</strong><br /><a href='mailto:" + registro.email2.Trim() + "'>" + registro.email2.Trim() + "</a></td></tr>"); }

            if (!(registro.site == null)) { retorno.Append("<td><strong>Website</strong><br /><a href='" + registro.site.Trim() + "' target='_blank'>" + registro.site.Trim() + "</a></td>"); }

            if (!(registro.nomecontato == null)) { retorno.Append("<td><strong>Contato principal</strong><br />" + registro.nomecontato.Trim() + "</td>"); }

            if (!(registro.nomecontato2 == null)) { retorno.Append("<td><strong>Contato 2</strong><br />" + registro.nomecontato2.Trim() + "</td>"); }

            if (!(registro.nomecontato3 == null)) { retorno.Append("<td><strong>Contato 3</strong><br />" + registro.nomecontato3.Trim() + "</td>"); }


            if (!(registro.emailAdc == null)) { retorno.Append("<td><strong>Email do contato</strong><br /><a href='mailto:" + registro.emailAdc.Trim() + "'>" + registro.emailAdc.Trim() + "</a></td></tr>"); }

            if (!(registro.cnae == null)) { retorno.Append("<tr><td><strong>CNAE principal</strong><br />" + registro.cnae.Trim() + "</td>"); }

            if (!(registro.cnae2 == null)) { retorno.Append("<td><strong>CNAE secundáro</strong><br />" + registro.cnae2.Trim() + "</td>"); }

            if (!(registro.cargo == null)) { retorno.Append("<td><strong>Cargo</strong><br />" + registro.cargo.Trim() + "</td>"); }

            if (!(registro.porte == null)) { retorno.Append("<td><strong>Porte</strong><br />" + registro.porte.Trim() + "</td>"); }

            if (!(registro.nrofuncionario == null)) { retorno.Append("<td><strong>Funcionários</strong><br />" + registro.nrofuncionario.Trim() + "</td>"); }

            if (!(registro.regime == null)) { retorno.Append("<td><strong>Regime</strong><br />" + registro.regime.Trim() + "</td>"); }

            if (!(registro.mtz == null)) { retorno.Append("<td><strong>Matriz/Filial</strong><br />" + registro.mtz.Trim() + "</td></tr>"); }

            if (!(registro.nj == null)) { retorno.Append("<tr><td><strong>Natureza Jurídica</strong><br />" + registro.nj.Trim() + "</td>"); }

            if (!(registro.ie == null)) { retorno.Append("<td><strong>Inscrição Estadual</strong><br />" + registro.ie.Trim() + "</td>"); }

            if (!(registro.escnom == null)) { retorno.Append("<tr><td><strong>Grau de instrução</strong><br />" + registro.escnom.Trim() + "</td>"); }

            if (!(registro.ecvnom == null)) { retorno.Append("<tr><td><strong>Estado Civil</strong><br />" + registro.ecvnom.Trim() + "</td>"); }

            if (!(registro.servicos == null)) { retorno.Append("<td><strong>Tipo Serviço</strong><br />" + registro.servicos.Trim() + "</td>"); }

            if (!(registro.servoper == null)) { retorno.Append("<td><strong>Operadora do serviço</strong><br />" + registro.servoper.Trim() + "</td>"); }

            if (!(registro.saude == null)) { retorno.Append("<td><strong>Plano de saúde</strong><br />" + registro.saude.Trim() + "</td></tr>"); }

            if (!(registro.veirenavam == null)) { retorno.Append("<p>Renavam:" + registro.veirenavam.Trim() + "</p>"); }

            if (!(registro.veiplaca == null)) { retorno.Append("<p>Placa:" + registro.veiplaca.Trim() + "</p>"); }

            if (!(registro.veidataincl == null)) { retorno.Append("<p>Data:" + registro.veidataincl.Trim() + "</p>"); }

            if (!(registro.veiano == null)) { retorno.Append("<p>Ano:" + registro.veiano.Trim() + "</p>"); }

            if (!(registro.veinomemod == null)) { retorno.Append("<p>Modelo:" + registro.veinomemod.Trim() + "</p>"); }

            if (!(registro.veinomemarca == null)) { retorno.Append("<p>Marca:" + registro.veinomemarca.Trim() + "</p>"); }

            if (!(registro.veinomefab == null)) { retorno.Append("<p>Fabricante:" + registro.veinomefab.Trim() + "</p>"); }

            if (!(registro.veinometipo == null)) { retorno.Append("<p>Tipo:" + registro.veinometipo.Trim() + "</p>"); }

            if (!(registro.divfed == null)) { retorno.Append("<tr><td><strong>Dividas Impostos Federais</strong><br />" + registro.divfed.Trim() + "</td>"); }

            if (!(registro.protestos == null)) { retorno.Append("<td><strong>Protesto nos últimos 6 meses</strong><br />" + registro.protestos.Trim() + "</td>"); }

            if (!(registro.cartorio == null)) { retorno.Append("<td><strong>Cartório</strong><br />" + registro.cartorio.Trim() + "</td></tr>"); }

            if (!(registro.renda == null)) { retorno.Append("<td><strong>Renda</strong><br />" + registro.renda.Trim() + "</td></tr>"); }

            if (!(registro.pis == null)) { retorno.Append("<td><strong>PIS</strong><br />" + registro.pis.Trim() + "</td></tr>"); }

            if (!(registro.faixa == null)) { retorno.Append("<td><strong>Faixa</strong><br />" + registro.faixa.Trim() + "</td></tr>"); }

            if (!(registro.tipobeneficio == null)) { retorno.Append("<td><strong>Tipo Beneficio</strong><br />" + registro.tipobeneficio.Trim() + "</td></tr>"); }

            if (!(registro.operacao == null)) { retorno.Append("<td><strong>Índice de Operação</strong><br />" + registro.operacao.Trim() + "</td></tr>"); }

            if (!(registro.fpublico == null)) { retorno.Append("<td><strong>Funcionário Público</strong><br />" + registro.fpublico.Trim() + "</td></tr>"); }

            if (!(registro.score == null)) { retorno.Append("<td><strong>Score</strong><br />" + registro.score.Trim() + "</td></tr>"); }

            if (!(registro.tituloeleitor == null)) { retorno.Append("<td><strong>Nr.Título Eleitor</strong><br />" + registro.tituloeleitor.Trim() + "</td></tr>"); }

            if (!(registro.zona == null)) { retorno.Append("<td><strong>Zona</strong><br />" + registro.zona.Trim() + "</td></tr>"); }

            if (!(registro.secao == null)) { retorno.Append("<td><strong>Secao</strong><br />" + registro.secao.Trim() + "</td></tr>"); }

            retorno.Append("</table>");

            return retorno.ToString();

        }





        public static string validaListaCampos(List<string> lstCampos, int pessoa, int cli_id, int tipocontrato)
        {
            StringBuilder retorno = new StringBuilder();

            if (lstCampos.Count == 0)
            { retorno.Append("Nenhum Campo Informado para Pesquisa"); }
            else
            {
                List<FieldPesquisa> lstCamposValidos = CamposPesquisa(pessoa, cli_id, tipocontrato);

                foreach (string campo in lstCampos)
                {
                    FieldPesquisa f = lstCamposValidos.Find(x => x.id == campo);
                    if (String.IsNullOrEmpty(f.id) || !(f.pessoa == 0 || f.pessoa == pessoa))
                    {
                        if (retorno.ToString() == String.Empty)
                        { retorno.Append("Campos Inválidos: " + campo); }
                        else
                        { retorno.Append(", " + campo); }

                    }

                }
            }

            return retorno.ToString();
        }

        public static string validaListaCampos(string lstCampos, int pessoa, int cli_id, int tipocontrato)
        {
            return validaListaCampos(lstCampos.Split(',').ToList(), pessoa, cli_id, tipocontrato);
        }

        public static string limpaListaCampos(string strCampos)
        {
            StringBuilder strRetorno = new StringBuilder();
            List<string> lstRetorno = new List<string>();
            List<string> lstInput = strCampos.Split(',').ToList();

            foreach (string item in lstInput)
            {
                if (String.IsNullOrEmpty(lstRetorno.Find(x => x == item)) && !(item == "CGC" || item == "CPF"))
                {
                    lstRetorno.Add(item.Trim());
                }
            }

            foreach (string item in lstRetorno)
            {
                if (!(strRetorno.ToString() == String.Empty)) { strRetorno.Append(","); }
                strRetorno.Append(item);
            }

            return strRetorno.ToString();

        }

        public static string trataTelefone(string telefone)
        {
            string retorno;

            /*if (telefone.Length > 9)
            {
                retorno = "(" + telefone.Substring(0, 2) + ") " + telefone.Substring(2);
            }
            else
            {
                retorno = telefone;
            }*/

            retorno = telefone;

            return retorno;

        }

        public static string trataTelefoneVoip(string DDD, string telefone)
        {
            string retorno;

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

        public static List<FieldPesquisa> CamposPesquisa(int pessoa, int cli_id, int tipoContrato)
        {

            List<FieldPesquisa> cRetCamposPesquisa = new List<FieldPesquisa>();

            FieldPesquisa cFieldPesquisa;

            cFieldPesquisa.id = "RAZ";
            cFieldPesquisa.nome = (pessoa == 1 ? "Razão Social" : "Nome");
            cFieldPesquisa.pessoa = 0;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "FAN";
            cFieldPesquisa.nome = "Nome Fantasia";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            /*cFieldPesquisa.id = "MAE";
            cFieldPesquisa.nome = "Nome da Mãe";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);*/

            cFieldPesquisa.id = "TEL";
            cFieldPesquisa.nome = "Telefone";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "TLF";
            cFieldPesquisa.nome = "Telefone";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "CEL";
            cFieldPesquisa.nome = "Celular";
            cFieldPesquisa.pessoa = 0;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            /*
            cFieldPesquisa.id = "OPC";
            cFieldPesquisa.nome = "Operadora de Celular";
            cFieldPesquisa.pessoa = 0;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);
            */

            cFieldPesquisa.id = "END";
            cFieldPesquisa.nome = "Endereço";
            cFieldPesquisa.pessoa = 0;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "LLT";
            cFieldPesquisa.nome = "Latitude e Longitude";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "DMS";
            cFieldPesquisa.nome = "Data e Motivo da Situacao";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            /*
            cFieldPesquisa.id = "BAI";
            cFieldPesquisa.nome = "Bairro";
            cFieldPesquisa.pessoa = 0;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "CEP";
            cFieldPesquisa.nome = "CEP";
            cFieldPesquisa.pessoa = 0;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);
             * */

            cFieldPesquisa.id = "FUN";
            cFieldPesquisa.nome = "Nro. de Funcionários";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 2;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "FXF";
            cFieldPesquisa.nome = "Faixa de Faturamento";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 2;
            cRetCamposPesquisa.Add(cFieldPesquisa); 

            cFieldPesquisa.id = "EME";
            cFieldPesquisa.nome = "Email";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 2;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "EMJ";
            cFieldPesquisa.nome = "Email";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 2;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            
            cFieldPesquisa.id = "STE";
            cFieldPesquisa.nome = "Site";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 2;
            cRetCamposPesquisa.Add(cFieldPesquisa);
            

            /*
            cFieldPesquisa.id = "UF";
            cFieldPesquisa.nome = "Estado";
            cFieldPesquisa.pessoa = 0;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "MUN";
            cFieldPesquisa.nome = "Cidade";
            cFieldPesquisa.pessoa = 0;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);
             * */

            cFieldPesquisa.id = "DDD";
            cFieldPesquisa.nome = "DDD";
            cFieldPesquisa.pessoa = 0;
            cFieldPesquisa.uso = 1;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "RAT";
            cFieldPesquisa.nome = "Ramo de Atividade";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "PRT";
            cFieldPesquisa.nome = "Porte";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "SET";
            cFieldPesquisa.nome = "Setor";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "ESP";
            cFieldPesquisa.nome = "Especialidades";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "CTN";
            cFieldPesquisa.nome = "Nome do Contato";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "CTT";
            cFieldPesquisa.nome = "Contatos";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            /*FieldPesquisa.id = "CTE";
            cFieldPesquisa.nome = "Email do Contato";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);
            */

            /*cFieldPesquisa.id = "CRG";
            cFieldPesquisa.nome = "Cargo";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);*/

            cFieldPesquisa.id = "CGC";
            cFieldPesquisa.nome = "CNPJ";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "CPF";
            cFieldPesquisa.nome = "CPF";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "RGM";
            cFieldPesquisa.nome = "Regime";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            /*cFieldPesquisa.id = "SIT";
            cFieldPesquisa.nome = "Situação";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);*/

            cFieldPesquisa.id = "MTZ";
            cFieldPesquisa.nome = "Matriz-Filial";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "NJ";
            cFieldPesquisa.nome = "Natureza Jurídica";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "ABE";
            cFieldPesquisa.nome = "Abertura";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "IE";
            cFieldPesquisa.nome = "Inscrição Estadual";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            /*
            cFieldPesquisa.id = "DIV";
            cFieldPesquisa.nome = "Dívidas";
            cFieldPesquisa.pessoa = 0;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);
            */

            /*
            cFieldPesquisa.id = "PTR";
            cFieldPesquisa.nome = "Protestos";
            cFieldPesquisa.pessoa = 0;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);
            */

            cFieldPesquisa.id = "SX";
            cFieldPesquisa.nome = "Sexo";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "CBO";
            cFieldPesquisa.nome = "Ocupação";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "DTN";
            cFieldPesquisa.nome = "Data de Nascimento";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "IDD";
            cFieldPesquisa.nome = "Idade";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            /*cFieldPesquisa.id = "OBT";
            cFieldPesquisa.nome = "Óbito";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);*/

            cFieldPesquisa.id = "ESC";
            cFieldPesquisa.nome = "Escolaridade";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "CLA";
            cFieldPesquisa.nome = "Classe Social";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "LKF";
            cFieldPesquisa.nome = "Linkedin";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);


            cFieldPesquisa.id = "BAN";
            cFieldPesquisa.nome = "Banco";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "CRT";
            cFieldPesquisa.nome = "Cartão";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "SAU";
            cFieldPesquisa.nome = "Plano de Saúde";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "SRV";
            cFieldPesquisa.nome = "Serviços Adquiridos";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "ECS";
            cFieldPesquisa.nome = "Site e-Commerce";
            cFieldPesquisa.pessoa = 0;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "IMV";
            cFieldPesquisa.nome = "Imóvel";
            cFieldPesquisa.pessoa = 0;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "IPE";
            cFieldPesquisa.nome = "Valor Importação-Exportação";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "PIS";
            cFieldPesquisa.nome = "Número PIS";
            cFieldPesquisa.pessoa = 2;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);


            cFieldPesquisa.id = "MEI";
            cFieldPesquisa.nome = "MEI";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "TOP";
            cFieldPesquisa.nome = "TOP 1000";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "MKS";
            cFieldPesquisa.nome = "MARKET SHARE";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "MFC";
            cFieldPesquisa.nome = "MÉD.FAT.CNAE";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);


            cFieldPesquisa.id = "QEC";
            cFieldPesquisa.nome = "QTD.EMP.CNAE";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "IND";
            cFieldPesquisa.nome = "Indústria";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            /*
            cFieldPesquisa.id = "EMC";
            cFieldPesquisa.nome = "Email Corporativo";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);
            */

            cFieldPesquisa.id = "FIL";
            cFieldPesquisa.nome = "Número de Filiais";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);


            cFieldPesquisa.id = "FCB";
            cFieldPesquisa.nome = "FaceBook";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);

            cFieldPesquisa.id = "LNK";
            cFieldPesquisa.nome = "Linkedin";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);


            /*
            cFieldPesquisa.id = "RSJ";
            cFieldPesquisa.nome = "Risco";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);
            */
            /*
            cFieldPesquisa.id = "OPR";
            cFieldPesquisa.nome = "Índice de Operação";
            cFieldPesquisa.pessoa = 1;
            cFieldPesquisa.uso = 0;
            cRetCamposPesquisa.Add(cFieldPesquisa);
            */

            if (cli_id == 0 || tipoContrato == 3)
            {
                cFieldPesquisa.id = "VEI";
                cFieldPesquisa.nome = "Veículo";
                cFieldPesquisa.pessoa = 0;
                cFieldPesquisa.uso = 0;
                cRetCamposPesquisa.Add(cFieldPesquisa);
            }

            return cRetCamposPesquisa;

        }

        public static string ListaNomeCampos(int pidTabela, string ListaSiglaCampos, int cli_id, int tipoContrato)
        {
            List<FieldPesquisa> lstCampos = CamposPesquisa(pidTabela, cli_id, tipoContrato);
            string[] campos = ListaSiglaCampos.Split(',');
            StringBuilder lstNomeCampos = new StringBuilder();
            foreach (string item in campos)
            {
                FieldPesquisa f = lstCampos.Find(x => x.id == item);
                string cNomeItem = f.nome ?? item;
                if (lstNomeCampos.Length > 0) { lstNomeCampos.Append(","); }
                lstNomeCampos.Append(cNomeItem);
            }

            return lstNomeCampos.ToString();
        }


        public void reset()
        {
            this.id = "";
            this.nomecontato = "";
            this.qt_socios = "";
            this.QtdRegistros = 0;
            this.QtdEnderecos = -1;
            this.QtdTelefones = -1;
            this.QtdCelular = -1;
            this.QtdEmail = -1;
            this.QtdSite = -1;
            this.QtdDtNasc = -1;
            this.QtdEmpresaVinc = -1;
            this.QtdContatos = -1;
            this.QtdObitos = -1;
            this.QtdMae = -1;
            this.QtdSocios= -1;
            this.QtdSPE = -1;
            this.QtdCBO = -1;
            this.QtdEscola = -1;
            this.cnpj = null;
            this.cnpjvinc = null;
            this.razao = null;
            this.fantasia = null;
            this.endereco = null;
            this.nro = null;
            this.compl = null;
            this.bairro = null;
            this.cep = null;
            this.nrofuncionario = null;
            this.dominio = null;
            this.site = null;
            this.email = null;
            this.email2 = null;
            this.nomecontato = null;
            this.cpf = null;
            this.emailAdc = null;
            this.uf = null;
            this.ddd = null;
            this.idcidade = null;
            this.cidade = null;
            this.mesoregiao = null;
            this.microregiao = null;
            this.cnae = null;
            this.cnae_desc = null;
            this.idcargo = null;
            this.cargo = null;
            this.idporte = null;
            this.porte = null;
            this.idsetor = null;
            this.setor = null;
            this.especialidades = null;
            this.tel1 = null;
            
            this.tel1_valido = null;
            this.tel2_valido = null;
            this.tel3_valido = null;
            this.email_website = null;

            this.tel2 = null;
            this.tel3 = null;
            this.tel4 = null;
            this.tel5 = null;
            this.cnae2 = null;
            this.cnae2_desc = null;
            this.cel1 = null;
            this.cel2 = null;
            this.cel3 = null;
            this.opcel = null;
            this.regime = null;
            this.situacao = null;
            this.capital = null;
            this.mtz = null;
            this.nj = null;
            this.abertura = null;
            this.ie = null;
            this.divfed = null;
            this.protestos = null;
            this.cartorio = null;
            this.sexo = null;
            this.operadora = null;
            this.idade = 0;
            this.Idade = null;
            this.obito = null;
            this.escnom = null;
            this.ecvnom = null;
            this.cbo = null;
            this.prfnom = null;
            this.clsnom = null;
            this.bancos = null;
            this.cartao = null;
            this.saude = null;
            this.servicos = null;
            this.servoper = null;
            this.veirenavam = null;
            this.veiano = null;
            this.veinomemod = null;
            this.veinomefab = null;
            this.veinomemarca = null;
            this.veinometipo = null;
            this.veiplaca = null;
            this.veidataincl = null;
            this.ecommsite = null;
            this.imvemp = null;
            this.imvvlr = null;
            this.renda = null;
            this.pis = null;
            this.scoretel1 = null;
            this.faixa = null;
            this.tipobeneficio = null;
            this.agencia = null;
            this.tipobanco = null;
            this.operacao = null;
            this.fpublico = null;
            this.tituloeleitor = null;
            this.emailhash = null;
            this.zona = null;
            this.secao = null;
            this.score = null;
            this.lucromes = null;
            this.lucroano = null;
            this.fieid = null;
            this.fieidnom = null;
            this.tem_mae = null;
            this.tem_tel = null;
            this.tem_end = null;
            this.tem_cel = null;
            this.tem_dtn = null;
            this.tem_obt = null;
            this.tem_eml = null;
            this.fxrenda = null;
            this.mae = null;
            this.empresa_razao = null;
            this.empresa_cidade = null;
            this.empresa_uf = null;
            this.empresa_ddd = null;
            this.empresa_tel1 = null;
            this.empresa_tel2 = null;
            this.empresa_tel3 = null;
            this.empresa_tel4 = null;
            this.empresa_tel5 = null;
            this.empresa_email = null;
            this.empresa_email2 = null;

            this.empresa_contato_depto = null;
            this.empresa_contato_nivel = null;
            this.emrpesa_contato_deptoid = -1;

            this.empresa_contato5_cpf = null;
            this.empresa_contato5_nome = null;
            this.empresa_contato5_cargo = null;
            this.empresa_contato5_participacao = null;
            this.empresa_contato5_dataentrada = null;
            this.empresa_contato5_ddd = null;
            this.empresa_contato5_telefone = null;
            this.empresa_contato5_celular = null;
            this.empresa_contato5_email = null;
            this.empresa_contato5_cbo = null;
            this.empresa_contato5_link = null;

            this.empresa_contato4_cpf = null;
            this.empresa_contato4_nome = null;
            this.empresa_contato4_cargo = null;
            this.empresa_contato4_participacao = null;
            this.empresa_contato4_dataentrada = null;
            this.empresa_contato4_ddd = null;
            this.empresa_contato4_telefone = null;
            this.empresa_contato4_celular = null;
            this.empresa_contato4_email = null;
            this.empresa_contato4_cbo = null;
            this.empresa_contato4_link = null;

            this.empresa_contato3_cpf = null;
            this.empresa_contato3_nome = null;
            this.empresa_contato3_cargo = null;
            this.empresa_contato3_participacao = null;
            this.empresa_contato3_dataentrada = null;
            this.empresa_contato3_ddd = null;
            this.empresa_contato3_telefone = null;
            this.empresa_contato3_celular = null;
            this.empresa_contato3_email = null;
            this.empresa_contato3_cbo = null;
            this.empresa_contato3_link = null;

            this.empresa_contato2_cpf = null;
            this.empresa_contato2_nome = null;
            this.empresa_contato2_cargo = null;
            this.empresa_contato2_participacao = null;
            this.empresa_contato2_dataentrada = null;
            this.empresa_contato2_ddd = null;
            this.empresa_contato2_telefone = null;
            this.empresa_contato2_celular = null;
            this.empresa_contato2_email = null;
            this.empresa_contato2_cbo = null;
            this.empresa_contato2_link = null;

            this.empresa_contato1_cpf = null;
            this.empresa_contato1_nome = null;
            this.empresa_contato1_cargo = null;
            this.empresa_contato1_participacao = null;
            this.empresa_contato1_dataentrada = null;
            this.empresa_contato1_ddd = null;
            this.empresa_contato1_telefone = null;
            this.empresa_contato1_celular = null;
            this.empresa_contato1_email = null;
            this.empresa_contato1_cbo = null;
            this.empresa_contato1_linkedin = null;
            this.mei = null;
            this.top1000 = null;
            this.marketshare = null;
            this.media_faturamento_cnae = null;
            this.qtde_empresas_cnae = null;
            this.industria = null;
            this.ecorp = null;
            this.filiais = null;
            this.facebook = null;
            this.seguidores = null;
            this.linkedin_company = null;
            this.linkedin_contatos = null;
            this.linkedin_pessoa = null;
            this.especialidade = null;
            this.fe = null;
            this.ff = null;
            this.tributacao = null;
            this.nomecontato2 = null;
            this.nomecontato3 = null;

            this.cargocontato = null;
            this.cargocontato2 = null;
            this.cargocontato3 = null;
            this.celcontato = null;
            this.celcontato2 = null;
            this.celcontato3 = null;

            this.latitude = null;
            this.longitude = null;
            this.data_situacao = null;
            this.motivo_situacao = null;
            this.idlista = null;

        }

        #region Bind
        private static List<PesqPJ> Bind(DataTable dt, int idTabela)
        {
            List<PesqPJ> items = new List<PesqPJ>();
            foreach (DataRow dr in dt.Rows)
                items.Add(Bind(dr, idTabela));
            return items;
        }

        private static Pesquisa Bind(DataTable dt, int idTabela, int maxItensLista)
        {
            int contador = 0;
            Pesquisa pesquisa = new Pesquisa();

            List<PesqPJ> items = new List<PesqPJ>();
            DataTable dtResult = new DataTable();

            foreach (DataRow dr in dt.Rows)
            {
                PesqPJ it = Bind(dr, idTabela);
                contador = contador + 1;

                if (contador <= maxItensLista || maxItensLista == 0) { items.Add(it); }

                if (contador == 1)
                {
                    string[] propheader = it.seqHeader.Split(',');
                    foreach (string nomeprop in propheader)
                        dtResult.Columns.Add(nomeprop);
                }


                string[] props = it.seqFields.Split(',');
                var row = new object[props.Length];
                int countcolumn = 0;
                foreach (string nomeprop in props)
                {
                    var column = typeof(PesqPJ).GetProperty(nomeprop).GetValue(it, null);
                    countcolumn = countcolumn + 1;
                    row[countcolumn - 1] = column;
                }

                dtResult.Rows.Add(row);
            }

            pesquisa.dados = items;
            pesquisa.dataDtb = dtResult;

            return pesquisa;
        }
        #endregion

        public PesqPJ()
        {
            reset();
        }

        #region Bind
        private static PesqPJ Bind(DataRow dr, int idTabela)
        {
            List<string> lstCampos = new List<string>();
            List<string> lstHeader = new List<string>();

            PesqPJ item = new PesqPJ();

            if (Util.ValidaDbNull(dr, "empresa_contato_depto"))
            { item.empresa_contato_depto = dr["empresa_contato_depto"].ToString(); lstCampos.Add("empresa_contato_depto"); lstHeader.Add("DeptoContato"); }

            if (Util.ValidaDbNull(dr, "empresa_contato_nivel"))
            { item.empresa_contato_nivel = dr["empresa_contato_nivel"].ToString(); lstCampos.Add("empresa_contato_nivel"); lstHeader.Add("Nível.DeptoContato"); }


            if (Util.ValidaDbNull(dr, "empresa_contato1_cpf"))
            { item.empresa_contato1_cpf = dr["empresa_contato1_cpf"].ToString(); lstCampos.Add("empresa_contato1_cpf"); lstHeader.Add("CPF1"); }

            if (Util.ValidaDbNull(dr, "empresa_contato1_nome"))
            { item.empresa_contato1_nome = dr["empresa_contato1_nome"].ToString(); lstCampos.Add("empresa_contato1_nome"); lstHeader.Add("NOME CONTATO#1"); }

            
            if (Util.ValidaDbNull(dr, "empresa_contato1_cargo"))
            { item.empresa_contato1_cargo = dr["empresa_contato1_cargo"].ToString().ToUpper(); lstCampos.Add("empresa_contato1_cargo"); lstHeader.Add("Cargo1"); }
            

            if (Util.ValidaDbNull(dr, "empresa_contato1_participacao"))
            { item.empresa_contato1_participacao = dr["empresa_contato1_participacao"].ToString(); lstCampos.Add("empresa_contato1_participacao"); lstHeader.Add("Participacao"); }

            if (Util.ValidaDbNull(dr, "empresa_contato1_dataentrada"))
            { item.empresa_contato1_dataentrada = dr["empresa_contato1_dataentrada"].ToString(); lstCampos.Add("empresa_contato1_dataentrada"); lstHeader.Add("DtEntrada"); }

            if (Util.ValidaDbNull(dr, "empresa_contato1_ddd"))
            { item.empresa_contato1_ddd = dr["empresa_contato1_ddd"].ToString(); lstCampos.Add("empresa_contato1_ddd"); lstHeader.Add("DDDContato1"); }

            if (Util.ValidaDbNull(dr, "empresa_contato1_telefone"))
            { item.empresa_contato1_telefone = dr["empresa_contato1_telefone"].ToString(); lstCampos.Add("empresa_contato1_telefone"); lstHeader.Add("Telefone"); }

            if (Util.ValidaDbNull(dr, "empresa_contato1_celular"))
            { item.empresa_contato1_celular = dr["empresa_contato1_celular"].ToString(); lstCampos.Add("empresa_contato1_celular"); lstHeader.Add("Celular"); }

            if (Util.ValidaDbNull(dr, "empresa_contato1_email"))
            { item.empresa_contato1_email = dr["empresa_contato1_email"].ToString(); lstCampos.Add("empresa_contato1_email"); lstHeader.Add("EmailContato"); }

            if (Util.ValidaDbNull(dr, "empresa_contato1_cbo"))
            { item.empresa_contato1_cbo = dr["empresa_contato1_cbo"].ToString(); lstCampos.Add("empresa_contato1_cbo"); lstHeader.Add("CBO"); }

            if (Util.ValidaDbNull(dr, "empresa_contato1_linkedin"))
            { item.empresa_contato1_linkedin = dr["empresa_contato1_linkedin"].ToString(); lstCampos.Add("empresa_contato1_linkedin"); lstHeader.Add("PAGINA_LINKEDIN"); }


            if (Util.ValidaDbNull(dr, "empresa_contato2_cpf"))
            { item.empresa_contato2_cpf = dr["empresa_contato2_cpf"].ToString(); lstCampos.Add("empresa_contato2_cpf"); lstHeader.Add("CPFContato2"); }

            if (Util.ValidaDbNull(dr, "empresa_contato2_nome"))
            { item.empresa_contato2_nome = dr["empresa_contato2_nome"].ToString(); lstCampos.Add("empresa_contato2_nome"); lstHeader.Add("NOME CONTATO #2"); }

            
            if (Util.ValidaDbNull(dr, "empresa_contato2_cargo"))
            { item.empresa_contato2_cargo = dr["empresa_contato2_cargo"].ToString(); lstCampos.Add("empresa_contato2_cargo"); lstHeader.Add("CargoContato2"); }
            

            if (Util.ValidaDbNull(dr, "empresa_contato2_participacao"))
            { item.empresa_contato2_participacao = dr["empresa_contato2_participacao"].ToString(); lstCampos.Add("empresa_contato2_participacao"); lstHeader.Add("ParticipacaoContato2"); }

            if (Util.ValidaDbNull(dr, "empresa_contato2_dataentrada"))
            { item.empresa_contato2_dataentrada = dr["empresa_contato2_dataentrada"].ToString(); lstCampos.Add("empresa_contato2_dataentrada"); lstHeader.Add("DtEntradaContato2"); }

            if (Util.ValidaDbNull(dr, "empresa_contato2_ddd"))
            { item.empresa_contato2_ddd = dr["empresa_contato2_ddd"].ToString(); lstCampos.Add("empresa_contato2_ddd"); lstHeader.Add("DDDContato2"); }

            if (Util.ValidaDbNull(dr, "empresa_contato2_telefone"))
            { item.empresa_contato2_telefone = dr["empresa_contato2_telefone"].ToString(); lstCampos.Add("empresa_contato2_telefone"); lstHeader.Add("TelefoneContato2"); }

            if (Util.ValidaDbNull(dr, "empresa_contato2_celular"))
            { item.empresa_contato2_celular = dr["empresa_contato2_celular"].ToString(); lstCampos.Add("empresa_contato2_celular"); lstHeader.Add("CEL CONTATO#2"); }

            if (Util.ValidaDbNull(dr, "empresa_contato2_email"))
            { item.empresa_contato2_email = dr["empresa_contato2_email"].ToString(); lstCampos.Add("empresa_contato2_email"); lstHeader.Add("EmailContato2"); }

            if (Util.ValidaDbNull(dr, "empresa_contato2_cbo"))
            { item.empresa_contato2_cbo = dr["empresa_contato2_cbo"].ToString(); lstCampos.Add("empresa_contato2_cbo"); lstHeader.Add("CBOContato2"); }

            if (Util.ValidaDbNull(dr, "empresa_contato2_link"))
            { item.empresa_contato2_link = dr["empresa_contato2_link"].ToString(); lstCampos.Add("empresa_contato2_link"); lstHeader.Add("LinkContato2"); }


            if (Util.ValidaDbNull(dr, "empresa_contato3_cpf"))
            { item.empresa_contato3_cpf = dr["empresa_contato3_cpf"].ToString(); lstCampos.Add("empresa_contato3_cpf"); lstHeader.Add("CPFContato3"); }

            if (Util.ValidaDbNull(dr, "empresa_contato3_nome"))
            { item.empresa_contato3_nome = dr["empresa_contato3_nome"].ToString(); lstCampos.Add("empresa_contato3_nome"); lstHeader.Add("NomeContato3"); }

            if (Util.ValidaDbNull(dr, "empresa_contato3_cargo"))
            { item.empresa_contato3_cargo = dr["empresa_contato3_cargo"].ToString(); lstCampos.Add("empresa_contato3_cargo"); lstHeader.Add("CargoContato3"); }

            if (Util.ValidaDbNull(dr, "empresa_contato3_participacao"))
            { item.empresa_contato3_participacao = dr["empresa_contato3_participacao"].ToString(); lstCampos.Add("empresa_contato3_participacao"); lstHeader.Add("ParticipaçãoContato3"); }

            if (Util.ValidaDbNull(dr, "empresa_contato3_dataentrada"))
            { item.empresa_contato3_dataentrada = dr["empresa_contato3_dataentrada"].ToString(); lstCampos.Add("empresa_contato3_dataentrada"); lstHeader.Add("DtEntradaContato3"); }

            if (Util.ValidaDbNull(dr, "empresa_contato3_ddd"))
            { item.empresa_contato3_ddd = dr["empresa_contato3_ddd"].ToString(); lstCampos.Add("empresa_contato3_ddd"); lstHeader.Add("DDDContato3"); }

            if (Util.ValidaDbNull(dr, "empresa_contato3_telefone"))
            { item.empresa_contato3_telefone = dr["empresa_contato3_telefone"].ToString(); lstCampos.Add("empresa_contato3_telefone"); lstHeader.Add("TelefoneContato3"); }

            if (Util.ValidaDbNull(dr, "empresa_contato3_celular"))
            { item.empresa_contato3_celular = dr["empresa_contato3_celular"].ToString(); lstCampos.Add("empresa_contato3_celular"); lstHeader.Add("CelularContato3"); }

            if (Util.ValidaDbNull(dr, "empresa_contato3_email"))
            { item.empresa_contato3_email = dr["empresa_contato3_email"].ToString(); lstCampos.Add("empresa_contato3_email"); lstHeader.Add("EmailContato3"); }

            if (Util.ValidaDbNull(dr, "empresa_contato3_cbo"))
            { item.empresa_contato3_cbo = dr["empresa_contato3_cbo"].ToString(); lstCampos.Add("empresa_contato3_cbo"); lstHeader.Add("CBOContato3"); }

            if (Util.ValidaDbNull(dr, "empresa_contato3_link"))
            { item.empresa_contato3_link = dr["empresa_contato3_link"].ToString(); lstCampos.Add("empresa_contato3_link"); lstHeader.Add("LinkContato3"); }


            if (Util.ValidaDbNull(dr, "empresa_contato4_cpf"))
            { item.empresa_contato4_cpf = dr["empresa_contato4_cpf"].ToString(); lstCampos.Add("empresa_contato4_cpf"); lstHeader.Add("CPFContato4"); }

            if (Util.ValidaDbNull(dr, "empresa_contato4_nome"))
            { item.empresa_contato4_nome = dr["empresa_contato4_nome"].ToString(); lstCampos.Add("empresa_contato4_nome"); lstHeader.Add("NomeContato4"); }

            if (Util.ValidaDbNull(dr, "empresa_contato4_cargo"))
            { item.empresa_contato4_cargo = dr["empresa_contato4_cargo"].ToString(); lstCampos.Add("empresa_contato4_cargo"); lstHeader.Add("CargoContato4"); }

            if (Util.ValidaDbNull(dr, "empresa_contato4_participacao"))
            { item.empresa_contato4_participacao = dr["empresa_contato4_participacao"].ToString(); lstCampos.Add("empresa_contato4_participacao"); lstHeader.Add("ParticipacaoContato4"); }

            if (Util.ValidaDbNull(dr, "empresa_contato4_dataentrada"))
            { item.empresa_contato4_dataentrada = dr["empresa_contato4_dataentrada"].ToString(); lstCampos.Add("empresa_contato4_dataentrada"); lstHeader.Add("DtEntradaContato4"); }

            if (Util.ValidaDbNull(dr, "empresa_contato4_ddd"))
            { item.empresa_contato4_ddd = dr["empresa_contato4_ddd"].ToString(); lstCampos.Add("empresa_contato4_ddd"); lstHeader.Add("DDDContato4"); }

            if (Util.ValidaDbNull(dr, "empresa_contato4_telefone"))
            { item.empresa_contato4_telefone = dr["empresa_contato4_telefone"].ToString(); lstCampos.Add("empresa_contato4_telefone"); lstHeader.Add("TelefoneContato4"); }

            if (Util.ValidaDbNull(dr, "empresa_contato4_celular"))
            { item.empresa_contato4_celular = dr["empresa_contato4_celular"].ToString(); lstCampos.Add("empresa_contato4_celular"); lstHeader.Add("CelularContato4"); }

            if (Util.ValidaDbNull(dr, "empresa_contato4_email"))
            { item.empresa_contato4_email = dr["empresa_contato4_email"].ToString(); lstCampos.Add("empresa_contato4_email"); lstHeader.Add("EmailContato4"); }

            if (Util.ValidaDbNull(dr, "empresa_contato4_cbo"))
            { item.empresa_contato4_cbo = dr["empresa_contato4_cbo"].ToString(); lstCampos.Add("empresa_contato4_cbo"); lstHeader.Add("CBOContato4"); }

            if (Util.ValidaDbNull(dr, "empresa_contato4_link"))
            { item.empresa_contato4_link = dr["empresa_contato4_link"].ToString(); lstCampos.Add("empresa_contato4_link"); lstHeader.Add("LinkContato4"); }

            if (Util.ValidaDbNull(dr, "empresa_contato5_cpf"))
            { item.empresa_contato5_cpf = dr["empresa_contato5_cpf"].ToString(); lstCampos.Add("empresa_contato5_cpf"); lstHeader.Add("CPFContato5"); }

            if (Util.ValidaDbNull(dr, "empresa_contato5_nome"))
            { item.empresa_contato5_nome = dr["empresa_contato5_nome"].ToString(); lstCampos.Add("empresa_contato5_nome"); lstHeader.Add("NomeContato5"); }

            if (Util.ValidaDbNull(dr, "empresa_contato5_cargo"))
            { item.empresa_contato5_cargo = dr["empresa_contato5_cargo"].ToString(); lstCampos.Add("empresa_contato5_cargo"); lstHeader.Add("CargoContato5"); }

            if (Util.ValidaDbNull(dr, "empresa_contato5_participacao"))
            { item.empresa_contato5_participacao = dr["empresa_contato5_participacao"].ToString(); lstCampos.Add("empresa_contato5_participacao"); lstHeader.Add("ParticipacaoContato5"); }

            if (Util.ValidaDbNull(dr, "empresa_contato5_dataentrada"))
            { item.empresa_contato5_dataentrada = dr["empresa_contato5_dataentrada"].ToString(); lstCampos.Add("empresa_contato5_dataentrada"); lstHeader.Add("DtEntradaContato5"); }

            if (Util.ValidaDbNull(dr, "empresa_contato5_ddd"))
            { item.empresa_contato5_ddd = dr["empresa_contato5_ddd"].ToString(); lstCampos.Add("empresa_contato5_ddd"); lstHeader.Add("DDDContato5"); }

            if (Util.ValidaDbNull(dr, "empresa_contato5_telefone"))
            { item.empresa_contato5_telefone = dr["empresa_contato5_telefone"].ToString(); lstCampos.Add("empresa_contato5_telefone"); lstHeader.Add("TelefoneContato5"); }

            if (Util.ValidaDbNull(dr, "empresa_contato5_celular"))
            { item.empresa_contato5_celular = dr["empresa_contato5_celular"].ToString(); lstCampos.Add("empresa_contato5_celular"); lstHeader.Add("CelularContato5"); }

            if (Util.ValidaDbNull(dr, "empresa_contato5_email"))
            { item.empresa_contato5_email = dr["empresa_contato5_email"].ToString(); lstCampos.Add("empresa_contato5_email"); lstHeader.Add("EmailContato5"); }

            if (Util.ValidaDbNull(dr, "empresa_contato5_cbo"))
            { item.empresa_contato5_cbo = dr["empresa_contato5_cbo"].ToString(); lstCampos.Add("empresa_contato5_cbo"); lstHeader.Add("CBOContato5"); }

            if (Util.ValidaDbNull(dr, "empresa_contato5_link"))
            { item.empresa_contato5_link = dr["empresa_contato5_link"].ToString(); lstCampos.Add("empresa_contato5_link"); lstHeader.Add("LinkContato5"); }



            if (Util.ValidaDbNull(dr, "dominio"))
            { item.dominio = dr["dominio"].ToString(); lstCampos.Add("dominio"); lstHeader.Add("DOMINIO"); }

            if (Util.ValidaDbNull(dr, "id"))
            { item.id = dr["id"].ToString(); lstCampos.Add("id"); lstHeader.Add("ID"); }


            if (Util.ValidaDbNull(dr, "TEL1_WEBSITE"))
            { item.tel1_valido = trataTelefone(dr["TEL1_WEBSITE"].ToString()); lstCampos.Add("tel1_valido"); lstHeader.Add("TEL1_WEBSITE"); }

            if (Util.ValidaDbNull(dr, "TEL2_WEBSITE"))
            { item.tel2_valido = trataTelefone(dr["TEL2_WEBSITE"].ToString()); lstCampos.Add("tel2_valido"); lstHeader.Add("TEL2_WEBSITE"); }

            if (Util.ValidaDbNull(dr, "TEL3_WEBSITE"))
            { item.tel3_valido = trataTelefone(dr["TEL3_WEBSITE"].ToString()); lstCampos.Add("tel3_valido"); lstHeader.Add("TEL3_WEBSITE"); }


            if (Util.ValidaDbNull(dr, "EMAIL_WEBSITE"))
            { item.email_website = trataTelefone(dr["EMAIL_WEBSITE"].ToString()); lstCampos.Add("email_website"); lstHeader.Add("EMAIL_WEBSITE"); }

            if (idTabela == 1)
            {
                if (Util.ValidaDbNull(dr, "cnpj"))
                { item.cnpj = dr["cnpj"].ToString(); lstCampos.Add("cnpj"); lstHeader.Add("CNPJ"); }

                if (Util.ValidaDbNull(dr, "nm"))
                { item.razao = dr["nm"].ToString(); lstCampos.Add("razao"); lstHeader.Add("RAZAO SOCIAL"); }

                if (Util.ValidaDbNull(dr, "nmf"))
                { item.fantasia = dr["nmf"].ToString(); lstCampos.Add("fantasia"); lstHeader.Add("NOME FANTASIA"); }

                if (Util.ValidaDbNull(dr, "empg"))
                { item.nrofuncionario = dr["empg"].ToString(); lstCampos.Add("nrofuncionario"); lstHeader.Add("FUNCIONARIOS"); }

            }
            else
            {
                if (Util.ValidaDbNull(dr, "cpf"))
                { item.cpf = dr["cpf"].ToString(); lstCampos.Add("cpf"); lstHeader.Add("CPF"); }

                if (Util.ValidaDbNull(dr, "nm"))
                { item.razao = dr["nm"].ToString(); lstCampos.Add("razao"); lstHeader.Add("NOME"); }

                if (Util.ValidaDbNull(dr, "nmf"))
                { item.fantasia = dr["nmf"].ToString(); lstCampos.Add("fantasia"); lstHeader.Add("NOME DA MAE"); }

            }

            if (Util.ValidaDbNull(dr, "sexo"))
            { item.sexo = dr["sexo"].ToString(); lstCampos.Add("sexo"); lstHeader.Add("SEXO"); }

            if (Util.ValidaDbNull(dr, "dtnasc"))
            { item.dtnasc = dr["dtnasc"].ToString(); lstCampos.Add("dtnasc"); lstHeader.Add("DATA NASCIMENTO"); }

            if (Util.ValidaDbNull(dr, "idade"))
            {
                item.idade = Convert.ToInt16(dr["idade"]);
                item.Idade = item.idade.ToString();
                lstCampos.Add("idade");
                lstHeader.Add("IDADE");
            }


            if (Util.ValidaDbNull(dr, "lg"))
            { item.endereco = dr["lg"].ToString(); lstCampos.Add("endereco"); lstHeader.Add("ENDERECO"); }

            if (Util.ValidaDbNull(dr, "nr"))
            { item.nro = dr["nr"].ToString(); lstCampos.Add("nro"); lstHeader.Add("NUMERO"); }

            if (Util.ValidaDbNull(dr, "cp"))
            { item.compl = dr["cp"].ToString(); lstCampos.Add("compl"); lstHeader.Add("COMPLEMENTO"); }

            if (Util.ValidaDbNull(dr, "br"))
            { item.bairro = dr["br"].ToString(); lstCampos.Add("bairro"); lstHeader.Add("BAIRRO"); }

            if (Util.ValidaDbNull(dr, "munid"))
            { item.idcidade = dr["munid"].ToString(); }

            if (Util.ValidaDbNull(dr, "mesoregiao"))
            { item.mesoregiao = dr["mesoregiao"].ToString(); lstCampos.Add("mesoregiao"); lstHeader.Add("MESSOREGIÃO"); }

            if (Util.ValidaDbNull(dr, "microregiao"))
            { item.microregiao = dr["microregiao"].ToString(); lstCampos.Add("microregiao"); lstHeader.Add("MICROREGIÃO"); }

            if (Util.ValidaDbNull(dr, "idcidade"))
            { item.idcidade = dr["idcidade"].ToString(); }

            if (Util.ValidaDbNull(dr, "mu"))
            { item.cidade = dr["mu"].ToString(); lstCampos.Add("cidade"); lstHeader.Add("CIDADE"); }

            if (Util.ValidaDbNull(dr, "uf"))
            { item.uf = dr["uf"].ToString(); lstCampos.Add("uf"); lstHeader.Add("UF"); }

            if (Util.ValidaDbNull(dr, "cep"))
            { item.cep = dr["cep"].ToString(); lstCampos.Add("cep"); lstHeader.Add("CEP"); }

            if (Util.ValidaDbNull(dr, "latitude"))
            { item.latitude = dr["latitude"].ToString(); lstCampos.Add("latitude"); lstHeader.Add("LATITUDE"); }

            if (Util.ValidaDbNull(dr, "longitude"))
            { item.longitude = dr["longitude"].ToString(); lstCampos.Add("longitude"); lstHeader.Add("LONGITUDE"); }

            if (Util.ValidaDbNull(dr, "data_situacao"))
            { item.data_situacao = dr["data_situacao"].ToString(); lstCampos.Add("data_situacao"); lstHeader.Add("DATA DA SITUACAO"); }

            if (Util.ValidaDbNull(dr, "motivo_situacao"))
            { item.motivo_situacao = dr["motivo_situacao"].ToString(); lstCampos.Add("motivo_situacao"); lstHeader.Add("MOTIVO DA SITUACAO"); }


            if (Util.ValidaDbNull(dr, "ddd"))
            { item.ddd = dr["ddd"].ToString(); lstCampos.Add("ddd"); lstHeader.Add("DDD"); }

            if (Util.ValidaDbNull(dr, "tel1"))
            { item.tel1 = trataTelefone(dr["tel1"].ToString()); lstCampos.Add("tel1"); lstHeader.Add("TEL1"); }

            if (Util.ValidaDbNull(dr, "tel2"))
            { item.tel2 = trataTelefone(dr["tel2"].ToString()); lstCampos.Add("tel2"); lstHeader.Add("TEL2"); }

            if (Util.ValidaDbNull(dr, "tel3"))
            { item.tel3 = trataTelefone(dr["tel3"].ToString()); lstCampos.Add("tel3"); lstHeader.Add("TEL3"); }

            if (Util.ValidaDbNull(dr, "tel4"))
            { item.tel4 = trataTelefone(dr["tel4"].ToString()); lstCampos.Add("tel4"); lstHeader.Add("Telefone4"); }

            if (Util.ValidaDbNull(dr, "tel5"))
            { item.tel5 = trataTelefone(dr["tel5"].ToString()); lstCampos.Add("tel5"); lstHeader.Add("Telefone5"); }

             if (Util.ValidaDbNull(dr, "operadora"))
              { item.operadora = dr["operadora"].ToString(); lstCampos.Add("operadora"); lstHeader.Add("OPERADORA FIXO"); }

            if (Util.ValidaDbNull(dr, "cel1"))
            { item.cel1 = trataTelefone(dr["cel1"].ToString()); lstCampos.Add("cel1"); lstHeader.Add(idTabela == 1 ? "CEL1" : "CEL"); }

            if (Util.ValidaDbNull(dr, "cel2"))
            { item.cel2 = trataTelefone(dr["cel2"].ToString()); lstCampos.Add("cel2"); lstHeader.Add("CEL2"); }

            if (Util.ValidaDbNull(dr, "cel3"))
            { item.cel3 = trataTelefone(dr["cel3"].ToString()); lstCampos.Add("cel3"); lstHeader.Add("CEL3"); }

             if (Util.ValidaDbNull(dr, "opcel"))
             { item.opcel = dr["opcel"].ToString(); lstCampos.Add("opcel"); lstHeader.Add("OPERADORA CELULAR"); }

            if (Util.ValidaDbNull(dr, "email"))
            { item.email = dr["email"].ToString(); lstCampos.Add("email"); lstHeader.Add("EMAIL"); }

            if (Util.ValidaDbNull(dr, "email2"))
            { item.email2 = dr["email2"].ToString(); lstCampos.Add("email2"); lstHeader.Add("EMAIL SECUNDARIO"); }


            if (Util.ValidaDbNull(dr, "ecorp"))
            { item.ecorp = dr["ecorp"].ToString(); lstCampos.Add("ecorp"); lstHeader.Add("TIPO DO EMAIL"); }


            if (Util.ValidaDbNull(dr, "site"))
            { item.site = dr["site"].ToString(); lstCampos.Add("site"); lstHeader.Add("WEBSITE"); }

            if (Util.ValidaDbNull(dr, "abertura"))
            { item.abertura = dr["abertura"].ToString(); lstCampos.Add("abertura"); lstHeader.Add("DATA ABERTURA"); }


            if (Util.ValidaDbNull(dr, "nomecontato"))
            { item.nomecontato = dr["nomecontato"].ToString(); lstCampos.Add("nomecontato"); lstHeader.Add("SÓCIO #1"); }

            /*
            if (Util.ValidaDbNull(dr, "cargocontato"))
            { item.cargocontato = dr["cargocontato"].ToString(); lstCampos.Add("cargocontato"); lstHeader.Add("CARGO SÓCIO"); }
            */

            if (Util.ValidaDbNull(dr, "celcontato"))
            { item.celcontato = dr["celcontato"].ToString(); lstCampos.Add("celcontato"); lstHeader.Add("CEL SÓCIO #1"); }


            if (Util.ValidaDbNull(dr, "nomecontato2"))
            { item.nomecontato2 = dr["nomecontato2"].ToString(); lstCampos.Add("nomecontato2"); lstHeader.Add("SÓCIO #2"); }

            /*
            if (Util.ValidaDbNull(dr, "cargocontato2"))
            { item.cargocontato2 = dr["cargocontato2"].ToString(); lstCampos.Add("cargocontato2"); lstHeader.Add("CARGO SÓCIO 2"); }
            */

            if (Util.ValidaDbNull(dr, "celcontato2"))
            { item.celcontato2 = dr["celcontato2"].ToString(); lstCampos.Add("celcontato2"); lstHeader.Add("CEL SÓCIO #2"); }


            if (Util.ValidaDbNull(dr, "nomecontato3"))
            { item.nomecontato3 = dr["nomecontato3"].ToString(); lstCampos.Add("nomecontato3"); lstHeader.Add("SÓCIO #3"); }

            /*
            if (Util.ValidaDbNull(dr, "cargocontato3"))
            { item.cargocontato3 = dr["cargocontato3"].ToString(); lstCampos.Add("cargocontato3"); lstHeader.Add("CARGO SÓCIO 3"); }
            */

            if (Util.ValidaDbNull(dr, "celcontato3"))
            { item.celcontato3 = dr["celcontato3"].ToString(); lstCampos.Add("celcontato3"); lstHeader.Add("CEL SÓCIO #3"); }


            if (Util.ValidaDbNull(dr, "emailAdc"))
            { item.emailAdc = dr["emailAdc"].ToString(); lstCampos.Add("emailAdc"); lstHeader.Add("EMAIL DO CONTATO"); }

            if (Util.ValidaDbNull(dr, "cnae"))
            { item.cnae = dr["cnae"].ToString(); lstCampos.Add("cnae"); lstHeader.Add("CNAE"); }

            if (Util.ValidaDbNull(dr, "cnae_desc"))
            { item.cnae_desc = dr["cnae_desc"].ToString(); lstCampos.Add("cnae_desc"); lstHeader.Add("ATIVIDADE ECONOMICA"); }

            if (Util.ValidaDbNull(dr, "cnae2"))
            { item.cnae2 = dr["cnae2"].ToString(); lstCampos.Add("cnae2"); lstHeader.Add("CNAE SECUNDARIO"); }

            if (Util.ValidaDbNull(dr, "cnae2_desc"))
            { item.cnae2_desc = dr["cnae2_desc"].ToString(); lstCampos.Add("cnae2_desc"); lstHeader.Add("ATIVIDADE ADICIONAL"); }

            if (Util.ValidaDbNull(dr, "crgid"))
            { item.idcargo = dr["crgid"].ToString(); }

            /* if (Util.ValidaDbNull(dr, "crgnome"))
             { item.cargo = dr["crgnome"].ToString(); lstCampos.Add("cargo"); lstHeader.Add("Cargo"); }*/

            if (Util.ValidaDbNull(dr, "prtid"))
            { item.idporte = dr["prtid"].ToString(); }

            if (Util.ValidaDbNull(dr, "prtnome"))
            { item.porte = dr["prtnome"].ToString(); lstCampos.Add("porte"); lstHeader.Add("PORTE"); }



            if (Util.ValidaDbNull(dr, "strid"))
            { item.idsetor = dr["strid"].ToString(); }

            if (Util.ValidaDbNull(dr, "strnome"))
            { item.setor = dr["strnome"].ToString(); lstCampos.Add("setor"); lstHeader.Add("SETOR"); }

            if (Util.ValidaDbNull(dr, "especialidades"))
            { item.especialidades = dr["especialidades"].ToString(); lstCampos.Add("especialidades"); lstHeader.Add("ESPECIALIDADES"); }

            if (Util.ValidaDbNull(dr, "regime"))
            { item.regime = dr["regime"].ToString(); lstCampos.Add("regime"); lstHeader.Add("REGIME"); }

            if (Util.ValidaDbNull(dr, "situacao"))
            { item.situacao = dr["situacao"].ToString(); lstCampos.Add("situacao"); lstHeader.Add("SITUACAO CADASTRAL"); }

            if (Util.ValidaDbNull(dr, "capital"))
            { item.capital = dr["capital"].ToString(); lstCampos.Add("capital"); lstHeader.Add("CAPITAL SOCIAL"); }

            if (Util.ValidaDbNull(dr, "matrizfilial"))
            { item.mtz = dr["matrizfilial"].ToString(); lstCampos.Add("mtz"); lstHeader.Add("TIPO"); }

            if (Util.ValidaDbNull(dr, "nj"))
            { item.nj = dr["nj"].ToString(); lstCampos.Add("nj"); lstHeader.Add("NATUREZA JURIDICA"); }

            if (Util.ValidaDbNull(dr, "tributacao"))
            { item.tributacao = dr["tributacao"].ToString(); lstCampos.Add("tributacao"); lstHeader.Add("TRIBUTAÇÃO"); }

            if (Util.ValidaDbNull(dr, "ie"))
            { item.ie = dr["ie"].ToString(); lstCampos.Add("ie"); lstHeader.Add("INS ESTADUAL"); }

            if (Util.ValidaDbNull(dr, "escnom"))
            { item.escnom = dr["escnom"].ToString(); lstCampos.Add("escnom"); lstHeader.Add("ESCOLARIDADE"); }

            if (Util.ValidaDbNull(dr, "ecvnom"))
            { item.ecvnom = dr["ecvnom"].ToString(); lstCampos.Add("ecvnom"); lstHeader.Add("ESTADO CIVIL"); }

            if (Util.ValidaDbNull(dr, "cbo"))
            { item.cbo = dr["cbo"].ToString(); lstCampos.Add("cbo"); lstHeader.Add("CBO"); }

            if (Util.ValidaDbNull(dr, "obito"))
            { item.obito = dr["obito"].ToString(); lstCampos.Add("obito"); lstHeader.Add("OBITO"); }

            if (Util.ValidaDbNull(dr, "prfnom"))
            { item.prfnom = dr["prfnom"].ToString(); lstCampos.Add("prfnom"); lstHeader.Add("OCUPACAO"); }

            if (Util.ValidaDbNull(dr, "profissao"))
            { item.profissao = dr["profissao"].ToString(); lstCampos.Add("profissao"); lstHeader.Add("PROFISSAO"); }

            if (Util.ValidaDbNull(dr, "clsnom"))
            { item.clsnom = dr["clsnom"].ToString(); lstCampos.Add("clsnom"); lstHeader.Add("CLASSE SOCIAL"); }

            if (Util.ValidaDbNull(dr, "fxrenda"))
            { item.fxrenda = dr["fxrenda"].ToString(); lstCampos.Add("fxrenda"); lstHeader.Add("FAIXA DE RENDA"); }

            if (Util.ValidaDbNull(dr, "bancos"))
            { item.bancos = dr["bancos"].ToString(); lstCampos.Add("bancos"); lstHeader.Add("BANCO"); }

            if (Util.ValidaDbNull(dr, "agencia"))
            { item.agencia = dr["agencia"].ToString(); lstCampos.Add("agencia"); lstHeader.Add("AGENCIA"); }

            if (Util.ValidaDbNull(dr, "tipobanco"))
            { item.tipobanco = dr["tipobanco"].ToString(); lstCampos.Add("tipobanco"); lstHeader.Add("TIPO BANCO"); }

            if (Util.ValidaDbNull(dr, "cartao"))
            { item.cartao = dr["cartao"].ToString(); lstCampos.Add("cartao"); lstHeader.Add("CARTAO CREDITO"); }

            if (Util.ValidaDbNull(dr, "divfed"))
            { item.divfed = dr["divfed"].ToString(); lstCampos.Add("divfed"); lstHeader.Add("DIVIDAS"); }

            if (Util.ValidaDbNull(dr, "protestos"))
            { item.protestos = dr["protestos"].ToString(); lstCampos.Add("protestos"); lstHeader.Add("PROTESTO"); }

            if (Util.ValidaDbNull(dr, "cartorio"))
            { item.cartorio = dr["cartorio"].ToString(); lstCampos.Add("cartorio"); lstHeader.Add("CARTORIO"); }

            if (Util.ValidaDbNull(dr, "saude"))
            { item.saude = dr["saude"].ToString(); lstCampos.Add("saude"); lstHeader.Add("PLANO SAUDE"); }

            if (Util.ValidaDbNull(dr, "emailhash"))
            { item.emailhash = dr["emailhash"].ToString(); lstCampos.Add("emailhash"); lstHeader.Add("EMAIL HASH"); }

            if (Util.ValidaDbNull(dr, "servicos"))
            { item.servicos = dr["servicos"].ToString(); lstCampos.Add("servicos"); lstHeader.Add("SERVICO"); }

            if (Util.ValidaDbNull(dr, "servoper"))
            { item.servoper = dr["servoper"].ToString(); lstCampos.Add("servoper"); lstHeader.Add("OPERADORA SERVICO"); }

            if (Util.ValidaDbNull(dr, "ecommsite"))
            { item.ecommsite = dr["ecommsite"].ToString(); lstCampos.Add("ecommsite"); lstHeader.Add("SITE ECOMM"); }

            if (Util.ValidaDbNull(dr, "imvemp"))
            { item.imvemp = dr["imvemp"].ToString(); lstCampos.Add("imvemp"); lstHeader.Add("EmpreendimentoImovel"); }

            if (Util.ValidaDbNull(dr, "imvvlr"))
            { item.imvvlr = Convert.ToDecimal(dr["imvvlr"]).ToString("###,###,##0.00"); lstCampos.Add("imvvlr"); lstHeader.Add("VlrImovel"); }

            if (Util.ValidaDbNull(dr, "renda"))
            { item.renda = Convert.ToDecimal(dr["renda"]).ToString("###,###,##0.00"); lstCampos.Add("renda"); lstHeader.Add("RENDA"); }

            if (Util.ValidaDbNull(dr, "pis"))
            { item.pis = dr["pis"].ToString(); lstCampos.Add("pis"); lstHeader.Add("PIS"); }

            if (Util.ValidaDbNull(dr, "scoretel1"))
            { item.scoretel1 = dr["scoretel1"].ToString(); lstCampos.Add("scoretel1"); lstHeader.Add("SCORE TEL"); }

            if (Util.ValidaDbNull(dr, "score"))
            { item.score = dr["score"].ToString(); lstCampos.Add("score"); lstHeader.Add("SCORE DE CREDITO"); }

            if (Util.ValidaDbNull(dr, "faixa"))
            { item.faixa = dr["faixa"].ToString(); lstCampos.Add("faixa"); lstHeader.Add("FAIXA DE RISCO"); }

            if (Util.ValidaDbNull(dr, "tipobeneficio"))
            { item.tipobeneficio = dr["tipobeneficio"].ToString(); lstCampos.Add("tipobeneficio"); lstHeader.Add("TIPO BENEFICIO"); }

            if (Util.ValidaDbNull(dr, "esp"))
            { item.esp = dr["esp"].ToString(); lstCampos.Add("esp"); lstHeader.Add("ESP"); }

            if (Util.ValidaDbNull(dr, "idlista"))
            { item.idlista = dr["idlista"].ToString(); lstCampos.Add("idlista"); lstHeader.Add("LISTA ID"); }

            if (Util.ValidaDbNull(dr, "operacao"))
            { item.operacao = dr["operacao"].ToString(); lstCampos.Add("operacao"); lstHeader.Add("OPERACAO"); }

            if (Util.ValidaDbNull(dr, "fpublico"))
            { item.fpublico = dr["fpublico"].ToString(); lstCampos.Add("fpublico"); lstHeader.Add("FUNC PUBLICO"); }

            if (Util.ValidaDbNull(dr, "tituloeleitor"))
            { item.tituloeleitor = dr["tituloeleitor"].ToString(); lstCampos.Add("tituloeleitor"); lstHeader.Add("TITULO ELEITOR"); }

            if (Util.ValidaDbNull(dr, "zona"))
            { item.zona = dr["zona"].ToString(); lstCampos.Add("zona"); lstHeader.Add("ZONA"); }

            if (Util.ValidaDbNull(dr, "secao"))
            { item.secao = dr["secao"].ToString(); lstCampos.Add("secao"); lstHeader.Add("SECAO"); }


            if (Util.ValidaDbNull(dr, "lucromes"))
            { item.lucromes = Convert.ToDecimal(dr["lucromes"]).ToString(); lstCampos.Add("lucromes"); lstHeader.Add("FATURAMENTO MENSAL"); }

            if (Util.ValidaDbNull(dr, "lucroanual"))
            { item.lucroano = Convert.ToDecimal(dr["lucroanual"]).ToString(); lstCampos.Add("lucroano"); lstHeader.Add("FATURAMENTO ANUAL"); }

            if (Util.ValidaDbNull(dr, "ff"))
            { item.ff = dr["ff"].ToString(); lstCampos.Add("ff"); lstHeader.Add("FAIXA DE FATURAMENTO"); }

            if (Util.ValidaDbNull(dr, "fe"))
            { item.fe = dr["fe"].ToString(); lstCampos.Add("fe"); lstHeader.Add("FAIXA DE EMPREGADOS"); }

            if (Util.ValidaDbNull(dr, "fieid"))
            { item.fieid = dr["fieid"].ToString(); lstCampos.Add("fieid"); lstHeader.Add("FaixaImporacaoExportacao"); }

            if (Util.ValidaDbNull(dr, "fieidnom"))
            { item.fieidnom = dr["fieidnom"].ToString(); lstCampos.Add("fieidnom"); lstHeader.Add("VlrImportacaoExportacao"); }

            if (Util.ValidaDbNull(dr, "veinometipo"))
            { item.veinometipo = dr["veinometipo"].ToString(); lstCampos.Add("veinometipo"); lstHeader.Add("TipoVeiculo"); }

            if (Util.ValidaDbNull(dr, "veinomefab"))
            { item.veinomefab = dr["veinomefab"].ToString(); lstCampos.Add("veinomefab"); lstHeader.Add("Fabricante"); }

            /* if (Util.ValidaDbNull(dr, "veinomemarca"))
             { item.veinomemarca = dr["veinomemarca"].ToString(); lstCampos.Add("veinomemarca"); lstHeader.Add("Marca"); }*/

            if (Util.ValidaDbNull(dr, "veinomemod"))
            { item.veinomemod = dr["veinomemod"].ToString(); lstCampos.Add("veinomemod"); lstHeader.Add("Modelo"); }

            if (Util.ValidaDbNull(dr, "veiano"))
            { item.veiano = dr["veiano"].ToString(); lstCampos.Add("veiano"); lstHeader.Add("AnoModelo"); }

            if (Util.ValidaDbNull(dr, "veirenavam"))
            { item.veirenavam = dr["veirenavam"].ToString(); lstCampos.Add("veirenavam"); lstHeader.Add("Renavam"); }

            if (Util.ValidaDbNull(dr, "veiplaca"))
            { item.veiplaca = dr["veiplaca"].ToString(); lstCampos.Add("veiplaca"); lstHeader.Add("Placa"); }

            if (Util.ValidaDbNull(dr, "veidataincl"))
            { item.veidataincl = dr["veidataincl"].ToString(); lstCampos.Add("veidataincl"); lstHeader.Add("Data"); }

            if (Util.ValidaDbNull(dr, "tem_mae"))
            { item.tem_mae = dr["tem_mae"].ToString(); lstCampos.Add("tem_mae"); lstHeader.Add("TMae"); }

            if (Util.ValidaDbNull(dr, "tem_end"))
            { item.tem_end = dr["tem_end"].ToString(); lstCampos.Add("tem_end"); lstHeader.Add("TEndereco"); }

            if (Util.ValidaDbNull(dr, "tem_tel"))
            {
                item.tem_tel = dr["tem_tel"].ToString(); lstCampos.Add("tem_tel"); lstHeader.Add("TTelFixo");
            }

            if (Util.ValidaDbNull(dr, "tem_cel"))
            { item.tem_cel = dr["tem_cel"].ToString(); lstCampos.Add("tem_cel"); lstHeader.Add("TCelular"); }

            if (Util.ValidaDbNull(dr, "tem_dtn"))
            { item.tem_dtn = dr["tem_dtn"].ToString(); lstCampos.Add("tem_dtn"); lstHeader.Add("TDtNasc"); }

            if (Util.ValidaDbNull(dr, "tem_obt"))
            { item.tem_obt = dr["tem_obt"].ToString(); lstCampos.Add("tem_obt"); lstHeader.Add("TObito"); }

            if (Util.ValidaDbNull(dr, "tem_eml"))
            { item.tem_eml = dr["tem_eml"].ToString(); lstCampos.Add("tem_eml"); lstHeader.Add("TEmail"); }

            if (Util.ValidaDbNull(dr, "mae"))
            { item.mae = dr["mae"].ToString(); lstCampos.Add("mae"); lstHeader.Add("NOME DA MAE"); }

            if (idTabela == 2)
            {
                if (Util.ValidaDbNull(dr, "cnpj"))
                { item.cnpjvinc = dr["cnpj"].ToString(); lstCampos.Add("cnpjvinc"); lstHeader.Add("CNPJvinc"); }
            }

            if (Util.ValidaDbNull(dr, "empresa_razao"))
            { item.empresa_razao = dr["empresa_razao"].ToString(); lstCampos.Add("empresa_razao"); lstHeader.Add("RazaoEmpresa"); }

            if (idTabela == 2)
            {
                if (Util.ValidaDbNull(dr, "empg"))
                { item.nrofuncionario = dr["empg"].ToString(); lstCampos.Add("nrofuncionario"); lstHeader.Add("Funcionarios"); }

                if (Util.ValidaDbNull(dr, "fe"))
                { item.fe = dr["fe"].ToString(); lstCampos.Add("fe"); lstHeader.Add("Faixa de Empregados"); }
            }

            if (Util.ValidaDbNull(dr, "empresa_cidade"))
            { item.empresa_cidade = dr["empresa_cidade"].ToString(); lstCampos.Add("empresa_cidade"); lstHeader.Add("CidadeEmpresa"); }

            if (Util.ValidaDbNull(dr, "empresa_uf"))
            { item.empresa_uf = dr["empresa_uf"].ToString(); lstCampos.Add("empresa_uf"); lstHeader.Add("UFEmpresa"); }

            if (Util.ValidaDbNull(dr, "empresa_ddd"))
            { item.empresa_ddd = dr["empresa_ddd"].ToString(); lstCampos.Add("empresa_ddd"); lstHeader.Add("DDDEmpresa"); }

            if (Util.ValidaDbNull(dr, "empresa_tel1"))
            { item.empresa_tel1 = dr["empresa_tel1"].ToString(); lstCampos.Add("empresa_tel1"); lstHeader.Add("Tel1Empresa"); }

            if (Util.ValidaDbNull(dr, "empresa_tel2"))
            { item.empresa_tel2 = dr["empresa_tel2"].ToString(); lstCampos.Add("empresa_tel2"); lstHeader.Add("Tel2Empresa"); }

            if (Util.ValidaDbNull(dr, "empresa_tel3"))
            { item.empresa_tel3 = dr["empresa_tel3"].ToString(); lstCampos.Add("empresa_tel3"); lstHeader.Add("Tel3Empresa"); }

            if (Util.ValidaDbNull(dr, "empresa_tel4"))
            { item.empresa_tel4 = dr["empresa_tel4"].ToString(); lstCampos.Add("empresa_tel4"); lstHeader.Add("Tel4Empresa"); }

            if (Util.ValidaDbNull(dr, "empresa_tel5"))
            { item.empresa_tel1 = dr["empresa_tel5"].ToString(); lstCampos.Add("empresa_tel5"); lstHeader.Add("Tel5Empresa"); }

            if (Util.ValidaDbNull(dr, "empresa_email"))
            { item.empresa_email = dr["empresa_email"].ToString(); lstCampos.Add("empresa_email"); lstHeader.Add("EmailEmpresa"); }

            if (Util.ValidaDbNull(dr, "empresa_email2"))
            { item.empresa_email2 = dr["empresa_email2"].ToString(); lstCampos.Add("empresa_email2"); lstHeader.Add("Email2Empresa"); }

            if (Util.ValidaDbNull(dr, "mei"))
            { item.mei = dr["mei"].ToString(); lstCampos.Add("mei"); lstHeader.Add("MEI"); }

            if (Util.ValidaDbNull(dr, "top1000"))
            { item.top1000 = dr["top1000"].ToString(); lstCampos.Add("top1000"); lstHeader.Add("TOP 1000"); }

            if (Util.ValidaDbNull(dr, "marketshare"))
            { item.marketshare = dr["marketshare"].ToString(); 
              lstCampos.Add("marketshare"); 
              lstHeader.Add("MARKET SHARE");
              if (item.marketshare != String.Empty && Convert.ToDecimal(item.marketshare) == 0 )
                {
                    item.marketshare = "< 0,001%";
                }
              else
                {
                    item.marketshare = item.marketshare + "%";
                }

            }

            if (Util.ValidaDbNull(dr, "media_faturamento_cnae"))
            {
                item.media_faturamento_cnae = "R$ " + string.Format(CultureInfo.GetCultureInfo("pt-BR"),"{0:N}", Convert.ToInt64(dr["media_faturamento_cnae"]));
                lstCampos.Add("media_faturamento_cnae");
                lstHeader.Add("Med.Fat.CNAE");
            }

            if (Util.ValidaDbNull(dr, "qtde_empresas_cnae"))
            {
                item.qtde_empresas_cnae = string.Format(CultureInfo.GetCultureInfo("pt-BR"), "{0:0,0}", Convert.ToInt32(dr["qtde_empresas_cnae"]));
                lstCampos.Add("qtde_empresas_cnae");
                lstHeader.Add("Qtd.Emp.CNAE");
            }

            if (Util.ValidaDbNull(dr, "industria"))
            { item.industria = dr["industria"].ToString(); lstCampos.Add("industria"); lstHeader.Add("INDÚSTRIA"); }

            if (Util.ValidaDbNull(dr, "filiais"))
            { item.filiais = dr["filiais"].ToString(); lstCampos.Add("filiais"); lstHeader.Add("Qtd.FILIAIS"); }

            if (Util.ValidaDbNull(dr, "qt_socios"))
            { item.qt_socios = dr["qt_socios"].ToString(); lstCampos.Add("qt_socios"); lstHeader.Add("Qtd.SÓCIOS"); }

            if (Util.ValidaDbNull(dr, "especialidade"))
            { item.especialidade = dr["especialidade"].ToString(); lstCampos.Add("especialidade"); lstHeader.Add("ESPECIALIDADE"); }

            if (Util.ValidaDbNull(dr, "facebook"))
            { item.facebook = dr["facebook"].ToString(); lstCampos.Add("facebook"); lstHeader.Add("FACEBOOK"); }

            if (Util.ValidaDbNull(dr, "seguidores"))
            { item.seguidores = dr["seguidores"].ToString(); lstCampos.Add("seguidores"); lstHeader.Add("SEGUIDORES"); }

            if (Util.ValidaDbNull(dr, "linkedin_company"))
            { item.linkedin_company = dr["linkedin_company"].ToString(); lstCampos.Add("linkedin_company"); lstHeader.Add("LINKEDIN"); }

            if (Util.ValidaDbNull(dr, "linkedin_contatos"))
            { item.linkedin_contatos= dr["linkedin_contatos"].ToString(); lstCampos.Add("linkedin_contatos"); lstHeader.Add("Contatos LINKEDIN"); }

            if (Util.ValidaDbNull(dr, "linkedin_pessoa"))
            { item.linkedin_pessoa = dr["linkedin_pessoa"].ToString(); lstCampos.Add("linkedin_pessoa"); lstHeader.Add("LINKEDIN"); }


            if (Util.ValidaDbNull(dr, "QtdRegistros"))
            { item.QtdRegistros = Convert.ToInt32(dr["QtdRegistros"]); lstCampos.Add("QtdRegistros"); lstHeader.Add("Registros"); }

            if (Util.ValidaDbNull(dr, "QtdEnderecos"))
            { item.QtdEnderecos = Convert.ToInt32(dr["QtdEnderecos"]); lstCampos.Add("QtdEnderecos"); lstHeader.Add("QtdEnderecos"); }

            if (Util.ValidaDbNull(dr, "QtdTelefones"))
            { item.QtdTelefones = Convert.ToInt32(dr["QtdTelefones"]); lstCampos.Add("QtdTelefones"); lstHeader.Add("QtdTelefones"); }

            if (Util.ValidaDbNull(dr, "QtdEmail"))
            { item.QtdEmail = Convert.ToInt32(dr["QtdEmail"]); lstCampos.Add("QtdEmail"); lstHeader.Add("QtdEmail"); }

            if (Util.ValidaDbNull(dr, "QtdSite"))
            { item.QtdSite = Convert.ToInt32(dr["QtdSite"]); lstCampos.Add("QtdSite"); lstHeader.Add("QtdSite"); }

            if (Util.ValidaDbNull(dr, "QtdDtNasc"))
            { item.QtdDtNasc = Convert.ToInt32(dr["QtdDtNasc"]); lstCampos.Add("QtdDtNasc"); lstHeader.Add("QtdDtNasc"); }

            if (Util.ValidaDbNull(dr, "QtdEmpresaVinc"))
            { item.QtdEmpresaVinc = Convert.ToInt32(dr["QtdEmpresaVinc"]); lstCampos.Add("QtdEmpresaVinc"); lstHeader.Add("QtdEmpresaVinc"); }

            if (Util.ValidaDbNull(dr, "QtdContatos"))
            { item.QtdContatos = Convert.ToInt32(dr["QtdContatos"]); lstCampos.Add("QtdContatos"); lstHeader.Add("QtdContatos"); }

            if (Util.ValidaDbNull(dr, "QtdObitos"))
            { item.QtdObitos = Convert.ToInt32(dr["QtdObitos"]); lstCampos.Add("QtdObitos"); lstHeader.Add("QtdObitos"); }

            if (Util.ValidaDbNull(dr, "QtdMae"))
            { item.QtdMae = Convert.ToInt32(dr["QtdMae"]); lstCampos.Add("QtdMae"); lstHeader.Add("QtdMae"); }

            if (Util.ValidaDbNull(dr, "QtdCBO"))
            { item.QtdCBO = Convert.ToInt32(dr["QtdCBO"]); lstCampos.Add("QtdCBO"); lstHeader.Add("QtdCBO"); }

            if (Util.ValidaDbNull(dr, "QtdEscola"))
            { item.QtdEscola = Convert.ToInt32(dr["QtdEscola"]); lstCampos.Add("QtdEscola"); lstHeader.Add("QtdEscola"); }

            if (Util.ValidaDbNull(dr, "QtdSocios"))
            { item.QtdSocios = Convert.ToInt32(dr["QtdSocios"]); lstCampos.Add("QtdSocios"); lstHeader.Add("QtdSocios"); }

            if (Util.ValidaDbNull(dr, "QtdSPE"))
            { item.QtdSPE = Convert.ToInt32(dr["QtdSPE"]); lstCampos.Add("QtdSPE"); lstHeader.Add("QtdSPE"); }

            if (Util.ValidaDbNull(dr, "QtdCelular"))
            { item.QtdCelular = Convert.ToInt32(dr["QtdCelular"]); lstCampos.Add("QtdCelular"); lstHeader.Add("QtdCelular"); }



            StringBuilder auxNome = new StringBuilder();
            int contador = 0;
            foreach (string campo in lstCampos)
            {
                if (contador > 0) { auxNome.Append(","); }
                auxNome.Append(campo);
                contador = contador + 1;
            }
            item.seqFields = auxNome.ToString();

            auxNome = new StringBuilder();
            contador = 0;
            foreach (string campo in lstHeader)
            {
                if (contador > 0) { auxNome.Append(","); }
                auxNome.Append(campo);
                contador = contador + 1;
            }
            item.seqHeader = auxNome.ToString();

            return item;
        }
#endregion

#region Listar

        public static Pesquisa ListarHome(string pCpf)
        {

            /* try
             {*/
            DataTable dt = null;
            dt = AcessoDados.Get("PesquisaHome", CommandType.StoredProcedure)
                    .AddWithValue("@pCpf", pCpf)
                    .GetDataSet()
                    .Tables[0];

            /*  List<PesqPJ> lstResult = Bind(dt, pIdTabela);
              pesquisa.dados = lstResult; */

            Pesquisa pesquisa = Bind(dt, 2, 100);

            return pesquisa;
            /* }

             catch (Exception ex)
             {
                 throw ex;
             }*/
        }

        public static Pesquisa getPFbyEndereco(string pCep, int pNroIni, int pNroFim)
        {

            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("getPFbyEndereco", CommandType.StoredProcedure)
                        .AddWithValue("@pCep", pCep)
                        .AddWithValue("@pNroIni", pNroIni)
                        .AddWithValue("@pNroFim", pNroFim)
                        .GetDataSet()
                        .Tables[0];

                /*  List<PesqPJ> lstResult = Bind(dt, pIdTabela);
                  pesquisa.dados = lstResult; */

                Pesquisa pesquisa = Bind(dt, 2, 100);

                return pesquisa;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static Pesquisa getPJbyEndereco(string pCep, int pNroIni, int pNroFim)
        {

            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("getPJbyEndereco", CommandType.StoredProcedure)
                        .AddWithValue("@pCep", pCep)
                        .AddWithValue("@pNroIni", pNroIni)
                        .AddWithValue("@pNroFim", pNroFim)
                        .GetDataSet()
                        .Tables[0];

                /*  List<PesqPJ> lstResult = Bind(dt, pIdTabela);
                  pesquisa.dados = lstResult; */

                Pesquisa pesquisa = Bind(dt, 1, 100);

                return pesquisa;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static Pesquisa getPFbyPlaca(string pPlaca)
        {

            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("getPFbyPlaca", CommandType.StoredProcedure)
                        .AddWithValue("@pPlaca", pPlaca)
                        .GetDataSet()
                        .Tables[0];

                /*  List<PesqPJ> lstResult = Bind(dt, pIdTabela);
                  pesquisa.dados = lstResult; */

                Pesquisa pesquisa = Bind(dt, 2, 2);

                return pesquisa;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

       
        public static Pesquisa ListarParentes(string pCpf, string pMae, int pMunid)
        {

            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("getParentes", CommandType.StoredProcedure)
                        .AddWithValue("@pMae", pMae)
                        .AddWithValue("@pMunid", pMunid)
                        .AddWithValue("@pCpf", pCpf)
                        .GetDataSet()
                        .Tables[0];

                /*  List<PesqPJ> lstResult = Bind(dt, pIdTabela);
                  pesquisa.dados = lstResult; */

                Pesquisa pesquisa = Bind(dt, 2, 100);

                return pesquisa;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static Pesquisa ListaCPF(string pCPF)
        {
            /*try
            {*/
            DataTable dt = null;
            dt = AcessoDados.Get("PesquisaCPF", CommandType.StoredProcedure)
                    .AddWithValue("@pCPF", pCPF)
                    .GetDataSet()
                    .Tables[0];

            /*  List<PesqPJ> lstResult = Bind(dt, pIdTabela);
              pesquisa.dados = lstResult; */

            Pesquisa pesquisa = Bind(dt, 2, 100);

            return pesquisa;
            /*   }

               catch (Exception ex)
               {
                   throw ex;
               }*/

        }

        public static Pesquisa WsListaCPF(string pListaCPF)
        {
            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("PesquisaListaCPF", CommandType.StoredProcedure)
                        .AddWithValue("@ListaCPF", pListaCPF)
                        .GetDataSet()
                        .Tables[0];

                /*  List<PesqPJ> lstResult = Bind(dt, pIdTabela);
                  pesquisa.dados = lstResult; */

                Pesquisa pesquisa = Bind(dt, 2, 100);

                return pesquisa;
            }

            catch (Exception ex)
            {
                throw ex;
            }

        }

        public static Pesquisa ListaByNome(string pNome, string pUF, int pMunid)
        {

            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("getByNome", CommandType.StoredProcedure)
                        .AddWithValue("@pNome", pNome)
                        .AddWithValue("@pMunid", pMunid)
                        .AddWithValue("@pUF", pUF)
                        .GetDataSet()
                        .Tables[0];

                /*  List<PesqPJ> lstResult = Bind(dt, pIdTabela);
                  pesquisa.dados = lstResult; */

                Pesquisa pesquisa = Bind(dt, 2, 100);

                return pesquisa;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static Pesquisa ListaByPJNome(string pNome, string pUF, int pMunid)
        {

            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("getByNomePJ", CommandType.StoredProcedure)
                        .AddWithValue("@pNome", pNome)
                        .AddWithValue("@pMunid", pMunid)
                        .AddWithValue("@pUF", pUF)
                        .GetDataSet()
                        .Tables[0];

                /*  List<PesqPJ> lstResult = Bind(dt, pIdTabela);
                  pesquisa.dados = lstResult; */

                Pesquisa pesquisa = Bind(dt, 1, 100);

                return pesquisa;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static Pesquisa ListaByCnpj(string pCnpj)
        {

            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("getByCnpj", CommandType.StoredProcedure)
                        .AddWithValue("@pCnpj", pCnpj)
                        .GetDataSet()
                        .Tables[0];

                /*  List<PesqPJ> lstResult = Bind(dt, pIdTabela);
                  pesquisa.dados = lstResult; */

                Pesquisa pesquisa = Bind(dt, 1, 100);

                return pesquisa;
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }
        public static Pesquisa ListaEnderecosAnteriores(string pCPF, string pCEP)
        {
            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("PesquisaEnderecosAnteriores", CommandType.StoredProcedure)
                        .AddWithValue("@pCPF", pCPF)
                        .AddWithValue("@pCEP", pCEP)
                        .GetDataSet()
                        .Tables[0];

                /*  List<PesqPJ> lstResult = Bind(dt, pIdTabela);
                  pesquisa.dados = lstResult; */

                Pesquisa pesquisa = Bind(dt, 2, 100);

                return pesquisa;
            }

            catch (Exception ex)
            {
                throw ex;
            }

        }


        public static Pesquisa ListarValidos(int pMvwid,  int pCli_id)
        {


            DataTable dt = null;

            
                    dt = AcessoDados.Get("PesquisaDadosValidos", CommandType.StoredProcedure)
                        .AddWithValue("@pMvwid", pMvwid)
                        .AddWithValue("@pCli_id", pCli_id)                       
                        .GetDataSet()
                        .Tables[0];
            

            Pesquisa pesquisa = Bind(dt, 1, 0);
            


            return pesquisa;
           
        }

        public static Pesquisa Listar(int pIdTabela, int pIdUsuario, int pCli_id, int pIdVia, int ptipoPesquisa, string pFiltros, string filAdc, string pAgrupamentos, string pFltCompl, string pNomeFiltros, int pTipoContrato, int pIdPesquisa, int pQtdReg, string IP, string solic, string projeto, string prazo, string obs, bool expAllReg)
        {
            return Listar(pIdTabela, pIdUsuario, pCli_id, pIdVia, ptipoPesquisa, pFiltros, filAdc, pAgrupamentos, pFltCompl, pNomeFiltros, pTipoContrato, pIdPesquisa, pQtdReg, IP, solic, projeto, prazo, obs, expAllReg, true);
        }


            public static Pesquisa Listar(int pIdTabela, int pIdUsuario, int pCli_id, int pIdVia, int ptipoPesquisa, string pFiltros, string filAdc, string pAgrupamentos, string pFltCompl, string pNomeFiltros, int pTipoContrato, int pIdPesquisa, int pQtdReg, string IP, string solic, string projeto, string prazo, string obs, bool expAllReg, bool registraExportacao)
        {

            /* Pesquisa pesquisa = new Pesquisa();
             pesquisa.id = pIdPesquisa;
             pesquisa.campos = pAgrupamentos; */

            bool consIndividual = (pAgrupamentos.IndexOf("###") >= 0);
            bool consEnriquecimento = (pAgrupamentos.IndexOf("ERQ") >= 0);
            bool consClonagem = (pAgrupamentos.IndexOf("CLO") >= 0);

            pTipoContrato = 0;
            int ear;
            decimal mfatorctt = 5;
            decimal mfatordm = mfatordm = 0.5m;

            if (expAllReg == true)
                ear = 1;
            else
                ear = 0;



            /*try
             {
              */
            DataTable dt = null;
            if (consClonagem)
            {
                dt = AcessoDados.Get("ClonePJ", CommandType.StoredProcedure)
                 .AddWithValue("@pTempTable", pFiltros)
                 .AddWithValue("@pQtdRegistros", pQtdReg)
                 .GetDataSet()
                 .Tables[0];
            }
            else if (consEnriquecimento)
            {
                if (pIdTabela == 1)
                {
                    dt = AcessoDados.Get("EnriquecimentoPJ", CommandType.StoredProcedure)
                         .AddWithValue("@ListaCNPJ", filAdc)
                         .AddWithValue("@pQtdRegistros", pQtdReg)
                         .AddWithValue("@pCliId", pCli_id)
                         .GetDataSet()
                         .Tables[0];
                }
                else if (pIdTabela == 2)
                {
                    dt = AcessoDados.Get("EnriquecimentoPF", CommandType.StoredProcedure)
                         .AddWithValue("@ListaCPF", filAdc)
                         .AddWithValue("@pQtdRegistros", pQtdReg)
                         .GetDataSet()
                         .Tables[0];
                }
                else
                {
                    {
                        dt = AcessoDados.Get("EnriquecimentoSocio", CommandType.StoredProcedure)
                             .AddWithValue("@ListaCNPJ", filAdc)
                             .AddWithValue("@pQtdRegistros", pQtdReg)
                             .GetDataSet()
                             .Tables[0];
                    }
                }
            }


            else
            {

                if (consIndividual == true)
                {

                    if (filAdc.StartsWith("CPF"))
                    {
                        dt = AcessoDados.Get("PesquisaDs", CommandType.StoredProcedure)
                       .AddWithValue("@idTabela", pIdTabela)
                       .AddWithValue("@idfuncao", ptipoPesquisa)
                       .AddWithValue("@lstCampos", pAgrupamentos)
                       .AddWithValue("@lstFiltros", pFiltros)
                       .AddWithValue("@lstFltAdd", filAdc)
                       .AddWithValue("@p_CliId", ((pIdVia == 1 || consIndividual || consEnriquecimento) ? 0 : pCli_id))
                       .AddWithValue("@pIdPesquisa", pIdPesquisa)
                       .AddWithValue("@pQtdReg", pQtdReg)
                       .AddWithValue("@pexpAllReg", ear)
                       .GetDataSet()
                       .Tables[0];
                    }
                    else
                            {
                                dt = AcessoDados.Get("PesquisaDs", CommandType.StoredProcedure)
                               .AddWithValue("@idTabela", pIdTabela)
                               .AddWithValue("@idfuncao", ptipoPesquisa)
                               .AddWithValue("@lstCampos", pAgrupamentos)
                               .AddWithValue("@lstFiltros", pFiltros)
                               .AddWithValue("@lstFltAdd", filAdc)
                               .AddWithValue("@p_CliId", ((pIdVia == 1 || consIndividual || consEnriquecimento) ? 0 : pCli_id))
                               .AddWithValue("@pIdPesquisa", pIdPesquisa)
                               .AddWithValue("@pQtdReg", pQtdReg)
                               .AddWithValue("@pexpAllReg", ear)
                               .GetDataSet()
                               .Tables[0];
                            }
                }
                else
                {
                    dt = AcessoDados.Get("PesquisaDs", CommandType.StoredProcedure)
                        .AddWithValue("@idTabela", pIdTabela)
                        .AddWithValue("@idfuncao", ptipoPesquisa)
                        .AddWithValue("@lstCampos", pAgrupamentos)
                        .AddWithValue("@lstFiltros", pFiltros)
                        .AddWithValue("@lstFltAdd", filAdc)
                        .AddWithValue("@p_CliId", ((pIdVia == 1 || consIndividual || consEnriquecimento) ? 0 : pCli_id))
                        .AddWithValue("@pIdPesquisa", pIdPesquisa)
                        .AddWithValue("@pQtdReg", pQtdReg)
                        .AddWithValue("@pexpAllReg", ear)
                        .GetDataSet()
                        .Tables[0];
                }
            }

            /*  List<PesqPJ> lstResult = Bind(dt, pIdTabela);
              pesquisa.dados = lstResult; */
            int Socio = 0;
            if (pIdTabela == 3)
            { 
                pIdTabela = 1;
                Socio = 1;
            }
            Pesquisa pesquisa = Bind(dt, pIdTabela, (ptipoPesquisa == 2 ? 100 : 0));
            pesquisa.id = pIdPesquisa;

            int nQtdRegistros = 0;
            StringBuilder listaDocs = new StringBuilder();
            decimal vlrMailing = 0;
            decimal valor = 0;
            decimal vlruni = 0;
            int registros = 0;

            if (ptipoPesquisa == 2)
            {
                nQtdRegistros = pesquisa.dataDtb.Rows.Count;
                /* foreach (PesqPJ item in pesquisa.dados) */
                int nQtdDocs = 0;
                foreach (DataRow item in pesquisa.dataDtb.Rows)
                {

                    if (pIdTabela == 1) {
                       string mcnpj = item["cnpj"].ToString().Replace(".", "").Replace("-", "").Replace("/", "");
                       if (!listaDocs.ToString().Contains(mcnpj)) {
                            if (listaDocs.Length > 0)
                            {
                                listaDocs.Append(";");
                            }
                            listaDocs.Append(mcnpj);
                            nQtdDocs = nQtdDocs + 1;
                       }
                    }
                    else
                    {
                        if (listaDocs.Length > 0)
                        {
                            listaDocs.Append(";");
                        }
                        listaDocs.Append(item["cpf"].ToString().Replace(".", "").Replace("-", ""));
                        nQtdDocs = nQtdDocs + 1;
                    }

                }
                if (pAgrupamentos.IndexOf("CTT") >= 0 && !(consIndividual == true) && !(consEnriquecimento))
                {
                    nQtdRegistros = nQtdDocs;
                }
                

                    if ( Socio == 1)
                    {
                    
                    vlrMailing = 0.25m * nQtdRegistros;
                    valor = 0.25m * nQtdRegistros;
                    vlruni = 0.25m;

                }
                else
                {

                    if (pAgrupamentos.IndexOf("CTT") >= 0 && !(consIndividual == true) && !(consEnriquecimento))

                    {
                        registros = nQtdRegistros;
                        valor = nQtdRegistros * mfatorctt;
                        vlruni = mfatorctt;
                        vlrMailing = valor;

                    }

                    else

                    {
                        valor = nQtdRegistros;
                        vlruni = 1;
                        vlrMailing = valor;

                    }
                }
                
            }
            else
            {
                listaDocs.Append("");
                foreach (PesqPJ item in pesquisa.dados)
                { nQtdRegistros = nQtdRegistros + item.QtdRegistros; }
            }

            if (pIdUsuario > 0 && (ptipoPesquisa == 1 ? nQtdRegistros : valor) > 0 && registraExportacao)
            {

                if (solic.Length > 40) { solic = solic.Substring(0, 40); }

                DataTable xdt = null;
                xdt = AcessoDados.Get("MovWebUpdate", CommandType.StoredProcedure)
                   .AddWithValue("@pIdUsuario", pIdUsuario)
                   .AddWithValue("@pCli_id", pCli_id)
                   .AddWithValue("@pmvwVia", pIdVia)
                   .AddWithValue("@pmvwOper", ptipoPesquisa)
                   .AddWithValue("@pmvwArea", pIdTabela == 1 ? 2 : 1)
                   .AddWithValue("@pObs", "")
                   .AddWithValue("@pQtd", ptipoPesquisa == 1 ? nQtdRegistros : valor)
                   .AddWithValue("@pIdCampos", pAgrupamentos)
                   .AddWithValue("@pNmCampos", ListaNomeCampos(pIdTabela, pAgrupamentos, pCli_id, pTipoContrato))
                   .AddWithValue("@pIdFiltros", pFiltros)
                   .AddWithValue("@pIdFltCompl", pFltCompl)
                   .AddWithValue("@pNmFiltros", pNomeFiltros.Replace("</div>", ""))
                   .AddWithValue("@pListaDocs", listaDocs.ToString())
                   .AddWithValue("@pVlrCredito", vlrMailing)
                   .AddWithValue("@pValor", valor)
                   .AddWithValue("@pLiberado", (pTipoContrato == 1 && ptipoPesquisa == 2 ? 0 : 1))
                   .AddWithValue("@piP", IP)
                   .AddWithValue("@pSolic", solic)
                   .AddWithValue("@pProjeto", projeto)
                   .AddWithValue("@pPrazo", prazo)
                   .AddWithValue("@pCompl", obs)
                   .GetDataSet()
                   .Tables[0];

                pesquisa.id = Convert.ToInt32(xdt.Rows[0][0].ToString());
                

            }


            return pesquisa;
            /* }

              catch (Exception ex)
              {
                  throw ex;
              }*/
        }


        public static void Atualiza_Crm_PJ(int pidlista)
        {
            DataTable xdt = null;
            xdt = AcessoDados.Get("select ncrm_update_pjcrm(cpfcnpj) from movexportacao where mvwid = " + pidlista.ToString(),CommandType.Text)
                 .GetDataSet()
                 .Tables[0];
        }

        public static Pesquisa Listar(int pIdUsuario, int pCli_id, int pIdVia, int ptipoPesquisa, string pFiltros, string filAdc, string pAgrupamentos, string pFltCompl, string pNomeFiltros, int pTipoContrato, int pIdPesquisa, int pQtdReg, string ip, string solic, string projeto, string prazo, string obs, bool expallreg)
        {
            return Listar(1, pIdUsuario, pCli_id, pIdVia, ptipoPesquisa, pFiltros, filAdc, pAgrupamentos, pFltCompl, pNomeFiltros, pTipoContrato, pIdPesquisa, pQtdReg, ip, solic, projeto, prazo, obs, expallreg);
        }

#endregion

        public static string nomeLimPesq(int tipo)
        {
            string cRetorno;
            if (tipo == 1) { cRetorno = "Minuto"; }
            else if (tipo == 2) { cRetorno = "Hora"; }
            else if (tipo == 3) { cRetorno = "Dia"; }
            else if (tipo == 4) { cRetorno = "Semana"; }
            else { cRetorno = "Mês"; }

            return cRetorno;

        }

        public static resultValidacao ValidaFiltros(int pIdTabela, string filtros, string filAdc, int pOperacao, string agrupamentos, bool Enriquecimento)
        {
            resultValidacao lcRetorno = new resultValidacao();
            if (Enriquecimento)
            {
                lcRetorno.result = 1;
                lcRetorno.message = "";
            }
            else
                lcRetorno = ValidaFiltros(pIdTabela, filtros, filAdc, pOperacao, agrupamentos);

            return lcRetorno;

        }

        public static resultValidacao ValidaFiltros(int pIdTabela, string filtros, string filAdc, int pOperacao, string agrupamentos)
        {
            resultValidacao lcRetorno = new resultValidacao();

            lcRetorno.message = "Me desculpe, aplicar pelo menos 1 filtro para efetuar a pesquisa";



            if (filtros.Length == 0 && filAdc.Length == 0)
                lcRetorno.result = -1;
            else if (pOperacao == 1 && agrupamentos.Split(',').Length > 4)
            {
                lcRetorno.result = -1;
                lcRetorno.message = "Me desculpe, são permitidos no máximo 4 Campos de agrupamento na contagem.";
            }
            else if (filtros.Length == 0 && filAdc.IndexOf("CGC") < 0 && filAdc.IndexOf("CEP") < 0 && filAdc.IndexOf("EML") < 0 && filAdc.IndexOf("DOM") < 0 && pIdTabela == 1 && filAdc.IndexOf("),") < 0)
                lcRetorno.result = -1;
            else if (filtros.Length == 0 && filAdc.IndexOf("CPF") < 0 && filAdc.IndexOf("CEP") < 0 && filAdc.IndexOf("EML") < 0 && filAdc.IndexOf("DOM") < 0 && pIdTabela == 2 && filAdc.IndexOf("),") < 0)
                lcRetorno.result = -1;
            else if (filtros.Length == 0 && filAdc.IndexOf("!CGC") >= 0 && pIdTabela == 1)
                lcRetorno.result = -1;
            else if (filtros.Length == 0 && filAdc.IndexOf("!CPF") >= 0 && pIdTabela == 2)
                lcRetorno.result = -1;
            /* else if (filtros.IndexOf(",") < 0 && filtros.IndexOf("RAZ") < 0 && filtros.IndexOf("RZZ") < 0 && filtros.IndexOf("NOM") < 0 && filtros.IndexOf("VRN") < 0 && filAdc.Length == 0)
                lcRetorno.result = -1; */
            else if (pIdTabela == 1 && ((filtros.IndexOf("QFI") >= 0 || filtros.IndexOf("QFF") >= 0) && filtros.IndexOf("PRT") >= 0))
            {
                lcRetorno.result = -1;
                lcRetorno.message = "Não é permitido selecionar simultaneamente quantidade de funcionários e porte";
            }
            else
            {
                lcRetorno.result = 1;
                lcRetorno.message = "";
            }

            return lcRetorno;
        }

        public static resultValidacao ValidaPesquisa(int pIdTabela, int pIdUsuario, int pCli_Id, int pTipoContrato, int pQtdMaxPesq, int pTpLimPesq, int pQtdMaxExp, int pTpLimExp, int pOperacao, string agrupamentos, string filtros, string filAdc, int qtdRegExp, string solic, string projeto, string prazo, string obs, bool allregexp)
        {
            return ValidaPesquisa(pIdTabela, pIdUsuario, pCli_Id, pTipoContrato, pQtdMaxPesq, pTpLimPesq, pQtdMaxExp, pTpLimExp, pOperacao, agrupamentos, filtros, filAdc, qtdRegExp, solic, projeto, prazo, obs, allregexp, 0);
        }


        public static resultValidacao ValidaPesquisa(int pIdTabela, int pIdUsuario, int pCli_Id, int pTipoContrato, int pQtdMaxPesq, int pTpLimPesq, int pQtdMaxExp, int pTpLimExp, int pOperacao, string agrupamentos, string filtros, string filAdc, int qtdRegExp, string solic, string projeto, string prazo, string obs, bool allregexp, int tipoServico)
        {
            resultValidacao oRetorno = new resultValidacao();
            oRetorno.result = 1;
            oRetorno.message = "";
            oRetorno.vlrcredito = 0;
            oRetorno.valor = 0;

            pTipoContrato = 0;
            pQtdMaxPesq = 0;
            pTpLimPesq = 0;
            pQtdMaxExp = 0;
            pTpLimExp = 0;

            decimal mfatorctt = 5;
            decimal mfatordm = 0.5m;

            bool consIndividual = (agrupamentos.IndexOf("###") >= 0);
            bool consEnriquecimento = (agrupamentos.IndexOf("ERQ") >= 0 || agrupamentos.IndexOf("CLO") >= 0 || agrupamentos.IndexOf("JOB") >= 0);
            bool consJOB = (agrupamentos.IndexOf("JOB") >= 0);
            int Socio = 0;

            if (pIdTabela == 3)
            {
                pIdTabela = 1;
                Socio = 1;

            }

            resultValidacao retFiltro = ValidaFiltros(pIdTabela, filtros, filAdc, pOperacao, agrupamentos, consEnriquecimento);

            if (agrupamentos.Length == 0 && !(consEnriquecimento))
            {
                oRetorno.result = -1;
                if (pOperacao == 1)
                    oRetorno.message = "Nenhum campo de agrupamento selecionado para contagem...";
                else
                    oRetorno.message = "Nenhum campo selecionado para exportação...";
            }

            else if (retFiltro.result == -1 && !(consIndividual))
            {
                oRetorno.result = retFiltro.result;
                oRetorno.message = retFiltro.message;
            }
            else
            {
                if (pOperacao == 1) // Contagem
                {
                    if (pCli_Id > 0 && pTpLimPesq > 0 && getQtdMovCliente(pCli_Id, pOperacao, pTpLimPesq, pIdTabela) >= pQtdMaxPesq)
                    { oRetorno.result = -1; oRetorno.message = "Limite de " + pQtdMaxPesq.ToString() + " contagens/" + nomeLimPesq(pTpLimPesq) + " atingida. Entre em contato conosco para atualizar o seu plano."; }
                }
                else
                {
                    if (qtdRegExp <= 0 && !allregexp)
                    {
                        oRetorno.result = -1;
                        oRetorno.message = "Quantidade de registros a exportar inválida ou não foi Informada...";
                    }
                    else
                    {

                        if (pCli_Id > 0)
                        {
                            StringBuilder htmlComplemento = new StringBuilder();
                            int qtdExporta;
                            int qtdReg;
                            if (consIndividual)
                                qtdReg = 1;
                            else if (consJOB)
                                qtdReg = qtdRegExp;
                            else if (consEnriquecimento)
                            {
                                Pesquisa QtdsEnr = Contagem(pIdTabela, filAdc);
                                PesqPJ p = QtdsEnr.dados.First();
                                qtdReg = p.QtdRegistros;

                                if (p.QtdEnderecos >= 0 && Socio == 0)
                                    htmlComplemento.Append("<tr><td> com Endereço: </td><td><b>" + p.QtdEnderecos.ToString("###,##0") + "</b> registro(s).</td></tr>");
                                if (p.QtdTelefones >= 0 && Socio == 0)
                                    htmlComplemento.Append("<tr><td> com Telefone: </td><td><b>" + p.QtdTelefones.ToString("###,##0") + "</b> registro(s).</td></tr>");
                                if (p.QtdCelular >= 0 && Socio == 0)
                                    htmlComplemento.Append("<tr><td> com Celular: </td><td><b>" + p.QtdCelular.ToString("###,##0") + "</b> registro(s).</td></tr>");
                                if (p.QtdEmail >= 0 && Socio == 0)
                                    htmlComplemento.Append("<tr><td> com E-mail: </td><td><b>" + p.QtdEmail.ToString("###,##0") + "</b> registro(s).</td></tr>");
                                if (p.QtdSite >= 0 && Socio == 0)
                                    htmlComplemento.Append("<tr><td> com WebSite: </td><td><b>" + p.QtdSite.ToString("###,##0") + "</b> registro(s).</td></tr>");
                                if (p.QtdEmpresaVinc >= 0 && Socio == 0)
                                    htmlComplemento.Append("<tr><td> com Empresas Vinculadas: </td><td><b>" + p.QtdEmpresaVinc.ToString("###,##0") + "</b> registro(s).</td></tr>");
                                if (p.QtdDtNasc >= 0 && Socio == 0)
                                    htmlComplemento.Append("<tr><td> com Data de Nascimento: </td><td><b>" + p.QtdDtNasc.ToString("###,##0") + "</b> registro(s).</td></tr>");
                                if (p.QtdContatos >= 0 && Socio == 0)
                                    htmlComplemento.Append("<tr><td> com Contatos: </td><td><b>" + p.QtdContatos.ToString("###,##0") + "</b> registro(s).</td></tr>");
                                if (p.QtdSocios >= 0 && Socio == 1)
                                    htmlComplemento.Append("<tr><td> Total de Socios: </td><td><b>" + p.QtdSocios.ToString("###,##0") + "</b> registro(s).</td></tr>");
                            }
                            else
                                qtdReg = Contagem(pIdTabela, filtros, filAdc, ((consIndividual || consEnriquecimento) ? 0 : pCli_Id));

                            if (allregexp)
                                qtdExporta = (qtdReg < qtdRegExp) ? qtdReg : qtdRegExp;
                            else
                                qtdExporta = (qtdReg < qtdRegExp) ? qtdReg : qtdRegExp;


                            decimal vlrMailing = 0;
                            decimal valor = 0;
                            decimal vlrUnit = 0;
                            int registros = 0;


                            
                            if (Socio == 1)
                            {

                                vlrMailing = 0.03m * qtdRegExp;
                                valor = 0.03m * qtdRegExp;
                                vlrUnit = 0.03m;

                            }

                            if (agrupamentos.IndexOf("CTT") >= 0)

                            {
                                registros = qtdExporta;
                                valor = qtdExporta * mfatorctt;
                                vlrUnit = mfatorctt;
                                vlrMailing = valor;

                            }

                            else

                            {
                                valor = qtdExporta * (tipoServico == 1 ? mfatordm : 1);
                                vlrUnit = 1 * (tipoServico == 1 ? mfatordm : 1);
                                vlrMailing = valor;

                            }
                           


                            oRetorno.vlrcredito = vlrMailing;
                            oRetorno.valor = valor;

                            StringBuilder msgUsuario = new StringBuilder();

                            if (!(string.IsNullOrEmpty(htmlComplemento.ToString())))
                                msgUsuario.Append(htmlComplemento.ToString());

                        }
                    }
                }
            }
            return oRetorno;
        }


        public static resultValidacao ValidaPesquisa(int pIdUsuario, int pCli_Id, int pTipoContrato, int pQtdMaxPesq, int pTpLimPesq, int pQtdMaxExp, int pTpLimExp, int pOperacao, string agrupamentos, string filtros, string filAdc, int qtdRegExp, string solic, string projeto, string prazo, string obs, bool allregexp)
        {
            return ValidaPesquisa(1, pIdUsuario, pCli_Id, pTipoContrato, pQtdMaxPesq, pTpLimPesq, pQtdMaxExp, pTpLimExp, pOperacao, agrupamentos, filtros, filAdc, qtdRegExp, solic, projeto, prazo, obs, allregexp);
        }

        #region Contagem

        public static int Contagem(int pidTabela, string pFiltros, string filAdc, int pCli_id)
        {

            try
            {
                DataSet dt = null;
                int qtdRegistros = 0;
                dt = AcessoDados.Get("PesquisaDs", CommandType.StoredProcedure)
                        .AddWithValue("@idTabela", pidTabela)
                        .AddWithValue("@idFuncao", 3)
                        .AddWithValue("@lstCampos", "")
                        .AddWithValue("@lstFiltros", pFiltros)
                        .AddWithValue("@lstFltAdd", filAdc)
                        .AddWithValue("@p_CliId", pCli_id)
                        .AddWithValue("@pIdPesquisa", 0)
                        .AddWithValue("@pQtdReg", 0)
                        .AddWithValue("@pexpAllReg", true)
                        .GetDataSet();

                if (dt != null)
                {
                    // valor inicial
                    PesqPJ p = null;

                    if ((dt.Tables[0] != null) && (dt.Tables[0].Rows != null) && (dt.Tables[0].Rows.Count > 0))
                    { p = new PesqPJ(); p = (PesqPJ)Bind(dt.Tables[0], pidTabela).First(); }

                    qtdRegistros = p.QtdRegistros;
                }

                return qtdRegistros;

            }

            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static int ContagemAsync(int pidTabela, string pFiltros, string filAdc, int pCli_id)
        {

            try
            {
                DataSet dt = null;
                int qtdRegistros = 0;
                dt = AcessoDados.Get("PesquisaDs", CommandType.StoredProcedure)
                        .AddWithValue("@idTabela", pidTabela)
                        .AddWithValue("@idFuncao", 3)
                        .AddWithValue("@lstCampos", "")
                        .AddWithValue("@lstFiltros", pFiltros)
                        .AddWithValue("@lstFltAdd", filAdc)
                        .AddWithValue("@p_CliId", pCli_id)
                        .AddWithValue("@pIdPesquisa", 0)
                        .AddWithValue("@pQtdReg", 0)
                        .AddWithValue("@pexpAllReg", true)
                        .GetDataSet();

                if (dt != null)
                {
                    // valor inicial
                    PesqPJ p = null;

                    if ((dt.Tables[0] != null) && (dt.Tables[0].Rows != null) && (dt.Tables[0].Rows.Count > 0))
                    { p = new PesqPJ(); p = (PesqPJ)Bind(dt.Tables[0], pidTabela).First(); }

                    qtdRegistros = p.QtdRegistros;
                }

                return qtdRegistros;

            }

            catch (Exception ex)
            {
                throw ex;
            }
        }


        #endregion


            public static Pesquisa Contagem(int pidTabela, string pListaCPFCNPJ)
        
        {
            DataTable dt = null;
            if (pidTabela == 1)
            {
               
                dt = AcessoDados.Get("getQtdEnrqPJ", CommandType.StoredProcedure)
                        .AddWithValue("@ListaCNPJ", pListaCPFCNPJ)
                        .GetDataSet()
                        .Tables[0];
            }
            else if (pidTabela == 2)
            {
                dt = AcessoDados.Get("getQtdEnrqPF", CommandType.StoredProcedure)
                        .AddWithValue("@ListaCPF", pListaCPFCNPJ)
                        .GetDataSet()
                        .Tables[0];
            }
            else if (pidTabela == 9)
            {
                dt = AcessoDados.Get("getQtdEnrRF", CommandType.StoredProcedure)
                        .AddWithValue("@ListaCNPJ", pListaCPFCNPJ)
                        .GetDataSet()
                        .Tables[0];
            }
            else
            {
                dt = AcessoDados.Get("getQtdEnrqSocios", CommandType.StoredProcedure)
                        .AddWithValue("@ListaCNPJ", pListaCPFCNPJ)
                        .GetDataSet()
                        .Tables[0];
            }

            /*  List<PesqPJ> lstResult = Bind(dt, pIdTabela);
              pesquisa.dados = lstResult; */

            Pesquisa pesquisa = Bind(dt, 2, 100);

            return pesquisa;


        }


#region getQtdMovCliente

        public static int getQtdMovCliente(int pCli_Id, int pTpOper, int pTpLimite, int pIdTabela)
        {

            try
            {
                DataSet dt = null;
                int qtd = 0;
                dt = AcessoDados.Get("obterQtdMovbyCliente", CommandType.StoredProcedure)
                        .AddWithValue("@pCliId", pCli_Id)
                        .AddWithValue("@pTipoOper", pTpOper)
                        .AddWithValue("@pTipoLimite", pTpLimite)
                        .GetDataSet();

                if (dt != null)
                {
                    // valor inicial
                    PesqPJ p = null;

                    if ((dt.Tables[0] != null) && (dt.Tables[0].Rows != null) && (dt.Tables[0].Rows.Count > 0))
                    { p = new PesqPJ(); p = (PesqPJ)Bind(dt.Tables[0], pIdTabela).First(); }

                    qtd = p.QtdRegistros;
                }

                return qtd;

            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

#endregion


#region getQtdAjustesCliente

        public static int getQtdAjustesCliente(int pCli_Id, int pTpLimite)
        {

            try
            {
                DataSet dt = null;
                int qtd = 0;
                dt = AcessoDados.Get("obterQtdAjustesbyCliente", CommandType.StoredProcedure)
                        .AddWithValue("@pCliId", pCli_Id)
                        .AddWithValue("@pTipoLimite", pTpLimite)
                        .GetDataSet();

                if (dt != null)
                {
                    // valor inicial
                    PesqPJ p = null;

                    if ((dt.Tables[0] != null) && (dt.Tables[0].Rows != null) && (dt.Tables[0].Rows.Count > 0))
                    { p = new PesqPJ(); p = (PesqPJ)Bind(dt.Tables[0], 1).First(); }

                    qtd = p.QtdRegistros;
                }

                return qtd;

            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

#endregion


    }
}


