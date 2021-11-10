using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using SolicitudPermiso.Datos;
using SolicitudPermiso.Models;

namespace SolicitudPermiso.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SolicitudPermisoController : ControllerBase
    {
        public IConfiguration Configuration { get; }

        private readonly PermisosCirculacionSolicitudServicio _permisosCirculacionSolicitudServicio;
        private readonly TiposVehiculosServicio _tiposVehiculosServicio;

        private readonly MarcasServicio _marcasServicio;
        private readonly TiposCarroceriasServicio _tiposCarroceriasServicio;
        private readonly TiposSellosServicio _tiposSellosServicio;
        private readonly TiposCombustionesServicio _tiposCombustionesServicio;
        private readonly TiposTransmisionesServicio _tiposTransmisionesServicio;
        private readonly TiposEquipamientosServicio _tiposEquipamientosServicio;
        private readonly CalidadJuridicaServicio _calidadJuridicaServicio;
        private readonly PlantasRevisionTecnicaServicio _plantasRevisionTecnicaServicio;
        private readonly CompaniasAseguradorasServicio _companiasAseguradorasServicio;

        private readonly ILogger<SolicitudPermisoController> _log;

        public SolicitudPermisoController(IConfiguration configuration,
            PermisosCirculacionSolicitudServicio permisosCirculacionSolicitudServicio, 
            TiposVehiculosServicio tiposVehiculosServicio,
            MarcasServicio marcasServicio,
            TiposCarroceriasServicio tiposCarroceriasServicio,
            TiposSellosServicio tiposSellosServicio,
            TiposCombustionesServicio tiposCombustionesServicio,
            TiposTransmisionesServicio tiposTransmisionesServicio,
            TiposEquipamientosServicio tiposEquipamientosServicio,
            CalidadJuridicaServicio calidadJuridicaServicio,
            PlantasRevisionTecnicaServicio plantasRevisionTecnicaServicio,
            CompaniasAseguradorasServicio companiasAseguradorasServicio,
            ILogger<SolicitudPermisoController> log)
        {
            Configuration = configuration;
            _permisosCirculacionSolicitudServicio = permisosCirculacionSolicitudServicio;
            _tiposVehiculosServicio = tiposVehiculosServicio;
            _marcasServicio = marcasServicio;
            _tiposCarroceriasServicio = tiposCarroceriasServicio;
            _tiposSellosServicio = tiposSellosServicio;
            _tiposCombustionesServicio = tiposCombustionesServicio;
            _tiposTransmisionesServicio = tiposTransmisionesServicio;
            _tiposEquipamientosServicio = tiposEquipamientosServicio;
            _calidadJuridicaServicio = calidadJuridicaServicio;
            _plantasRevisionTecnicaServicio = plantasRevisionTecnicaServicio;
            _companiasAseguradorasServicio = companiasAseguradorasServicio;
            _log = log;
        }

        [HttpPost]
        public RespuestaSolicitudPermisoModel Post(
            string usuario,
            string password,
            string numeroMotor,
            string idTipoVehiculo,
            string idMarca,
            string modelo,
            string anioFabricacion,
            string color,
            string chassis,
            string cantidadPuertas,
            string cantidadAsientos,
            string carga,
            string idTipoCarroceria,
            string idTipoSello,
            string serieSello,
            string cilindrada,
            string idTipoCombustion,
            string idTransmision,
            string idEquipo,
            string rutPropietario,
            string dvPropietario,
            string idCalidadJuridica,
            string razonSocial,
            string nombres,
            string apellidoPaterno,
            string apellidoMaterno,
            string calleDireccion,
            string numeroDireccion,
            string observacionDireccion,
            string idComuna,
            string fono,
            string mail,
            string netoFactura,
            string ivaFactura,
            string brutoFactura,
            string fechaFactura,
            //string tipoVehiculo,
            string tipoCertificadoRevisionTecnica,
            string idPlantaRevisionTecnica,
            string numeroCertificadoRevisionTecnica,
            string fechaVigenciaCertificadoHomog,
            string tipoSoap,
            string idCompaniaAseguradora,
            string numeroSoap,
            string fechaVigenciaSoap,
            string placa,
            string dvPlaca,
            string imgFactura,
            string xmlFactura,
            string imgHomologado,
            string numeroHomologado,
            string imgCertificadoInscripcion
            )
        {
            var res = new RespuestaSolicitudPermisoModel();

            string apiUsuario = "ltec2021";
            string apiPassword = "abc2021";
            string permisosEmpresa = "";
            string permisosUsuario = "";

            try { apiUsuario = Configuration.GetSection("Solicitud").GetValue<string>("ApiUsuario"); } catch (Exception ex) { }
            try { apiPassword = Configuration.GetSection("Solicitud").GetValue<string>("ApiPassword"); } catch (Exception ex) { }
            try { permisosEmpresa = Configuration.GetSection("Solicitud").GetValue<string>("PermisosEmpresa"); } catch (Exception ex) { }
            try { permisosUsuario = Configuration.GetSection("Solicitud").GetValue<string>("PermisosUsuario"); } catch (Exception ex) { }

            res.codigoRespuesta = 1;
            res.respuesta = "Proceso exitoso";
            res.fecha = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            try { idTipoVehiculo = _tiposVehiculosServicio.SelPorId(int.Parse(idTipoVehiculo)).nombre; } catch { idTipoVehiculo = ""; }
            try { idMarca = _marcasServicio.SelPorId(int.Parse(idMarca)).nombre; } catch { idMarca = ""; }
            try { idTipoCarroceria = _tiposCarroceriasServicio.SelPorId(int.Parse(idTipoCarroceria)).nombre; } catch { idTipoCarroceria = ""; }
            try { idTipoSello = _tiposSellosServicio.SelPorId(int.Parse(idTipoSello)).nombre; } catch { idTipoSello = ""; }
            try { idTipoCombustion = _tiposCombustionesServicio.SelPorId(int.Parse(idTipoCombustion)).nombre; } catch { idTipoCombustion = ""; }
            try { idTransmision = _tiposTransmisionesServicio.SelPorId(int.Parse(idTransmision)).nombre; } catch { idTransmision = ""; }
            try { idEquipo = _tiposEquipamientosServicio.SelPorId(int.Parse(idEquipo)).nombre; } catch { idEquipo = ""; }
            try { idCalidadJuridica = _calidadJuridicaServicio.SelPorId(int.Parse(idCalidadJuridica)).nombre; } catch { idCalidadJuridica = ""; }
            try { idPlantaRevisionTecnica = _plantasRevisionTecnicaServicio.SelPorId(int.Parse(idPlantaRevisionTecnica)).nombre; } catch { idPlantaRevisionTecnica = ""; }
            try { idCompaniaAseguradora = _companiasAseguradorasServicio.SelPorId(int.Parse(idCompaniaAseguradora)).nombre; } catch { idCompaniaAseguradora = ""; }

            if (usuario.ToUpper() != apiUsuario.ToUpper()) { res.codigoRespuesta = 2; res.respuesta = "El parámetro <usuario> no es válido"; return res; }
            if (password != apiPassword) { res.codigoRespuesta = 3; res.respuesta = "El parámetro <password> no es válido"; return res; }
            if (numeroMotor == null || numeroMotor == "") { res.codigoRespuesta = 4; res.respuesta = "El parámetro <numeroMotor> no es válido"; return res; }
            if (idTipoVehiculo == null || idTipoVehiculo == "") { res.codigoRespuesta = 5; res.respuesta = "El parámetro <idTipoVehiculo> no es válido"; return res; }
            if (idMarca == null || idMarca == "") { res.codigoRespuesta = 6; res.respuesta = "El parámetro <idMarca> no es válido"; return res; }
            if (modelo == null || modelo == "") { res.codigoRespuesta = 7; res.respuesta = "El parámetro <modelo> no es válido"; return res; }
            if (anioFabricacion == null || anioFabricacion == "") { res.codigoRespuesta = 8; res.respuesta = "El parámetro <anioFabricacion> no es válido"; return res; }
            if (color == null || color == "") { res.codigoRespuesta = 9; res.respuesta = "El parámetro <color> no es válido"; return res; }
            if (chassis == null || chassis == "") { res.codigoRespuesta = 10; res.respuesta = "El parámetro <chassis> no es válido"; return res; }
            if (cantidadPuertas == null || cantidadPuertas == "") { res.codigoRespuesta = 11; res.respuesta = "El parámetro <cantidadPuertas> no es válido"; return res; }
            if (cantidadAsientos == null || cantidadAsientos == "") { res.codigoRespuesta = 12; res.respuesta = "El parámetro <cantidadAsientos> no es válido"; return res; }
            if (carga == null || carga == "") { res.codigoRespuesta = 13; res.respuesta = "El parámetro <carga> no es válido"; return res; }
            if (idTipoCarroceria == null || idTipoCarroceria == "") { res.codigoRespuesta = 14; res.respuesta = "El parámetro <idTipoCarroceria> no es válido"; return res; }
            if (idTipoSello == null || idTipoSello == "") { res.codigoRespuesta = 15; res.respuesta = "El parámetro <idTipoSello> no es válido"; return res; }
            if (serieSello == null || serieSello == "") { res.codigoRespuesta = 16; res.respuesta = "El parámetro <serieSello> no es válido"; return res; }
            if (cilindrada == null || cilindrada == "") { res.codigoRespuesta = 17; res.respuesta = "El parámetro <cilindrada> no es válido"; return res; }
            if (idTipoCombustion == null || idTipoCombustion == "") { res.codigoRespuesta = 18; res.respuesta = "El parámetro <idTipoCombustion> no es válido"; return res; }
            if (idTransmision == null || idTransmision == "") { res.codigoRespuesta = 19; res.respuesta = "El parámetro <idTransmision> no es válido"; return res; }
            if (idEquipo == null || idEquipo == "") { res.codigoRespuesta = 20; res.respuesta = "El parámetro <idEquipo> no es válido"; return res; }
            if (rutPropietario == null || rutPropietario == "") { res.codigoRespuesta = 21; res.respuesta = "El parámetro <rutPropietario> no es válido"; return res; }
            if (dvPropietario == null || dvPropietario == "") { res.codigoRespuesta = 22; res.respuesta = "El parámetro <dvPropietario> no es válido"; return res; }
            if (idCalidadJuridica == null || idCalidadJuridica == "") { res.codigoRespuesta = 23; res.respuesta = "El parámetro <idCalidadJuridica> no es válido"; return res; }

            if (razonSocial == null || razonSocial == "") { res.codigoRespuesta = 24; res.respuesta = "El parámetro <razonSocial> no es válido"; return res; }
            if (nombres == null || nombres == "") { res.codigoRespuesta = 25; res.respuesta = "El parámetro <nombres> no es válido"; return res; }
            if (apellidoPaterno == null || apellidoPaterno == "") { res.codigoRespuesta = 26; res.respuesta = "El parámetro <apellidoPaterno> no es válido"; return res; }
            if (apellidoMaterno == null || apellidoMaterno == "") { res.codigoRespuesta = 27; res.respuesta = "El parámetro <apellidoMaterno> no es válido"; return res; }
            if (calleDireccion == null || calleDireccion == "") { res.codigoRespuesta = 28; res.respuesta = "El parámetro <calleDireccion> no es válido"; return res; }
            if (numeroDireccion == null || numeroDireccion == "") { res.codigoRespuesta = 29; res.respuesta = "El parámetro <numeroDireccion> no es válido"; return res; }
            if (observacionDireccion == null || observacionDireccion == "") { res.codigoRespuesta = 30; res.respuesta = "El parámetro <observacionDireccion> no es válido"; return res; }
            if (idComuna == null || idComuna == "") { res.codigoRespuesta = 31; res.respuesta = "El parámetro <idComuna> no es válido"; return res; }
            if (fono == null || fono == "") { res.codigoRespuesta = 32; res.respuesta = "El parámetro <fono> no es válido"; return res; }
            if (mail == null || mail == "") { res.codigoRespuesta = 33; res.respuesta = "El parámetro <mail> no es válido"; return res; }
            if (netoFactura == null || netoFactura == "") { res.codigoRespuesta = 34; res.respuesta = "El parámetro <netoFactura> no es válido"; return res; }
            if (ivaFactura == null || ivaFactura == "") { res.codigoRespuesta = 35; res.respuesta = "El parámetro <ivaFactura> no es válido"; return res; }
            if (brutoFactura == null || brutoFactura == "") { res.codigoRespuesta = 36; res.respuesta = "El parámetro <brutoFactura> no es válido"; return res; }
            if (fechaFactura == null || fechaFactura == "") { res.codigoRespuesta = 37; res.respuesta = "El parámetro <fechaFactura> no es válido"; return res; }
//            if (tipoVehiculo == null || tipoVehiculo == "") { res.codigoRespuesta = 38; res.respuesta = "El parámetro <tipoVehiculo> no es válido"; return res; }
            if (tipoCertificadoRevisionTecnica == null || tipoCertificadoRevisionTecnica == "") { res.codigoRespuesta = 39; res.respuesta = "El parámetro <tipoCertificadoRevisionTecnica> no es válido"; return res; }
            if (idPlantaRevisionTecnica == null || idPlantaRevisionTecnica == "") { res.codigoRespuesta = 40; res.respuesta = "El parámetro <idPlantaRevisionTecnica> no es válido"; return res; }
            if (numeroCertificadoRevisionTecnica == null || numeroCertificadoRevisionTecnica == "") { res.codigoRespuesta = 41; res.respuesta = "El parámetro <numeroCertificadoRevisionTecnica> no es válido"; return res; }
            if (fechaVigenciaCertificadoHomog == null || fechaVigenciaCertificadoHomog == "") { res.codigoRespuesta = 42; res.respuesta = "El parámetro <fechaVigenciaCertificadoHomog> no es válido"; return res; }
            if (tipoSoap == null || tipoSoap == "") { res.codigoRespuesta = 43; res.respuesta = "El parámetro <tipoSoap> no es válido"; return res; }
            if (idCompaniaAseguradora == null || idCompaniaAseguradora == "") { res.codigoRespuesta = 44; res.respuesta = "El parámetro <idCompaniaAseguradora> no es válido"; return res; }
            if (numeroSoap == null || numeroSoap == "") { res.codigoRespuesta = 45; res.respuesta = "El parámetro <numeroSoap> no es válido"; return res; }
            if (fechaVigenciaSoap == null || fechaVigenciaSoap == "") { res.codigoRespuesta = 46; res.respuesta = "El parámetro <fechaVigenciaSoap> no es válido"; return res; }
            if (placa == null || placa == "" || placa.Length != 6) { res.codigoRespuesta = 47; res.respuesta = "El parámetro <placa> no es válido"; return res; }
            if (dvPlaca == null || dvPlaca == "") { res.codigoRespuesta = 48; res.respuesta = "El parámetro <dvPlaca> no es válido"; return res; }
            if (imgFactura == null || imgFactura == "") { res.codigoRespuesta = 49; res.respuesta = "El parámetro <imgFactura> no es válido"; return res; }
            if (xmlFactura == null || xmlFactura == "") { res.codigoRespuesta = 50; res.respuesta = "El parámetro <xmlFactura> no es válido"; return res; }
            if (imgHomologado == null || imgHomologado == "") { res.codigoRespuesta = 51; res.respuesta = "El parámetro <imgHomologado> no es válido"; return res; }
            if (numeroHomologado == null || numeroHomologado == "") { res.codigoRespuesta = 52; res.respuesta = "El parámetro <numeroHomologado> no es válido"; return res; }
            if (imgCertificadoInscripcion == null || imgCertificadoInscripcion == "") { res.codigoRespuesta = 53; res.respuesta = "El parámetro <imgCertificadoInscripcion> no es válido"; return res; }


            PermisoCirculacionSolicitudModel solicitud = new PermisoCirculacionSolicitudModel();

            solicitud.motor = numeroMotor;
            solicitud.tipo_vehiculo = idTipoVehiculo;
            solicitud.Marca = idMarca;
            solicitud.Modelo = modelo;
            solicitud.ano = anioFabricacion;
            solicitud.color = color;
            solicitud.chasis = chassis;
            solicitud.n_puertas = cantidadPuertas;
            solicitud.n_asiento = cantidadAsientos;
            solicitud.carga = carga;
            //idTipoCarroceria
            //idTipoSello
            solicitud.sello_verde = serieSello;
            solicitud.cilindrada = cilindrada;
            solicitud.combustible = idTipoCombustion;
            solicitud.transmision = idTransmision;
            solicitud.equipamiento = idEquipo;
            solicitud.rut = rutPropietario + "-" + dvPropietario;
            //idCalidadJuridica
            //razonSocial
            solicitud.nombre_propietario = nombres + (apellidoPaterno.Trim() == "" ? "" : " " + apellidoPaterno.Trim()) + (apellidoMaterno.Trim() == "" ? "" : " " + apellidoMaterno.Trim());
            solicitud.domicilio_propietario = calleDireccion + " " + numeroDireccion.Trim() + (observacionDireccion.Trim() == "" ? "" : " " + observacionDireccion.Trim());
            solicitud.comuna_propietario = idComuna;
            solicitud.telefono_propietario = fono;
            //mail
            solicitud.tasacion = netoFactura;
            //ivaFactura
            //brutoFactura
            //fechaFactura
            //tipoCertificadoRevisionTecnica
            //idPlantaRevisionTecnica
            //numeroCertificadoRevisionTecnica
            //fechaVigenciaCertificadoHomog
            //tipoSoap
            //idCompaniaAseguradora
            //numeroSoap
            //fechaVigenciaSoap
            solicitud.patente = placa;
            solicitud.digito_verificador = dvPlaca;
            solicitud.cuota = "TOTAL";
            solicitud.empresa = permisosEmpresa;
            solicitud.usuario = permisosUsuario;

            var respuesta = _permisosCirculacionSolicitudServicio.Ins(solicitud);

            return res;
        }
    
    }
}
