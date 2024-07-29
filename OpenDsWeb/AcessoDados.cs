using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Reflection;
using MySql.Data;
using MySql.Data.MySqlClient;


namespace OpenDsWeb
{
    public class AcessoDados
    {

        MySqlCommand _comm;


        public string CommandText
        {
            set
            {
                _comm.CommandText = value;
            }
        }

        public static string GetConnectionString(string chave)
        {
            if(string.IsNullOrEmpty(chave))
                return AcessoDados.GetConexao().ConnectionString;
            else
                return AcessoDados.GetConexao(chave).ConnectionString;
        }

        public AcessoDados(string commandText, CommandType commandType)
        {
            MySqlConnection conn = GetConexao();

            _comm = conn.CreateCommand();
            _comm.CommandText = commandText;
            _comm.CommandType = commandType;
        }

        public AcessoDados(string commandText, CommandType commandType, string connectionString)
        {
            MySqlConnection conn = GetConexao(connectionString);

            _comm = conn.CreateCommand();
            _comm.CommandText = commandText;
            _comm.CommandType = commandType;
        }

        public static AcessoDados Get(string commandText, CommandType commandType)
        {
            AcessoDados comm = new AcessoDados(commandText, commandType);
            return comm;
        }

        public static AcessoDados Get(string commandText, CommandType commandType, string connectionString)
        {
            AcessoDados comm = new AcessoDados(commandText, commandType, connectionString);
            return comm;
        }

        public static AcessoDados Get(CommandType commandType)
        {
            AcessoDados comm = new AcessoDados("", commandType);
            return comm;
        }

        public AcessoDados AddWithValue(string name, object value)
        {
            if (value is DateTime)
                if (((DateTime)value) == DateTime.MinValue)
                {
                    AddNullValue(name);
                    return this;
                }

            if (value == null)
            {
                AddNullValue(name);
                return this;
            }
            else
            {
                _comm.Parameters.AddWithValue(name, value);
                return this;
            }
        }

        public DataSet GetDataSet()
        {
            MySqlDataAdapter da = new MySqlDataAdapter(_comm);
            DataSet ds = new DataSet();

           _comm.Connection.Open();
            da.Fill(ds);
            _comm.Connection.Close();


            return ds;
        }

        public DataSet GetDataSet(string reference)
        {
            MySqlDataAdapter da = new MySqlDataAdapter(_comm);
            DataSet ds = new DataSet();

            _comm.Connection.Open();
            da.Fill(ds, reference);
            _comm.Connection.Close();

            return ds;
        }


        public int Execute()
        {
            int ret = 0;

            _comm.Connection.Open();
            ret = _comm.ExecuteNonQuery();
            _comm.Connection.Close();


            return ret;
        }

        public void AddNullValue(string name)
        {
            AddWithValue(name, DBNull.Value);
        }

        public static MySqlConnection GetConexao()
        {

            //0: Localhost Desenvolvimento 1: Producao Cloud 2: Producao LAN
            string ambiente = System.Configuration.ConfigurationManager.AppSettings["Ambiente_Producao"];
            if (ambiente == String.Empty)
                ambiente = "1";  
            if (ambiente == "0")
               return new MySqlConnection("server=192.168.1.3;Port=3306;database=dsweb;uid=root;pwd=Zxasqw!@#$;default command timeout=300; CheckParameters = false;");
            else if (ambiente == "1")
                return new MySqlConnection("server=200.183.119.247;Port=3333;database=dsweb;uid=dsweb;pwd=Zxasqw!@#$;default command timeout=300; CheckParameters = false;");
            else
                return new MySqlConnection("server=192.168.1.5;Port=3333;database=dsweb;uid=dsweb;pwd=Zxasqw!@#$;default command timeout=300; CheckParameters = false;");
        }

        public static MySqlConnection GetConexao(string chave)
        {
            return new MySqlConnection(ConfigurationManager.ConnectionStrings[chave].ConnectionString);
        }

    }
}
