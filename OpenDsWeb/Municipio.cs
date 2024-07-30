using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace OpenDsWeb
{
    public class Municipio
    {
        public string id { get; set; }
        public string Nome { get; set; }
        public string UF { get; set; }
        public string DDD { get; set; }
        public string QtdRegistros { get; set; }
        public int NroRegistros { get; set; }

        #region Bind
        private static List<Municipio> Bind(DataTable dt)
        {
            List<Municipio> items = new List<Municipio>();
            foreach (DataRow dr in dt.Rows)
                items.Add(Bind(dr));
            return items;
        }
        #endregion

        #region Bind
        private static Municipio Bind(DataRow dr)
        {
            Municipio item = new Municipio();
            if (Util.ValidaDbNull(dr, "QtdRegistros"))
            {
                item.NroRegistros = Convert.ToInt32(dr["QtdRegistros"]);
                item.QtdRegistros = item.NroRegistros.ToString("#,###,##0");
            }

            if (Util.ValidaDbNull(dr, "Id"))
            { item.id = dr["Id"].ToString(); }

            if (Util.ValidaDbNull(dr, "Nome"))
            { item.Nome = dr["Nome"].ToString(); }

            if (Util.ValidaDbNull(dr, "UF"))
            { item.UF = dr["UF"].ToString(); }

            if (Util.ValidaDbNull(dr, "DDD"))
            { item.DDD = dr["DDD"].ToString(); }

            return item;
        }
        #endregion

        #region Listar

        public static List<Municipio> Listar(string filtros)
        {
            return Listar(1, filtros);
        }

        public static List<Municipio> Listar(int tipoPesquisa, string filtros)
        {
            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("GetMunicipio", CommandType.StoredProcedure)
                        .AddWithValue("@TipoPesq", tipoPesquisa)
                        .AddWithValue("@listaUFddd", filtros)
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
