﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using CapaDatos;
using CapaEntidad;

namespace CapaNegocio
{
    public class CN_Permiso
    {
        private CD_PERMISO objcs_permiso = new CD_PERMISO();

        public List<Permiso> Listar(int IdUsuario)
        {
            return objcs_permiso.Listar(IdUsuario);
        }
    }
}