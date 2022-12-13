using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Datos
{
    public class EmpleadoDato : Conexion
    {

        private SqlCommand cmd;
        private SqlDataReader dr;

        public List<Empleado> ConsultarEmpleado()
        {
            int i = 0;
            List<Empleado> resultado = null;

            try
            {
                Conectar();

                cmd = new SqlCommand("sp_empleado_listar");

                cmd.Connection = con;

                dr = cmd.ExecuteReader();

                if (dr.HasRows)
                {
                    resultado = new List<Empleado>();

                    while (dr.Read())
                    {
                        i += 1;

                        Empleado empleado = new Empleado
                        {

                            CodigoEmpleado = dr["i_id_empleado"].ToString(),
                            Direccion = dr["v_direccion_ubicacion"].ToString(),
                            TipoDocumento = dr["v_nombre_tipo_documento"].ToString(),
                            NumeroDocumento = dr["v_valor_documento"].ToString(),
                            CodigoRegion = dr["i_id_region"].ToString(),
                            CodigoDistrito = dr["i_id_distrito"].ToString(),
                            CodigoProvincia = dr["i_id_provincia"].ToString(),
                            Codigo = dr["i_id_persona"].ToString(),
                            Nombre= dr["v_nombre_persona"].ToString(),
                            ApellidoPaterno = dr["v_apellido_paterno_persona"].ToString(),
                            ApellidoMaterno = dr["v_apellido_materno_persona"].ToString(),
                            CodigoDocumento = dr["i_id_documento"].ToString(),
                            FechaNacimiento = dr["d_fecha_nacimiento_persona"].ToString(),
                            CodigoPais = dr["i_id_pais"].ToString()
                        };

                        resultado.Add(empleado);
                    }
                }
            }
            finally
            {
                Desconectar();
            }

            return resultado;
        }
    }
}
