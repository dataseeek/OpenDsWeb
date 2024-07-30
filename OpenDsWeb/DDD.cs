using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace OpenDsWeb
{
    public class DDD
    {
        public string id { get; set; }
        public string ddd { get; set; }
        public string uf { get; set; }
        public string QtdRegistros { get; set; }
        public int NroRegistros { get; set; }

        #region Bind
        private static List<DDD> Bind(DataTable dt)
        {
            List<DDD> items = new List<DDD>();
            foreach (DataRow dr in dt.Rows)
                items.Add(Bind(dr));
            return items;
        }
        #endregion

        #region Bind
        private static DDD Bind(DataRow dr)
        {
            DDD item = new DDD();
            if (Util.ValidaDbNull(dr, "QtdRegistros"))
            {
                item.NroRegistros = Convert.ToInt32(dr["QtdRegistros"]);
                item.QtdRegistros = item.NroRegistros.ToString("#,###,##0");
            }

            if (Util.ValidaDbNull(dr, "ddd"))
            { item.ddd = dr["ddd"].ToString(); item.id = item.ddd; }

            if (Util.ValidaDbNull(dr, "uf"))
            { item.uf = dr["uf"].ToString(); }

            return item;
        }
        #endregion

        #region Listar

        public static List<DDD> Listar(string filtros)
        {
            return Listar(1, filtros);
        }

        public static List<DDD> Listar(int tipoPesquisa, string filtros)
        {
            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("GetDDD", CommandType.StoredProcedure)
                        .AddWithValue("@pTipoPesq", tipoPesquisa)
                        .AddWithValue("@listaUFs", filtros)
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
