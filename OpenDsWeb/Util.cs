using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Reflection;
using System.Data;
using System.Net.NetworkInformation;
using System.Web;
using ClosedXML.Excel;
using System.IO;
using System.Globalization;
using Newtonsoft.Json;

namespace OpenDsWeb
{

    public enum enumTipoPerfil
    {
        DataSeekAdmin = 1,
        MasterUser = 2,
        Gerente = 3,
        Operador = 4
    }

    public enum enumStatus
    {
        Solicitado = 1,
        Aprovado = 2,
        Cancelado = 3,
        Finalizado = 4,
    }
    
    public class Util
    {
        public static bool ValidaDbNull(DataRow _dr, string _coluna)
        {
            if (_dr != null)
                if (_dr.Table != null)
                    if (_dr.Table.Columns != null)
                        if (_dr.Table.Columns.Contains(_coluna))
                            return (_dr[_coluna] != Convert.DBNull);
            return false;
        }
    
        public static string GeraSenhaRandomTamVariavel()
        {
            string guid = Guid.NewGuid().ToString().Replace("-", "");

            Random clsRan = new Random();
            Int32 tamanhoSenha = clsRan.Next(6, 12);

            string senha = "";
            for (Int32 i = 0; i <= tamanhoSenha; i++)
            {
                senha += guid.Substring(clsRan.Next(1, guid.Length), 1);
            }

            return senha;
        }

        public static string GerarSenhaMD5(string input)
        {

            System.Security.Cryptography.MD5 md5 = System.Security.Cryptography.MD5.Create();

            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);

            byte[] hash = md5.ComputeHash(inputBytes);

            System.Text.StringBuilder sb = new System.Text.StringBuilder();

            for (int i = 0; i < hash.Length; i++)
            {

                sb.Append(hash[i].ToString("X2"));

            }

            return sb.ToString();

        }

        public static bool ValidaCNPJ(string pCnpj)
        {
            pCnpj = pCnpj.Trim().PadLeft(14,'0');
            string cDv;
            cDv = pCnpj.Substring(pCnpj.Length - 2, 2);
            StringBuilder cRaiz = new StringBuilder();
            cRaiz.Append(pCnpj.Substring(0, pCnpj.Length - 2).ToString());
            StringBuilder cDvCalc = new StringBuilder();

            for (int j = 1; j <= 2; j++)
            {
                int nFator = 2;
                int nSoma = 0;
                int nDv;
                for (int i = (cRaiz.Length - 1); i >= 0; i--)
                {
                    nSoma = nSoma +  Convert.ToInt16(cRaiz[i].ToString()) * nFator;
                    nFator = nFator + 1;
                    if (nFator > 9) { nFator = 2; }
                } 
                nDv = 11 - (nSoma % 11);
                if (nDv > 9) { nDv = 0; }
                cRaiz.Append(nDv.ToString());
            }

            return (cRaiz.ToString().Substring(cRaiz.Length - 2, 2) == cDv); 
        }

        public static bool ValidaCNPJ(long pCnpj)
        {
            bool retorno;
            if (pCnpj <= 0)
               { retorno = false; }
            else
               { retorno = ValidaCNPJ(pCnpj.ToString()); }

            return retorno;
        }


        public static bool IsCpf(string cpf)
        {
            int[] multiplicador1 = new int[9] { 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            int[] multiplicador2 = new int[10] { 11, 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            string tempCpf;
            string digito;
            int soma;
            int resto;
            cpf = getNumerosFromString(cpf);
            if (cpf.Length != 11)
                return false;
            tempCpf = cpf.Substring(0, 9);
            soma = 0;

            for (int i = 0; i < 9; i++)
                soma += int.Parse(tempCpf[i].ToString()) * multiplicador1[i];
            resto = soma % 11;
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;
            digito = resto.ToString();
            tempCpf = tempCpf + digito;
            soma = 0;
            for (int i = 0; i < 10; i++)
                soma += int.Parse(tempCpf[i].ToString()) * multiplicador2[i];
            resto = soma % 11;
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;
            digito = digito + resto.ToString();
            return cpf.EndsWith(digito);
        }

        public static string getNumerosFromString(string pData)
        {
            return String.Join("", System.Text.RegularExpressions.Regex.Split(pData, @"[^\d]"));
        }

        public static string FormataCNPJ(string pCnpj)
        {
            string mCnpj = pCnpj.PadLeft(14, '0');
            return mCnpj.Substring(0, 2) + "." + mCnpj.Substring(2, 3) + "." + mCnpj.Substring(5, 3)
                + "/" + mCnpj.Substring(8, 4) + "-" + mCnpj.Substring(12, 2);
        }

        public static string FormataCNPJ(int pCnpj)
        {
            return FormataCNPJ(pCnpj.ToString());
        }

        public static bool ValidaEmail(string email)
        {
            if (email == "") { return false; }
            string[] especialChar = {"@", "/", "\\", "(", ")" }; //Monta lista de carateres especiais

            string[] _email = email.Split('@'); //separa o usuario do dominio

            //verifica se tem caracteres especiais no nome de usuario ou no dominio
            foreach (string e in _email)
            {
                foreach (string ec in especialChar)
                {
                    if (e.IndexOf(ec) > 0) { return false; }
                }
            }


            if (_email.Length == 2)
            {
                return true;
            }
            else
                return false;
        }

        public static bool validaSenha(string pSenha)
        {
            int nQtUpper = 0;
            int nQtDigitos = 0;
            pSenha = pSenha.Trim();

            bool invalidChar = (pSenha.IndexOf('"') >= 0  || pSenha.IndexOf("'") >= 0);

            for (int i=0; i < pSenha.Length; i++)
            {
                if (Char.IsDigit(pSenha, i)) { nQtDigitos++; } else if (Char.IsUpper(pSenha, i)) { nQtUpper++; }
            }

            return (nQtUpper > 0 && nQtDigitos > 0 && pSenha.Length >= 6 && ! invalidChar);
        }

        public static string TrataFiltro(string pSelecao, string pTipoFiltro, string pFiltro)
        {
            return TrataFiltro(pSelecao, pTipoFiltro, pFiltro, 0);
        }

        public static string TrataFiltro(string pSelecao, string pTipoFiltro, string pFiltro, int idTipoCondicaoLista)
        {
            StringBuilder varFiltros = new StringBuilder();



                int flgComma = 0;

                if (pFiltro != String.Empty) { varFiltros.Append(pFiltro); flgComma = 1; }
                var arrSelecao = pSelecao.Split(';');

                int contador = 0;
            foreach (string item in arrSelecao)
            {
                if (item.Trim() != String.Empty)
                {
                    if (contador == 0)
                    {
                        if (flgComma == 1)
                        { varFiltros.Append(","); }
                        varFiltros.Append(((idTipoCondicaoLista == 1) ? "!" : "") + pTipoFiltro + "(");
                    }
                    else
                    { varFiltros.Append(","); }

                    varFiltros.Append(item);
                    contador++;
                }
            }
            
            if (contador > 0) { varFiltros.Append(")"); };
            
            return varFiltros.ToString();
        }



        public static string TrataFiltroEnriquecimento(string pSelecao, string pTipoFiltro, string pFiltro, int idTipoCondicaoLista)
        {
            StringBuilder varFiltros = new StringBuilder();
            int flgComma = 0;

            if (pFiltro != String.Empty) { varFiltros.Append(pFiltro); flgComma = 1; }
            var arrSelecao = pSelecao.Split(';');

            int contador = 0;
            foreach (string item in arrSelecao)
            {
                if (item.Trim() != String.Empty)
                {
                    if (contador == 0)
                    {
                        if (flgComma == 1)
                        { varFiltros.Append(","); }
                        //varFiltros.Append(((idTipoCondicaoLista == 1) ? "!" : "") + pTipoFiltro + "(");
                    }
                    else
                    { varFiltros.Append(","); }

                    varFiltros.Append(item);
                    contador++;
                }
            }
            //if (contador > 0) { varFiltros.Append(")"); };

            return varFiltros.ToString();
        }


        public static DataTable ToDataTable<T>(List<T> items)
        {
            DataTable dataTable = new DataTable(typeof(T).Name);

            //Get all the properties
            PropertyInfo[] Props = typeof(T).GetProperties(BindingFlags.Public | BindingFlags.Instance);
            foreach (PropertyInfo prop in Props)
            {
                //Setting column names as Property names
                dataTable.Columns.Add(prop.Name);
            }


            //Get all the fields
            FieldInfo[] Fields = typeof(T).GetFields();
            foreach (FieldInfo field in Fields)
            {
                //Setting column names as Property names
                dataTable.Columns.Add(field.Name);
            }


            foreach (T item in items)
            {
                var values = new object[Props.Length + Fields.Length];

                for (int i = 0; i < Props.Length; i++)
                {
                    //inserting property values to datatable rows
                    values[i] = Props[i].GetValue(item, null);

                }


                for (int i = 0; i < Fields.Length; i++)
                {

                    //inserting field values to datatable rows
                    values[i + Props.Length] = Fields[i].GetValue(item);

                }


                dataTable.Rows.Add(values);
            }
            //put a breakpoint here and check datatable
            return dataTable;
        }


        public static List<T> DataTable2List<T>(DataTable dt)
        {
            List<T> data = new List<T>();
            foreach (DataRow row in dt.Rows)
            {
                T item = GetItem<T>(row);
                data.Add(item);
            }
            return data;
        }
        private static T GetItem<T>(DataRow dr)
        {
            Type temp = typeof(T);
            T obj = Activator.CreateInstance<T>();

            foreach (DataColumn column in dr.Table.Columns)
            {
                foreach (PropertyInfo pro in temp.GetProperties())
                {
                    if (pro.Name == column.ColumnName)
                        pro.SetValue(obj, dr[column.ColumnName], null);
                    else
                        continue;
                }
            }
            return obj;
        }

        public static bool SequenciaIsNumeric(string pString)
        {
            bool listaValida = true;
            string[] itens = pString.Split(',');
            foreach (string item in itens)
            {
                if (item == String.Empty)
                {
                    listaValida = false;
                    break;
                }
                else
                {
                    if (! StringIsNumeric(item))
                       {
                        listaValida = false;
                        break;
                       }
                }
            }

            return listaValida;
        }

        public static bool StringIsNumeric(string pString)
        {
            bool lretorno = true;
            char[] c = pString.ToCharArray();

            if (c.Length > 0)
            {
                for (int i = 0; i < c.Length; i++)
                    // verifica se o char não é um dígito  
                    if (!Char.IsDigit(c[i]))
                    {
                        lretorno = false;
                        break;
                    }
            }
            else
            { lretorno = false; }

            return lretorno;

          }

        public static string getDigitsFromString(string pString)
        {
            
            StringBuilder result = new StringBuilder();
            char[] c = pString.ToCharArray();

            if (c.Length > 0)
            {
                for (int i = 0; i < c.Length; i++)
                    // verifica se o char não é um dígito  
                    if (Char.IsDigit(c[i]))
                    {
                        result.Append(c[i]);
                    }
            }

            return result.ToString();

        }


        public static void ExportarArquivosCrm(DataTable table, int tipoArquivo, int idArquivo, bool createFile, bool Download)
        {

                StringBuilder sFileName = new StringBuilder();
                sFileName.Append("crm-");                     
                 sFileName.Append(idArquivo.ToString());

                if (tipoArquivo == 1)
                { sFileName.Append(".xlsx"); }
                else if (tipoArquivo == 2)
                { sFileName.Append(".csv"); }

           

            HttpContext context = HttpContext.Current;

                /// >>>> Para salver 29/09/2014
                string destPath = context.Server.MapPath("~/downloads/" + sFileName);  //("~/TstFile/" + mediaName);

                if (createFile)
                {
                    if (tipoArquivo == 1)
                    {
                        table.TableName = "Arquivo";
                        var wb = new XLWorkbook();


                        // Add a DataTable as a worksheet
                        var ws = wb.Worksheets.Add(table);
                        ws.SheetView.FreezeRows(1);


                        wb.SaveAs(destPath);
                    }

                    else
                    {

                        string cChar = ";";
                        string cDelimField = (tipoArquivo == 2 ? String.Empty : '"'.ToString());

                      

                        System.IO.StreamWriter objWriter;
                        objWriter = new System.IO.StreamWriter(destPath.ToString(), false, Encoding.GetEncoding(28591));

                        foreach (DataColumn column in table.Columns)
                        {
                            objWriter.Write(column.ColumnName + cChar);
                        }
                        objWriter.Write(Environment.NewLine);

                        foreach (DataRow row in table.Rows)
                        {
                            for (int i = 0; i < table.Columns.Count; i++)
                            {
                                objWriter.Write(cDelimField + row[i].ToString().Replace(cChar, string.Empty) + cDelimField + cChar);
                            }
                            objWriter.Write(Environment.NewLine);
                        }

                        objWriter.Close();
                        objWriter = null;
                                          

                    }
                }
                if (Download)
                {  

                    FileInfo fi = new FileInfo(destPath);

                    if (fi.Exists)
                    {

                    var file = new System.IO.FileInfo(fi.FullName);

                    HttpContext.Current.Response.Clear();
                    HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + sFileName);
                    HttpContext.Current.Response.AddHeader("Content-Length", file.Length.ToString(CultureInfo.InvariantCulture));
                    HttpContext.Current.Response.ContentType = "application/octet-stream";
                    HttpContext.Current.Response.WriteFile(file.FullName);
                    HttpContext.Current.Response.End();



                }

                    // Filipe 02/10/2014
                    //context.Response.End(); 
                }

            }

        public static void GravaLog(Exception ex)
        {
 
            string nomePasta = HttpContext.Current.Server.MapPath("~/logs/");

            if (!Directory.Exists(nomePasta))
            {

                //Criamos um com o nome folder
                Directory.CreateDirectory(nomePasta);

            }

            StringBuilder xFileName = new StringBuilder();
            xFileName.Append(nomePasta);
            xFileName.Append("Log");
            xFileName.Append(DateTime.Today.Year.ToString("0000"));
            xFileName.Append(DateTime.Today.Month.ToString("00"));
            xFileName.Append(DateTime.Today.Day.ToString("00"));
            xFileName.Append(".txt");

            StreamWriter sw = new StreamWriter(xFileName.ToString(), true, Encoding.ASCII);

            string linha = String.Empty;

            linha = DateTime.Now.ToString();
            sw.WriteLine(linha);
            sw.WriteLine(ex.Message);
            sw.WriteLine(ex.InnerException);
            linha = new string('-', 130);
            sw.WriteLine(linha);

            sw.Close();

        }

        public static void DownloadArquivo(int tipoArquivo, int tpOper, int idArquivo)
        {

            StringBuilder sFileName = new StringBuilder();

            if (tpOper == 1)  { 
               sFileName.Append("cnt-"); 
            }
            else { 
                sFileName.Append("exp-"); 
            }
 
            sFileName.Append(idArquivo.ToString());

            if (tipoArquivo == 1) { 
               sFileName.Append(".xlsx"); 
            }
               else if (tipoArquivo == 2) { 
               sFileName.Append(".csv"); 
            }
            else { 
               sFileName.Append(".txt"); 
            }

            string destPath = HttpContext.Current.Server.MapPath("~/downloads/" + sFileName);  //("~/TstFile/" + mediaName);

            FileInfo fi = new FileInfo(destPath);
            if (fi.Exists) {
               var file = new System.IO.FileInfo(fi.FullName);
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + sFileName);
                HttpContext.Current.Response.AddHeader("Content-Length", file.Length.ToString(CultureInfo.InvariantCulture));
                HttpContext.Current.Response.ContentType = "application/octet-stream";
                HttpContext.Current.Response.WriteFile(file.FullName);
                HttpContext.Current.Response.End();
            }

        }


        public static void ExportarArquivos(DataTable table, int tipoArquivo, int tpOper, int idArquivo, bool createFile, bool Download)
        {
            StringBuilder sFileName = new StringBuilder();

            if (tpOper == 1)
               { sFileName.Append("cnt-"); }
            else
               { sFileName.Append("exp-"); }

            sFileName.Append(idArquivo.ToString());

            if (tipoArquivo == 1)
                { sFileName.Append(".xlsx"); }
            else if (tipoArquivo == 2)
                { sFileName.Append(".csv"); }
            else
                { sFileName.Append(".txt"); }

                HttpContext context = HttpContext.Current;

                /// >>>> Para salver 29/09/2014
                string destPath = context.Server.MapPath("~/downloads/" + sFileName);  //("~/TstFile/" + mediaName);

                if (createFile)
                {
                    if (tipoArquivo == 1)
                    {
                        table.TableName = "Arquivo";
                        var wb = new XLWorkbook();


                        // Add a DataTable as a worksheet
                        var ws = wb.Worksheets.Add(table);
                        ws.SheetView.FreezeRows(1);


                        wb.SaveAs(destPath);
                    }

                    else
                    {

                        string cChar = ";";
                        string cDelimField = (tipoArquivo == 2 ? String.Empty : '"'.ToString());

                        /*if (tipoArquivo == 2)
                            cChar = ";";
                        else
                            cChar = ",";*/

                        ////HttpContext context = HttpContext.Current;
                        ///context.Response.Clear();

                        System.IO.StreamWriter objWriter;
                        objWriter = new System.IO.StreamWriter(destPath.ToString(), false, Encoding.GetEncoding(28591));

                        foreach (DataColumn column in table.Columns)
                        {
                            objWriter.Write(column.ColumnName + cChar);
                        }
                        objWriter.Write(Environment.NewLine);

                        foreach (DataRow row in table.Rows)
                        {
                            for (int i = 0; i < table.Columns.Count; i++)
                            {
                                objWriter.Write(cDelimField + row[i].ToString().Replace(cChar, string.Empty) + cDelimField + cChar);
                            }
                            objWriter.Write(Environment.NewLine);
                        }

                        objWriter.Close();
                        objWriter = null;

                        ////context.Response.ContentType = "text/csv";
                        ////context.Response.AppendHeader("Content-Disposition", "attachment; filename=" + sFileName);
                        ////context.Response.End();

                    }
                }
                if (Download)
                {
                    // para download



                    // Check to see if file exist       

                    FileInfo fi = new FileInfo(destPath);

                    // If the file exist on the server     

                    if (fi.Exists)
                    {


                        /*
                        HttpContext.Current.Response.ClearHeaders();

                        HttpContext.Current.Response.ClearContent();

                        HttpContext.Current.Response.AppendHeader("Content-Disposition", "attachment; filename=" + fi.Name);

                        HttpContext.Current.Response.AppendHeader("Content-Length", fi.Length.ToString());

                        HttpContext.Current.Response.ContentType = "application/octet-stream";

                        HttpContext.Current.Response.TransmitFile(fi.FullName);

                        HttpContext.Current.Response.Flush();
                        */


                        var file = new System.IO.FileInfo(fi.FullName);

                        HttpContext.Current.Response.Clear();
                        HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + sFileName);
                        HttpContext.Current.Response.AddHeader("Content-Length", file.Length.ToString(CultureInfo.InvariantCulture));
                        HttpContext.Current.Response.ContentType = "application/octet-stream";
                        HttpContext.Current.Response.WriteFile(file.FullName);
                        HttpContext.Current.Response.End();



                    }


                    // Filipe 02/10/2014
                    //context.Response.End(); 
                }

            } // Se lista pertence ao usuario

        }

    public class resultValidacao
    {
        public int result;
        public string message;
        public decimal vlrcredito;
        public decimal valor;
    }

}
