USE [master]
GO
/****** Object:  Database [jj_construcoes]    Script Date: 29/08/2012 23:45:17 ******/
CREATE DATABASE [jj_construcoes]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'jj_construcoes', FILENAME = N'E:\App_Data\jj_construcoes.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'jj_construcoes_log', FILENAME = N'E:\App_Data\jj_construcoes_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [jj_construcoes] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [jj_construcoes].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [jj_construcoes] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [jj_construcoes] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [jj_construcoes] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [jj_construcoes] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [jj_construcoes] SET ARITHABORT OFF 
GO
ALTER DATABASE [jj_construcoes] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [jj_construcoes] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [jj_construcoes] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [jj_construcoes] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [jj_construcoes] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [jj_construcoes] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [jj_construcoes] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [jj_construcoes] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [jj_construcoes] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [jj_construcoes] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [jj_construcoes] SET  DISABLE_BROKER 
GO
ALTER DATABASE [jj_construcoes] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [jj_construcoes] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [jj_construcoes] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [jj_construcoes] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [jj_construcoes] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [jj_construcoes] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [jj_construcoes] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [jj_construcoes] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [jj_construcoes] SET  MULTI_USER 
GO
ALTER DATABASE [jj_construcoes] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [jj_construcoes] SET DB_CHAINING OFF 
GO
ALTER DATABASE [jj_construcoes] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [jj_construcoes] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [jj_construcoes]
GO
/****** Object:  StoredProcedure [dbo].[sp_altera_acesso]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_altera_acesso]
@nivel_acesso AS VARCHAR(10),
@email_usuario AS VARCHAR(40)

AS
BEGIN	

   UPDATE  tbl_usuario 
   SET nivel_acesso = @nivel_acesso
   WHERE email_usuario = @email_usuario

END

GO
/****** Object:  StoredProcedure [dbo].[sp_cadastra_imagem]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_cadastra_imagem]
	@nome_imagem AS VARCHAR(45),
	@descricao_imagem AS VARCHAR(150),
	@data_imagem AS DATETIME
AS
BEGIN
	SELECT @nome_imagem = replace(@nome_imagem, 'insert', '')
	SELECT @nome_imagem = replace(@nome_imagem, 'delete', '')
	SELECT @nome_imagem = replace(@nome_imagem, 'select', '')
	SELECT @nome_imagem = replace(@nome_imagem, 'update', '')
	SELECT @nome_imagem = replace(@nome_imagem, 'alter', '')
	SELECT @nome_imagem = replace(@nome_imagem, 'drop', '')
	SELECT @nome_imagem = replace(@nome_imagem, 'truncate', '')
	SELECT @nome_imagem = replace(@nome_imagem, 'or', '')
	SELECT @nome_imagem = replace(@nome_imagem, '1=1', '')
		
	SELECT @descricao_imagem = replace(@descricao_imagem, 'insert', '')
	SELECT @descricao_imagem = replace(@descricao_imagem, 'delete', '')
	SELECT @descricao_imagem = replace(@descricao_imagem, 'select', '')
	SELECT @descricao_imagem = replace(@descricao_imagem, 'update', '')
	SELECT @descricao_imagem = replace(@descricao_imagem, 'alter', '')
	SELECT @descricao_imagem = replace(@descricao_imagem, 'drop', '')
	SELECT @descricao_imagem = replace(@descricao_imagem, 'truncate', '')
	SELECT @descricao_imagem = replace(@descricao_imagem, 'or', '')
	SELECT @descricao_imagem = replace(@descricao_imagem, '1=1', '')
				
	INSERT INTO tbl_imagem(nome_imagem, descricao_imagem, data_imagem)
	VALUES(@nome_imagem, @descricao_imagem, @data_imagem)
END




GO
/****** Object:  StoredProcedure [dbo].[sp_cadastra_noticia]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_cadastra_noticia]
	@nome_noticia AS VARCHAR(45),
	@descricao_noticia AS VARCHAR(150),
	@data_noticia AS DATETIME
AS
BEGIN
	SELECT @nome_noticia = replace(@nome_noticia, 'insert', '')
	SELECT @nome_noticia = replace(@nome_noticia, 'delete', '')
	SELECT @nome_noticia = replace(@nome_noticia, 'select', '')
	SELECT @nome_noticia = replace(@nome_noticia, 'update', '')
	SELECT @nome_noticia = replace(@nome_noticia, 'alter', '')
	SELECT @nome_noticia = replace(@nome_noticia, 'drop', '')
	SELECT @nome_noticia = replace(@nome_noticia, 'truncate', '')
	SELECT @nome_noticia = replace(@nome_noticia, 'or', '')
	SELECT @nome_noticia = replace(@nome_noticia, '1=1', '')
		
	SELECT @descricao_noticia = replace(@descricao_noticia, 'insert', '')
	SELECT @descricao_noticia = replace(@descricao_noticia, 'delete', '')
	SELECT @descricao_noticia = replace(@descricao_noticia, 'select', '')
	SELECT @descricao_noticia = replace(@descricao_noticia, 'update', '')
	SELECT @descricao_noticia = replace(@descricao_noticia, 'alter', '')
	SELECT @descricao_noticia = replace(@descricao_noticia, 'drop', '')
	SELECT @descricao_noticia = replace(@descricao_noticia, 'truncate', '')
	SELECT @descricao_noticia = replace(@descricao_noticia, 'or', '')
	SELECT @descricao_noticia = replace(@descricao_noticia, '1=1', '')
				
	INSERT INTO tbl_noticia(nome_noticia, descricao_noticia, data_noticia)
	VALUES(@nome_noticia, @descricao_noticia, @data_noticia)
END




GO
/****** Object:  StoredProcedure [dbo].[sp_cadastra_usuario]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_cadastra_usuario]
	@nivel_acesso AS INT,
	@nome_usuario AS VARCHAR(45),
	@telefone_usuario AS VARCHAR(15),
	@email_usuario AS VARCHAR(45),
	@senha_usuario AS VARCHAR(40)
AS
BEGIN
	SELECT @nome_usuario = replace(@nome_usuario, 'insert', '')
	SELECT @nome_usuario = replace(@nome_usuario, 'delete', '')
	SELECT @nome_usuario = replace(@nome_usuario, 'select', '')
	SELECT @nome_usuario = replace(@nome_usuario, 'update', '')
	SELECT @nome_usuario = replace(@nome_usuario, 'alter', '')
	SELECT @nome_usuario = replace(@nome_usuario, 'drop', '')
	SELECT @nome_usuario = replace(@nome_usuario, 'truncate', '')
	SELECT @nome_usuario = replace(@nome_usuario, 'or', '')
	SELECT @nome_usuario = replace(@nome_usuario, '1=1', '')
		
	SELECT @telefone_usuario = replace(@telefone_usuario, 'insert', '')
	SELECT @telefone_usuario = replace(@telefone_usuario, 'delete', '')
	SELECT @telefone_usuario = replace(@telefone_usuario, 'select', '')
	SELECT @telefone_usuario = replace(@telefone_usuario, 'update', '')
	SELECT @telefone_usuario = replace(@telefone_usuario, 'alter', '')
	SELECT @telefone_usuario = replace(@telefone_usuario, 'drop', '')
	SELECT @telefone_usuario = replace(@telefone_usuario, 'truncate', '')
	SELECT @telefone_usuario = replace(@telefone_usuario, 'or', '')
	SELECT @telefone_usuario = replace(@telefone_usuario, '1=1', '')
				
	SELECT @email_usuario = replace(@email_usuario, 'insert', '')
	SELECT @email_usuario = replace(@email_usuario, 'delete', '')
	SELECT @email_usuario = replace(@email_usuario, 'select', '')
	SELECT @email_usuario = replace(@email_usuario, 'update', '')
	SELECT @email_usuario = replace(@email_usuario, 'alter', '')
	SELECT @email_usuario = replace(@email_usuario, 'drop', '')
	SELECT @email_usuario = replace(@email_usuario, 'truncate', '')
	SELECT @email_usuario = replace(@email_usuario, 'or', '')
	SELECT @email_usuario = replace(@email_usuario, '1=1', '')
		
	SELECT @senha_usuario = replace(@senha_usuario, 'insert', '')
	SELECT @senha_usuario = replace(@senha_usuario, 'delete', '')
	SELECT @senha_usuario = replace(@senha_usuario, 'select', '')
	SELECT @senha_usuario = replace(@senha_usuario, 'update', '')
	SELECT @senha_usuario = replace(@senha_usuario, 'alter', '')
	SELECT @senha_usuario = replace(@senha_usuario, 'drop', '')
	SELECT @senha_usuario = replace(@senha_usuario, 'truncate', '')
	SELECT @senha_usuario = replace(@senha_usuario, 'or', '')
	
	INSERT INTO tbl_usuario(nivel_acesso, nome_usuario, telefone_usuario, email_usuario, senha_usuario)
	VALUES(@nivel_acesso, @nome_usuario, @telefone_usuario, @email_usuario, @senha_usuario)
END




GO
/****** Object:  StoredProcedure [dbo].[sp_carrega_usuario]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_carrega_usuario]
	@email_usuario AS VARCHAR(45),
	@senha_usuario AS VARCHAR (40)
AS
BEGIN
	SELECT * FROM tbl_usuario WHERE email_usuario = @email_usuario AND senha_usuario = @senha_usuario
END



GO
/****** Object:  StoredProcedure [dbo].[sp_envia_mensagem]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_envia_mensagem]
	@nome_solicitante AS VARCHAR(45),
	@telefone_solicitante AS VARCHAR(15),
	@email_solicitante AS VARCHAR(45),
	@assunto_mensagem AS VARCHAR(10),
	@mensagem_solicitante AS VARCHAR(150),
	@data_mensagem AS DATETIME
AS
BEGIN
	SELECT @nome_solicitante = replace(@nome_solicitante, 'insert', '')
	SELECT @nome_solicitante = replace(@nome_solicitante, 'delete', '')
	SELECT @nome_solicitante = replace(@nome_solicitante, 'select', '')
	SELECT @nome_solicitante = replace(@nome_solicitante, 'update', '')
	SELECT @nome_solicitante = replace(@nome_solicitante, 'alter', '')
	SELECT @nome_solicitante = replace(@nome_solicitante, 'drop', '')
	SELECT @nome_solicitante = replace(@nome_solicitante, 'truncate', '')
	SELECT @nome_solicitante = replace(@nome_solicitante, 'or', '')
	SELECT @nome_solicitante = replace(@nome_solicitante, '1=1', '')
		
	SELECT @telefone_solicitante = replace(@telefone_solicitante, 'insert', '')
	SELECT @telefone_solicitante = replace(@telefone_solicitante, 'delete', '')
	SELECT @telefone_solicitante = replace(@telefone_solicitante, 'select', '')
	SELECT @telefone_solicitante = replace(@telefone_solicitante, 'update', '')
	SELECT @telefone_solicitante = replace(@telefone_solicitante, 'alter', '')
	SELECT @telefone_solicitante = replace(@telefone_solicitante, 'drop', '')
	SELECT @telefone_solicitante = replace(@telefone_solicitante, 'truncate', '')
	SELECT @telefone_solicitante = replace(@telefone_solicitante, 'or', '')
	SELECT @telefone_solicitante = replace(@telefone_solicitante, '1=1', '')
				
	SELECT @email_solicitante = replace(@email_solicitante, 'insert', '')
	SELECT @email_solicitante = replace(@email_solicitante, 'delete', '')
	SELECT @email_solicitante = replace(@email_solicitante, 'select', '')
	SELECT @email_solicitante = replace(@email_solicitante, 'update', '')
	SELECT @email_solicitante = replace(@email_solicitante, 'alter', '')
	SELECT @email_solicitante = replace(@email_solicitante, 'drop', '')
	SELECT @email_solicitante = replace(@email_solicitante, 'truncate', '')
	SELECT @email_solicitante = replace(@email_solicitante, 'or', '')
	SELECT @email_solicitante = replace(@email_solicitante, '1=1', '')
		
	SELECT @mensagem_solicitante = replace(@mensagem_solicitante, 'insert', '')
	SELECT @mensagem_solicitante = replace(@mensagem_solicitante, 'delete', '')
	SELECT @mensagem_solicitante = replace(@mensagem_solicitante, 'select', '')
	SELECT @mensagem_solicitante = replace(@mensagem_solicitante, 'update', '')
	SELECT @mensagem_solicitante = replace(@mensagem_solicitante, 'alter', '')
	SELECT @mensagem_solicitante = replace(@mensagem_solicitante, 'drop', '')
	SELECT @mensagem_solicitante = replace(@mensagem_solicitante, 'truncate', '')
	SELECT @mensagem_solicitante = replace(@mensagem_solicitante, 'or', '')
	
	INSERT INTO tbl_fale_conosco(nome_solicitante, telefone_solicitante, email_solicitante, assunto_mensagem, mensagem_solicitante, data_mensagem)
	VALUES(@nome_solicitante, @telefone_solicitante, @email_solicitante, @assunto_mensagem, @mensagem_solicitante, @data_mensagem)
END



GO
/****** Object:  StoredProcedure [dbo].[sp_exclui_conta]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_exclui_conta]

@email_usuario AS VARCHAR(45)

AS
BEGIN	

DELETE FROM tbl_usuario
WHERE email_usuario = @email_usuario

END

GO
/****** Object:  StoredProcedure [dbo].[sp_exclui_imagem]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_exclui_imagem]
@id_imagem AS INT
AS
BEGIN	
   Delete FROM tbl_imagem 
   Where @id_imagem = id_imagem
END

GO
/****** Object:  StoredProcedure [dbo].[sp_exclui_mensagem]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_exclui_mensagem]
@id_chamado AS INT
AS
BEGIN	
   Delete FROM tbl_fale_conosco 
   Where @id_chamado = id_chamado
END

GO
/****** Object:  StoredProcedure [dbo].[sp_exclui_noticia]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_exclui_noticia]
@id_noticia AS INT
AS
BEGIN	
   Delete FROM tbl_noticia
   Where @id_noticia = id_noticia
END

GO
/****** Object:  StoredProcedure [dbo].[sp_pesquisa_conta]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_pesquisa_conta]

@email_usuario AS VARCHAR(45)

AS
BEGIN	

    SELECT * FROM  tbl_usuario
    Where email_usuario <> @email_usuario
    
END

GO
/****** Object:  StoredProcedure [dbo].[sp_pesquisa_imagem]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_pesquisa_imagem]
@parametro_imagem AS VARCHAR (45)
	
AS
BEGIN
	SELECT  @parametro_imagem = replace( @parametro_imagem, 'insert', '')
	SELECT  @parametro_imagem = replace( @parametro_imagem, 'delete', '')
	SELECT  @parametro_imagem = replace( @parametro_imagem, 'select', '')
	SELECT  @parametro_imagem = replace( @parametro_imagem, 'update', '')
	SELECT  @parametro_imagem = replace( @parametro_imagem, 'alter', '')
	SELECT  @parametro_imagem = replace( @parametro_imagem, 'drop', '')
	SELECT  @parametro_imagem = replace( @parametro_imagem, 'truncate', '')
	SELECT  @parametro_imagem = replace( @parametro_imagem, 'or', '')
	SELECT  @parametro_imagem = replace( @parametro_imagem, '1=1', '')

IF @parametro_imagem = ''

  SELECT * FROM dbo.tbl_imagem

ELSE
  SELECT * FROM tbl_imagem
  WHERE nome_imagem like @parametro_imagem OR descricao_imagem like @parametro_imagem 
  ORDER BY data_imagem DESC
END


GO
/****** Object:  StoredProcedure [dbo].[sp_pesquisa_mensagem]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_pesquisa_mensagem]

AS
BEGIN	
    SELECT * FROM tbl_fale_conosco 
    ORDER BY data_mensagem DESC
END

GO
/****** Object:  StoredProcedure [dbo].[sp_pesquisa_noticia]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_pesquisa_noticia]
@parametro_pesquisa AS VARCHAR (45)
	
AS
BEGIN	
	SELECT  @parametro_pesquisa = replace( @parametro_pesquisa, 'insert', '')
	SELECT  @parametro_pesquisa = replace( @parametro_pesquisa, 'delete', '')
	SELECT  @parametro_pesquisa = replace( @parametro_pesquisa, 'select', '')
	SELECT  @parametro_pesquisa = replace( @parametro_pesquisa, 'update', '')
	SELECT  @parametro_pesquisa = replace( @parametro_pesquisa, 'alter', '')
	SELECT  @parametro_pesquisa = replace( @parametro_pesquisa, 'drop', '')
	SELECT  @parametro_pesquisa = replace( @parametro_pesquisa, 'truncate', '')
	SELECT  @parametro_pesquisa = replace( @parametro_pesquisa, 'or', '')
	SELECT  @parametro_pesquisa = replace( @parametro_pesquisa, '1=1', '')

IF @parametro_pesquisa = ''

  SELECT * FROM dbo.tbl_noticia

ELSE
  SELECT * FROM tbl_noticia 
  WHERE nome_noticia like  @parametro_pesquisa OR descricao_noticia like  @parametro_pesquisa 
  ORDER BY data_noticia DESC
END


GO
/****** Object:  StoredProcedure [dbo].[sp_valida_email]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_valida_email]
	@email_usuario AS VARCHAR(45)
AS
BEGIN
	SELECT id_login FROM tbl_usuario WHERE email_usuario = @email_usuario
END



GO
/****** Object:  StoredProcedure [dbo].[sp_valida_imagem]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_valida_imagem]
	@nome_imagem AS VARCHAR(45)
AS
BEGIN
	SELECT id_imagem FROM tbl_imagem WHERE nome_imagem = @nome_imagem
END




GO
/****** Object:  StoredProcedure [dbo].[sp_valida_login]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_valida_login]
	@email_usuario AS VARCHAR(45),
	@senha_usuario AS VARCHAR (40)
AS
BEGIN
	SELECT id_login FROM tbl_usuario WHERE email_usuario = @email_usuario AND senha_usuario = @senha_usuario
END



GO
/****** Object:  StoredProcedure [dbo].[sp_valida_noticia]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_valida_noticia]
	@nome_noticia AS VARCHAR(45)
AS
BEGIN
	SELECT id_noticia FROM tbl_noticia WHERE nome_noticia = @nome_noticia
END




GO
/****** Object:  StoredProcedure [dbo].[sp_visualiza_mensagem]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_visualiza_mensagem]
@id_chamado AS INT
AS
BEGIN	
   Select * FROM tbl_fale_conosco 
   Where @id_chamado = id_chamado
END

GO
/****** Object:  Table [dbo].[tbl_fale_conosco]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_fale_conosco](
	[id_chamado] [int] IDENTITY(1,1) NOT NULL,
	[nome_solicitante] [varchar](45) NOT NULL,
	[email_solicitante] [varchar](45) NOT NULL,
	[telefone_solicitante] [varchar](15) NOT NULL,
	[assunto_mensagem] [varchar](20) NOT NULL,
	[mensagem_solicitante] [varchar](150) NOT NULL,
	[data_mensagem] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_fale_conosco] PRIMARY KEY CLUSTERED 
(
	[id_chamado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_imagem]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_imagem](
	[id_imagem] [int] IDENTITY(1,1) NOT NULL,
	[nome_imagem] [varchar](45) NOT NULL,
	[descricao_imagem] [varchar](150) NOT NULL,
	[data_imagem] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_imagens] PRIMARY KEY CLUSTERED 
(
	[id_imagem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_noticia]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_noticia](
	[id_noticia] [int] IDENTITY(1,1) NOT NULL,
	[nome_noticia] [varchar](45) NOT NULL,
	[descricao_noticia] [varchar](150) NOT NULL,
	[data_noticia] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_noticia] PRIMARY KEY CLUSTERED 
(
	[id_noticia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_usuario]    Script Date: 29/08/2012 23:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_usuario](
	[id_login] [int] IDENTITY(1,1) NOT NULL,
	[nome_usuario] [varchar](45) NOT NULL,
	[email_usuario] [varchar](45) NOT NULL,
	[senha_usuario] [varchar](40) NOT NULL,
	[telefone_usuario] [varchar](15) NOT NULL,
	[nivel_acesso] [int] NOT NULL,
 CONSTRAINT [PK_tbl_usuario] PRIMARY KEY CLUSTERED 
(
	[id_login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [jj_construcoes] SET  READ_WRITE 
GO
