using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace OpenDsWeb
{
    public class cnae
    {
        public string codigo { get; set; }
        public string nome { get; set; }

        private static List<cnae> Bind(DataTable dt)
        {
            List<cnae> items = new List<cnae>();
            foreach (DataRow dr in dt.Rows)
                items.Add(BindAuto(dr));
            return items;
        }

        private static cnae BindAuto(DataRow dr)
        {

            cnae item = new cnae();

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

        public static List<cnae> getListaCnaeSecundarioFromCNPJ(string pCnpj)
        {
            List<cnae> lstCNAEs = new List<cnae>();

            string sql = "select a.cnae as codigo, b.cnanom as nome from pj.pj_cnaes a join dsweb.tabcnae b on b.cnacod = a.cnae " + 
                "where a.cnpj = " + pCnpj + " and a.tipo = 2";

            try
            {
                DataTable dt = null;
                dt = AcessoDados.Get(sql, CommandType.Text)
                     .GetDataSet()
                     .Tables[0];

                lstCNAEs = Bind(dt);
            }

            catch (Exception ex)
            {
            }

            return lstCNAEs;
        }
    }
}