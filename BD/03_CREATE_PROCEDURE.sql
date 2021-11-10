USE [GSC_CalleLarga_QA]
GO
/****** Object:  StoredProcedure [dbo].[PA_Del_Permisos_circulacion]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Del_Permisos_circulacion]
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY  
		DELETE FROM permisos_circulacion WHERE id_permisosCirculacion = @id
		SELECT 1 res
	END TRY  
	BEGIN CATCH
		SELECT 0 res
	END CATCH;

END
GO
/****** Object:  StoredProcedure [dbo].[PA_Del_Permisos_circulacion_envio]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Del_Permisos_circulacion_envio]
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY  
		DELETE FROM permisos_circulacion_envio WHERE id_permisos_circulacion_envio = @id
		SELECT 1 res
	END TRY  
	BEGIN CATCH  
		SELECT 0 res
	END CATCH;

END
GO
/****** Object:  StoredProcedure [dbo].[PA_Del_Permisos_circulacion_solicitud]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Del_Permisos_circulacion_solicitud]
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY  
		DELETE FROM permisos_circulacion_solicitud WHERE id_permisosCirculacion_solicitud=@id
		SELECT 1 res
	END TRY  
	BEGIN CATCH  
		SELECT 0 res
	END CATCH;

END
GO
/****** Object:  StoredProcedure [dbo].[PA_Del_PermisoTemp]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Del_PermisoTemp]
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRY  
		INSERT INTO solicitud_permiso_temp_2
			SELECT * FROM solicitud_permiso_temp WHERE id=@id
	END TRY  
	BEGIN CATCH  

	END CATCH;

    -- Insert statements for procedure here
	DELETE FROM solicitud_permiso_temp WHERE id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Ins_Envio_A_ICar]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Ins_Envio_A_ICar]
	@accion INT,
	@id_permiso_temp INT=NULL,
	@id_permiso INT=NULL,
	@xml_res varchar(MAX)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO envio_a_icar (accion, id_permiso_temp, id_permiso, xml_res) VALUES (@accion, @id_permiso_temp, @id_permiso, @xml_res)
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Ins_Formulario_Contacto]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Ins_Formulario_Contacto]
	@nombre VARCHAR(150)
	,@correo VARCHAR(50)
	,@telefono VARCHAR(50)
	,@mensaje VARCHAR(500)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO formulario_contacto (nombre, correo, telefono, mensaje) VALUES (@nombre, @correo, @telefono, @mensaje)

	SELECT SCOPE_IDENTITY() id
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Ins_Permiso_Circulacion]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Ins_Permiso_Circulacion]
	@id_permisosCirculacion INT
	,@tipo INT
	,@rut VARCHAR(50)
	,@patente VARCHAR(50)
	,@monto_neto VARCHAR(255)
	,@fecha_vencimiento DATE
	,@digito_verificador VARCHAR(255)
	,@Marca VARCHAR(255)
	,@Modelo VARCHAR(255)
	,@ano VARCHAR(255)
	,@tipo_vehiculo VARCHAR(255)
	,@motor VARCHAR(255)
	,@color VARCHAR(255)
	,@chasis VARCHAR(255)
	,@n_puertas VARCHAR(255)
	,@n_asiento VARCHAR(255)
	,@tara VARCHAR(255)
	,@codigo_sii VARCHAR(255)
	,@tasacion VARCHAR(255)
	,@cilindrada VARCHAR(255)
	,@combustible VARCHAR(255)
	,@transmision VARCHAR(255)
	,@equipamiento VARCHAR(255)
	,@nombre_propietario VARCHAR(255)
	,@domicilio_propietario VARCHAR(255)
	,@comuna_propietario VARCHAR(255)
	,@telefono_propietario VARCHAR(255)
	,@pago_total VARCHAR(255)
	,@sello_verde VARCHAR(255)
	,@comuna_anterior VARCHAR(255)
	,@zona_franca VARCHAR(255)
	,@carga VARCHAR(255)
	,@multa VARCHAR(255)
	,@ipc INT = NULL
	,@valor_total INT = NULL
	,@interes FLOAT = NULL
	,@total_neto INT = NULL
	,@total_pagado INT = NULL
	,@cuota VARCHAR(250) = NULL
	,@empresa VARCHAR(250) = NULL
	,@usuario VARCHAR(250) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @fecha DATETIME = GETDATE();
	DECLARE @id INT

	IF (@id_permisosCirculacion>0)
	BEGIN
		UPDATE permisos_circulacion SET tipo=@tipo, rut=@rut, patente=@patente, monto_neto=@monto_neto, fecha_vencimiento=@fecha_vencimiento, digito_verificador=@digito_verificador, Marca=@Marca, Modelo=@Modelo, ano=@ano, tipo_vehiculo=@tipo_vehiculo, motor=@motor, color=@color, chasis=@chasis, n_puertas=@n_puertas, n_asiento=@n_asiento, tara=@tara, codigo_sii=@codigo_sii, tasacion=@tasacion, cilindrada=@cilindrada, combustible=@combustible, transmision=@transmision, equipamiento=@equipamiento, nombre_propietario=@nombre_propietario, domicilio_propietario=@domicilio_propietario, comuna_propietario=@comuna_propietario, telefono_propietario=@telefono_propietario, pago_total=@pago_total, sello_verde=@sello_verde, comuna_anterior=@comuna_anterior, zona_franca=@zona_franca, carga=@carga, multa=@multa, ipc=@ipc, valor_total=@valor_total, interes=@interes, total_neto=@total_neto, total_pagado=@total_pagado, cuota=@cuota, empresa=@empresa, usuario=@usuario WHERE id_permisosCirculacion=@id_permisosCirculacion
		SET @id=@id_permisosCirculacion
		INSERT INTO permisos_circulacion_logs (id_permisosCirculacion,fecha,accion) VALUES (@id,GETDATE(),2)
	END
	ELSE
	BEGIN
		INSERT INTO permisos_circulacion (tipo, fecha, rut, patente, monto_neto, fecha_vencimiento, digito_verificador, Marca, Modelo, ano, tipo_vehiculo, motor, color, chasis, n_puertas, n_asiento, tara, codigo_sii, tasacion, cilindrada, combustible, transmision, equipamiento, nombre_propietario, domicilio_propietario, comuna_propietario, telefono_propietario, pago_total, sello_verde, comuna_anterior, zona_franca, carga, multa, ipc, valor_total, interes, total_neto, total_pagado, cuota, empresa, usuario)
		values (@tipo, @fecha, @rut, @patente, @monto_neto, @fecha_vencimiento, @digito_verificador, @Marca, @Modelo, @ano, @tipo_vehiculo, @motor, @color, @chasis, @n_puertas, @n_asiento, @tara, @codigo_sii, @tasacion, @cilindrada, @combustible, @transmision, @equipamiento, @nombre_propietario, @domicilio_propietario, @comuna_propietario, @telefono_propietario, @pago_total, @sello_verde, @comuna_anterior, @zona_franca, @carga, @multa, @ipc, @valor_total, @interes, @total_neto, @total_pagado, @cuota, @empresa, @usuario)

		SET @id=SCOPE_IDENTITY()
		INSERT INTO permisos_circulacion_logs (id_permisosCirculacion,fecha,accion) VALUES (@id,GETDATE(),1)
	END

	SELECT CAST(@id AS VARCHAR)+'|'+REPLACE(CONVERT(VARCHAR, @fecha, 103),'/','-') res
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Ins_Permiso_Circulacion_Envio]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Ins_Permiso_Circulacion_Envio]
	 @id_permisosCirculacion	INT,
	 @archivo_pdf				VARCHAR(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @nuevo_id		INT				= NULL,
			@resultado		INT				= 1,			-- 1 = OK	2 = Existente	3 = Error
			@codigo_error	INT				= NULL,
			@mensaje_error	NVARCHAR(4000)	= NULL,
			@fecha			DATETIME		= GETDATE()

	IF EXISTS (SELECT id_permisos_circulacion_envio FROM permisos_circulacion_envio WHERE id_permisosCirculacion = @id_permisosCirculacion)
	BEGIN
		SET @resultado = 2
	END
	ELSE
	BEGIN
		BEGIN TRY
			INSERT INTO permisos_circulacion_envio (id_permisosCirculacion, archivo_pdf, intentos, activo) VALUES (@id_permisosCirculacion, @archivo_pdf, 0, 1)

			SET @nuevo_id = SCOPE_IDENTITY()
		END TRY
		BEGIN CATCH
			SET @resultado		= 3
			SET @codigo_error	= ERROR_NUMBER()
			SET @mensaje_error	= ERROR_MESSAGE()
		END CATCH
	END

	SELECT	@nuevo_id		AS id,
			@resultado		AS resultado,
			@codigo_error	AS codigo_error,
			@mensaje_error	AS mensaje_error
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Ins_Permiso_Circulacion_Solicitud]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Ins_Permiso_Circulacion_Solicitud]
	 @rut VARCHAR(50)
	,@patente VARCHAR(50)
	,@monto_neto VARCHAR(255)
	,@digito_verificador VARCHAR(255)
	,@Marca VARCHAR(255)
	,@Modelo VARCHAR(255)
	,@ano VARCHAR(255)
	,@tipo_vehiculo VARCHAR(255)
	,@motor VARCHAR(255)
	,@color VARCHAR(255)
	,@chasis VARCHAR(255)
	,@n_puertas VARCHAR(255)
	,@n_asiento VARCHAR(255)
	,@tara VARCHAR(255)
	,@codigo_sii VARCHAR(255)
	,@tasacion VARCHAR(255)
	,@cilindrada VARCHAR(255)
	,@combustible VARCHAR(255)
	,@transmision VARCHAR(255)
	,@equipamiento VARCHAR(255)
	,@nombre_propietario VARCHAR(255)
	,@domicilio_propietario VARCHAR(255)
	,@comuna_propietario VARCHAR(255)
	,@telefono_propietario VARCHAR(255)
	,@pago_total VARCHAR(255)
	,@sello_verde VARCHAR(255)
	,@comuna_anterior VARCHAR(255)
	,@zona_franca VARCHAR(255)
	,@carga VARCHAR(255)
	,@multa VARCHAR(255)
	,@ipc INT = NULL
	,@valor_total INT = NULL
	,@interes FLOAT = NULL
	,@total_neto INT = NULL
	,@total_pagado INT = NULL
	,@cuota VARCHAR(250) = NULL
	,@empresa VARCHAR(250) = NULL
	,@usuario VARCHAR(250) = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @nuevo_id		INT				= NULL,
			@resultado		INT				= 1,			-- 1 = OK	2 = Existente	3 = Error
			@codigo_error	INT				= NULL,
			@mensaje_error	NVARCHAR(4000)	= NULL,
			@fecha			DATETIME		= GETDATE()

	BEGIN TRY
		INSERT INTO permisos_circulacion_solicitud (fecha, rut, patente, monto_neto, digito_verificador, Marca, Modelo, ano, tipo_vehiculo, motor, color, chasis, n_puertas, n_asiento, tara, codigo_sii, tasacion, cilindrada, combustible, transmision, equipamiento, nombre_propietario, domicilio_propietario, comuna_propietario, telefono_propietario, pago_total, sello_verde, comuna_anterior, zona_franca, carga, multa, ipc, valor_total, interes, total_neto, total_pagado, cuota, empresa, usuario)
		values (@fecha, @rut, @patente, @monto_neto, @digito_verificador, @Marca, @Modelo, @ano, @tipo_vehiculo, @motor, @color, @chasis, @n_puertas, @n_asiento, @tara, @codigo_sii, @tasacion, @cilindrada, @combustible, @transmision, @equipamiento, @nombre_propietario, @domicilio_propietario, @comuna_propietario, @telefono_propietario, @pago_total, @sello_verde, @comuna_anterior, @zona_franca, @carga, @multa, @ipc, @valor_total, @interes, @total_neto, @total_pagado, @cuota, @empresa, @usuario)

		SET @nuevo_id=SCOPE_IDENTITY()
	END TRY
	BEGIN CATCH
		SET @resultado		= 3
		SET @codigo_error	= ERROR_NUMBER()
		SET @mensaje_error	= ERROR_MESSAGE()
	END CATCH

	SELECT	@nuevo_id		AS id,
			@resultado		AS resultado,
			@codigo_error	AS codigo_error,
			@mensaje_error	AS mensaje_error
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Ins_ws_logs]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Ins_ws_logs]
	@codigo_error INT,
	@mensaje VARCHAR(MAX),
	@id_permiso_temp_procesado INT=0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO ws_logs (codigo_error, mensaje, id_permiso_temp_procesado) VALUES (@codigo_error, @mensaje, @id_permiso_temp_procesado)

END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Acceso_Usuario]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Acceso_Usuario]
	@usuario VARCHAR(50),
	@password VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @id_usuario INT=ISNULL((SELECT id_usuario FROM usuarios WHERE usuario=@usuario AND password=@password AND activo=1),0)

	INSERT INTO accesos (fecha, id_usuario, usuario, password) VALUES (GETDATE(), @id_usuario, @usuario, @password)

	SELECT @id_usuario id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Calidad_Juridica_Por_Id]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Calidad_Juridica_Por_Id]
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [id_calidad_juridica]
		  ,[codigo_i_car]
		  ,[nombre]
		  ,[activo]
	FROM [calidad_juridica]
	WHERE id_calidad_juridica=@id
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Companias_Aseguradoras_Por_Id]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Companias_Aseguradoras_Por_Id]
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [id_compania_aseguradora]
		  ,[codigo_i_car]
		  ,[nombre]
		  ,[activo]
	FROM [companias_aseguradoras]
	WHERE id_compania_aseguradora=@id
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Comunas_Por_Id]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Comunas_Por_Id]
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [id_comuna]
		  ,[codigo_i_car]
		  ,[nombre]
		  ,[activo]
	FROM [comunas]
	WHERE id_comuna=@id
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Marcas_Por_Id]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Marcas_Por_Id]
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [id_marca]
		  ,[codigo_i_car]
		  ,[nombre]
		  ,[activo]
    FROM [marcas]
	WHERE id_marca=@id
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Permisos_Circulacion]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Permisos_Circulacion]
	@patente varchar(255)=NULL,
	@rut varchar(255)=NULL,
	@externo INT=NULL,
	@i_car INT=NULL,
	@fecha_desde DATETIME=NULL,
	@fecha_hasta DATETIME=NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
/****** Script para el comando SelectTopNRows de SSMS  ******/
SELECT p.[id_permisosCirculacion]
      ,p.[tipo]
      ,p.[fecha]
      ,p.[rut]
      ,p.[patente]
      ,p.[monto_neto]
      ,p.[fecha_vencimiento]
      ,p.[digito_verificador]
      ,p.[Marca]
      ,p.[Modelo]
      ,p.[ano]
      ,p.[tipo_vehiculo]
      ,p.[motor]
      ,p.[color]
      ,p.[chasis]
      ,p.[n_puertas]
      ,p.[n_asiento]
      ,p.[tara]
      ,p.[codigo_sii]
      ,p.[tasacion]
      ,p.[cilindrada]
      ,p.[combustible]
      ,p.[transmision]
      ,p.[equipamiento]
      ,p.[nombre_propietario]
      ,p.[domicilio_propietario]
      ,p.[comuna_propietario]
      ,p.[telefono_propietario]
      ,p.[pago_total]
      ,p.[sello_verde]
      ,p.[comuna_anterior]
      ,p.[zona_franca]
      ,p.[carga]
      ,p.[multa]
	  ,p.ipc
	  ,p.valor_total
	  ,p.interes
	  ,p.total_neto
	  ,p.total_pagado
	  ,p.cuota
	  ,p.empresa
	  ,p.usuario
  FROM [permisos_circulacion] p
  WHERE (@patente	  IS NULL  OR  p.patente=@patente)
	AND (@rut		  IS NULL  OR  p.rut=@rut)
	AND (@externo	  IS NULL  OR  p.tipo<>(CASE WHEN @externo=0 THEN 2 ELSE 999 END))
	AND (@i_car		  IS NULL  OR  p.tipo<>(CASE WHEN @i_car=0	 THEN 3 ELSE 999 END))
	AND (@fecha_desde IS NULL  OR  p.fecha>=@fecha_desde)
	AND (@fecha_hasta IS NULL  OR  p.fecha<=@fecha_hasta)
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Permisos_Circulacion_Envio_Top]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Permisos_Circulacion_Envio_Top]
	@cantidad INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT TOP (@cantidad)
			e.id_permisos_circulacion_envio,
			e.id_permisosCirculacion,
			e.archivo_pdf,
			e.intentos,
			p.patente,
			p.motor
	  FROM permisos_circulacion_envio e
	  LEFT JOIN permisos_circulacion p ON p.id_permisosCirculacion = e.id_permisosCirculacion
	  WHERE e.activo = 1
	  Order By e.id_permisos_circulacion_envio
  
  END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Permisos_Circulacion_Por_Id]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Permisos_Circulacion_Por_Id]
	@id_permisosCirculacion INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
/****** Script para el comando SelectTopNRows de SSMS  ******/
SELECT p.[id_permisosCirculacion]
      ,p.[tipo]
      ,p.[fecha]
      ,p.[rut]
      ,p.[patente]
      ,p.[monto_neto]
      ,p.[fecha_vencimiento]
      ,p.[digito_verificador]
      ,p.[Marca]
      ,p.[Modelo]
      ,p.[ano]
      ,p.[tipo_vehiculo]
      ,p.[motor]
      ,p.[color]
      ,p.[chasis]
      ,p.[n_puertas]
      ,p.[n_asiento]
      ,p.[tara]
      ,p.[codigo_sii]
      ,p.[tasacion]
      ,p.[cilindrada]
      ,p.[combustible]
      ,p.[transmision]
      ,p.[equipamiento]
      ,p.[nombre_propietario]
      ,p.[domicilio_propietario]
      ,p.[comuna_propietario]
      ,p.[telefono_propietario]
      ,p.[pago_total]
      ,p.[sello_verde]
      ,p.[comuna_anterior]
      ,p.[zona_franca]
      ,p.[carga]
      ,p.[multa]
	  ,p.ipc
	  ,p.valor_total
	  ,p.interes
	  ,p.total_neto
	  ,p.total_pagado
	  ,p.cuota
  FROM [permisos_circulacion] p
  WHERE id_permisosCirculacion=@id_permisosCirculacion
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Permisos_Circulacion_Solicitud_Por_Id]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Permisos_Circulacion_Solicitud_Por_Id]
	@id_permisosCirculacion_solicitud INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT s.id_permisosCirculacion_solicitud
		  ,s.fecha
		  ,s.rut
		  ,s.patente
		  ,s.monto_neto
		  ,s.fecha_vencimiento
		  ,s.digito_verificador
		  ,s.Marca
		  ,s.Modelo
		  ,s.ano
		  ,s.tipo_vehiculo
		  ,s.motor
		  ,s.color
		  ,s.chasis
		  ,s.n_puertas
		  ,s.n_asiento
		  ,s.tara
		  ,s.codigo_sii
		  ,s.tasacion
		  ,s.cilindrada
		  ,s.combustible
		  ,s.transmision
		  ,s.equipamiento
		  ,s.nombre_propietario
		  ,s.domicilio_propietario
		  ,s.comuna_propietario
		  ,s.telefono_propietario
		  ,s.pago_total
		  ,s.sello_verde
		  ,s.comuna_anterior
		  ,s.zona_franca
		  ,s.carga
		  ,s.multa
		  ,s.ipc
		  ,s.valor_total
		  ,s.interes
		  ,s.total_neto
		  ,s.total_pagado
		  ,s.cuota
		  ,s.empresa
		  ,s.usuario
	  FROM permisos_circulacion_solicitud s
	  WHERE s.id_permisosCirculacion_solicitud = @id_permisosCirculacion_solicitud
  
  END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Permisos_Circulacion_Solicitud_Top]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Permisos_Circulacion_Solicitud_Top]
	@cantidad INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT TOP (@cantidad)
		   s.id_permisosCirculacion_solicitud
		  ,s.fecha
		  ,s.rut
		  ,s.patente
		  ,s.monto_neto
		  ,s.fecha_vencimiento
		  ,s.digito_verificador
		  ,s.Marca
		  ,s.Modelo
		  ,s.ano
		  ,s.tipo_vehiculo
		  ,s.motor
		  ,s.color
		  ,s.chasis
		  ,s.n_puertas
		  ,s.n_asiento
		  ,s.tara
		  ,s.codigo_sii
		  ,s.tasacion
		  ,s.cilindrada
		  ,s.combustible
		  ,s.transmision
		  ,s.equipamiento
		  ,s.nombre_propietario
		  ,s.domicilio_propietario
		  ,s.comuna_propietario
		  ,s.telefono_propietario
		  ,s.pago_total
		  ,s.sello_verde
		  ,s.comuna_anterior
		  ,s.zona_franca
		  ,s.carga
		  ,s.multa
		  ,s.ipc
		  ,s.valor_total
		  ,s.interes
		  ,s.total_neto
		  ,s.total_pagado
		  ,s.cuota
		  ,s.empresa
		  ,s.usuario
	  FROM permisos_circulacion_solicitud s
	  Order By s.id_permisosCirculacion_solicitud
  
  END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Permisos_Temp]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Permisos_Temp]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT p.[id]
      ,p.[USUARIO]
      ,p.[CLAVE]
      ,p.[ACCION]
      ,p.[NRO_MOTOR]
      ,p.[COD_TIP_VEH]
      ,p.[COD_MARCA]
      ,p.[MODELO]
      ,p.[ANO_FAB]
      ,p.[COLOR]
      ,p.[CHASSIS]
      ,p.[NUM_PUERTA]
      ,p.[NUM_ASIENTO]
      ,p.[CARGA]
      ,p.[COD_TIP_CAR]
      ,p.[COD_TIP_SEL]
      ,p.[NUM_SELLO]
      ,p.[CILINDRADA]
      ,p.[COD_COMBU]
      ,p.[COD_TRANSM]
      ,p.[COD_EQUIP]
      ,p.[RUT_PROP]
      ,p.[DV_PROP]
      ,p.[CAL_JUR]
      ,p.[RAZ_SOCIAL]
      ,p.[NOMBRES]
      ,p.[AP_PAT]
      ,p.[AP_MAT]
      ,p.[CALLE_DIR]
      ,p.[NUM_DIR]
      ,p.[ACLARA_DIR]
      ,p.[COD_COMUNA]
      ,p.[FONO]
      ,p.[EMAIL]
      ,p.[NETO_FAC]
      ,p.[IVA_FAC]
      ,p.[BRUTO_FAC]
      ,p.[FECHA_FAC]
      ,p.[IND_NUEVO]
      ,p.[TIP_CER_RT]
      ,p.[COD_PRT]
      ,p.[NUM_CER]
      ,p.[FEC_VIG_CER]
      ,p.[TIPO_SOAP]
      ,p.[COD_CIA_ASEG]
      ,p.[NUM_SOAP]
      ,p.[FEC_VIG_SOAP]
      ,p.[PLACA]
      ,p.[DV_PLACA]
	  ,tv.nombre tipo_vehiculo
	  ,mr.nombre marca
	  ,tc.nombre tipo_carroceria
	  ,ts.nombre tipo_sello
	  ,tcom.nombre tipo_combustion
	  ,tt.nombre tipo_transmision
	  ,te.nombre tipo_equipamiento
	  ,cj.nombre cal_juridica
	  ,com.nombre comuna
	  ,rt.nombre planta_revision_tecnica
	  ,ca.nombre compania_aseguradora
	  ,(CASE WHEN TIP_CER_RT='h' THEN 'HOMOLOGADO'	ELSE 'REVISIÓN TÉCNICA' END) tipo_cert
	  ,(CASE WHEN TIPO_SOAP	='e' THEN 'ELECTRÓNICO' ELSE 'MANUAL'			END) tipo_soap
  FROM [solicitud_permiso_temp] p
  LEFT JOIN tipos_vehiculos		tv		ON tv.id_codigo_tipo_vehiculo=p.COD_TIP_VEH
  LEFT JOIN marcas				mr		ON mr.id_marca=p.COD_MARCA
  LEFT JOIN tipos_carrocerias	tc		ON tc.id_tipo_carroceria=p.COD_TIP_CAR
  LEFT JOIN tipos_sellos		ts		ON ts.id_tipo_sello=p.COD_TIP_SEL
  LEFT JOIN tipos_combustiones	tcom	ON tcom.id_tipo_combustion=p.COD_COMBU
  LEFT JOIN tipos_transmisiones tt		ON tt.id_tipo_transmision=p.COD_TRANSM
  LEFT JOIN tipos_equipamientos te		ON te.id_tipo_equipamiento=p.COD_EQUIP
  LEFT JOIN calidad_juridica	cj		ON cj.id_calidad_juridica=p.CAL_JUR
  LEFT JOIN comunas				com		ON com.id_comuna=p.COD_COMUNA
  LEFT JOIN plantas_revision_tecnica rt ON rt.id_planta_revision_tecnica=p.COD_PRT
  LEFT JOIN companias_aseguradoras ca	ON ca.id_compania_aseguradora=p.COD_CIA_ASEG
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Plantas_Revision_Tecnica_Por_Id]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Plantas_Revision_Tecnica_Por_Id]
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [id_planta_revision_tecnica]
		  ,[codigo_i_car]
		  ,[nombre]
		  ,[activo]
	FROM [plantas_revision_tecnica]
	WHERE id_planta_revision_tecnica=@id
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Presupuesto]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Presupuesto]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT monto FROM monto_presupuesto
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Tipos_Carrocerias_Por_Id]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Tipos_Carrocerias_Por_Id]
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [id_tipo_carroceria]
		  ,[codigo_i_car]
		  ,[grupo]
		  ,[nombre]
		  ,[activo]
	FROM [tipos_carrocerias]
	WHERE id_tipo_carroceria=@id
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Tipos_Combustiones_Por_Id]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Tipos_Combustiones_Por_Id]
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [id_tipo_combustion]
		  ,[codigo_i_car]
		  ,[nombre]
		  ,[activo]
	FROM [tipos_combustiones]
	WHERE id_tipo_combustion=@id
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Tipos_Equipamientos_Por_Id]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Tipos_Equipamientos_Por_Id]
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [id_tipo_equipamiento]
		  ,[codigo_i_car]
		  ,[nombre]
		  ,[activo]
	FROM [tipos_equipamientos]
	WHERE id_tipo_equipamiento=@id
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Tipos_Sellos_Por_Id]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Tipos_Sellos_Por_Id]
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [id_tipo_sello]
		  ,[codigo_i_car]
		  ,[nombre]
		  ,[activo]
	FROM [tipos_sellos]
	WHERE id_tipo_sello=@id
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Tipos_Transmisiones_Por_Id]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Tipos_Transmisiones_Por_Id]
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [id_tipo_transmision]
		  ,[codigo_i_car]
		  ,[nombre]
		  ,[activo]
	FROM [tipos_transmisiones]
	WHERE id_tipo_transmision=@id
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Tipos_Vehiculos_Por_Id]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Tipos_Vehiculos_Por_Id]
	@id INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT [id_codigo_tipo_vehiculo]
		  ,[codigo_i_car]
		  ,[grupo]
		  ,[nombre]
		  ,[activo]
	FROM [tipos_vehiculos]
	WHERE id_codigo_tipo_vehiculo=@id
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Sel_Usuario_Por_Id]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Sel_Usuario_Por_Id]
	@id_usuario INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT nombre, mail, activo, id_perfil FROM usuarios WHERE id_usuario=@id_usuario
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Solicitud_Permiso]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Solicitud_Permiso]
	@USUARIO VARCHAR(250),
	@CLAVE VARCHAR(250),
	@ACCION VARCHAR(250),
	@NRO_MOTOR VARCHAR(250),
	@COD_TIP_VEH VARCHAR(250),
	@COD_MARCA VARCHAR(250),
	@MODELO VARCHAR(250),
	@ANO_FAB VARCHAR(250),
	@COLOR VARCHAR(250),
	@CHASSIS VARCHAR(250),
	@NUM_PUERTA VARCHAR(250),
	@NUM_ASIENTO VARCHAR(250),
	@CARGA VARCHAR(250),
	@COD_TIP_CAR VARCHAR(250),
	@COD_TIP_SEL VARCHAR(250),
	@NUM_SELLO VARCHAR(250),
	@CILINDRADA VARCHAR(250),
	@COD_COMBU VARCHAR(250),
	@COD_TRANSM VARCHAR(250),
	@COD_EQUIP VARCHAR(250),
	@RUT_PROP VARCHAR(250),
	@DV_PROP VARCHAR(250),
	@CAL_JUR VARCHAR(250),
	@RAZ_SOCIAL VARCHAR(250),
	@NOMBRES VARCHAR(250),
	@AP_PAT VARCHAR(250),
	@AP_MAT VARCHAR(250),
	@CALLE_DIR VARCHAR(250),
	@NUM_DIR VARCHAR(250),
	@ACLARA_DIR VARCHAR(250),
	@COD_COMUNA VARCHAR(250),
	@FONO VARCHAR(250),
	@EMAIL VARCHAR(250),
	@NETO_FAC VARCHAR(250),
	@IVA_FAC VARCHAR(250),
	@BRUTO_FAC VARCHAR(250),
	@FECHA_FAC VARCHAR(250),
	@IND_NUEVO VARCHAR(250),
	@TIP_CER_RT VARCHAR(250),
	@COD_PRT VARCHAR(250),
	@NUM_CER VARCHAR(250),
	@FEC_VIG_CER VARCHAR(250),
	@TIPO_SOAP VARCHAR(250),
	@COD_CIA_ASEG VARCHAR(250),
	@NUM_SOAP VARCHAR(250),
	@FEC_VIG_SOAP VARCHAR(250),
	@PLACA VARCHAR(250),
	@DV_PLACA VARCHAR(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO solicitud_permiso_temp (
		USUARIO,
		CLAVE,
		ACCION,
		NRO_MOTOR,
		COD_TIP_VEH,
		COD_MARCA,
		MODELO,
		ANO_FAB,
		COLOR,
		CHASSIS,
		NUM_PUERTA,
		NUM_ASIENTO,
		CARGA,
		COD_TIP_CAR,
		COD_TIP_SEL,
		NUM_SELLO,
		CILINDRADA,
		COD_COMBU,
		COD_TRANSM,
		COD_EQUIP,
		RUT_PROP,
		DV_PROP,
		CAL_JUR,
		RAZ_SOCIAL,
		NOMBRES,
		AP_PAT,
		AP_MAT,
		CALLE_DIR,
		NUM_DIR,
		ACLARA_DIR,
		COD_COMUNA,
		FONO,
		EMAIL,
		NETO_FAC,
		IVA_FAC,
		BRUTO_FAC,
		FECHA_FAC,
		IND_NUEVO,
		TIP_CER_RT,
		COD_PRT,
		NUM_CER,
		FEC_VIG_CER,
		TIPO_SOAP,
		COD_CIA_ASEG,
		NUM_SOAP,
		FEC_VIG_SOAP,
		PLACA,
		DV_PLACA
		) VALUES (
		@USUARIO,
		@CLAVE,
		@ACCION,
		@NRO_MOTOR,
		@COD_TIP_VEH,
		@COD_MARCA,
		@MODELO,
		@ANO_FAB,
		@COLOR,
		@CHASSIS,
		@NUM_PUERTA,
		@NUM_ASIENTO,
		@CARGA,
		@COD_TIP_CAR,
		@COD_TIP_SEL,
		@NUM_SELLO,
		@CILINDRADA,
		@COD_COMBU,
		@COD_TRANSM,
		@COD_EQUIP,
		@RUT_PROP,
		@DV_PROP,
		@CAL_JUR,
		@RAZ_SOCIAL,
		@NOMBRES,
		@AP_PAT,
		@AP_MAT,
		@CALLE_DIR,
		@NUM_DIR,
		@ACLARA_DIR,
		@COD_COMUNA,
		@FONO,
		@EMAIL,
		@NETO_FAC,
		@IVA_FAC,
		@BRUTO_FAC,
		@FECHA_FAC,
		@IND_NUEVO,
		@TIP_CER_RT,
		@COD_PRT,
		@NUM_CER,
		@FEC_VIG_CER,
		@TIPO_SOAP,
		@COD_CIA_ASEG,
		@NUM_SOAP,
		@FEC_VIG_SOAP,
		@PLACA,
		@DV_PLACA
		)

	SELECT SCOPE_IDENTITY() id
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Upd_Monto_Presupuesto]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Upd_Monto_Presupuesto]
	@monto INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    IF (SELECT COUNT(*) FROM monto_presupuesto)=0
		INSERT INTO monto_presupuesto (monto) VALUES (@monto)
	ELSE
		UPDATE monto_presupuesto SET monto=@monto
END
GO
/****** Object:  StoredProcedure [dbo].[PA_Upd_Permisos_Circulacion_Envio_Intentos]    Script Date: 08/11/2021 23:14:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PA_Upd_Permisos_Circulacion_Envio_Intentos]
	@id_permisos_circulacion_envio	INT,
	@max_intentos					INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	DECLARE @resultado		INT				= 1,			-- 1 = OK	2 = Existente	3 = Error
			@codigo_error	INT				= NULL,
			@mensaje_error	NVARCHAR(4000)	= NULL,
			@fecha			DATETIME		= GETDATE()

	BEGIN TRY
		UPDATE permisos_circulacion_envio SET intentos = intentos + 1, activo = (CASE WHEN intentos + 1 < @max_intentos THEN 1 ELSE 0 END) WHERE id_permisos_circulacion_envio = @id_permisos_circulacion_envio
	END TRY
	BEGIN CATCH
		SET @resultado		= 3
		SET @codigo_error	= ERROR_NUMBER()
		SET @mensaje_error	= ERROR_MESSAGE()
	END CATCH

	SELECT	@id_permisos_circulacion_envio	AS id,
			@resultado						AS resultado,
			@codigo_error					AS codigo_error,
			@mensaje_error					AS mensaje_error
  
  END
GO
