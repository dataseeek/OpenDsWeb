using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace OpenDsWeb
{
    public class mesoregiao
    {
        public int idmeso { get; set; }
        public string nmmeso { get; set; }
        public int ddd { get; set; }
        public string uf { get; set; }

        #region Bind
        private static List<mesoregiao> Bind(DataTable dt)
        {
            List<mesoregiao> items = new List<mesoregiao>();
            foreach (DataRow dr in dt.Rows)
                items.Add(Bind(dr));
            return items;
        }
        #endregion

        #region Bind
        private static mesoregiao Bind(DataRow dr)
        {
            mesoregiao item = new mesoregiao();

            if (Util.ValidaDbNull(dr, "ddd"))
            { item.ddd = Convert.ToInt32(dr["ddd"]); }

            if (Util.ValidaDbNull(dr, "uf"))
            { item.uf = dr["uf"].ToString(); }

            if (Util.ValidaDbNull(dr, "idmeso"))
            { item.idmeso = Convert.ToInt32(dr["idmeso"]); }

            if (Util.ValidaDbNull(dr, "nmmeso"))
            { item.nmmeso = dr["nmmeso"].ToString(); }

            return item;
        }
        #endregion

        #region Listar
        public static List<mesoregiao> Listar()
        {
            return Listar(1, String.Empty);
        }

        public static List<mesoregiao> Listar(int pTipoPesquisa, string filtros)
        {
            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("getMSR", CommandType.StoredProcedure)
                        .AddWithValue("@tipoPesq", pTipoPesquisa)
                        .AddWithValue("@filtros", filtros)
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
