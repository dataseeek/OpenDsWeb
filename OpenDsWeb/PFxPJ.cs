using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace OpenDsWeb
{
    public class PFxPJ
    {
        public string cpf { get; set; }
        public string cnpj { get; set; }
        public string nm { get; set; }
        public string cargo { get; set; }
        public string entrada { get; set; }
        public string part { get; set; }
        public string email { get; set; }
        public string email2 { get; set; }
        public string nrodoc { get; set; }
        public string tipo { get; set; }
        public string cel1 { get; set; }
        public string cel2 { get; set; }
        public string cnae { get; set; }
        public string cnae_desc { get; set; }


        #region Bind
        private static List<PFxPJ> Bind(DataTable dt)
        {
            List<PFxPJ> items = new List<PFxPJ>();
            foreach (DataRow dr in dt.Rows)
            {
                PFxPJ it = Bind(dr);
                if (it.email == null) { it.email = String.Empty; }
                if (it.email2 == null) { it.email2 = String.Empty; }
                if (it.nrodoc == null) { it.nrodoc = String.Empty; }
                if (it.tipo == null) { it.tipo = String.Empty; }
                if (it.cel1 == null) { it.cel1 = String.Empty; }
                if (it.cel2 == null) { it.cel2 = String.Empty; }
                items.Add(it);
            }
            return items;
        }
        #endregion

        #region Bind
        private static PFxPJ Bind(DataRow dr)
        {
            PFxPJ item = new PFxPJ();

            if (Util.ValidaDbNull(dr, "cpf"))
                item.cpf = dr["cpf"].ToString();

            if (Util.ValidaDbNull(dr, "cnpj"))
                item.cnpj = dr["cnpj"].ToString();

            if (Util.ValidaDbNull(dr, "nm"))
                item.nm = dr["nm"].ToString();

            if (Util.ValidaDbNull(dr, "cargo"))
                item.cargo = dr["cargo"].ToString();

            if (Util.ValidaDbNull(dr, "entrada"))
                item.entrada = dr["entrada"].ToString();

            if (Util.ValidaDbNull(dr, "part"))
                item.part = dr["part"].ToString();

            if (Util.ValidaDbNull(dr, "email"))
                item.email = dr["email"].ToString();

            if (Util.ValidaDbNull(dr, "email2"))
                item.email2 = dr["email2"].ToString();

            if (Util.ValidaDbNull(dr, "cel1"))
                item.cel1 = dr["cel1"].ToString();

            if (Util.ValidaDbNull(dr, "cel2"))
                item.cel2 = dr["cel2"].ToString();

            if (Util.ValidaDbNull(dr, "nrodoc"))
                item.nrodoc = dr["nrodoc"].ToString();

            if (Util.ValidaDbNull(dr, "tipo"))
                item.tipo = dr["tipo"].ToString();

            if (Util.ValidaDbNull(dr, "cnae"))
                item.cnae = dr["cnae"].ToString();

            if (Util.ValidaDbNull(dr, "cnae_desc"))
                item.cnae_desc = dr["cnae_desc"].ToString();

            return item;
        }
        #endregion

        #region Listar

        public static List<PFxPJ> getPJfromCPF(string cpf, int tipo)
        {
           try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("getPJfromCPF", CommandType.StoredProcedure)
                        .AddWithValue("@pCPF", cpf)
                        .AddWithValue("@ptipo", tipo)
                        .GetDataSet()
                        .Tables[0];
                return Bind(dt);
           }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        public static List<PFxPJ> getPFfromCNPJ(string cnpj, int tipo)
        {
            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("getPFfromCNPJ", CommandType.StoredProcedure)
                        .AddWithValue("@pCNPJ", cnpj)
                        .AddWithValue("@ptipo", tipo)
                        .GetDataSet()
                        .Tables[0];
                return Bind(dt);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static List<PFxPJ> getPFfromCNPJLista(string cnpj, int tipo)
        {
            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("getPFfromCNPJLista", CommandType.StoredProcedure)
                        .AddWithValue("@pCNPJLista", cnpj)
                        .AddWithValue("@ptipo", tipo)
                        .GetDataSet()
                        .Tables[0];
                return Bind(dt);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

    }

    public class PFxPJBasico
    {
        public string cpf { get; set; }
        public string cnpj { get; set; }
        public string nm { get; set; }
        public string cargo { get; set; }
        public string entrada { get; set; }
        public string part { get; set; }
        public string cel1 { get; set; }
        public string cel2 { get; set; }


        #region Bind
        private static List<PFxPJBasico> Bind(DataTable dt)
        {
            List<PFxPJBasico> items = new List<PFxPJBasico>();
            foreach (DataRow dr in dt.Rows)
                items.Add(Bind(dr));
            return items;
        }
        #endregion

        #region Bind
        private static PFxPJBasico Bind(DataRow dr)
        {
            PFxPJBasico item = new PFxPJBasico();

            if (Util.ValidaDbNull(dr, "cpf"))
                item.cpf = dr["cpf"].ToString();

            if (Util.ValidaDbNull(dr, "cnpj"))
                item.cnpj = dr["cnpj"].ToString();

            if (Util.ValidaDbNull(dr, "nm"))
                item.nm = dr["nm"].ToString();

            if (Util.ValidaDbNull(dr, "cargo"))
                item.cargo = dr["cargo"].ToString();

            if (Util.ValidaDbNull(dr, "entrada"))
                item.entrada = dr["entrada"].ToString();

            if (Util.ValidaDbNull(dr, "part"))
                item.part = dr["part"].ToString();

            if (Util.ValidaDbNull(dr, "cel1"))
                item.cel1 = dr["cel1"].ToString();

            if (Util.ValidaDbNull(dr, "cel2"))
                item.cel2 = dr["cel2"].ToString();

            return item;
        }
        #endregion

        #region Listar

        public static List<PFxPJBasico> getPFfromCNPJBasico(string cnpj, int tipo)
        {
            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("getPFfromCNPJBasico", CommandType.StoredProcedure)
                        .AddWithValue("@pCNPJ", cnpj)
                        .AddWithValue("@ptipo", tipo)
                        .GetDataSet()
                        .Tables[0];
                return Bind(dt);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }


        public static List<PFxPJBasico> getParentes(string cpf, int munid, string mae)
        {
            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("getParentes", CommandType.StoredProcedure)
                        .AddWithValue("@pMae", mae)
                        .AddWithValue("@pMunid", munid)
                        .AddWithValue("@pCpf", cpf)
                        .GetDataSet()
                        .Tables[0];
                return Bind(dt);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        #endregion

    }

    public class GrupoEconomico
    {
        public string cnpj_raiz { get; set; }
        public string cnpj { get; set; }
        public string nm { get; set; }
        public string motivo_associacao { get; set; }


        #region Bind
        private static List<GrupoEconomico> Bind(DataTable dt)
        {
            List<GrupoEconomico> items = new List<GrupoEconomico>();
            foreach (DataRow dr in dt.Rows)
                items.Add(Bind(dr));
            return items;
        }
        #endregion

        #region Bind
        private static GrupoEconomico Bind(DataRow dr)
        {
            GrupoEconomico item = new GrupoEconomico();

            if (Util.ValidaDbNull(dr, "cnpj_raiz"))
                item.cnpj_raiz = dr["cnpj_raiz"].ToString();

            if (Util.ValidaDbNull(dr, "cnpj"))
                item.cnpj = dr["cnpj"].ToString();

            if (Util.ValidaDbNull(dr, "nm"))
                item.nm = dr["nm"].ToString();

            if (Util.ValidaDbNull(dr, "motivo_associacao"))
                item.motivo_associacao = dr["motivo_associacao"].ToString();

            return item;
        }
        #endregion

        #region Listar

        public static List<GrupoEconomico> getGrupoEconomicofromCNPJ(string cnpj)
        {
            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("getGrupoQSAfromCNPJ", CommandType.StoredProcedure)
                        .AddWithValue("@pCNPJ", cnpj)
                        .GetDataSet()
                        .Tables[0];
                return Bind(dt);
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }


        #endregion

    }

   
       
        public class Links
        {
            public string source { get; set; }
            public string target { get; set; }
            public int distance { get; set; }            
            public string relationship { get; set; }

        #region Bind Links
        private static List<Links> BindLinks(DataTable dt)
            {
                List<Links> items = new List<Links>();
                foreach (DataRow dr in dt.Rows)
                    items.Add(BindAuto(dr));
                return items;
            }
            #endregion

            #region Bind Links
            private static Links BindOld(DataRow dr)
            {
                Links item = new Links();


                if (Util.ValidaDbNull(dr, "source"))
                    item.source = dr["source"].ToString();

                if (Util.ValidaDbNull(dr, "target"))
                    item.target = dr["target"].ToString();

                if (Util.ValidaDbNull(dr, "distance"))
                    item.distance = Convert.ToInt32(dr["distance"]);
                

            return item;
            }
       

        private static Links BindAuto(DataRow dr)
        {

            Links item = new Links();

            foreach (DataColumn dc in dr.Table.Columns)
            {
                string campo = dc.ColumnName;


                var propInfo = item.GetType().GetProperty(campo);
                if (propInfo != null)
                {

                    if (propInfo.PropertyType.Name.Contains("Int64"))
                        propInfo.SetValue(item, Convert.ToInt64(dr[campo]), null);
                    else if (propInfo.PropertyType.Name.Contains("Int32"))
                        propInfo.SetValue(item, Convert.ToInt32(dr[campo]), null);
                    else
                        propInfo.SetValue(item, dr[campo].ToString(), null);

                }

            }

            return item;
        }
        
        #endregion

        public static List<Links> getLinks(string tabela, int tipo, long cnpj)
            {
                try
                {
                    DataTable dt = null;
                    dt = AcessoDados.Get("_NetworkPJ2", CommandType.StoredProcedure)
                            .AddWithValue("@pTabela", tabela)
                            .AddWithValue("@pTipo", tipo)
                            .AddWithValue("@pCNPJ", cnpj)
                            .GetDataSet()
                            .Tables[0];
                    return BindLinks(dt);
                }

                catch (Exception ex)
                {
                    throw ex;
                }
            }

        }

        public class Node
        {
        public string id { get; set; }
        public string name { get; set; }
        public string tipo { get; set; }

            #region Bind Nodes
            private static List<Node> BindNodes(DataTable dt)
            {
                List<Node> items = new List<Node>();
                foreach (DataRow dr in dt.Rows)
                    items.Add(BindN(dr));
                return items;
            }
            #endregion

            #region Bind Nodes
            private static Node BindN(DataRow dr)
            {
                Node item = new Node();

                if (Util.ValidaDbNull(dr, "id"))
                    item.id = dr["id"].ToString();

                if (Util.ValidaDbNull(dr, "name"))
                    item.name = dr["name"].ToString();

                if (Util.ValidaDbNull(dr, "tipo"))
                    item.tipo = dr["tipo"].ToString();



                return item;
            }
            #endregion

            public static List<Node> getNodes(string cnpj, int tipo)
            {
                try
                {
                    DataTable dt = null;
                    dt = AcessoDados.Get("_NetworkPJ", CommandType.StoredProcedure)
                            .AddWithValue("@pCnpj", cnpj)
                            .AddWithValue("@pTipo", tipo)
                            .GetDataSet()
                            .Tables[0];
                    return BindNodes(dt);
                }

                catch (Exception ex)
                {
                    throw ex;
                }
            }

    }
}
