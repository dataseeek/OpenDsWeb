using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;

namespace OpenDsWeb
{
    public class microregiao
    {
        public int idmeso { get; set; }
        public string nmmeso { get; set; }
        public int ddd { get; set; }
        public string uf { get; set; }
        public int idmicro { get; set; }
        public string nmmicro { get; set; }
        #region Bind
        private static List<microregiao> Bind(DataTable dt)
        {
            List<microregiao> items = new List<microregiao>();
            foreach (DataRow dr in dt.Rows)
                items.Add(Bind(dr));
            return items;
        }
        #endregion

        #region Bind
        private static microregiao Bind(DataRow dr)
        {
            microregiao item = new microregiao();

            if (Util.ValidaDbNull(dr, "ddd"))
            { item.ddd = Convert.ToInt32(dr["ddd"]); }

            if (Util.ValidaDbNull(dr, "uf"))
            { item.uf = dr["uf"].ToString(); }

            if (Util.ValidaDbNull(dr, "idmeso"))
            { item.idmeso = Convert.ToInt32(dr["idmeso"]); }

            if (Util.ValidaDbNull(dr, "nmmeso"))
            { item.nmmeso = dr["nmmeso"].ToString(); }


            if (Util.ValidaDbNull(dr, "idmicro"))
            { item.idmicro = Convert.ToInt32(dr["idmicro"]); }

            if (Util.ValidaDbNull(dr, "nmmicro"))
            { item.nmmicro = dr["nmmicro"].ToString(); }

            return item;
        }
        #endregion

        #region Listar



        public static List<microregiao> Listar()
        {
            return Listar(1, String.Empty) ;
        }

        public static List<microregiao> Listar(int tipoPesquisa, string filtros)
        {
            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("getMCR", CommandType.StoredProcedure)
                        .AddWithValue("@tipoPesq", tipoPesquisa)
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
