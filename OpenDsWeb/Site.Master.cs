using System;
using System.Web;
using System.Web.UI;


namespace OpenDsWeb 
{ 
    public partial class SiteMaster : System.Web.UI.MasterPage
    {

       

        protected void Page_Load(object sender, EventArgs e)
        {
            
        // Filipe 27/06/2014: Avoid browser back button 
             Response.Cache.SetNoStore();
            Response.Cache.AppendCacheExtension("no-cache");
            Response.Expires = 0;

            if (!IsPostBack)
            {

            }

        }

        protected void lkbLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("/Login.aspx");
     
        }



        protected void lkbPesquisaBase_Click(object sender, EventArgs e)
        {

            // indica operação
            //Session["Action"] = "AlterarSenha";
            Response.Redirect("PesquisaBase.aspx");

        }


      

        protected void lkbSairSistema_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            //System.AppDomain.Unload();
            System.Environment.Exit(0);
        }

        protected void doMainMenu(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx", false);
        }


        protected void doLogOut(object sender, EventArgs e)
        {
           Response.Redirect("Login.aspx", false);
          }

     


        // Filipe 14/08/2014: Propriedade para exibição do título da página
        private string _PageTitle;
        public string PageTitle
        {
            get
            {
                return _PageTitle;
            }
            set
            {
                _PageTitle = value;
            }
        }

        

        public void ChangeTitle(string newTitle)
        {
            Page.Title = newTitle;
        }

     



    }
}
