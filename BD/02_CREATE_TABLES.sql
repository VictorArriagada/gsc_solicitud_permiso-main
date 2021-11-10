USE [GSC_CalleLarga_QA]
GO
/****** Object:  Table [dbo].[accesos]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[accesos](
	[id_acceso] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[id_usuario] [int] NULL,
	[usuario] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_accesos] PRIMARY KEY CLUSTERED 
(
	[id_acceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[calidad_juridica]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calidad_juridica](
	[id_calidad_juridica] [int] IDENTITY(1,1) NOT NULL,
	[codigo_i_car] [int] NULL,
	[nombre] [varchar](150) NULL,
	[activo] [int] NULL,
 CONSTRAINT [PK_calidad_juridica] PRIMARY KEY CLUSTERED 
(
	[id_calidad_juridica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[companias_aseguradoras]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[companias_aseguradoras](
	[id_compania_aseguradora] [int] IDENTITY(1,1) NOT NULL,
	[codigo_i_car] [int] NULL,
	[nombre] [varchar](150) NULL,
	[activo] [int] NULL,
 CONSTRAINT [PK_companias_aseguradoras] PRIMARY KEY CLUSTERED 
(
	[id_compania_aseguradora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comunas]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comunas](
	[id_comuna] [int] IDENTITY(1,1) NOT NULL,
	[codigo_i_car] [int] NULL,
	[nombre] [varchar](150) NULL,
	[activo] [int] NULL,
 CONSTRAINT [PK_comunas] PRIMARY KEY CLUSTERED 
(
	[id_comuna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[envio_a_icar]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[envio_a_icar](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[accion] [int] NULL,
	[id_permiso_temp] [int] NULL,
	[id_permiso] [int] NULL,
	[xml_res] [varchar](max) NULL,
 CONSTRAINT [PK_envio_a_icar] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[formulario_contacto]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[formulario_contacto](
	[id_contacto] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NULL,
	[correo] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[mensaje] [varchar](500) NULL,
 CONSTRAINT [PK_formulario_contacto] PRIMARY KEY CLUSTERED 
(
	[id_contacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marcas]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marcas](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[codigo_i_car] [int] NULL,
	[nombre] [varchar](150) NULL,
	[activo] [int] NULL,
 CONSTRAINT [PK_marcas] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[monto_presupuesto]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[monto_presupuesto](
	[monto] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permisos_circulacion]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permisos_circulacion](
	[id_permisosCirculacion] [int] IDENTITY(100001,1) NOT NULL,
	[tipo] [int] NULL,
	[fecha] [datetime] NULL,
	[rut] [varchar](255) NULL,
	[patente] [varchar](255) NULL,
	[monto_neto] [varchar](255) NULL,
	[fecha_vencimiento] [date] NULL,
	[digito_verificador] [varchar](255) NULL,
	[Marca] [varchar](255) NULL,
	[Modelo] [varchar](255) NULL,
	[ano] [varchar](255) NULL,
	[tipo_vehiculo] [varchar](255) NULL,
	[motor] [varchar](255) NULL,
	[color] [varchar](255) NULL,
	[chasis] [varchar](255) NULL,
	[n_puertas] [varchar](255) NULL,
	[n_asiento] [varchar](255) NULL,
	[tara] [varchar](255) NULL,
	[codigo_sii] [varchar](255) NULL,
	[tasacion] [varchar](255) NULL,
	[cilindrada] [varchar](255) NULL,
	[combustible] [varchar](255) NULL,
	[transmision] [varchar](255) NULL,
	[equipamiento] [varchar](255) NULL,
	[nombre_propietario] [varchar](255) NULL,
	[domicilio_propietario] [varchar](255) NULL,
	[comuna_propietario] [varchar](255) NULL,
	[telefono_propietario] [varchar](255) NULL,
	[pago_total] [varchar](255) NULL,
	[sello_verde] [varchar](255) NULL,
	[comuna_anterior] [varchar](255) NULL,
	[zona_franca] [varchar](255) NULL,
	[carga] [varchar](255) NULL,
	[multa] [varchar](255) NULL,
	[ipc] [int] NULL,
	[valor_total] [int] NULL,
	[interes] [float] NULL,
	[total_neto] [int] NULL,
	[total_pagado] [int] NULL,
	[cuota] [varchar](250) NULL,
	[empresa] [varchar](250) NULL,
	[usuario] [varchar](250) NULL,
 CONSTRAINT [PK_permisos_circulacion] PRIMARY KEY CLUSTERED 
(
	[id_permisosCirculacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permisos_circulacion_envio]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permisos_circulacion_envio](
	[id_permisos_circulacion_envio] [int] IDENTITY(1,1) NOT NULL,
	[id_permisosCirculacion] [int] NULL,
	[archivo_pdf] [varchar](250) NULL,
	[intentos] [int] NULL,
	[activo] [int] NULL,
 CONSTRAINT [PK_permisos_circulacion_envio] PRIMARY KEY CLUSTERED 
(
	[id_permisos_circulacion_envio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permisos_circulacion_logs]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permisos_circulacion_logs](
	[id_permisosCirculacion] [int] NULL,
	[fecha] [datetime] NULL,
	[accion] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permisos_circulacion_solicitud]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permisos_circulacion_solicitud](
	[id_permisosCirculacion_solicitud] [int] IDENTITY(100001,1) NOT NULL,
	[fecha] [datetime] NULL,
	[rut] [varchar](255) NULL,
	[patente] [varchar](255) NULL,
	[monto_neto] [varchar](255) NULL,
	[fecha_vencimiento] [date] NULL,
	[digito_verificador] [varchar](255) NULL,
	[Marca] [varchar](255) NULL,
	[Modelo] [varchar](255) NULL,
	[ano] [varchar](255) NULL,
	[tipo_vehiculo] [varchar](255) NULL,
	[motor] [varchar](255) NULL,
	[color] [varchar](255) NULL,
	[chasis] [varchar](255) NULL,
	[n_puertas] [varchar](255) NULL,
	[n_asiento] [varchar](255) NULL,
	[tara] [varchar](255) NULL,
	[codigo_sii] [varchar](255) NULL,
	[tasacion] [varchar](255) NULL,
	[cilindrada] [varchar](255) NULL,
	[combustible] [varchar](255) NULL,
	[transmision] [varchar](255) NULL,
	[equipamiento] [varchar](255) NULL,
	[nombre_propietario] [varchar](255) NULL,
	[domicilio_propietario] [varchar](255) NULL,
	[comuna_propietario] [varchar](255) NULL,
	[telefono_propietario] [varchar](255) NULL,
	[pago_total] [varchar](255) NULL,
	[sello_verde] [varchar](255) NULL,
	[comuna_anterior] [varchar](255) NULL,
	[zona_franca] [varchar](255) NULL,
	[carga] [varchar](255) NULL,
	[multa] [varchar](255) NULL,
	[ipc] [int] NULL,
	[valor_total] [int] NULL,
	[interes] [float] NULL,
	[total_neto] [int] NULL,
	[total_pagado] [int] NULL,
	[cuota] [varchar](250) NULL,
	[empresa] [varchar](250) NULL,
	[usuario] [varchar](250) NULL,
 CONSTRAINT [PK_permisos_circulacion_solicitud] PRIMARY KEY CLUSTERED 
(
	[id_permisosCirculacion_solicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[plantas_revision_tecnica]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[plantas_revision_tecnica](
	[id_planta_revision_tecnica] [int] IDENTITY(1,1) NOT NULL,
	[codigo_i_car] [int] NULL,
	[nombre] [varchar](150) NULL,
	[activo] [int] NULL,
 CONSTRAINT [PK_plantas_revision_tecnica] PRIMARY KEY CLUSTERED 
(
	[id_planta_revision_tecnica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[solicitud_permiso_temp]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[solicitud_permiso_temp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[USUARIO] [varchar](250) NULL,
	[CLAVE] [varchar](250) NULL,
	[ACCION] [varchar](250) NULL,
	[NRO_MOTOR] [varchar](250) NULL,
	[COD_TIP_VEH] [varchar](250) NULL,
	[COD_MARCA] [varchar](250) NULL,
	[MODELO] [varchar](250) NULL,
	[ANO_FAB] [varchar](250) NULL,
	[COLOR] [varchar](250) NULL,
	[CHASSIS] [varchar](250) NULL,
	[NUM_PUERTA] [varchar](250) NULL,
	[NUM_ASIENTO] [varchar](250) NULL,
	[CARGA] [varchar](250) NULL,
	[COD_TIP_CAR] [varchar](250) NULL,
	[COD_TIP_SEL] [varchar](250) NULL,
	[NUM_SELLO] [varchar](250) NULL,
	[CILINDRADA] [varchar](250) NULL,
	[COD_COMBU] [varchar](250) NULL,
	[COD_TRANSM] [varchar](250) NULL,
	[COD_EQUIP] [varchar](250) NULL,
	[RUT_PROP] [varchar](250) NULL,
	[DV_PROP] [varchar](250) NULL,
	[CAL_JUR] [varchar](250) NULL,
	[RAZ_SOCIAL] [varchar](250) NULL,
	[NOMBRES] [varchar](250) NULL,
	[AP_PAT] [varchar](250) NULL,
	[AP_MAT] [varchar](250) NULL,
	[CALLE_DIR] [varchar](250) NULL,
	[NUM_DIR] [varchar](250) NULL,
	[ACLARA_DIR] [varchar](250) NULL,
	[COD_COMUNA] [varchar](250) NULL,
	[FONO] [varchar](250) NULL,
	[EMAIL] [varchar](250) NULL,
	[NETO_FAC] [varchar](250) NULL,
	[IVA_FAC] [varchar](250) NULL,
	[BRUTO_FAC] [varchar](250) NULL,
	[FECHA_FAC] [varchar](250) NULL,
	[IND_NUEVO] [varchar](250) NULL,
	[TIP_CER_RT] [varchar](250) NULL,
	[COD_PRT] [varchar](250) NULL,
	[NUM_CER] [varchar](250) NULL,
	[FEC_VIG_CER] [varchar](250) NULL,
	[TIPO_SOAP] [varchar](250) NULL,
	[COD_CIA_ASEG] [varchar](250) NULL,
	[NUM_SOAP] [varchar](250) NULL,
	[FEC_VIG_SOAP] [varchar](250) NULL,
	[PLACA] [varchar](250) NULL,
	[DV_PLACA] [varchar](250) NULL,
 CONSTRAINT [PK_SolicitudPermisoTEMP] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[solicitud_permiso_temp_2]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[solicitud_permiso_temp_2](
	[id] [int] NOT NULL,
	[USUARIO] [varchar](250) NULL,
	[CLAVE] [varchar](250) NULL,
	[ACCION] [varchar](250) NULL,
	[NRO_MOTOR] [varchar](250) NULL,
	[COD_TIP_VEH] [varchar](250) NULL,
	[COD_MARCA] [varchar](250) NULL,
	[MODELO] [varchar](250) NULL,
	[ANO_FAB] [varchar](250) NULL,
	[COLOR] [varchar](250) NULL,
	[CHASSIS] [varchar](250) NULL,
	[NUM_PUERTA] [varchar](250) NULL,
	[NUM_ASIENTO] [varchar](250) NULL,
	[CARGA] [varchar](250) NULL,
	[COD_TIP_CAR] [varchar](250) NULL,
	[COD_TIP_SEL] [varchar](250) NULL,
	[NUM_SELLO] [varchar](250) NULL,
	[CILINDRADA] [varchar](250) NULL,
	[COD_COMBU] [varchar](250) NULL,
	[COD_TRANSM] [varchar](250) NULL,
	[COD_EQUIP] [varchar](250) NULL,
	[RUT_PROP] [varchar](250) NULL,
	[DV_PROP] [varchar](250) NULL,
	[CAL_JUR] [varchar](250) NULL,
	[RAZ_SOCIAL] [varchar](250) NULL,
	[NOMBRES] [varchar](250) NULL,
	[AP_PAT] [varchar](250) NULL,
	[AP_MAT] [varchar](250) NULL,
	[CALLE_DIR] [varchar](250) NULL,
	[NUM_DIR] [varchar](250) NULL,
	[ACLARA_DIR] [varchar](250) NULL,
	[COD_COMUNA] [varchar](250) NULL,
	[FONO] [varchar](250) NULL,
	[EMAIL] [varchar](250) NULL,
	[NETO_FAC] [varchar](250) NULL,
	[IVA_FAC] [varchar](250) NULL,
	[BRUTO_FAC] [varchar](250) NULL,
	[FECHA_FAC] [varchar](250) NULL,
	[IND_NUEVO] [varchar](250) NULL,
	[TIP_CER_RT] [varchar](250) NULL,
	[COD_PRT] [varchar](250) NULL,
	[NUM_CER] [varchar](250) NULL,
	[FEC_VIG_CER] [varchar](250) NULL,
	[TIPO_SOAP] [varchar](250) NULL,
	[COD_CIA_ASEG] [varchar](250) NULL,
	[NUM_SOAP] [varchar](250) NULL,
	[FEC_VIG_SOAP] [varchar](250) NULL,
	[PLACA] [varchar](250) NULL,
	[DV_PLACA] [varchar](250) NULL,
 CONSTRAINT [PK_SolicitudPermisoTEMP_2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_carrocerias]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_carrocerias](
	[id_tipo_carroceria] [int] IDENTITY(1,1) NOT NULL,
	[codigo_i_car] [int] NULL,
	[grupo] [int] NULL,
	[nombre] [varchar](150) NULL,
	[activo] [int] NULL,
 CONSTRAINT [PK_tipo_carroceria] PRIMARY KEY CLUSTERED 
(
	[id_tipo_carroceria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_combustiones]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_combustiones](
	[id_tipo_combustion] [int] IDENTITY(1,1) NOT NULL,
	[codigo_i_car] [int] NULL,
	[nombre] [varchar](150) NULL,
	[activo] [int] NULL,
 CONSTRAINT [PK_tipos_combustiones] PRIMARY KEY CLUSTERED 
(
	[id_tipo_combustion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_equipamientos]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_equipamientos](
	[id_tipo_equipamiento] [int] IDENTITY(1,1) NOT NULL,
	[codigo_i_car] [int] NULL,
	[nombre] [varchar](150) NULL,
	[activo] [int] NULL,
 CONSTRAINT [PK_tipos_equipamientos] PRIMARY KEY CLUSTERED 
(
	[id_tipo_equipamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_permisos_circulacion]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_permisos_circulacion](
	[id_tipo_permiso] [int] NOT NULL,
	[nombre] [varchar](150) NULL,
	[Activo] [int] NULL,
 CONSTRAINT [PK_tiposPermisosCirculacion] PRIMARY KEY CLUSTERED 
(
	[id_tipo_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_sellos]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_sellos](
	[id_tipo_sello] [int] IDENTITY(1,1) NOT NULL,
	[codigo_i_car] [int] NULL,
	[nombre] [varchar](150) NULL,
	[activo] [int] NULL,
 CONSTRAINT [PK_tipo_sellos] PRIMARY KEY CLUSTERED 
(
	[id_tipo_sello] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_transmisiones]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_transmisiones](
	[id_tipo_transmision] [int] IDENTITY(1,1) NOT NULL,
	[codigo_i_car] [int] NULL,
	[nombre] [varchar](150) NULL,
	[activo] [int] NULL,
 CONSTRAINT [PK_tipos_transmisiones] PRIMARY KEY CLUSTERED 
(
	[id_tipo_transmision] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipos_vehiculos]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipos_vehiculos](
	[id_codigo_tipo_vehiculo] [int] IDENTITY(1,1) NOT NULL,
	[codigo_i_car] [int] NULL,
	[grupo] [int] NULL,
	[nombre] [varchar](150) NULL,
	[activo] [int] NULL,
 CONSTRAINT [PK_tipos_vehiculos] PRIMARY KEY CLUSTERED 
(
	[id_codigo_tipo_vehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NULL,
	[mail] [varchar](50) NULL,
	[usuario] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[activo] [int] NULL,
	[id_perfil] [int] NULL,
 CONSTRAINT [PK_usuarios] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ws_logs]    Script Date: 08/11/2021 23:09:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ws_logs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[codigo_error] [int] NULL,
	[mensaje] [varchar](max) NULL,
	[id_permiso_temp_procesado] [int] NULL,
 CONSTRAINT [PK_ws_logs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[envio_a_icar] ADD  CONSTRAINT [DF_envio_a_icar_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[ws_logs] ADD  CONSTRAINT [DF_ws_logs_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[permisos_circulacion_envio]  WITH CHECK ADD  CONSTRAINT [FK_permisos_circulacion_envio_permisos_circulacion] FOREIGN KEY([id_permisosCirculacion])
REFERENCES [dbo].[permisos_circulacion] ([id_permisosCirculacion])
GO
ALTER TABLE [dbo].[permisos_circulacion_envio] CHECK CONSTRAINT [FK_permisos_circulacion_envio_permisos_circulacion]
GO
