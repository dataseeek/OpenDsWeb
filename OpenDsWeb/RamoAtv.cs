using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace OpenDsWeb
{
    public class RamoAtv 
    {
        public string Id { get; set; }
        public string Nome { get; set; }
        public int QtdRegistros { get; set; }
        public string Strid { get; set; }
        public string divi { get; set; }
        public string gp { get; set; }
        public string cls { get; set; }
        public string diviDesc { get; set; }
        public string gpDesc { get; set; }
        public string clsDesc { get; set; }

        #region Bind
        private static List<RamoAtv> Bind(DataTable dt)
        {
            List<RamoAtv> items = new List<RamoAtv>();
            foreach (DataRow dr in dt.Rows)
                items.Add(Bind(dr));
            return items;
        }
        #endregion

        #region Bind
        private static RamoAtv Bind(DataRow dr)
        {
            RamoAtv item = new RamoAtv();
            if (Util.ValidaDbNull(dr, "QtdRegistros"))
                item.QtdRegistros = Convert.ToInt32(dr["QtdRegistros"]);

            if (dr[0] != Convert.DBNull)
                item.Id = dr[0].ToString();

            if (dr[1] != Convert.DBNull)
                item.Nome = dr[1].ToString();

            if (dr[4] != Convert.DBNull)
                item.divi = dr[4].ToString();

            if (dr[5] != Convert.DBNull)
                item.gp = dr[5].ToString();

            if (dr[6] != Convert.DBNull)
                item.cls = dr[6].ToString();

            if (dr[7] != Convert.DBNull)
                item.diviDesc = dr[7].ToString();

            if (dr[8] != Convert.DBNull)
                item.gpDesc = dr[8].ToString();

            if (dr[9] != Convert.DBNull)
                item.clsDesc = dr[9].ToString();

            if (Util.ValidaDbNull(dr,"StrId"))
                item.Strid = dr["StrId"].ToString();
         

            
            return item;
        }
        #endregion

        #region Listar

        public static List<RamoAtv> Listar()
        {
            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get("getAtividade", CommandType.StoredProcedure)
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
