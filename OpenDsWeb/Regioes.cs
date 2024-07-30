using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace OpenDsWeb
{
    public class Regioes
    {
        public string id { get; set; }
        public string UF { get; set; }
        public int NroRegistros { get; set; }
        public string QtdRegistros { get; set; }
        public string html { get; set; }

        #region Bind
        private static List<Regioes> Bind(DataTable dt)
        {
            List<Regioes> items = new List<Regioes>();
            foreach (DataRow dr in dt.Rows)
                items.Add(Bind(dr));
            return items;
        }
        #endregion

        #region Bind
        private static Regioes Bind(DataRow dr)
        {
            Regioes item = new Regioes();
            if (Util.ValidaDbNull(dr, "QtdRegistros"))
            {
                item.NroRegistros = Convert.ToInt32(dr["QtdRegistros"]);
                item.QtdRegistros = item.NroRegistros.ToString("#,###,##0");
            }

            if (Util.ValidaDbNull(dr, "uf"))
            { item.UF = dr["UF"].ToString(); item.id = item.UF; }

            if (Util.ValidaDbNull(dr, "html"))
            { item.html = dr["html"].ToString();  }

            return item;
        }
        #endregion

        #region Listar

        public static List<Regioes> Listar()
        {
            return Listar(1);
        }

        public static List<Regioes> Listar(int tipoPesquisa)
        {
            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("GetUF", CommandType.StoredProcedure)
                        .AddWithValue("@TipoPesq", tipoPesquisa)
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
}
