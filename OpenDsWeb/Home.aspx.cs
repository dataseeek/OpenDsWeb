using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Configuration;
using System.Reflection;
using System.Security.Authentication;
using System.Net;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Text;

namespace OpenDsWeb
{
    public partial class Home : System.Web.UI.Page
    {

        #region Page_Load
        protected void Page_Load(object sender, EventArgs e)
        {
            // Filipe 14/08/2014: determina título da página
            this.Master.ChangeTitle("Minha Conta");

        }
        #endregion

        public class resultBlackList
        {
            public int result;
            public string msgresult;
        }
   
        public class inputPesquisa
        {
            public string cliente;
            public string tipo;
            public string idmov;
            public string status;
            public string usuario;
            public string usrnivel;
            public string valor;
            public string listacpfcnpj;
        }

        public class inputSalvar
        {
            public int id;
            public string contato;
            public string telefone;
            public string EmailLogin;
            public string cnpj;

        }

        public class ReturnCliData
        {
            public string saldo;
            public string esaldo;
            public string apisaldo;
            public string datavenc;
            public string fatorctt;

        }

        public class editReturn
        {
            public Boolean success;
            public Boolean showMessage;
            public string message;
        }
    }


}