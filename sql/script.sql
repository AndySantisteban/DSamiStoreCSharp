USE [master]
GO
/****** Object:  Database [  dsamistore_almacen_sqlServer]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE DATABASE [  dsamistore_almacen_sqlServer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'  dsamistore_almacen_sqlServer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\  dsamistore_almacen_sqlServer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'  dsamistore_almacen_sqlServer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\  dsamistore_almacen_sqlServer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [  dsamistore_almacen_sqlServer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET ARITHABORT OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET  MULTI_USER 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET QUERY_STORE = OFF
GO
USE [  dsamistore_almacen_sqlServer]
GO
/****** Object:  Table [dbo].[almacen]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[almacen](
	[i_id_almacen] [nchar](36) NOT NULL,
	[i_id_almacen_detalle] [nchar](36) NULL,
	[v_nombre_almacen] [nvarchar](25) NULL,
	[i_estado_almacen] [int] NULL,
 CONSTRAINT [PK_almacen_i_id_almacen] PRIMARY KEY CLUSTERED 
(
	[i_id_almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[almacen_detalle]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[almacen_detalle](
	[i_id_almacen_detalle] [nchar](36) NOT NULL,
	[i_stock_almacen_detalle] [int] NULL,
 CONSTRAINT [PK_almacen_detalle_i_id_almacen_detalle] PRIMARY KEY CLUSTERED 
(
	[i_id_almacen_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria](
	[i_id_categoria] [nchar](36) NOT NULL,
	[v_nombre_categoria] [nvarchar](30) NULL,
	[v_descripcion_categoria] [nvarchar](45) NULL,
	[d_fecha_creacion] [datetime2](0) NULL,
	[i_estado_categoria] [int] NULL,
 CONSTRAINT [PK_categoria_i_id_categoria] PRIMARY KEY CLUSTERED 
(
	[i_id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[despacho]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[despacho](
	[i_id_despacho] [nchar](36) NOT NULL,
	[i_id_empleado_1] [nchar](36) NULL,
	[i_id_empleado_2] [nchar](36) NULL,
	[d_fecha_pedido_despacho] [datetime2](0) NULL,
	[d_fecha_respuesta_despacho] [datetime2](0) NULL,
	[i_estado_despacho] [int] NULL,
 CONSTRAINT [PK_despacho_i_id_despacho] PRIMARY KEY CLUSTERED 
(
	[i_id_despacho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[despacho_detalle]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[despacho_detalle](
	[i_id_despacho_detalle] [nchar](36) NOT NULL,
	[i_id_despacho] [nchar](36) NULL,
	[i_id_producto] [nchar](36) NULL,
	[i_id_moneda] [nchar](36) NULL,
	[d_cantidad_despacho_detalle] [int] NULL,
 CONSTRAINT [PK_despacho_detalle_i_id_despacho_detalle] PRIMARY KEY CLUSTERED 
(
	[i_id_despacho_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[distrito]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[distrito](
	[i_id_distrito] [nvarchar](6) NOT NULL,
	[v_nombre_distrito] [nvarchar](45) NULL,
	[i_id_provincia] [nvarchar](4) NULL,
	[i_id_region] [nvarchar](2) NULL,
 CONSTRAINT [PK_distrito_i_id_distrito] PRIMARY KEY CLUSTERED 
(
	[i_id_distrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[documento]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[documento](
	[i_id_documento] [nchar](36) NOT NULL,
	[i_id_tipo_documento] [nchar](36) NULL,
	[v_valor_documento] [nvarchar](12) NULL,
	[i_estado_documento] [int] NULL,
 CONSTRAINT [PK_documento_i_id_documento] PRIMARY KEY CLUSTERED 
(
	[i_id_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[email]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[email](
	[i_id_email] [nchar](36) NOT NULL,
	[v_direccion_email] [nvarchar](60) NOT NULL,
	[b_primario_email] [binary](1) NULL,
	[i_estado_email] [int] NULL,
 CONSTRAINT [PK_email_i_id_email] PRIMARY KEY CLUSTERED 
(
	[i_id_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[email_empresa]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[email_empresa](
	[i_id_email_empresa] [nchar](36) NOT NULL,
	[i_id_email] [nchar](36) NOT NULL,
	[i_id_empresa] [nchar](36) NOT NULL,
 CONSTRAINT [PK_email_empresa_i_id_email_empresa] PRIMARY KEY CLUSTERED 
(
	[i_id_email_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[email_persona]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[email_persona](
	[i_id_email_persona] [nchar](36) NOT NULL,
	[i_id_email] [nchar](36) NOT NULL,
	[i_id_persona] [nchar](36) NOT NULL,
 CONSTRAINT [PK_email_persona_i_id_email_persona] PRIMARY KEY CLUSTERED 
(
	[i_id_email_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empleado]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empleado](
	[i_id_empleado] [nchar](36) NOT NULL,
	[i_id_persona] [nchar](36) NULL,
	[d_fecha_creacion] [datetime2](0) NULL,
	[i_estado_empleado] [int] NULL,
 CONSTRAINT [PK_empleado_i_id_empleado] PRIMARY KEY CLUSTERED 
(
	[i_id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empresa]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresa](
	[i_id_empresa] [nchar](36) NOT NULL,
	[i_id_ubicacion] [nchar](36) NULL,
	[v_ruc_empresa] [nvarchar](17) NOT NULL,
	[v_razon_social_empresa] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_empresa_i_id_empresa] PRIMARY KEY CLUSTERED 
(
	[i_id_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[imagen]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[imagen](
	[i_id_imagen] [nchar](36) NOT NULL,
	[v_nombre_imagen] [nvarchar](25) NULL,
	[v_ruta_imagen] [nvarchar](45) NULL,
 CONSTRAINT [PK_imagen_i_id_imagen] PRIMARY KEY CLUSTERED 
(
	[i_id_imagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marca]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marca](
	[i_id_marca] [nchar](36) NOT NULL,
	[i_id_imagen] [nchar](36) NULL,
	[v_nombre_marca] [nvarchar](25) NULL,
	[i_estado_marca] [int] NULL,
 CONSTRAINT [PK_marca_i_id_marca] PRIMARY KEY CLUSTERED 
(
	[i_id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modulo]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modulo](
	[i_id_modulo] [nchar](36) NOT NULL,
	[v_nombre_modulo] [nvarchar](30) NULL,
 CONSTRAINT [PK_modulo_i_id_modulo] PRIMARY KEY CLUSTERED 
(
	[i_id_modulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[moneda]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[moneda](
	[i_id_moneda] [nchar](36) NOT NULL,
	[v_nombre_moneda] [nvarchar](30) NULL,
	[v_codigo_moneda] [nvarchar](10) NULL,
	[i_estado_moneda] [int] NULL,
 CONSTRAINT [PK_moneda_i_id_moneda] PRIMARY KEY CLUSTERED 
(
	[i_id_moneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operacion]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operacion](
	[i_id_operacion] [nchar](36) NOT NULL,
	[i_id_modulo] [nchar](36) NULL,
	[v_nombre_operacion] [nvarchar](60) NULL,
 CONSTRAINT [PK_operacion_i_id_operacion] PRIMARY KEY CLUSTERED 
(
	[i_id_operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operador_telefono]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operador_telefono](
	[i_id_operador_telefono] [nchar](36) NOT NULL,
	[v_nombre_operador] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_operador_telefono_i_id_operador_telefono] PRIMARY KEY CLUSTERED 
(
	[i_id_operador_telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pais]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pais](
	[i_id_pais] [nvarchar](2) NOT NULL,
	[v_nombre_pais] [nvarchar](30) NULL,
 CONSTRAINT [PK_pais_i_id_pais] PRIMARY KEY CLUSTERED 
(
	[i_id_pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[persona]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[persona](
	[i_id_persona] [nchar](36) NOT NULL,
	[i_id_documento] [nchar](36) NULL,
	[i_id_pais_origen] [nvarchar](2) NULL,
	[i_id_ubicacion] [nchar](36) NULL,
	[v_nombre_persona] [nvarchar](20) NULL,
	[v_apellido_paterno_persona] [nvarchar](15) NULL,
	[v_apellido_materno_persona] [nvarchar](15) NULL,
	[d_fecha_nacimiento_persona] [date] NULL,
	[i_estado_persona] [int] NULL,
 CONSTRAINT [PK_persona_i_id_persona] PRIMARY KEY CLUSTERED 
(
	[i_id_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[producto]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producto](
	[i_id_producto] [nchar](36) NOT NULL,
	[i_id_marca] [nchar](36) NOT NULL,
	[i_id_categoria] [nchar](36) NOT NULL,
	[i_id_imagen] [nchar](36) NULL,
	[i_id_almacen] [nchar](36) NOT NULL,
	[i_id_moneda] [nchar](36) NOT NULL,
	[v_nombre_producto] [nvarchar](100) NULL,
	[v_descripcion_producto] [nvarchar](100) NULL,
	[v_codigo_barras_producto] [nvarchar](13) NULL,
	[d_precio_referencia_producto] [decimal](8, 2) NULL,
	[d_fecha_creacion] [datetime2](0) NULL,
	[i_estado_producto] [int] NULL,
 CONSTRAINT [PK_producto_i_id_producto] PRIMARY KEY CLUSTERED 
(
	[i_id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedor]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedor](
	[i_id_proveedor] [nchar](36) NOT NULL,
	[i_id_persona] [nchar](36) NOT NULL,
	[i_id_empresa] [nchar](36) NOT NULL,
	[d_fecha_creacion] [datetime2](0) NULL,
	[i_estado_proveedor] [int] NULL,
 CONSTRAINT [PK_proveedor_i_id_proveedor] PRIMARY KEY CLUSTERED 
(
	[i_id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[provincia]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[provincia](
	[i_id_provincia] [nvarchar](4) NOT NULL,
	[v_nombre_provincia] [nvarchar](45) NULL,
	[i_id_region] [nvarchar](2) NULL,
 CONSTRAINT [PK_provincia_i_id_provincia] PRIMARY KEY CLUSTERED 
(
	[i_id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recepcion]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recepcion](
	[i_id_recepcion] [nchar](36) NOT NULL,
	[i_id_empleado] [nchar](36) NULL,
	[i_id_proveedor] [nchar](36) NULL,
	[d_fecha_pedido_recepcion] [datetime2](0) NULL,
	[d_fecha_respuesta_recepcion] [datetime2](0) NULL,
	[i_estado_recepcion] [int] NULL,
 CONSTRAINT [PK_recepcion_i_id_recepcion] PRIMARY KEY CLUSTERED 
(
	[i_id_recepcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recepcion_detalle]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recepcion_detalle](
	[i_id_recepcion_detalle] [nchar](36) NOT NULL,
	[i_id_recepcion] [nchar](36) NULL,
	[i_id_producto] [nchar](36) NOT NULL,
	[d_precio_producto_compra] [decimal](8, 2) NULL,
	[i_cantidad_recepcion_detalle] [int] NULL,
 CONSTRAINT [PK_recepcion_detalle_i_id_recepcion_detalle] PRIMARY KEY CLUSTERED 
(
	[i_id_recepcion_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[region]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[region](
	[i_id_region] [nvarchar](2) NOT NULL,
	[v_nombre_region] [nvarchar](45) NULL,
	[i_id_pais] [nvarchar](2) NULL,
 CONSTRAINT [PK_region_i_id_region] PRIMARY KEY CLUSTERED 
(
	[i_id_region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol](
	[i_id_rol] [nchar](36) NOT NULL,
	[v_nombre_rol] [nvarchar](30) NULL,
	[d_fecha_creacion] [datetime2](0) NULL,
	[i_estado_rol] [int] NULL,
 CONSTRAINT [PK_rol_i_id_rol] PRIMARY KEY CLUSTERED 
(
	[i_id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rol_operacion]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rol_operacion](
	[i_id_rol_operacion] [nchar](36) NOT NULL,
	[i_id_rol] [nchar](36) NULL,
	[i_id_operacion] [nchar](36) NULL,
 CONSTRAINT [PK_rol_operacion_i_id_rol_operacion] PRIMARY KEY CLUSTERED 
(
	[i_id_rol_operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefono]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefono](
	[i_id_telefono] [nchar](36) NOT NULL,
	[i_id_operador_telefono] [nchar](36) NULL,
	[v_numero_telefono] [nvarchar](20) NOT NULL,
	[v_codigo_pais_telefono] [nvarchar](5) NULL,
	[v_codigo_region_telefono] [nvarchar](5) NULL,
	[b_primario_telefono] [binary](1) NULL,
 CONSTRAINT [PK_telefono_i_id_telefono] PRIMARY KEY CLUSTERED 
(
	[i_id_telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefono_empresa]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefono_empresa](
	[i_id_telefono_empresa] [nchar](36) NOT NULL,
	[i_id_telefono] [nchar](36) NOT NULL,
	[i_id_empresa] [nchar](36) NOT NULL,
 CONSTRAINT [PK_telefono_empresa_i_id_telefono_empresa] PRIMARY KEY CLUSTERED 
(
	[i_id_telefono_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[telefono_persona]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[telefono_persona](
	[i_id_telefono_persona] [nchar](36) NOT NULL,
	[i_id_telefono] [nchar](36) NOT NULL,
	[i_id_persona] [nchar](36) NOT NULL,
 CONSTRAINT [PK_telefono_persona_i_id_telefono_persona] PRIMARY KEY CLUSTERED 
(
	[i_id_telefono_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_documento]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_documento](
	[i_id_tipo_documento] [nchar](36) NOT NULL,
	[v_nombre_tipo_documento] [nvarchar](30) NULL,
 CONSTRAINT [PK_tipo_documento_i_id_tipo_documento] PRIMARY KEY CLUSTERED 
(
	[i_id_tipo_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ubicacion]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ubicacion](
	[i_id_ubicacion] [nchar](36) NOT NULL,
	[i_id_distrito] [nvarchar](6) NULL,
	[v_direccion_ubicacion] [nvarchar](50) NOT NULL,
	[i_estado_ubicacion] [int] NULL,
 CONSTRAINT [PK_ubicacion_i_id_ubicacion] PRIMARY KEY CLUSTERED 
(
	[i_id_ubicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 18/10/2022 1:33:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[i_id_usuario] [nchar](36) NOT NULL,
	[i_id_empleado] [nchar](36) NOT NULL,
	[i_id_rol] [nchar](36) NOT NULL,
	[v_username_usuario] [nvarchar](45) NULL,
	[v_password_usuario] [nvarchar](60) NULL,
	[d_fecha_creacion] [datetime2](0) NULL,
	[i_estado_usuario] [int] NULL,
 CONSTRAINT [PK_usuario_i_id_usuario] PRIMARY KEY CLUSTERED 
(
	[i_id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_almacen_detalle]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_almacen_detalle] ON [dbo].[almacen]
(
	[i_id_almacen_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [despacho_empleado_1]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [despacho_empleado_1] ON [dbo].[despacho]
(
	[i_id_empleado_1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [despacho_empleado_2]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [despacho_empleado_2] ON [dbo].[despacho]
(
	[i_id_empleado_2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_despacho]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_despacho] ON [dbo].[despacho_detalle]
(
	[i_id_despacho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_moneda]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_moneda] ON [dbo].[despacho_detalle]
(
	[i_id_moneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_producto]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_producto] ON [dbo].[despacho_detalle]
(
	[i_id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_provincia]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_provincia] ON [dbo].[distrito]
(
	[i_id_provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_region]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_region] ON [dbo].[distrito]
(
	[i_id_region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_tipo_documento]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_tipo_documento] ON [dbo].[documento]
(
	[i_id_tipo_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_email]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_email] ON [dbo].[email_empresa]
(
	[i_id_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_empresa]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_empresa] ON [dbo].[email_empresa]
(
	[i_id_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_email]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_email] ON [dbo].[email_persona]
(
	[i_id_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_persona]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_persona] ON [dbo].[email_persona]
(
	[i_id_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_persona]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_persona] ON [dbo].[empleado]
(
	[i_id_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_ubicacion]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_ubicacion] ON [dbo].[empresa]
(
	[i_id_ubicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_imagen]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_imagen] ON [dbo].[marca]
(
	[i_id_imagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_modulo]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_modulo] ON [dbo].[operacion]
(
	[i_id_modulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_documento]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_documento] ON [dbo].[persona]
(
	[i_id_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_pais_origen]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_pais_origen] ON [dbo].[persona]
(
	[i_id_pais_origen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_ubicacion]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_ubicacion] ON [dbo].[persona]
(
	[i_id_ubicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_almacen]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_almacen] ON [dbo].[producto]
(
	[i_id_almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_categoria]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_categoria] ON [dbo].[producto]
(
	[i_id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_imagen]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_imagen] ON [dbo].[producto]
(
	[i_id_imagen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_marca]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_marca] ON [dbo].[producto]
(
	[i_id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_moneda]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_moneda] ON [dbo].[producto]
(
	[i_id_moneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_empresa]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_empresa] ON [dbo].[proveedor]
(
	[i_id_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_persona]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_persona] ON [dbo].[proveedor]
(
	[i_id_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_region]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_region] ON [dbo].[provincia]
(
	[i_id_region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_empleado]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_empleado] ON [dbo].[recepcion]
(
	[i_id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_proveedor]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_proveedor] ON [dbo].[recepcion]
(
	[i_id_proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_producto]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_producto] ON [dbo].[recepcion_detalle]
(
	[i_id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_recepcion]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_recepcion] ON [dbo].[recepcion_detalle]
(
	[i_id_recepcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_pais]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_pais] ON [dbo].[region]
(
	[i_id_pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_operacion]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_operacion] ON [dbo].[rol_operacion]
(
	[i_id_operacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_rol]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_rol] ON [dbo].[rol_operacion]
(
	[i_id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_operador_telefono]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_operador_telefono] ON [dbo].[telefono]
(
	[i_id_operador_telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_empresa]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_empresa] ON [dbo].[telefono_empresa]
(
	[i_id_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_telefono]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_telefono] ON [dbo].[telefono_empresa]
(
	[i_id_telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_persona]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_persona] ON [dbo].[telefono_persona]
(
	[i_id_persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_telefono]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_telefono] ON [dbo].[telefono_persona]
(
	[i_id_telefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_distrito]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_distrito] ON [dbo].[ubicacion]
(
	[i_id_distrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_empleado]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_empleado] ON [dbo].[usuario]
(
	[i_id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [i_id_rol]    Script Date: 18/10/2022 1:33:40 p. m. ******/
CREATE NONCLUSTERED INDEX [i_id_rol] ON [dbo].[usuario]
(
	[i_id_rol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[almacen] ADD  DEFAULT (NULL) FOR [i_id_almacen_detalle]
GO
ALTER TABLE [dbo].[almacen] ADD  DEFAULT (NULL) FOR [v_nombre_almacen]
GO
ALTER TABLE [dbo].[almacen] ADD  DEFAULT ((0)) FOR [i_estado_almacen]
GO
ALTER TABLE [dbo].[almacen_detalle] ADD  DEFAULT (NULL) FOR [i_stock_almacen_detalle]
GO
ALTER TABLE [dbo].[categoria] ADD  DEFAULT (NULL) FOR [v_nombre_categoria]
GO
ALTER TABLE [dbo].[categoria] ADD  DEFAULT (NULL) FOR [v_descripcion_categoria]
GO
ALTER TABLE [dbo].[categoria] ADD  DEFAULT (getdate()) FOR [d_fecha_creacion]
GO
ALTER TABLE [dbo].[categoria] ADD  DEFAULT ((0)) FOR [i_estado_categoria]
GO
ALTER TABLE [dbo].[despacho] ADD  DEFAULT (NULL) FOR [i_id_empleado_1]
GO
ALTER TABLE [dbo].[despacho] ADD  DEFAULT (NULL) FOR [i_id_empleado_2]
GO
ALTER TABLE [dbo].[despacho] ADD  DEFAULT (NULL) FOR [d_fecha_pedido_despacho]
GO
ALTER TABLE [dbo].[despacho] ADD  DEFAULT (NULL) FOR [d_fecha_respuesta_despacho]
GO
ALTER TABLE [dbo].[despacho] ADD  DEFAULT ((0)) FOR [i_estado_despacho]
GO
ALTER TABLE [dbo].[despacho_detalle] ADD  DEFAULT (NULL) FOR [i_id_despacho]
GO
ALTER TABLE [dbo].[despacho_detalle] ADD  DEFAULT (NULL) FOR [i_id_producto]
GO
ALTER TABLE [dbo].[despacho_detalle] ADD  DEFAULT (NULL) FOR [i_id_moneda]
GO
ALTER TABLE [dbo].[despacho_detalle] ADD  DEFAULT (NULL) FOR [d_cantidad_despacho_detalle]
GO
ALTER TABLE [dbo].[distrito] ADD  DEFAULT (NULL) FOR [v_nombre_distrito]
GO
ALTER TABLE [dbo].[distrito] ADD  DEFAULT (NULL) FOR [i_id_provincia]
GO
ALTER TABLE [dbo].[distrito] ADD  DEFAULT (NULL) FOR [i_id_region]
GO
ALTER TABLE [dbo].[documento] ADD  DEFAULT (NULL) FOR [i_id_tipo_documento]
GO
ALTER TABLE [dbo].[documento] ADD  DEFAULT (NULL) FOR [v_valor_documento]
GO
ALTER TABLE [dbo].[documento] ADD  DEFAULT ((0)) FOR [i_estado_documento]
GO
ALTER TABLE [dbo].[email] ADD  DEFAULT (NULL) FOR [b_primario_email]
GO
ALTER TABLE [dbo].[email] ADD  DEFAULT ((0)) FOR [i_estado_email]
GO
ALTER TABLE [dbo].[empleado] ADD  DEFAULT (NULL) FOR [i_id_persona]
GO
ALTER TABLE [dbo].[empleado] ADD  DEFAULT (getdate()) FOR [d_fecha_creacion]
GO
ALTER TABLE [dbo].[empleado] ADD  DEFAULT ((0)) FOR [i_estado_empleado]
GO
ALTER TABLE [dbo].[empresa] ADD  DEFAULT (NULL) FOR [i_id_ubicacion]
GO
ALTER TABLE [dbo].[imagen] ADD  DEFAULT (NULL) FOR [v_nombre_imagen]
GO
ALTER TABLE [dbo].[imagen] ADD  DEFAULT (NULL) FOR [v_ruta_imagen]
GO
ALTER TABLE [dbo].[marca] ADD  DEFAULT (NULL) FOR [i_id_imagen]
GO
ALTER TABLE [dbo].[marca] ADD  DEFAULT (NULL) FOR [v_nombre_marca]
GO
ALTER TABLE [dbo].[marca] ADD  DEFAULT ((0)) FOR [i_estado_marca]
GO
ALTER TABLE [dbo].[modulo] ADD  DEFAULT (NULL) FOR [v_nombre_modulo]
GO
ALTER TABLE [dbo].[moneda] ADD  DEFAULT (NULL) FOR [v_nombre_moneda]
GO
ALTER TABLE [dbo].[moneda] ADD  DEFAULT (NULL) FOR [v_codigo_moneda]
GO
ALTER TABLE [dbo].[moneda] ADD  DEFAULT ((0)) FOR [i_estado_moneda]
GO
ALTER TABLE [dbo].[operacion] ADD  DEFAULT (NULL) FOR [i_id_modulo]
GO
ALTER TABLE [dbo].[operacion] ADD  DEFAULT (NULL) FOR [v_nombre_operacion]
GO
ALTER TABLE [dbo].[pais] ADD  DEFAULT (NULL) FOR [v_nombre_pais]
GO
ALTER TABLE [dbo].[persona] ADD  DEFAULT (NULL) FOR [i_id_documento]
GO
ALTER TABLE [dbo].[persona] ADD  DEFAULT (NULL) FOR [i_id_pais_origen]
GO
ALTER TABLE [dbo].[persona] ADD  DEFAULT (NULL) FOR [i_id_ubicacion]
GO
ALTER TABLE [dbo].[persona] ADD  DEFAULT (NULL) FOR [v_nombre_persona]
GO
ALTER TABLE [dbo].[persona] ADD  DEFAULT (NULL) FOR [v_apellido_paterno_persona]
GO
ALTER TABLE [dbo].[persona] ADD  DEFAULT (NULL) FOR [v_apellido_materno_persona]
GO
ALTER TABLE [dbo].[persona] ADD  DEFAULT (NULL) FOR [d_fecha_nacimiento_persona]
GO
ALTER TABLE [dbo].[persona] ADD  DEFAULT ((0)) FOR [i_estado_persona]
GO
ALTER TABLE [dbo].[producto] ADD  DEFAULT (NULL) FOR [i_id_imagen]
GO
ALTER TABLE [dbo].[producto] ADD  DEFAULT (NULL) FOR [v_nombre_producto]
GO
ALTER TABLE [dbo].[producto] ADD  DEFAULT (NULL) FOR [v_descripcion_producto]
GO
ALTER TABLE [dbo].[producto] ADD  DEFAULT (NULL) FOR [v_codigo_barras_producto]
GO
ALTER TABLE [dbo].[producto] ADD  DEFAULT (NULL) FOR [d_precio_referencia_producto]
GO
ALTER TABLE [dbo].[producto] ADD  DEFAULT (getdate()) FOR [d_fecha_creacion]
GO
ALTER TABLE [dbo].[producto] ADD  DEFAULT ((0)) FOR [i_estado_producto]
GO
ALTER TABLE [dbo].[proveedor] ADD  DEFAULT (getdate()) FOR [d_fecha_creacion]
GO
ALTER TABLE [dbo].[proveedor] ADD  DEFAULT ((0)) FOR [i_estado_proveedor]
GO
ALTER TABLE [dbo].[provincia] ADD  DEFAULT (NULL) FOR [v_nombre_provincia]
GO
ALTER TABLE [dbo].[provincia] ADD  DEFAULT (NULL) FOR [i_id_region]
GO
ALTER TABLE [dbo].[recepcion] ADD  DEFAULT (NULL) FOR [i_id_empleado]
GO
ALTER TABLE [dbo].[recepcion] ADD  DEFAULT (NULL) FOR [i_id_proveedor]
GO
ALTER TABLE [dbo].[recepcion] ADD  DEFAULT (NULL) FOR [d_fecha_pedido_recepcion]
GO
ALTER TABLE [dbo].[recepcion] ADD  DEFAULT (NULL) FOR [d_fecha_respuesta_recepcion]
GO
ALTER TABLE [dbo].[recepcion] ADD  DEFAULT ((0)) FOR [i_estado_recepcion]
GO
ALTER TABLE [dbo].[recepcion_detalle] ADD  DEFAULT (NULL) FOR [i_id_recepcion]
GO
ALTER TABLE [dbo].[recepcion_detalle] ADD  DEFAULT (NULL) FOR [d_precio_producto_compra]
GO
ALTER TABLE [dbo].[recepcion_detalle] ADD  DEFAULT (NULL) FOR [i_cantidad_recepcion_detalle]
GO
ALTER TABLE [dbo].[region] ADD  DEFAULT (NULL) FOR [v_nombre_region]
GO
ALTER TABLE [dbo].[region] ADD  DEFAULT (N'01') FOR [i_id_pais]
GO
ALTER TABLE [dbo].[rol] ADD  DEFAULT (NULL) FOR [v_nombre_rol]
GO
ALTER TABLE [dbo].[rol] ADD  DEFAULT (getdate()) FOR [d_fecha_creacion]
GO
ALTER TABLE [dbo].[rol] ADD  DEFAULT ((0)) FOR [i_estado_rol]
GO
ALTER TABLE [dbo].[rol_operacion] ADD  DEFAULT (NULL) FOR [i_id_rol]
GO
ALTER TABLE [dbo].[rol_operacion] ADD  DEFAULT (NULL) FOR [i_id_operacion]
GO
ALTER TABLE [dbo].[telefono] ADD  DEFAULT (NULL) FOR [i_id_operador_telefono]
GO
ALTER TABLE [dbo].[telefono] ADD  DEFAULT (NULL) FOR [v_codigo_pais_telefono]
GO
ALTER TABLE [dbo].[telefono] ADD  DEFAULT (NULL) FOR [v_codigo_region_telefono]
GO
ALTER TABLE [dbo].[telefono] ADD  DEFAULT (NULL) FOR [b_primario_telefono]
GO
ALTER TABLE [dbo].[tipo_documento] ADD  DEFAULT (NULL) FOR [v_nombre_tipo_documento]
GO
ALTER TABLE [dbo].[ubicacion] ADD  DEFAULT (NULL) FOR [i_id_distrito]
GO
ALTER TABLE [dbo].[ubicacion] ADD  DEFAULT ((0)) FOR [i_estado_ubicacion]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT (NULL) FOR [v_username_usuario]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT (NULL) FOR [v_password_usuario]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT (getdate()) FOR [d_fecha_creacion]
GO
ALTER TABLE [dbo].[usuario] ADD  DEFAULT ((0)) FOR [i_estado_usuario]
GO
ALTER TABLE [dbo].[almacen]  WITH NOCHECK ADD  CONSTRAINT [almacen$almacen_ibfk_1] FOREIGN KEY([i_id_almacen_detalle])
REFERENCES [dbo].[almacen_detalle] ([i_id_almacen_detalle])
GO
ALTER TABLE [dbo].[almacen] CHECK CONSTRAINT [almacen$almacen_ibfk_1]
GO
ALTER TABLE [dbo].[despacho]  WITH NOCHECK ADD  CONSTRAINT [despacho$despacho_empleado_1] FOREIGN KEY([i_id_empleado_1])
REFERENCES [dbo].[empleado] ([i_id_empleado])
GO
ALTER TABLE [dbo].[despacho] CHECK CONSTRAINT [despacho$despacho_empleado_1]
GO
ALTER TABLE [dbo].[despacho]  WITH NOCHECK ADD  CONSTRAINT [despacho$despacho_empleado_2] FOREIGN KEY([i_id_empleado_2])
REFERENCES [dbo].[empleado] ([i_id_empleado])
GO
ALTER TABLE [dbo].[despacho] CHECK CONSTRAINT [despacho$despacho_empleado_2]
GO
ALTER TABLE [dbo].[despacho_detalle]  WITH NOCHECK ADD  CONSTRAINT [despacho_detalle$despacho_detalle_ibfk_1] FOREIGN KEY([i_id_despacho])
REFERENCES [dbo].[despacho] ([i_id_despacho])
GO
ALTER TABLE [dbo].[despacho_detalle] CHECK CONSTRAINT [despacho_detalle$despacho_detalle_ibfk_1]
GO
ALTER TABLE [dbo].[despacho_detalle]  WITH NOCHECK ADD  CONSTRAINT [despacho_detalle$despacho_detalle_ibfk_2] FOREIGN KEY([i_id_producto])
REFERENCES [dbo].[producto] ([i_id_producto])
GO
ALTER TABLE [dbo].[despacho_detalle] CHECK CONSTRAINT [despacho_detalle$despacho_detalle_ibfk_2]
GO
ALTER TABLE [dbo].[despacho_detalle]  WITH NOCHECK ADD  CONSTRAINT [despacho_detalle$despacho_detalle_ibfk_3] FOREIGN KEY([i_id_moneda])
REFERENCES [dbo].[moneda] ([i_id_moneda])
GO
ALTER TABLE [dbo].[despacho_detalle] CHECK CONSTRAINT [despacho_detalle$despacho_detalle_ibfk_3]
GO
ALTER TABLE [dbo].[distrito]  WITH NOCHECK ADD  CONSTRAINT [distrito$distrito_ibfk_1] FOREIGN KEY([i_id_provincia])
REFERENCES [dbo].[provincia] ([i_id_provincia])
GO
ALTER TABLE [dbo].[distrito] CHECK CONSTRAINT [distrito$distrito_ibfk_1]
GO
ALTER TABLE [dbo].[distrito]  WITH NOCHECK ADD  CONSTRAINT [distrito$distrito_ibfk_2] FOREIGN KEY([i_id_region])
REFERENCES [dbo].[region] ([i_id_region])
GO
ALTER TABLE [dbo].[distrito] CHECK CONSTRAINT [distrito$distrito_ibfk_2]
GO
ALTER TABLE [dbo].[documento]  WITH NOCHECK ADD  CONSTRAINT [documento$documento_ibfk_1] FOREIGN KEY([i_id_tipo_documento])
REFERENCES [dbo].[tipo_documento] ([i_id_tipo_documento])
GO
ALTER TABLE [dbo].[documento] CHECK CONSTRAINT [documento$documento_ibfk_1]
GO
ALTER TABLE [dbo].[email_empresa]  WITH NOCHECK ADD  CONSTRAINT [email_empresa$email_empresa_ibfk_1] FOREIGN KEY([i_id_email])
REFERENCES [dbo].[email] ([i_id_email])
GO
ALTER TABLE [dbo].[email_empresa] CHECK CONSTRAINT [email_empresa$email_empresa_ibfk_1]
GO
ALTER TABLE [dbo].[email_empresa]  WITH NOCHECK ADD  CONSTRAINT [email_empresa$email_empresa_ibfk_2] FOREIGN KEY([i_id_empresa])
REFERENCES [dbo].[empresa] ([i_id_empresa])
GO
ALTER TABLE [dbo].[email_empresa] CHECK CONSTRAINT [email_empresa$email_empresa_ibfk_2]
GO
ALTER TABLE [dbo].[email_persona]  WITH NOCHECK ADD  CONSTRAINT [email_persona$email_persona_ibfk_1] FOREIGN KEY([i_id_email])
REFERENCES [dbo].[email] ([i_id_email])
GO
ALTER TABLE [dbo].[email_persona] CHECK CONSTRAINT [email_persona$email_persona_ibfk_1]
GO
ALTER TABLE [dbo].[email_persona]  WITH NOCHECK ADD  CONSTRAINT [email_persona$email_persona_ibfk_2] FOREIGN KEY([i_id_persona])
REFERENCES [dbo].[persona] ([i_id_persona])
GO
ALTER TABLE [dbo].[email_persona] CHECK CONSTRAINT [email_persona$email_persona_ibfk_2]
GO
ALTER TABLE [dbo].[empleado]  WITH NOCHECK ADD  CONSTRAINT [empleado$empleado_ibfk_1] FOREIGN KEY([i_id_persona])
REFERENCES [dbo].[persona] ([i_id_persona])
GO
ALTER TABLE [dbo].[empleado] CHECK CONSTRAINT [empleado$empleado_ibfk_1]
GO
ALTER TABLE [dbo].[empresa]  WITH NOCHECK ADD  CONSTRAINT [empresa$empresa_ibfk_1] FOREIGN KEY([i_id_ubicacion])
REFERENCES [dbo].[ubicacion] ([i_id_ubicacion])
GO
ALTER TABLE [dbo].[empresa] CHECK CONSTRAINT [empresa$empresa_ibfk_1]
GO
ALTER TABLE [dbo].[marca]  WITH NOCHECK ADD  CONSTRAINT [marca$marca_ibfk_1] FOREIGN KEY([i_id_imagen])
REFERENCES [dbo].[imagen] ([i_id_imagen])
GO
ALTER TABLE [dbo].[marca] CHECK CONSTRAINT [marca$marca_ibfk_1]
GO
ALTER TABLE [dbo].[operacion]  WITH NOCHECK ADD  CONSTRAINT [operacion$operacion_ibfk_1] FOREIGN KEY([i_id_modulo])
REFERENCES [dbo].[modulo] ([i_id_modulo])
GO
ALTER TABLE [dbo].[operacion] CHECK CONSTRAINT [operacion$operacion_ibfk_1]
GO
ALTER TABLE [dbo].[persona]  WITH NOCHECK ADD  CONSTRAINT [persona$persona_ibfk_1] FOREIGN KEY([i_id_documento])
REFERENCES [dbo].[documento] ([i_id_documento])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [persona$persona_ibfk_1]
GO
ALTER TABLE [dbo].[persona]  WITH NOCHECK ADD  CONSTRAINT [persona$persona_ibfk_2] FOREIGN KEY([i_id_pais_origen])
REFERENCES [dbo].[pais] ([i_id_pais])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [persona$persona_ibfk_2]
GO
ALTER TABLE [dbo].[persona]  WITH NOCHECK ADD  CONSTRAINT [persona$persona_ibfk_3] FOREIGN KEY([i_id_ubicacion])
REFERENCES [dbo].[ubicacion] ([i_id_ubicacion])
GO
ALTER TABLE [dbo].[persona] CHECK CONSTRAINT [persona$persona_ibfk_3]
GO
ALTER TABLE [dbo].[producto]  WITH NOCHECK ADD  CONSTRAINT [producto$producto_ibfk_1] FOREIGN KEY([i_id_marca])
REFERENCES [dbo].[marca] ([i_id_marca])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [producto$producto_ibfk_1]
GO
ALTER TABLE [dbo].[producto]  WITH NOCHECK ADD  CONSTRAINT [producto$producto_ibfk_2] FOREIGN KEY([i_id_categoria])
REFERENCES [dbo].[categoria] ([i_id_categoria])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [producto$producto_ibfk_2]
GO
ALTER TABLE [dbo].[producto]  WITH NOCHECK ADD  CONSTRAINT [producto$producto_ibfk_3] FOREIGN KEY([i_id_imagen])
REFERENCES [dbo].[imagen] ([i_id_imagen])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [producto$producto_ibfk_3]
GO
ALTER TABLE [dbo].[producto]  WITH NOCHECK ADD  CONSTRAINT [producto$producto_ibfk_4] FOREIGN KEY([i_id_almacen])
REFERENCES [dbo].[almacen] ([i_id_almacen])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [producto$producto_ibfk_4]
GO
ALTER TABLE [dbo].[producto]  WITH NOCHECK ADD  CONSTRAINT [producto$producto_ibfk_5] FOREIGN KEY([i_id_moneda])
REFERENCES [dbo].[moneda] ([i_id_moneda])
GO
ALTER TABLE [dbo].[producto] CHECK CONSTRAINT [producto$producto_ibfk_5]
GO
ALTER TABLE [dbo].[proveedor]  WITH NOCHECK ADD  CONSTRAINT [proveedor$proveedor_ibfk_1] FOREIGN KEY([i_id_persona])
REFERENCES [dbo].[persona] ([i_id_persona])
GO
ALTER TABLE [dbo].[proveedor] CHECK CONSTRAINT [proveedor$proveedor_ibfk_1]
GO
ALTER TABLE [dbo].[proveedor]  WITH NOCHECK ADD  CONSTRAINT [proveedor$proveedor_ibfk_2] FOREIGN KEY([i_id_empresa])
REFERENCES [dbo].[empresa] ([i_id_empresa])
GO
ALTER TABLE [dbo].[proveedor] CHECK CONSTRAINT [proveedor$proveedor_ibfk_2]
GO
ALTER TABLE [dbo].[provincia]  WITH NOCHECK ADD  CONSTRAINT [provincia$provincia_ibfk_1] FOREIGN KEY([i_id_region])
REFERENCES [dbo].[region] ([i_id_region])
GO
ALTER TABLE [dbo].[provincia] CHECK CONSTRAINT [provincia$provincia_ibfk_1]
GO
ALTER TABLE [dbo].[recepcion]  WITH NOCHECK ADD  CONSTRAINT [recepcion$recepcion_ibfk_1] FOREIGN KEY([i_id_empleado])
REFERENCES [dbo].[empleado] ([i_id_empleado])
GO
ALTER TABLE [dbo].[recepcion] CHECK CONSTRAINT [recepcion$recepcion_ibfk_1]
GO
ALTER TABLE [dbo].[recepcion]  WITH NOCHECK ADD  CONSTRAINT [recepcion$recepcion_ibfk_2] FOREIGN KEY([i_id_proveedor])
REFERENCES [dbo].[proveedor] ([i_id_proveedor])
GO
ALTER TABLE [dbo].[recepcion] CHECK CONSTRAINT [recepcion$recepcion_ibfk_2]
GO
ALTER TABLE [dbo].[recepcion_detalle]  WITH NOCHECK ADD  CONSTRAINT [recepcion_detalle$recepcion_detalle_ibfk_1] FOREIGN KEY([i_id_recepcion])
REFERENCES [dbo].[recepcion] ([i_id_recepcion])
GO
ALTER TABLE [dbo].[recepcion_detalle] CHECK CONSTRAINT [recepcion_detalle$recepcion_detalle_ibfk_1]
GO
ALTER TABLE [dbo].[recepcion_detalle]  WITH NOCHECK ADD  CONSTRAINT [recepcion_detalle$recepcion_detalle_ibfk_2] FOREIGN KEY([i_id_producto])
REFERENCES [dbo].[producto] ([i_id_producto])
GO
ALTER TABLE [dbo].[recepcion_detalle] CHECK CONSTRAINT [recepcion_detalle$recepcion_detalle_ibfk_2]
GO
ALTER TABLE [dbo].[region]  WITH NOCHECK ADD  CONSTRAINT [region$region_ibfk_1] FOREIGN KEY([i_id_pais])
REFERENCES [dbo].[pais] ([i_id_pais])
GO
ALTER TABLE [dbo].[region] CHECK CONSTRAINT [region$region_ibfk_1]
GO
ALTER TABLE [dbo].[rol_operacion]  WITH NOCHECK ADD  CONSTRAINT [rol_operacion$rol_operacion_ibfk_1] FOREIGN KEY([i_id_rol])
REFERENCES [dbo].[rol] ([i_id_rol])
GO
ALTER TABLE [dbo].[rol_operacion] CHECK CONSTRAINT [rol_operacion$rol_operacion_ibfk_1]
GO
ALTER TABLE [dbo].[rol_operacion]  WITH NOCHECK ADD  CONSTRAINT [rol_operacion$rol_operacion_ibfk_2] FOREIGN KEY([i_id_operacion])
REFERENCES [dbo].[operacion] ([i_id_operacion])
GO
ALTER TABLE [dbo].[rol_operacion] CHECK CONSTRAINT [rol_operacion$rol_operacion_ibfk_2]
GO
ALTER TABLE [dbo].[telefono]  WITH NOCHECK ADD  CONSTRAINT [telefono$telefono_ibfk_1] FOREIGN KEY([i_id_operador_telefono])
REFERENCES [dbo].[operador_telefono] ([i_id_operador_telefono])
GO
ALTER TABLE [dbo].[telefono] CHECK CONSTRAINT [telefono$telefono_ibfk_1]
GO
ALTER TABLE [dbo].[telefono_empresa]  WITH NOCHECK ADD  CONSTRAINT [telefono_empresa$telefono_empresa_ibfk_1] FOREIGN KEY([i_id_telefono])
REFERENCES [dbo].[telefono] ([i_id_telefono])
GO
ALTER TABLE [dbo].[telefono_empresa] CHECK CONSTRAINT [telefono_empresa$telefono_empresa_ibfk_1]
GO
ALTER TABLE [dbo].[telefono_empresa]  WITH NOCHECK ADD  CONSTRAINT [telefono_empresa$telefono_empresa_ibfk_2] FOREIGN KEY([i_id_empresa])
REFERENCES [dbo].[empresa] ([i_id_empresa])
GO
ALTER TABLE [dbo].[telefono_empresa] CHECK CONSTRAINT [telefono_empresa$telefono_empresa_ibfk_2]
GO
ALTER TABLE [dbo].[telefono_persona]  WITH NOCHECK ADD  CONSTRAINT [telefono_persona$telefono_persona_ibfk_1] FOREIGN KEY([i_id_telefono])
REFERENCES [dbo].[telefono] ([i_id_telefono])
GO
ALTER TABLE [dbo].[telefono_persona] CHECK CONSTRAINT [telefono_persona$telefono_persona_ibfk_1]
GO
ALTER TABLE [dbo].[telefono_persona]  WITH NOCHECK ADD  CONSTRAINT [telefono_persona$telefono_persona_ibfk_2] FOREIGN KEY([i_id_persona])
REFERENCES [dbo].[persona] ([i_id_persona])
GO
ALTER TABLE [dbo].[telefono_persona] CHECK CONSTRAINT [telefono_persona$telefono_persona_ibfk_2]
GO
ALTER TABLE [dbo].[ubicacion]  WITH NOCHECK ADD  CONSTRAINT [ubicacion$ubicacion_ibfk_1] FOREIGN KEY([i_id_distrito])
REFERENCES [dbo].[distrito] ([i_id_distrito])
GO
ALTER TABLE [dbo].[ubicacion] CHECK CONSTRAINT [ubicacion$ubicacion_ibfk_1]
GO
ALTER TABLE [dbo].[usuario]  WITH NOCHECK ADD  CONSTRAINT [usuario$usuario_ibfk_1] FOREIGN KEY([i_id_empleado])
REFERENCES [dbo].[empleado] ([i_id_empleado])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [usuario$usuario_ibfk_1]
GO
ALTER TABLE [dbo].[usuario]  WITH NOCHECK ADD  CONSTRAINT [usuario$usuario_ibfk_2] FOREIGN KEY([i_id_rol])
REFERENCES [dbo].[rol] ([i_id_rol])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [usuario$usuario_ibfk_2]
GO
/****** Object:  StoredProcedure [dbo].[sp_almacen_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_almacen_listar]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT AL.i_id_almacen, AL.v_nombre_almacen
      FROM dbo.almacen  AS AL

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_categoria_actualizar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_categoria_actualizar]  
   @in_i_id_categoria nchar(36),
   @in_v_nombre_categoria nvarchar(30),
   @in_v_descripcion_categoria nvarchar(45)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      UPDATE dbo.categoria
         SET 
            v_nombre_categoria = @in_v_nombre_categoria, 
            v_descripcion_categoria = @in_v_descripcion_categoria
      WHERE categoria.i_id_categoria = @in_i_id_categoria

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_categoria_buscar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_categoria_buscar]  
   @in_v_nombre nvarchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         categoria.i_id_categoria, 
         categoria.v_nombre_categoria, 
         categoria.v_descripcion_categoria, 
         categoria.d_fecha_creacion, 
         categoria.i_estado_categoria
      FROM dbo.categoria
      WHERE categoria.i_estado_categoria = 0 AND (categoria.i_id_categoria LIKE @in_v_nombre + N'%' OR categoria.v_nombre_categoria LIKE @in_v_nombre + N'%')

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_categoria_buscar_id]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_categoria_buscar_id]  
   @in_i_id_categoria nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         categoria.i_id_categoria, 
         categoria.v_nombre_categoria, 
         categoria.v_descripcion_categoria, 
         categoria.d_fecha_creacion, 
         categoria.i_estado_categoria
      FROM dbo.categoria
      WHERE categoria.i_estado_categoria = 0 AND categoria.i_id_categoria LIKE @in_i_id_categoria + N'%'

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_categoria_buscar_nombre]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_categoria_buscar_nombre]  
   @in_v_nombre nvarchar(30)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         categoria.i_id_categoria, 
         categoria.v_nombre_categoria, 
         categoria.v_descripcion_categoria, 
         categoria.d_fecha_creacion, 
         categoria.i_estado_categoria
      FROM dbo.categoria
      WHERE categoria.i_estado_categoria = 0 AND categoria.v_nombre_categoria LIKE @in_v_nombre + N'%'

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_categoria_crear]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_categoria_crear]  
   @in_v_nombre_categoria nvarchar(30),
   @in_v_descripcion_categoria nvarchar(45)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @var_i_id_categoria nchar(36)

      SET @var_i_id_categoria = newid()

      INSERT dbo.categoria(i_id_categoria, v_nombre_categoria, v_descripcion_categoria)
         VALUES (@var_i_id_categoria, @in_v_nombre_categoria, @in_v_descripcion_categoria)

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_categoria_eliminar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_categoria_eliminar]  
   @in_i_id_categoria nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         c.i_id_categoria, 
         c.v_nombre_categoria, 
         c.v_descripcion_categoria, 
         c.d_fecha_creacion, 
         c.i_estado_categoria
      FROM dbo.categoria  AS c
      WHERE c.i_id_categoria = @in_i_id_categoria

      UPDATE dbo.categoria
         SET 
            i_estado_categoria = 1
      WHERE categoria.i_id_categoria = @in_i_id_categoria

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_categoria_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_categoria_listar]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         categoria.i_id_categoria, 
         categoria.v_nombre_categoria, 
         categoria.v_descripcion_categoria, 
         categoria.d_fecha_creacion, 
         categoria.i_estado_categoria
      FROM dbo.categoria
      WHERE categoria.i_estado_categoria = 0

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_categoria_listar_paginacion]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_categoria_listar_paginacion]  
   @in_v_valor nvarchar(36),
   @in_pagina int,
   @in_tamanio_pagina int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @num_filas int

      DECLARE
         @total_pagina int

      DECLARE
         @empezar_desde int

      SELECT @num_filas = count_big(*)
      FROM dbo.categoria
      WHERE categoria.i_estado_categoria = 0

      SET @empezar_desde = (@in_pagina - 1) * @in_tamanio_pagina

      SELECT 
         C.i_id_categoria, 
         C.v_nombre_categoria, 
         C.v_descripcion_categoria, 
         C.d_fecha_creacion, 
         C.i_estado_categoria
      FROM dbo.categoria  AS C
      WHERE C.i_estado_categoria = 0 AND (C.i_id_categoria LIKE @in_v_valor + N'%' OR C.v_nombre_categoria LIKE @in_v_valor + N'%')
         ORDER BY C.d_fecha_creacion ASC
         OFFSET @empezar_desde ROWS
         FETCH NEXT @in_tamanio_pagina ROWS ONLY

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_categoria_listar_paginacion_count]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_categoria_listar_paginacion_count]  
   @in_v_valor nvarchar(36),
   @in_tamanio_pagina int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @num_filas int

      DECLARE
         @total_pagina int

      SELECT @num_filas = count_big(*)
      FROM dbo.categoria
      WHERE categoria.i_estado_categoria = 0 AND (categoria.i_id_categoria LIKE @in_v_valor + N'%' OR categoria.v_nombre_categoria LIKE @in_v_valor + N'%')

      SET @total_pagina = ceiling(@num_filas * 1.0 / NULLIF(@in_tamanio_pagina, 0))

      SELECT @total_pagina

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_distrito_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_distrito_listar]  
   @in_i_id_provincia nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT distrito.i_id_distrito, distrito.v_nombre_distrito, distrito.i_id_provincia, distrito.i_id_region
      FROM dbo.distrito
      WHERE distrito.i_id_provincia = @in_i_id_provincia

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_email_eliminar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_email_eliminar]  
   @in_i_id_email nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @var_b_primario_email binary(1)

      SELECT @var_b_primario_email = email.b_primario_email
      FROM dbo.email
      WHERE email.i_id_email = @in_i_id_email

      IF CAST(@var_b_primario_email AS bigint) = 0
         UPDATE dbo.email
            SET 
               i_estado_email = 1
         WHERE email.i_id_email = @in_i_id_email

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_empleado_agregar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_empleado_agregar]  
   @in_v_direccion_ubicacion nvarchar(45),
   @in_i_id_distrito nvarchar(6),
   @in_v_valor_documento nvarchar(45),
   @in_i_id_tipo_documento nchar(36),
   @in_v_nombre_persona nvarchar(45),
   @in_v_apellido_paterno_persona nvarchar(45),
   @in_v_apellido_materno_persona nvarchar(45),
   @in_d_fecha_nacimiento_persona date,
   @in_i_id_pais_origen nvarchar(2)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @var_i_id_ubicacion nchar(36)

      DECLARE
         @var_i_id_documento nchar(36)

      DECLARE
         @var_i_id_persona nchar(36)

      DECLARE
         @var_i_id_empleado nchar(36)

      SET @var_i_id_ubicacion = newid()

      SET @var_i_id_documento = newid()

      SET @var_i_id_persona = newid()

      SET @var_i_id_empleado = newid()

      INSERT dbo.ubicacion(i_id_ubicacion, v_direccion_ubicacion, i_id_distrito)
         VALUES (@var_i_id_ubicacion, @in_v_direccion_ubicacion, @in_i_id_distrito)

      INSERT dbo.documento(i_id_documento, v_valor_documento, i_id_tipo_documento)
         VALUES (@var_i_id_documento, @in_v_valor_documento, @in_i_id_tipo_documento)

      INSERT dbo.persona(
         i_id_persona, 
         v_nombre_persona, 
         v_apellido_paterno_persona, 
         v_apellido_materno_persona, 
         i_id_documento, 
         d_fecha_nacimiento_persona, 
         i_id_pais_origen, 
         i_id_ubicacion)
         VALUES (
            @var_i_id_persona, 
            @in_v_nombre_persona, 
            @in_v_apellido_paterno_persona, 
            @in_v_apellido_materno_persona, 
            @var_i_id_documento, 
            @in_d_fecha_nacimiento_persona, 
            @in_i_id_pais_origen, 
            @var_i_id_ubicacion)

      INSERT dbo.empleado(i_id_empleado, i_id_persona)
         VALUES (@var_i_id_empleado, @var_i_id_persona)

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_empleado_buscar_id]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_empleado_buscar_id]  
   @in_i_id_empleado nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         empleado.i_id_empleado, 
         empleado.i_id_persona, 
         empleado.d_fecha_creacion, 
         empleado.i_estado_empleado, 
         persona.i_id_persona, 
         persona.i_id_documento, 
         persona.i_id_pais_origen, 
         persona.i_id_ubicacion, 
         persona.v_nombre_persona, 
         persona.v_apellido_paterno_persona, 
         persona.v_apellido_materno_persona, 
         persona.d_fecha_nacimiento_persona, 
         persona.i_estado_persona, 
         pais.i_id_pais, 
         pais.v_nombre_pais, 
         ubicacion.i_id_ubicacion, 
         ubicacion.i_id_distrito, 
         ubicacion.v_direccion_ubicacion, 
         ubicacion.i_estado_ubicacion, 
         documento.i_id_documento, 
         documento.i_id_tipo_documento, 
         documento.v_valor_documento, 
         documento.i_estado_documento
      FROM 
         dbo.empleado 
            INNER JOIN dbo.persona 
            ON empleado.i_id_persona = persona.i_id_persona 
            INNER JOIN dbo.pais 
            ON pais.i_id_pais = persona.i_id_pais_origen 
            INNER JOIN dbo.ubicacion 
            ON ubicacion.i_id_ubicacion = persona.i_id_ubicacion 
            INNER JOIN dbo.documento 
            ON documento.i_id_documento = persona.i_id_documento
      WHERE empleado.i_estado_empleado = 0 AND empleado.i_id_empleado LIKE @in_i_id_empleado + N'%'

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_empleado_buscar_nombre]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_empleado_buscar_nombre]  
   @in_nombre nvarchar(20)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         empleado.i_id_empleado, 
         empleado.i_id_persona, 
         empleado.d_fecha_creacion, 
         empleado.i_estado_empleado, 
         persona.i_id_persona, 
         persona.i_id_documento, 
         persona.i_id_pais_origen, 
         persona.i_id_ubicacion, 
         persona.v_nombre_persona, 
         persona.v_apellido_paterno_persona, 
         persona.v_apellido_materno_persona, 
         persona.d_fecha_nacimiento_persona, 
         persona.i_estado_persona, 
         pais.i_id_pais, 
         pais.v_nombre_pais, 
         ubicacion.i_id_ubicacion, 
         ubicacion.i_id_distrito, 
         ubicacion.v_direccion_ubicacion, 
         ubicacion.i_estado_ubicacion, 
         documento.i_id_documento, 
         documento.i_id_tipo_documento, 
         documento.v_valor_documento, 
         documento.i_estado_documento
      FROM 
         dbo.empleado 
            INNER JOIN dbo.persona 
            ON empleado.i_id_persona = persona.i_id_persona 
            INNER JOIN dbo.pais 
            ON pais.i_id_pais = persona.i_id_pais_origen 
            INNER JOIN dbo.ubicacion 
            ON ubicacion.i_id_ubicacion = persona.i_id_ubicacion 
            INNER JOIN dbo.documento 
            ON documento.i_id_documento = persona.i_id_documento
      WHERE empleado.i_estado_empleado = 0 AND (persona.v_nombre_persona LIKE @in_nombre + N'%' OR persona.v_apellido_paterno_persona LIKE @in_nombre + N'%' OR persona.v_apellido_paterno_persona LIKE @in_nombre + N'%')

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_empleado_eliminar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_empleado_eliminar]  
   @in_i_id_empleado nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @var_i_id_persona nchar(36), 
         @var_i_id_ubicacion nchar(36), 
         @var_i_id_documento nchar(36)

      SELECT @var_i_id_persona = em.i_id_persona, @var_i_id_ubicacion = p.i_id_ubicacion, @var_i_id_documento = p.i_id_documento
      FROM 
         dbo.empleado  AS em 
            INNER JOIN dbo.persona  AS p 
            ON em.i_id_persona = p.i_id_persona
      WHERE em.i_id_persona = @in_i_id_empleado

      UPDATE dbo.empleado
         SET 
            i_estado_empleado = 1
      WHERE empleado.i_id_empleado = @in_i_id_empleado

      UPDATE dbo.persona
         SET 
            i_estado_persona = 1
      WHERE persona.i_id_persona = @var_i_id_persona

      UPDATE dbo.documento
         SET 
            i_estado_documento = 1
      WHERE documento.i_id_documento = @var_i_id_documento

      UPDATE dbo.ubicacion
         SET 
            i_estado_ubicacion = 1
      WHERE ubicacion.i_id_ubicacion = @var_i_id_ubicacion

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_empleado_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_empleado_listar]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         pa.i_id_pais, 
         pa.v_nombre_pais, 
         r.i_id_region, 
         r.v_nombre_region, 
         dis.i_id_distrito, 
         dis.v_nombre_distrito, 
         pr.i_id_provincia, 
         pr.v_nombre_provincia, 
         td.i_id_tipo_documento, 
         td.v_nombre_tipo_documento, 
         p.i_id_persona, 
         p.v_nombre_persona, 
         p.v_apellido_paterno_persona, 
         p.v_apellido_materno_persona, 
         p.d_fecha_nacimiento_persona, 
         pv.i_id_empleado, 
         p.i_id_documento, 
         p.i_id_ubicacion, 
         p.i_id_pais_origen, 
         d.v_valor_documento, 
         u.v_direccion_ubicacion
      FROM 
         dbo.empleado  AS pv 
            INNER JOIN dbo.persona  AS p 
            ON pv.i_id_persona = p.i_id_persona 
            INNER JOIN dbo.documento  AS d 
            ON p.i_id_documento = d.i_id_documento 
            INNER JOIN dbo.ubicacion  AS u 
            ON p.i_id_ubicacion = u.i_id_ubicacion 
            INNER JOIN dbo.distrito  AS dis 
            ON u.i_id_distrito = dis.i_id_distrito 
            INNER JOIN dbo.provincia  AS pr 
            ON dis.i_id_provincia = pr.i_id_provincia 
            INNER JOIN dbo.region  AS r 
            ON pr.i_id_region = r.i_id_region 
            INNER JOIN dbo.pais  AS pa 
            ON r.i_id_pais = pa.i_id_pais 
            INNER JOIN dbo.tipo_documento  AS td 
            ON d.i_id_tipo_documento = td.i_id_tipo_documento
      WHERE pv.i_estado_empleado = 0

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_empleado_listar_paginacion]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_empleado_listar_paginacion]  
   @in_v_valor nvarchar(36),
   @in_pagina int,
   @in_tamanio_pagina int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @num_filas int

      DECLARE
         @total_pagina int

      DECLARE
         @empezar_desde int

      SELECT @num_filas = count_big(*)
      FROM dbo.empleado
      WHERE empleado.i_estado_empleado = 0

      SET @empezar_desde = (@in_pagina - 1) * @in_tamanio_pagina

      SELECT 
         pa.i_id_pais, 
         pa.v_nombre_pais, 
         r.i_id_region, 
         r.v_nombre_region, 
         dis.i_id_distrito, 
         dis.v_nombre_distrito, 
         pr.i_id_provincia, 
         pr.v_nombre_provincia, 
         td.i_id_tipo_documento, 
         td.v_nombre_tipo_documento, 
         p.i_id_persona, 
         p.v_nombre_persona, 
         p.v_apellido_paterno_persona, 
         p.v_apellido_materno_persona, 
         p.d_fecha_nacimiento_persona, 
         pv.i_id_empleado, 
         p.i_id_documento, 
         p.i_id_ubicacion, 
         p.i_id_pais_origen, 
         d.v_valor_documento, 
         u.v_direccion_ubicacion
      FROM 
         dbo.empleado  AS pv 
            INNER JOIN dbo.persona  AS p 
            ON pv.i_id_persona = p.i_id_persona 
            INNER JOIN dbo.documento  AS d 
            ON p.i_id_documento = d.i_id_documento 
            INNER JOIN dbo.ubicacion  AS u 
            ON p.i_id_ubicacion = u.i_id_ubicacion 
            INNER JOIN dbo.distrito  AS dis 
            ON u.i_id_distrito = dis.i_id_distrito 
            INNER JOIN dbo.provincia  AS pr 
            ON dis.i_id_provincia = pr.i_id_provincia 
            INNER JOIN dbo.region  AS r 
            ON pr.i_id_region = r.i_id_region 
            INNER JOIN dbo.pais  AS pa 
            ON r.i_id_pais = pa.i_id_pais 
            INNER JOIN dbo.tipo_documento  AS td 
            ON d.i_id_tipo_documento = td.i_id_tipo_documento
      WHERE pv.i_estado_empleado = 0 AND (
         pv.i_id_empleado LIKE @in_v_valor + N'%' OR 
         p.v_nombre_persona LIKE @in_v_valor + N'%' OR 
         p.v_apellido_paterno_persona LIKE @in_v_valor + N'%' OR 
         p.v_apellido_paterno_persona LIKE @in_v_valor + N'%')
         ORDER BY pv.d_fecha_creacion ASC
         OFFSET @empezar_desde ROWS
         FETCH NEXT @in_tamanio_pagina ROWS ONLY

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_empleado_listar_paginacion_count]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_empleado_listar_paginacion_count]  
   @in_v_valor nvarchar(36),
   @in_tamanio_pagina int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @num_filas int

      DECLARE
         @total_pagina int

      SELECT @num_filas = count_big(*)
      FROM 
         dbo.empleado  AS pv 
            INNER JOIN dbo.persona  AS p 
            ON pv.i_id_persona = p.i_id_persona
      WHERE pv.i_estado_empleado = 0 AND (
         pv.i_id_empleado LIKE @in_v_valor + N'%' OR 
         p.v_nombre_persona LIKE @in_v_valor + N'%' OR 
         p.v_apellido_paterno_persona LIKE @in_v_valor + N'%' OR 
         p.v_apellido_paterno_persona LIKE @in_v_valor + N'%')

      SET @total_pagina = ceiling(@num_filas * 1.0 / NULLIF(@in_tamanio_pagina, 0))

      SELECT @total_pagina

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_empleado_modificar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_empleado_modificar]  
   @in_i_id_empleado nchar(36),
   @in_v_direccion_ubicacion nvarchar(45),
   @in_i_id_distrito nvarchar(6),
   @in_v_valor_documento nvarchar(45),
   @in_i_id_tipo_documento nchar(36),
   @in_v_nombre_persona nvarchar(45),
   @in_v_apellido_paterno_persona nvarchar(40),
   @in_v_apellido_materno_persona nvarchar(40),
   @in_d_fecha_nacimiento_persona date,
   @in_i_id_pais_origen nvarchar(2)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @var_i_id_persona nchar(36), 
         @var_i_id_ubicacion nchar(36), 
         @var_i_id_documento nchar(36)

      SELECT @var_i_id_persona = pv.i_id_persona, @var_i_id_ubicacion = p.i_id_ubicacion, @var_i_id_documento = p.i_id_documento
      FROM 
         dbo.empleado  AS pv 
            INNER JOIN dbo.persona  AS p 
            ON pv.i_id_persona = p.i_id_persona
      WHERE pv.i_id_empleado = @in_i_id_empleado

      UPDATE dbo.ubicacion
         SET 
            v_direccion_ubicacion = @in_v_direccion_ubicacion, 
            i_id_distrito = @in_i_id_distrito
      WHERE ubicacion.i_id_ubicacion = @var_i_id_ubicacion

      UPDATE dbo.documento
         SET 
            v_valor_documento = @in_v_valor_documento, 
            i_id_tipo_documento = @in_i_id_tipo_documento
      WHERE documento.i_id_documento = @var_i_id_documento

      UPDATE dbo.persona
         SET 
            v_nombre_persona = @in_v_nombre_persona, 
            v_apellido_paterno_persona = @in_v_apellido_paterno_persona, 
            v_apellido_materno_persona = @in_v_apellido_materno_persona, 
            d_fecha_nacimiento_persona = @in_d_fecha_nacimiento_persona, 
            i_id_pais_origen = @in_i_id_pais_origen
      WHERE persona.i_id_persona = @var_i_id_persona

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_empresa_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_empresa_listar]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT empresa.i_id_empresa, empresa.i_id_ubicacion, empresa.v_ruc_empresa, empresa.v_razon_social_empresa
      FROM dbo.empresa

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_imagen_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_imagen_listar]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT I.i_id_imagen, I.v_nombre_imagen
      FROM dbo.imagen  AS I

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_marca_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_marca_listar]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT M.i_id_marca, M.v_nombre_marca
      FROM dbo.marca  AS M

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_moneda_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_moneda_listar]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT MO.i_id_moneda, MO.v_nombre_moneda
      FROM dbo.moneda  AS MO

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_pais_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_pais_listar]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT pais.i_id_pais, pais.v_nombre_pais
      FROM dbo.pais

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_persona_email_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_persona_email_listar]  
   @in_i_id_persona nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT E.i_id_email, E.v_direccion_email, E.b_primario_email
      FROM 
         dbo.email  AS E 
            INNER JOIN dbo.email_persona  AS EP 
            ON E.i_id_email = EP.i_id_email 
            INNER JOIN dbo.persona  AS P 
            ON EP.i_id_persona = P.i_id_persona
      WHERE E.i_estado_email = 0 AND EP.i_id_persona = @in_i_id_persona

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_producto_agregar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_producto_agregar]  
   @idMarca nchar(36),
   @idCategoria nchar(36),
   @idImagen nchar(36),
   @idAlmacen nchar(36),
   @idMoneda nchar(36),
   @nombre nvarchar(100),
   @descripcion nvarchar(100),
   @codigoBarras nvarchar(13),
   @precioReferencia decimal(8, 2)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @var_i_id_producto nchar(36)

      SET @var_i_id_producto = newid()

      INSERT dbo.producto(
         i_id_producto, 
         i_id_marca, 
         i_id_categoria, 
         i_id_imagen, 
         i_id_almacen, 
         i_id_moneda, 
         v_nombre_producto, 
         v_descripcion_producto, 
         v_codigo_barras_producto, 
         d_precio_referencia_producto)
         VALUES (
            @var_i_id_producto, 
            @idMarca, 
            @idCategoria, 
            @idImagen, 
            @idAlmacen, 
            @idMoneda, 
            @nombre, 
            @descripcion, 
            @codigoBarras, 
            @precioReferencia)

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_producto_buscar_id]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_producto_buscar_id]  
   @in_i_id_producto nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         P.i_id_producto, 
         P.i_id_marca, 
         P.i_id_categoria, 
         P.i_id_imagen, 
         P.i_id_almacen, 
         P.i_id_moneda, 
         P.v_nombre_producto, 
         P.v_descripcion_producto, 
         P.v_codigo_barras_producto, 
         P.d_precio_referencia_producto, 
         P.d_fecha_creacion, 
         P.i_estado_producto, 
         M.i_id_marca, 
         M.i_id_imagen, 
         M.v_nombre_marca, 
         M.i_estado_marca, 
         I.i_id_imagen, 
         I.v_nombre_imagen, 
         I.v_ruta_imagen, 
         AL.i_id_almacen, 
         AL.i_id_almacen_detalle, 
         AL.v_nombre_almacen, 
         AL.i_estado_almacen, 
         C.i_id_categoria, 
         C.v_nombre_categoria, 
         C.v_descripcion_categoria, 
         C.d_fecha_creacion, 
         C.i_estado_categoria, 
         MO.i_id_moneda, 
         MO.v_nombre_moneda, 
         MO.v_codigo_moneda, 
         MO.i_estado_moneda
      FROM 
         dbo.producto  AS P 
            INNER JOIN dbo.marca  AS M 
            ON M.i_id_marca = P.i_id_marca 
            INNER JOIN dbo.imagen  AS I 
            ON I.i_id_imagen = P.i_id_imagen 
            INNER JOIN dbo.almacen  AS AL 
            ON AL.i_id_almacen = P.i_id_almacen 
            INNER JOIN dbo.categoria  AS C 
            ON C.i_id_categoria = P.i_id_categoria 
            INNER JOIN dbo.moneda  AS MO 
            ON MO.i_id_moneda = P.i_id_moneda
      WHERE P.i_estado_producto = 0 AND P.i_id_producto LIKE @in_i_id_producto + N'%'

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_producto_buscar_nombre]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_producto_buscar_nombre]  
   @in_nombre nvarchar(100)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         P.i_id_producto, 
         P.i_id_marca, 
         P.i_id_categoria, 
         P.i_id_imagen, 
         P.i_id_almacen, 
         P.i_id_moneda, 
         P.v_nombre_producto, 
         P.v_descripcion_producto, 
         P.v_codigo_barras_producto, 
         P.d_precio_referencia_producto, 
         P.d_fecha_creacion, 
         P.i_estado_producto, 
         M.i_id_marca, 
         M.i_id_imagen, 
         M.v_nombre_marca, 
         M.i_estado_marca, 
         I.i_id_imagen, 
         I.v_nombre_imagen, 
         I.v_ruta_imagen, 
         AL.i_id_almacen, 
         AL.i_id_almacen_detalle, 
         AL.v_nombre_almacen, 
         AL.i_estado_almacen, 
         C.i_id_categoria, 
         C.v_nombre_categoria, 
         C.v_descripcion_categoria, 
         C.d_fecha_creacion, 
         C.i_estado_categoria, 
         MO.i_id_moneda, 
         MO.v_nombre_moneda, 
         MO.v_codigo_moneda, 
         MO.i_estado_moneda
      FROM 
         dbo.producto  AS P 
            INNER JOIN dbo.marca  AS M 
            ON M.i_id_marca = P.i_id_marca 
            INNER JOIN dbo.imagen  AS I 
            ON I.i_id_imagen = P.i_id_imagen 
            INNER JOIN dbo.almacen  AS AL 
            ON AL.i_id_almacen = P.i_id_almacen 
            INNER JOIN dbo.categoria  AS C 
            ON C.i_id_categoria = P.i_id_categoria 
            INNER JOIN dbo.moneda  AS MO 
            ON MO.i_id_moneda = P.i_id_moneda
      WHERE P.i_estado_producto = 0 AND P.v_nombre_producto LIKE @in_nombre + N'%'

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_producto_eliminar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_producto_eliminar]  
   @in_i_id_producto nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @var_id_categoria nchar(36), 
         @var_id_marca nchar(36), 
         @var_id_almacen nchar(36), 
         @var_id_moneda nchar(36)

      SELECT @var_id_categoria = cat.i_id_categoria, @var_id_marca = m.i_id_marca, @var_id_almacen = al.i_id_almacen, @var_id_moneda = mo.i_id_moneda
      FROM 
         dbo.producto  AS pro 
            INNER JOIN dbo.categoria  AS cat 
            ON pro.i_id_categoria = cat.i_id_categoria 
            INNER JOIN dbo.marca  AS m 
            ON pro.i_id_marca = m.i_id_marca 
            INNER JOIN dbo.almacen  AS al 
            ON pro.i_id_almacen = al.i_id_almacen 
            INNER JOIN dbo.moneda  AS mo 
            ON pro.i_id_moneda = mo.i_id_moneda
      WHERE pro.i_id_producto = @in_i_id_producto

      UPDATE dbo.producto
         SET 
            i_estado_producto = 1
      WHERE producto.i_id_producto = @in_i_id_producto

      UPDATE dbo.categoria
         SET 
            i_estado_categoria = 1
      WHERE categoria.i_id_categoria = @var_id_categoria

      UPDATE dbo.marca
         SET 
            i_estado_marca = 1
      WHERE marca.i_id_marca = @var_id_marca

      UPDATE dbo.almacen
         SET 
            i_estado_almacen = 1
      WHERE almacen.i_id_almacen = @var_id_almacen

      UPDATE dbo.moneda
         SET 
            i_estado_moneda = 1
      WHERE moneda.i_id_moneda = @var_id_moneda

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_producto_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_producto_listar]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         P.i_id_producto, 
         P.i_id_marca, 
         P.i_id_categoria, 
         P.i_id_imagen, 
         P.i_id_almacen, 
         P.i_id_moneda, 
         P.v_nombre_producto, 
         P.v_descripcion_producto, 
         P.v_codigo_barras_producto, 
         P.d_precio_referencia_producto, 
         P.d_fecha_creacion, 
         P.i_estado_producto, 
         M.i_id_marca, 
         M.i_id_imagen, 
         M.v_nombre_marca, 
         M.i_estado_marca, 
         I.i_id_imagen, 
         I.v_nombre_imagen, 
         I.v_ruta_imagen, 
         AL.i_id_almacen, 
         AL.i_id_almacen_detalle, 
         AL.v_nombre_almacen, 
         AL.i_estado_almacen, 
         C.i_id_categoria, 
         C.v_nombre_categoria, 
         C.v_descripcion_categoria, 
         C.d_fecha_creacion, 
         C.i_estado_categoria, 
         MO.i_id_moneda, 
         MO.v_nombre_moneda, 
         MO.v_codigo_moneda, 
         MO.i_estado_moneda
      FROM 
         dbo.producto  AS P 
            INNER JOIN dbo.marca  AS M 
            ON M.i_id_marca = P.i_id_marca 
            INNER JOIN dbo.imagen  AS I 
            ON I.i_id_imagen = P.i_id_imagen 
            INNER JOIN dbo.almacen  AS AL 
            ON AL.i_id_almacen = P.i_id_almacen 
            INNER JOIN dbo.categoria  AS C 
            ON C.i_id_categoria = P.i_id_categoria 
            INNER JOIN dbo.moneda  AS MO 
            ON MO.i_id_moneda = P.i_id_moneda
      WHERE P.i_estado_producto = 0
         ORDER BY P.d_fecha_creacion ASC/* Revisar bien*/

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_producto_listar_paginacion]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_producto_listar_paginacion]  
   @in_v_valor nvarchar(36),
   @in_pagina int,
   @in_tamanio_pagina int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @total_pagina int

      DECLARE
         @empezar_desde int

      SET @empezar_desde = (@in_pagina - 1) * @in_tamanio_pagina

      SELECT 
         P.i_id_producto, 
         P.i_id_marca, 
         P.i_id_categoria, 
         P.i_id_imagen, 
         P.i_id_almacen, 
         P.i_id_moneda, 
         P.v_nombre_producto, 
         P.v_descripcion_producto, 
         P.v_codigo_barras_producto, 
         P.d_precio_referencia_producto, 
         P.d_fecha_creacion, 
         P.i_estado_producto, 
         M.i_id_marca, 
         M.i_id_imagen, 
         M.v_nombre_marca, 
         M.i_estado_marca, 
         I.i_id_imagen, 
         I.v_nombre_imagen, 
         I.v_ruta_imagen, 
         AL.i_id_almacen, 
         AL.i_id_almacen_detalle, 
         AL.v_nombre_almacen, 
         AL.i_estado_almacen, 
         C.i_id_categoria, 
         C.v_nombre_categoria, 
         C.v_descripcion_categoria, 
         C.d_fecha_creacion, 
         C.i_estado_categoria, 
         MO.i_id_moneda, 
         MO.v_nombre_moneda, 
         MO.v_codigo_moneda, 
         MO.i_estado_moneda
      FROM 
         dbo.producto  AS P 
            INNER JOIN dbo.marca  AS M 
            ON M.i_id_marca = P.i_id_marca 
            INNER JOIN dbo.imagen  AS I 
            ON I.i_id_imagen = P.i_id_imagen 
            INNER JOIN dbo.almacen  AS AL 
            ON AL.i_id_almacen = P.i_id_almacen 
            INNER JOIN dbo.categoria  AS C 
            ON C.i_id_categoria = P.i_id_categoria 
            INNER JOIN dbo.moneda  AS MO 
            ON MO.i_id_moneda = P.i_id_moneda
      WHERE P.i_estado_producto = 0 AND (P.i_id_producto LIKE @in_v_valor + N'%' OR P.v_nombre_producto LIKE @in_v_valor + N'%')
         ORDER BY P.d_fecha_creacion ASC
         OFFSET @empezar_desde ROWS
         FETCH NEXT @in_tamanio_pagina ROWS ONLY

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_producto_listar_paginacion_count]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_producto_listar_paginacion_count]  
   @in_v_valor nvarchar(36),
   @in_tamanio_pagina int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @num_filas int

      DECLARE
         @total_pagina int

      SELECT @num_filas = count_big(*)
      FROM dbo.producto  AS P
      WHERE P.i_estado_producto = 0 AND (P.i_id_producto LIKE @in_v_valor + N'%' OR P.v_nombre_producto LIKE @in_v_valor + N'%')

      SET @total_pagina = ceiling(@num_filas * 1.0 / NULLIF(@in_tamanio_pagina, 0))

      SELECT @total_pagina

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_proveedor_agregar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_proveedor_agregar]  
   @in_v_direccion_ubicacion nvarchar(45),
   @in_i_id_distrito nvarchar(6),
   @in_v_valor_documento nvarchar(45),
   @in_i_id_tipo_documento nchar(36),
   @in_v_nombre_persona nvarchar(45),
   @in_v_apellido_paterno_persona nvarchar(45),
   @in_v_apellido_materno_persona nvarchar(45),
   @in_d_fecha_nacimiento_persona date,
   @in_i_id_pais_origen nvarchar(2),
   @in_i_id_empresa nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @var_i_id_ubicacion nchar(36)

      DECLARE
         @var_i_id_documento nchar(36)

      DECLARE
         @var_i_id_persona nchar(36)

      DECLARE
         @var_i_id_proveedor nchar(36)

      SET @var_i_id_ubicacion = newid()

      SET @var_i_id_documento = newid()

      SET @var_i_id_persona = newid()

      SET @var_i_id_proveedor = newid()

      INSERT dbo.ubicacion(i_id_ubicacion, v_direccion_ubicacion, i_id_distrito)
         VALUES (@var_i_id_ubicacion, @in_v_direccion_ubicacion, @in_i_id_distrito)

      INSERT dbo.documento(i_id_documento, v_valor_documento, i_id_tipo_documento)
         VALUES (@var_i_id_documento, @in_v_valor_documento, @in_i_id_tipo_documento)

      INSERT dbo.persona(
         i_id_persona, 
         v_nombre_persona, 
         v_apellido_paterno_persona, 
         v_apellido_materno_persona, 
         i_id_documento, 
         d_fecha_nacimiento_persona, 
         i_id_pais_origen, 
         i_id_ubicacion)
         VALUES (
            @var_i_id_persona, 
            @in_v_nombre_persona, 
            @in_v_apellido_paterno_persona, 
            @in_v_apellido_materno_persona, 
            @var_i_id_documento, 
            @in_d_fecha_nacimiento_persona, 
            @in_i_id_pais_origen, 
            @var_i_id_ubicacion)

      INSERT dbo.proveedor(i_id_proveedor, i_id_persona, i_id_empresa)
         VALUES (@var_i_id_proveedor, @var_i_id_persona, @in_i_id_empresa)

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_proveedor_buscar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_proveedor_buscar]  
   @in_nombre nvarchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         pa.i_id_pais, 
         pa.v_nombre_pais, 
         r.i_id_region, 
         r.v_nombre_region, 
         dis.i_id_distrito, 
         dis.v_nombre_distrito, 
         pr.i_id_provincia, 
         pr.v_nombre_provincia, 
         td.i_id_tipo_documento, 
         td.v_nombre_tipo_documento, 
         e.i_id_empresa, 
         e.v_ruc_empresa, 
         e.v_razon_social_empresa, 
         p.i_id_persona, 
         p.v_nombre_persona, 
         p.v_apellido_paterno_persona, 
         p.v_apellido_materno_persona, 
         p.d_fecha_nacimiento_persona, 
         pv.i_id_proveedor, 
         p.i_id_documento, 
         p.i_id_ubicacion, 
         p.i_id_pais_origen, 
         d.v_valor_documento, 
         u.v_direccion_ubicacion
      FROM 
         dbo.proveedor  AS pv 
            INNER JOIN dbo.empresa  AS e 
            ON pv.i_id_empresa = e.i_id_empresa 
            INNER JOIN dbo.persona  AS p 
            ON pv.i_id_persona = p.i_id_persona 
            INNER JOIN dbo.documento  AS d 
            ON p.i_id_documento = d.i_id_documento 
            INNER JOIN dbo.ubicacion  AS u 
            ON p.i_id_ubicacion = u.i_id_ubicacion 
            INNER JOIN dbo.distrito  AS dis 
            ON u.i_id_distrito = dis.i_id_distrito 
            INNER JOIN dbo.provincia  AS pr 
            ON dis.i_id_provincia = pr.i_id_provincia 
            INNER JOIN dbo.region  AS r 
            ON pr.i_id_region = r.i_id_region 
            INNER JOIN dbo.pais  AS pa 
            ON r.i_id_pais = pa.i_id_pais 
            INNER JOIN dbo.tipo_documento  AS td 
            ON d.i_id_tipo_documento = td.i_id_tipo_documento
      WHERE pv.i_estado_proveedor = 0 AND (
         pv.i_id_proveedor LIKE @in_nombre + N'%' OR 
         p.v_nombre_persona LIKE @in_nombre + N'%' OR 
         p.v_apellido_paterno_persona LIKE @in_nombre + N'%' OR 
         p.v_apellido_paterno_persona LIKE @in_nombre + N'%')

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_proveedor_buscar_id]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_proveedor_buscar_id]  
   @in_i_id_proveedor nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         pa.i_id_pais, 
         pa.v_nombre_pais, 
         r.i_id_region, 
         r.v_nombre_region, 
         dis.i_id_distrito, 
         dis.v_nombre_distrito, 
         pr.i_id_provincia, 
         pr.v_nombre_provincia, 
         td.i_id_tipo_documento, 
         td.v_nombre_tipo_documento, 
         e.i_id_empresa, 
         e.v_ruc_empresa, 
         e.v_razon_social_empresa, 
         p.i_id_persona, 
         p.v_nombre_persona, 
         p.v_apellido_paterno_persona, 
         p.v_apellido_materno_persona, 
         p.d_fecha_nacimiento_persona, 
         pv.i_id_proveedor, 
         p.i_id_documento, 
         p.i_id_ubicacion, 
         p.i_id_pais_origen, 
         d.v_valor_documento, 
         u.v_direccion_ubicacion
      FROM 
         dbo.proveedor  AS pv 
            INNER JOIN dbo.empresa  AS e 
            ON pv.i_id_empresa = e.i_id_empresa 
            INNER JOIN dbo.persona  AS p 
            ON pv.i_id_persona = p.i_id_persona 
            INNER JOIN dbo.documento  AS d 
            ON p.i_id_documento = d.i_id_documento 
            INNER JOIN dbo.ubicacion  AS u 
            ON p.i_id_ubicacion = u.i_id_ubicacion 
            INNER JOIN dbo.distrito  AS dis 
            ON u.i_id_distrito = dis.i_id_distrito 
            INNER JOIN dbo.provincia  AS pr 
            ON dis.i_id_provincia = pr.i_id_provincia 
            INNER JOIN dbo.region  AS r 
            ON pr.i_id_region = r.i_id_region 
            INNER JOIN dbo.pais  AS pa 
            ON r.i_id_pais = pa.i_id_pais 
            INNER JOIN dbo.tipo_documento  AS td 
            ON d.i_id_tipo_documento = td.i_id_tipo_documento
      WHERE pv.i_estado_proveedor = 0 AND @in_i_id_proveedor LIKE @in_i_id_proveedor + N'%'

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_proveedor_buscar_nombre]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_proveedor_buscar_nombre]  
   @in_nombre nvarchar(20)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         pa.i_id_pais, 
         pa.v_nombre_pais, 
         r.i_id_region, 
         r.v_nombre_region, 
         dis.i_id_distrito, 
         dis.v_nombre_distrito, 
         pr.i_id_provincia, 
         pr.v_nombre_provincia, 
         td.i_id_tipo_documento, 
         td.v_nombre_tipo_documento, 
         e.i_id_empresa, 
         e.v_ruc_empresa, 
         e.v_razon_social_empresa, 
         p.i_id_persona, 
         p.v_nombre_persona, 
         p.v_apellido_paterno_persona, 
         p.v_apellido_materno_persona, 
         p.d_fecha_nacimiento_persona, 
         pv.i_id_proveedor, 
         p.i_id_documento, 
         p.i_id_ubicacion, 
         p.i_id_pais_origen, 
         d.v_valor_documento, 
         u.v_direccion_ubicacion
      FROM 
         dbo.proveedor  AS pv 
            INNER JOIN dbo.empresa  AS e 
            ON pv.i_id_empresa = e.i_id_empresa 
            INNER JOIN dbo.persona  AS p 
            ON pv.i_id_persona = p.i_id_persona 
            INNER JOIN dbo.documento  AS d 
            ON p.i_id_documento = d.i_id_documento 
            INNER JOIN dbo.ubicacion  AS u 
            ON p.i_id_ubicacion = u.i_id_ubicacion 
            INNER JOIN dbo.distrito  AS dis 
            ON u.i_id_distrito = dis.i_id_distrito 
            INNER JOIN dbo.provincia  AS pr 
            ON dis.i_id_provincia = pr.i_id_provincia 
            INNER JOIN dbo.region  AS r 
            ON pr.i_id_region = r.i_id_region 
            INNER JOIN dbo.pais  AS pa 
            ON r.i_id_pais = pa.i_id_pais 
            INNER JOIN dbo.tipo_documento  AS td 
            ON d.i_id_tipo_documento = td.i_id_tipo_documento
      WHERE pv.i_estado_proveedor = 0 AND (p.v_nombre_persona LIKE @in_nombre + N'%' OR p.v_apellido_paterno_persona LIKE @in_nombre + N'%' OR p.v_apellido_paterno_persona LIKE @in_nombre + N'%')

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_proveedor_eliminar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_proveedor_eliminar]  
   @in_i_id_proveedor nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @var_i_id_persona nchar(36), 
         @var_i_id_ubicacion nchar(36), 
         @var_i_id_documento nchar(36)

      SELECT @var_i_id_persona = pv.i_id_persona, @var_i_id_ubicacion = p.i_id_ubicacion, @var_i_id_documento = p.i_id_documento
      FROM 
         dbo.proveedor  AS pv 
            INNER JOIN dbo.persona  AS p 
            ON pv.i_id_persona = p.i_id_persona
      WHERE pv.i_id_proveedor = @in_i_id_proveedor

      UPDATE dbo.proveedor
         SET 
            i_estado_proveedor = 1
      WHERE proveedor.i_id_proveedor = @in_i_id_proveedor

      UPDATE dbo.persona
         SET 
            i_estado_persona = 1
      WHERE persona.i_id_persona = @var_i_id_persona

      UPDATE dbo.documento
         SET 
            i_estado_documento = 1
      WHERE documento.i_id_documento = @var_i_id_documento

      UPDATE dbo.ubicacion
         SET 
            i_estado_ubicacion = 1
      WHERE ubicacion.i_id_ubicacion = @var_i_id_ubicacion

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_proveedor_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_proveedor_listar]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         pa.i_id_pais, 
         pa.v_nombre_pais, 
         r.i_id_region, 
         r.v_nombre_region, 
         dis.i_id_distrito, 
         dis.v_nombre_distrito, 
         pr.i_id_provincia, 
         pr.v_nombre_provincia, 
         td.i_id_tipo_documento, 
         td.v_nombre_tipo_documento, 
         e.i_id_empresa, 
         e.v_ruc_empresa, 
         e.v_razon_social_empresa, 
         p.i_id_persona, 
         p.v_nombre_persona, 
         p.v_apellido_paterno_persona, 
         p.v_apellido_materno_persona, 
         p.d_fecha_nacimiento_persona, 
         pv.i_id_proveedor, 
         p.i_id_documento, 
         p.i_id_ubicacion, 
         p.i_id_pais_origen, 
         d.v_valor_documento, 
         u.v_direccion_ubicacion
      FROM 
         dbo.proveedor  AS pv 
            INNER JOIN dbo.empresa  AS e 
            ON pv.i_id_empresa = e.i_id_empresa 
            INNER JOIN dbo.persona  AS p 
            ON pv.i_id_persona = p.i_id_persona 
            INNER JOIN dbo.documento  AS d 
            ON p.i_id_documento = d.i_id_documento 
            INNER JOIN dbo.ubicacion  AS u 
            ON p.i_id_ubicacion = u.i_id_ubicacion 
            INNER JOIN dbo.distrito  AS dis 
            ON u.i_id_distrito = dis.i_id_distrito 
            INNER JOIN dbo.provincia  AS pr 
            ON dis.i_id_provincia = pr.i_id_provincia 
            INNER JOIN dbo.region  AS r 
            ON pr.i_id_region = r.i_id_region 
            INNER JOIN dbo.pais  AS pa 
            ON r.i_id_pais = pa.i_id_pais 
            INNER JOIN dbo.tipo_documento  AS td 
            ON d.i_id_tipo_documento = td.i_id_tipo_documento
      WHERE pv.i_estado_proveedor = 0
         ORDER BY pv.d_fecha_creacion ASC

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_proveedor_listar_paginacion]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_proveedor_listar_paginacion]  
   @in_v_valor nvarchar(36),
   @in_pagina int,
   @in_tamanio_pagina int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @num_filas int

      DECLARE
         @total_pagina int

      DECLARE
         @empezar_desde int

      SELECT @num_filas = count_big(*)
      FROM dbo.proveedor
      WHERE proveedor.i_estado_proveedor = 0

      SET @empezar_desde = (@in_pagina - 1) * @in_tamanio_pagina

      SELECT 
         pa.i_id_pais, 
         pa.v_nombre_pais, 
         r.i_id_region, 
         r.v_nombre_region, 
         dis.i_id_distrito, 
         dis.v_nombre_distrito, 
         pr.i_id_provincia, 
         pr.v_nombre_provincia, 
         td.i_id_tipo_documento, 
         td.v_nombre_tipo_documento, 
         e.i_id_empresa, 
         e.v_ruc_empresa, 
         e.v_razon_social_empresa, 
         p.i_id_persona, 
         p.v_nombre_persona, 
         p.v_apellido_paterno_persona, 
         p.v_apellido_materno_persona, 
         p.d_fecha_nacimiento_persona, 
         pv.i_id_proveedor, 
         p.i_id_documento, 
         p.i_id_ubicacion, 
         p.i_id_pais_origen, 
         d.v_valor_documento, 
         u.v_direccion_ubicacion
      FROM 
         dbo.proveedor  AS pv 
            INNER JOIN dbo.empresa  AS e 
            ON pv.i_id_empresa = e.i_id_empresa 
            INNER JOIN dbo.persona  AS p 
            ON pv.i_id_persona = p.i_id_persona 
            INNER JOIN dbo.documento  AS d 
            ON p.i_id_documento = d.i_id_documento 
            INNER JOIN dbo.ubicacion  AS u 
            ON p.i_id_ubicacion = u.i_id_ubicacion 
            INNER JOIN dbo.distrito  AS dis 
            ON u.i_id_distrito = dis.i_id_distrito 
            INNER JOIN dbo.provincia  AS pr 
            ON dis.i_id_provincia = pr.i_id_provincia 
            INNER JOIN dbo.region  AS r 
            ON pr.i_id_region = r.i_id_region 
            INNER JOIN dbo.pais  AS pa 
            ON r.i_id_pais = pa.i_id_pais 
            INNER JOIN dbo.tipo_documento  AS td 
            ON d.i_id_tipo_documento = td.i_id_tipo_documento
      WHERE pv.i_estado_proveedor = 0 AND (
         pv.i_id_proveedor LIKE @in_v_valor + N'%' OR 
         p.v_nombre_persona LIKE @in_v_valor + N'%' OR 
         p.v_apellido_paterno_persona LIKE @in_v_valor + N'%' OR 
         p.v_apellido_paterno_persona LIKE @in_v_valor + N'%')
         ORDER BY pv.d_fecha_creacion ASC
         OFFSET @empezar_desde ROWS
         FETCH NEXT @in_tamanio_pagina ROWS ONLY

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_proveedor_listar_paginacion_count]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_proveedor_listar_paginacion_count]  
   @in_v_valor nvarchar(36),
   @in_tamanio_pagina int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @num_filas int

      DECLARE
         @total_pagina int

      SELECT @num_filas = count_big(*)
      FROM 
         dbo.proveedor  AS pv 
            INNER JOIN dbo.persona  AS p 
            ON pv.i_id_persona = p.i_id_persona
      WHERE pv.i_estado_proveedor = 0 AND (
         pv.i_id_proveedor LIKE @in_v_valor + N'%' OR 
         p.v_nombre_persona LIKE @in_v_valor + N'%' OR 
         p.v_apellido_paterno_persona LIKE @in_v_valor + N'%' OR 
         p.v_apellido_paterno_persona LIKE @in_v_valor + N'%')

      SET @total_pagina = ceiling(@num_filas * 1.0 / NULLIF(@in_tamanio_pagina, 0))

      SELECT @total_pagina

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_proveedor_modificar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_proveedor_modificar]  
   @in_i_id_proveedor nchar(36),
   @in_v_direccion_ubicacion nvarchar(45),
   @in_i_id_distrito nvarchar(6),
   @in_v_valor_documento nvarchar(45),
   @in_i_id_tipo_documento nchar(36),
   @in_v_nombre_persona nvarchar(45),
   @in_v_apellido_paterno_persona nvarchar(45),
   @in_v_apellido_materno_persona nvarchar(45),
   @in_d_fecha_nacimiento_persona date,
   @in_i_id_pais_origen nvarchar(2)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @var_i_id_persona nchar(36), 
         @var_i_id_ubicacion nchar(36), 
         @var_i_id_documento nchar(36)

      SELECT @var_i_id_persona = pv.i_id_persona, @var_i_id_ubicacion = p.i_id_ubicacion, @var_i_id_documento = p.i_id_documento
      FROM 
         dbo.proveedor  AS pv 
            INNER JOIN dbo.persona  AS p 
            ON pv.i_id_persona = p.i_id_persona
      WHERE pv.i_id_proveedor = @in_i_id_proveedor

      UPDATE dbo.ubicacion
         SET 
            v_direccion_ubicacion = @in_v_direccion_ubicacion, 
            i_id_distrito = @in_i_id_distrito
      WHERE ubicacion.i_id_ubicacion = @var_i_id_ubicacion

      UPDATE dbo.documento
         SET 
            v_valor_documento = @in_v_valor_documento, 
            i_id_tipo_documento = @in_i_id_tipo_documento
      WHERE documento.i_id_documento = @var_i_id_documento

      UPDATE dbo.persona
         SET 
            v_nombre_persona = @in_v_nombre_persona, 
            v_apellido_paterno_persona = @in_v_apellido_paterno_persona, 
            v_apellido_materno_persona = @in_v_apellido_materno_persona, 
            d_fecha_nacimiento_persona = @in_d_fecha_nacimiento_persona, 
            i_id_pais_origen = @in_i_id_pais_origen
      WHERE persona.i_id_persona = @var_i_id_persona

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_provincia_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_provincia_listar]  
   @in_i_id_region nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT provincia.i_id_provincia, provincia.v_nombre_provincia, provincia.i_id_region
      FROM dbo.provincia
      WHERE provincia.i_id_region = @in_i_id_region

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_region_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_region_listar]  
   @in_i_id_pais nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT region.i_id_region, region.v_nombre_region, region.i_id_pais
      FROM dbo.region
      WHERE region.i_id_pais = @in_i_id_pais

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_rol_actualizar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_rol_actualizar]  
   @in_i_id_rol nchar(36),
   @in_v_nombre_rol nvarchar(30)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      UPDATE dbo.rol
         SET 
            v_nombre_rol = @in_v_nombre_rol
      WHERE rol.i_id_rol = @in_i_id_rol

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_rol_agregar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_rol_agregar]  
   @in_v_nombre_rol nvarchar(30)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @var_i_id_rol nchar(36)

      SET @var_i_id_rol = newid()

      INSERT dbo.rol(i_id_rol, v_nombre_rol)
         VALUES (@var_i_id_rol, @in_v_nombre_rol)

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_rol_buscar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_rol_buscar]  
   @in_v_nombre nvarchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT R.i_id_rol, R.v_nombre_rol, R.d_fecha_creacion, R.i_estado_rol
      FROM dbo.rol  AS R
      WHERE R.i_estado_rol = 0 AND (R.i_id_rol LIKE @in_v_nombre + N'%' OR R.v_nombre_rol LIKE @in_v_nombre + N'%')
         ORDER BY R.d_fecha_creacion ASC

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_rol_eliminar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_rol_eliminar]  
   @in_i_id_rol nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      UPDATE dbo.rol
         SET 
            i_estado_rol = 1
      WHERE rol.i_id_rol = @in_i_id_rol

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_rol_encontrar_por_codigo]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_rol_encontrar_por_codigo]  
   @in_i_id_rol nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT rol.i_id_rol, rol.v_nombre_rol, rol.d_fecha_creacion, rol.i_estado_rol
      FROM dbo.rol
      WHERE rol.i_estado_rol = 0 AND rol.i_id_rol = @in_i_id_rol

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_rol_encontrar_por_nombre]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_rol_encontrar_por_nombre]  
   @in_v_nombre nvarchar(30)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT rol.i_id_rol, rol.v_nombre_rol, rol.d_fecha_creacion, rol.i_estado_rol
      FROM dbo.rol
      WHERE rol.i_estado_rol = 0 AND rol.v_nombre_rol = @in_v_nombre

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_rol_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_rol_listar]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT R.i_id_rol, R.v_nombre_rol, R.d_fecha_creacion, R.i_estado_rol
      FROM dbo.rol  AS R
      WHERE R.i_estado_rol = 0
         ORDER BY R.d_fecha_creacion ASC

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_rol_listar_paginacion]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_rol_listar_paginacion]  
   @in_v_valor nvarchar(36),
   @in_pagina int,
   @in_tamanio_pagina int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @num_filas int

      DECLARE
         @total_pagina int

      DECLARE
         @empezar_desde int

      SELECT @num_filas = count_big(*)
      FROM dbo.rol
      WHERE rol.i_estado_rol = 0

      SET @empezar_desde = (@in_pagina - 1) * @in_tamanio_pagina

      SELECT R.i_id_rol, R.v_nombre_rol, R.d_fecha_creacion, R.i_estado_rol
      FROM dbo.rol  AS R
      WHERE R.i_estado_rol = 0 AND (R.i_id_rol LIKE @in_v_valor + N'%' OR R.v_nombre_rol LIKE @in_v_valor + N'%')
         ORDER BY R.d_fecha_creacion ASC
         OFFSET @empezar_desde ROWS
         FETCH NEXT @in_tamanio_pagina ROWS ONLY

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_rol_listar_paginacion_count]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_rol_listar_paginacion_count]  
   @in_v_valor nvarchar(36),
   @in_tamanio_pagina int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @num_filas int

      DECLARE
         @total_pagina int

      SELECT @num_filas = count_big(*)
      FROM dbo.rol
      WHERE rol.i_estado_rol = 0 AND (rol.i_id_rol LIKE @in_v_valor + N'%' OR rol.v_nombre_rol LIKE @in_v_valor + N'%')

      SET @total_pagina = ceiling(@num_filas * 1.0 / NULLIF(@in_tamanio_pagina, 0))

      SELECT @total_pagina

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_tipo_documento_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_tipo_documento_listar]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT tipo_documento.i_id_tipo_documento, tipo_documento.v_nombre_tipo_documento
      FROM dbo.tipo_documento

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_actualizar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_usuario_actualizar]  
   @in_i_id_usuario nchar(36),
   @in_v_username_usuario nvarchar(45),
   @in_v_password_usuario nvarchar(60),
   @in_i_id_rol nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      UPDATE dbo.usuario
         SET 
            v_username_usuario = @in_v_username_usuario, 
            v_password_usuario = @in_v_password_usuario, 
            i_id_rol = @in_i_id_rol
      WHERE usuario.i_id_usuario = @in_i_id_usuario

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_agregar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_usuario_agregar]  
   @in_v_username_usuario nvarchar(45),
   @in_v_password_usuario nvarchar(60),
   @in_i_id_empleado nchar(36),
   @in_i_id_rol nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @var_i_id_usuario nchar(36)

      SET @var_i_id_usuario = newid()

      INSERT dbo.usuario(
         i_id_usuario, 
         v_username_usuario, 
         v_password_usuario, 
         i_id_empleado, 
         i_id_rol)
         VALUES (
            @var_i_id_usuario, 
            @in_v_username_usuario, 
            @in_v_password_usuario, 
            @in_i_id_empleado, 
            @in_i_id_rol)

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_buscar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_usuario_buscar]  
   @in_v_valor nvarchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         U.i_id_usuario, 
         U.i_id_empleado, 
         U.i_id_rol, 
         U.v_username_usuario, 
         U.v_password_usuario, 
         U.d_fecha_creacion, 
         U.i_estado_usuario, 
         R.i_id_rol, 
         R.v_nombre_rol, 
         R.d_fecha_creacion, 
         R.i_estado_rol, 
         E.i_id_empleado, 
         E.i_id_persona, 
         E.d_fecha_creacion, 
         E.i_estado_empleado, 
         P.i_id_persona, 
         P.i_id_documento, 
         P.i_id_pais_origen, 
         P.i_id_ubicacion, 
         P.v_nombre_persona, 
         P.v_apellido_paterno_persona, 
         P.v_apellido_materno_persona, 
         P.d_fecha_nacimiento_persona, 
         P.i_estado_persona
      FROM 
         dbo.usuario  AS U 
            INNER JOIN dbo.rol  AS R 
            ON U.i_id_rol = R.i_id_rol 
            INNER JOIN dbo.empleado  AS E 
            ON U.i_id_empleado = E.i_id_empleado 
            INNER JOIN dbo.persona  AS P 
            ON E.i_id_persona = P.i_id_persona
      WHERE U.i_estado_usuario = 0 AND (U.i_id_usuario LIKE @in_v_valor + N'%' OR U.v_username_usuario LIKE @in_v_valor + N'%')
         ORDER BY U.d_fecha_creacion ASC

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_eliminar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_usuario_eliminar]  
   @in_i_id_usuario nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      UPDATE dbo.usuario
         SET 
            i_estado_usuario = 1
      WHERE usuario.i_id_usuario = @in_i_id_usuario

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_encontrar_por_codigo]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_usuario_encontrar_por_codigo]  
   @in_i_id_usuario nchar(36)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         U.i_id_usuario, 
         U.i_id_empleado, 
         U.i_id_rol, 
         U.v_username_usuario, 
         U.v_password_usuario, 
         U.d_fecha_creacion, 
         U.i_estado_usuario, 
         R.i_id_rol, 
         R.v_nombre_rol, 
         R.d_fecha_creacion, 
         R.i_estado_rol, 
         E.i_id_empleado, 
         E.i_id_persona, 
         E.d_fecha_creacion, 
         E.i_estado_empleado, 
         P.i_id_persona, 
         P.i_id_documento, 
         P.i_id_pais_origen, 
         P.i_id_ubicacion, 
         P.v_nombre_persona, 
         P.v_apellido_paterno_persona, 
         P.v_apellido_materno_persona, 
         P.d_fecha_nacimiento_persona, 
         P.i_estado_persona
      FROM 
         dbo.usuario  AS U 
            INNER JOIN dbo.rol  AS R 
            ON U.i_id_rol = R.i_id_rol 
            INNER JOIN dbo.empleado  AS E 
            ON U.i_id_empleado = E.i_id_empleado 
            INNER JOIN dbo.persona  AS P 
            ON E.i_id_persona = P.i_id_persona
      WHERE U.i_estado_usuario = 0 AND U.i_id_usuario = @in_i_id_usuario

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_encontrar_por_nombre_usuario]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_usuario_encontrar_por_nombre_usuario]  
   @in_v_nombre nvarchar(30)
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         U.i_id_usuario, 
         U.i_id_empleado, 
         U.i_id_rol, 
         U.v_username_usuario, 
         U.v_password_usuario, 
         U.d_fecha_creacion, 
         U.i_estado_usuario, 
         R.i_id_rol, 
         R.v_nombre_rol, 
         R.d_fecha_creacion, 
         R.i_estado_rol, 
         E.i_id_empleado, 
         E.i_id_persona, 
         E.d_fecha_creacion, 
         E.i_estado_empleado, 
         P.i_id_persona, 
         P.i_id_documento, 
         P.i_id_pais_origen, 
         P.i_id_ubicacion, 
         P.v_nombre_persona, 
         P.v_apellido_paterno_persona, 
         P.v_apellido_materno_persona, 
         P.d_fecha_nacimiento_persona, 
         P.i_estado_persona
      FROM 
         dbo.usuario  AS U 
            INNER JOIN dbo.rol  AS R 
            ON U.i_id_rol = R.i_id_rol 
            INNER JOIN dbo.empleado  AS E 
            ON U.i_id_empleado = E.i_id_empleado 
            INNER JOIN dbo.persona  AS P 
            ON E.i_id_persona = P.i_id_persona
      WHERE U.i_estado_usuario = 0 AND U.v_username_usuario = @in_v_nombre

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_listar]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_usuario_listar]
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      SELECT 
         U.i_id_usuario, 
         U.i_id_empleado, 
         U.i_id_rol, 
         U.v_username_usuario, 
         U.v_password_usuario, 
         U.d_fecha_creacion, 
         U.i_estado_usuario, 
         R.i_id_rol, 
         R.v_nombre_rol, 
         R.d_fecha_creacion, 
         R.i_estado_rol, 
         E.i_id_empleado, 
         E.i_id_persona, 
         E.d_fecha_creacion, 
         E.i_estado_empleado, 
         P.i_id_persona, 
         P.i_id_documento, 
         P.i_id_pais_origen, 
         P.i_id_ubicacion, 
         P.v_nombre_persona, 
         P.v_apellido_paterno_persona, 
         P.v_apellido_materno_persona, 
         P.d_fecha_nacimiento_persona, 
         P.i_estado_persona
      FROM 
         dbo.usuario  AS U 
            INNER JOIN dbo.rol  AS R 
            ON U.i_id_rol = R.i_id_rol 
            INNER JOIN dbo.empleado  AS E 
            ON U.i_id_empleado = E.i_id_empleado 
            INNER JOIN dbo.persona  AS P 
            ON E.i_id_persona = P.i_id_persona
      WHERE U.i_estado_usuario = 0
         ORDER BY U.d_fecha_creacion ASC

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_listar_paginacion]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_usuario_listar_paginacion]  
   @in_v_valor nvarchar(36),
   @in_pagina int,
   @in_tamanio_pagina int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @num_filas int

      DECLARE
         @total_pagina int

      DECLARE
         @empezar_desde int

      SELECT @num_filas = count_big(*)
      FROM dbo.usuario
      WHERE usuario.i_estado_usuario = 0

      SET @empezar_desde = (@in_pagina - 1) * @in_tamanio_pagina

      SELECT 
         U.i_id_usuario, 
         U.i_id_empleado, 
         U.i_id_rol, 
         U.v_username_usuario, 
         U.v_password_usuario, 
         U.d_fecha_creacion, 
         U.i_estado_usuario, 
         R.i_id_rol, 
         R.v_nombre_rol, 
         R.d_fecha_creacion, 
         R.i_estado_rol, 
         E.i_id_empleado, 
         E.i_id_persona, 
         E.d_fecha_creacion, 
         E.i_estado_empleado, 
         P.i_id_persona, 
         P.i_id_documento, 
         P.i_id_pais_origen, 
         P.i_id_ubicacion, 
         P.v_nombre_persona, 
         P.v_apellido_paterno_persona, 
         P.v_apellido_materno_persona, 
         P.d_fecha_nacimiento_persona, 
         P.i_estado_persona
      FROM 
         dbo.usuario  AS U 
            INNER JOIN dbo.rol  AS R 
            ON U.i_id_rol = R.i_id_rol 
            INNER JOIN dbo.empleado  AS E 
            ON U.i_id_empleado = E.i_id_empleado 
            INNER JOIN dbo.persona  AS P 
            ON E.i_id_persona = P.i_id_persona
      WHERE U.i_estado_usuario = 0 AND (U.i_id_usuario LIKE @in_v_valor + N'%' OR U.v_username_usuario LIKE @in_v_valor + N'%')
         ORDER BY U.d_fecha_creacion ASC
         OFFSET @empezar_desde ROWS
         FETCH NEXT @in_tamanio_pagina ROWS ONLY

   END
GO
/****** Object:  StoredProcedure [dbo].[sp_usuario_listar_paginacion_count]    Script Date: 18/10/2022 1:33:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
*   SSMA informational messages:
*   M2SS0003: The following SQL clause was ignored during conversion:
*   DEFINER = `root`@`localhost`.
*/

CREATE PROCEDURE [dbo].[sp_usuario_listar_paginacion_count]  
   @in_v_valor nvarchar(36),
   @in_tamanio_pagina int
AS 
   BEGIN

      SET  XACT_ABORT  ON

      SET  NOCOUNT  ON

      DECLARE
         @num_filas int

      DECLARE
         @total_pagina int

      SELECT @num_filas = count_big(*)
      FROM dbo.usuario
      WHERE usuario.i_estado_usuario = 0 AND (usuario.i_id_usuario LIKE @in_v_valor + N'%' OR usuario.v_username_usuario LIKE @in_v_valor + N'%')

      SET @total_pagina = ceiling(@num_filas * 1.0 / NULLIF(@in_tamanio_pagina, 0))

      SELECT @total_pagina

   END
GO
USE [master]
GO
ALTER DATABASE [  dsamistore_almacen_sqlServer] SET  READ_WRITE 
GO
