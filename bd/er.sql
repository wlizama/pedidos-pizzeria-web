-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema pedidos-pizzeria-web
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pedidos-pizzeria-web
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pedidos-pizzeria-web` ;
USE `pedidos-pizzeria-web` ;

-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`roles` (
  `IdRol` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IdRol`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`formulario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`formulario` (
  `IdFormulario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `alias` VARCHAR(45) NULL,
  `idSistema` INT NOT NULL,
  PRIMARY KEY (`IdFormulario`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`acceso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`acceso` (
  `IdAcceso` INT NOT NULL AUTO_INCREMENT,
  `acceso` TINYINT NOT NULL DEFAULT 0,
  `IdFormulario` INT NOT NULL,
  `IdRol` INT NOT NULL,
  PRIMARY KEY (`IdAcceso`),
  INDEX `Acceso_ibfk_2` (`IdRol` ASC),
  INDEX `fk_acceso_1_idx` (`IdFormulario` ASC),
  CONSTRAINT `Acceso_ibfk_2`
    FOREIGN KEY (`IdRol`)
    REFERENCES `pedidos-pizzeria-web`.`roles` (`IdRol`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_acceso_1`
    FOREIGN KEY (`IdFormulario`)
    REFERENCES `pedidos-pizzeria-web`.`formulario` (`IdFormulario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`tipoPersona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`tipoPersona` (
  `IdTipoPersona` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`IdTipoPersona`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`tipoDocumentoIdentidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`tipoDocumentoIdentidad` (
  `IdTipoDocIdentidad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NULL DEFAULT NULL,
  `cantidad_caracteres` INT NULL DEFAULT NULL,
  PRIMARY KEY (`IdTipoDocIdentidad`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`documentoIdentidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`documentoIdentidad` (
  `IdDocumentoIdentidad` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(15) NOT NULL,
  `IdTipoDocIdentidad` INT NOT NULL,
  PRIMARY KEY (`IdDocumentoIdentidad`),
  INDEX `R_29` (`IdTipoDocIdentidad` ASC),
  CONSTRAINT `DocumentoIdentidad_ibfk_1`
    FOREIGN KEY (`IdTipoDocIdentidad`)
    REFERENCES `pedidos-pizzeria-web`.`tipoDocumentoIdentidad` (`IdTipoDocIdentidad`))
ENGINE = InnoDB
AUTO_INCREMENT = 30
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`tipoestado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`tipoestado` (
  `IdTipoEstado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`IdTipoEstado`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`estado` (
  `IdEstado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `IdTipoEstado` INT NULL DEFAULT NULL,
  PRIMARY KEY (`IdEstado`),
  INDEX `fk_Estado_1_idx` (`IdTipoEstado` ASC),
  CONSTRAINT `fk_Estado_1`
    FOREIGN KEY (`IdTipoEstado`)
    REFERENCES `pedidos-pizzeria-web`.`tipoestado` (`IdTipoEstado`))
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`persona` (
  `IdPersona` INT NOT NULL AUTO_INCREMENT,
  `nombres` VARCHAR(150) NULL DEFAULT NULL,
  `apellidos` VARCHAR(150) NULL DEFAULT NULL,
  `telefono` VARCHAR(10) NULL DEFAULT NULL,
  `celular` VARCHAR(15) NULL,
  `IdTipoPersona` INT NOT NULL,
  `IdDocumentoIdentidad` INT NOT NULL,
  `IdEstado` INT NOT NULL,
  PRIMARY KEY (`IdPersona`),
  INDEX `R_18` (`IdTipoPersona` ASC),
  INDEX `R_30` (`IdDocumentoIdentidad` ASC),
  INDEX `R_36` (`IdEstado` ASC),
  CONSTRAINT `Persona_ibfk_1`
    FOREIGN KEY (`IdTipoPersona`)
    REFERENCES `pedidos-pizzeria-web`.`tipoPersona` (`IdTipoPersona`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `Persona_ibfk_2`
    FOREIGN KEY (`IdDocumentoIdentidad`)
    REFERENCES `pedidos-pizzeria-web`.`documentoIdentidad` (`IdDocumentoIdentidad`),
  CONSTRAINT `Persona_ibfk_3`
    FOREIGN KEY (`IdEstado`)
    REFERENCES `pedidos-pizzeria-web`.`estado` (`IdEstado`))
ENGINE = InnoDB
AUTO_INCREMENT = 29
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`cliente` (
  `IdCliente` INT NOT NULL AUTO_INCREMENT,
  `IdPersona` INT NOT NULL,
  `nombre_usuario` VARCHAR(50) NULL,
  `contrasenha` VARCHAR(50) NULL,
  PRIMARY KEY (`IdCliente`),
  INDEX `R_43` (`IdPersona` ASC),
  CONSTRAINT `Cliente_ibfk_1`
    FOREIGN KEY (`IdPersona`)
    REFERENCES `pedidos-pizzeria-web`.`persona` (`IdPersona`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT)
ENGINE = InnoDB
AUTO_INCREMENT = 20
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`tipocomprobante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`tipocomprobante` (
  `IdTipoComprobante` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `IdEstado` INT NOT NULL,
  PRIMARY KEY (`IdTipoComprobante`),
  INDEX `R_39` (`IdEstado` ASC),
  CONSTRAINT `TipoComprobante_ibfk_1`
    FOREIGN KEY (`IdEstado`)
    REFERENCES `pedidos-pizzeria-web`.`estado` (`IdEstado`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`distrito`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`distrito` (
  `IdDistrito` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `cobertura` TINYINT(1) NOT NULL,
  PRIMARY KEY (`IdDistrito`))
ENGINE = InnoDB
AUTO_INCREMENT = 44
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`direccionCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`direccionCliente` (
  `iddireccionCliente` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(250) NULL,
  `referencia` VARCHAR(250) NULL,
  `latitud` DECIMAL(18,6) NULL,
  `longitud` DECIMAL(18,6) NULL,
  `principal` TINYINT NULL,
  `idDistrito` INT NOT NULL,
  `idCliente` INT NOT NULL,
  PRIMARY KEY (`iddireccionCliente`),
  INDEX `fk_direccionCliente_1_idx` (`idDistrito` ASC),
  INDEX `fk_direccionCliente_2_idx` (`idCliente` ASC),
  CONSTRAINT `fk_direccionCliente_1`
    FOREIGN KEY (`idDistrito`)
    REFERENCES `pedidos-pizzeria-web`.`distrito` (`IdDistrito`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_direccionCliente_2`
    FOREIGN KEY (`idCliente`)
    REFERENCES `pedidos-pizzeria-web`.`cliente` (`IdCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`pedido` (
  `IdPedido` INT NOT NULL AUTO_INCREMENT,
  `numero` INT NOT NULL DEFAULT '0',
  `fecha_creacion` DATETIME NOT NULL,
  `observaciones` VARCHAR(50) NULL DEFAULT NULL,
  `IdCliente` INT NOT NULL,
  `IdEstado` INT NOT NULL,
  `fecha_preparacion` DATETIME NULL,
  `fecha_entrega` DATETIME NULL,
  `idDireccionEnvio` INT NOT NULL,
  PRIMARY KEY (`IdPedido`),
  UNIQUE INDEX `numero_UNIQUE` (`numero` ASC),
  INDEX `R_15` (`IdEstado` ASC),
  INDEX `R_26` (`IdCliente` ASC),
  INDEX `fk_pedido_1_idx` (`idDireccionEnvio` ASC),
  CONSTRAINT `Pedido_ibfk_1`
    FOREIGN KEY (`IdEstado`)
    REFERENCES `pedidos-pizzeria-web`.`estado` (`IdEstado`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `Pedido_ibfk_2`
    FOREIGN KEY (`IdCliente`)
    REFERENCES `pedidos-pizzeria-web`.`cliente` (`IdCliente`),
  CONSTRAINT `fk_pedido_1`
    FOREIGN KEY (`idDireccionEnvio`)
    REFERENCES `pedidos-pizzeria-web`.`direccionCliente` (`iddireccionCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`comprobante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`comprobante` (
  `IdComprobante` INT NOT NULL AUTO_INCREMENT,
  `numero` INT NOT NULL DEFAULT '0',
  `fecha_emision` DATETIME NOT NULL,
  `subtotal` DECIMAL(18,2) NOT NULL,
  `IdPedido` INT NOT NULL,
  `IdTipoComprobante` INT NOT NULL,
  `IdEstado` INT NOT NULL,
  `total` DECIMAL(18,2) NULL,
  PRIMARY KEY (`IdComprobante`),
  UNIQUE INDEX `numero_UNIQUE` (`numero` ASC),
  INDEX `R_14` (`IdTipoComprobante` ASC),
  INDEX `R_25` (`IdPedido` ASC),
  INDEX `R_45` (`IdEstado` ASC),
  CONSTRAINT `Comprobante_ibfk_1`
    FOREIGN KEY (`IdTipoComprobante`)
    REFERENCES `pedidos-pizzeria-web`.`tipocomprobante` (`IdTipoComprobante`),
  CONSTRAINT `Comprobante_ibfk_2`
    FOREIGN KEY (`IdPedido`)
    REFERENCES `pedidos-pizzeria-web`.`pedido` (`IdPedido`),
  CONSTRAINT `Comprobante_ibfk_3`
    FOREIGN KEY (`IdEstado`)
    REFERENCES `pedidos-pizzeria-web`.`estado` (`IdEstado`))
ENGINE = InnoDB
AUTO_INCREMENT = 17
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`repartidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`repartidor` (
  `idRepartidor` INT NOT NULL AUTO_INCREMENT,
  `IdPersona` INT NOT NULL,
  `placa_unidad` VARCHAR(10) NULL,
  PRIMARY KEY (`idRepartidor`),
  UNIQUE INDEX `idRepartidor_UNIQUE` (`idRepartidor` ASC),
  INDEX `fk_repartidor_1_idx` (`IdPersona` ASC),
  CONSTRAINT `fk_repartidor_1`
    FOREIGN KEY (`IdPersona`)
    REFERENCES `pedidos-pizzeria-web`.`persona` (`IdPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`envio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`envio` (
  `IdEnvio` INT NOT NULL AUTO_INCREMENT,
  `hora_inicio` DATETIME NOT NULL,
  `hora_fin` DATETIME NOT NULL,
  `numero` INT NOT NULL DEFAULT '0',
  `idRepartidor` INT NOT NULL,
  `IdEstado` INT NOT NULL,
  PRIMARY KEY (`IdEnvio`),
  INDEX `R_35` (`IdEstado` ASC),
  INDEX `fk_envio_1_idx` (`idRepartidor` ASC),
  CONSTRAINT `Envio_ibfk_2`
    FOREIGN KEY (`IdEstado`)
    REFERENCES `pedidos-pizzeria-web`.`estado` (`IdEstado`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_envio_1`
    FOREIGN KEY (`idRepartidor`)
    REFERENCES `pedidos-pizzeria-web`.`repartidor` (`idRepartidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 13
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`detalleEnvio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`detalleEnvio` (
  `IdDetalleEnvio` INT NOT NULL AUTO_INCREMENT,
  `hora_entrega` DATETIME NOT NULL,
  `observaciones` VARCHAR(500) NULL DEFAULT NULL,
  `IdEnvio` INT NOT NULL,
  `IdPedido` INT NOT NULL,
  `IdEstado` INT NOT NULL,
  PRIMARY KEY (`IdDetalleEnvio`),
  INDEX `fk_detalleEnvio_1_idx` (`IdEstado` ASC),
  INDEX `fk_detalleEnvio_2_idx` (`IdEnvio` ASC),
  INDEX `fk_detalleEnvio_3_idx` (`IdPedido` ASC),
  CONSTRAINT `fk_detalleEnvio_1`
    FOREIGN KEY (`IdEstado`)
    REFERENCES `pedidos-pizzeria-web`.`estado` (`IdEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleEnvio_2`
    FOREIGN KEY (`IdEnvio`)
    REFERENCES `pedidos-pizzeria-web`.`envio` (`IdEnvio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalleEnvio_3`
    FOREIGN KEY (`IdPedido`)
    REFERENCES `pedidos-pizzeria-web`.`pedido` (`IdPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`tipoProducto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`tipoProducto` (
  `idTipoProducto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(150) NOT NULL,
  `descripcion` VARCHAR(500) NULL,
  PRIMARY KEY (`idTipoProducto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`producto` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(250) NULL,
  `descripcion` VARCHAR(500) NULL,
  `precio` DECIMAL(18,2) NOT NULL,
  `imagen` VARCHAR(500) NULL,
  `idTipoProducto` INT NOT NULL,
  `IdEstado` INT NOT NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_producto_1_idx` (`IdEstado` ASC),
  INDEX `fk_producto_2_idx` (`idTipoProducto` ASC),
  CONSTRAINT `fk_producto_1`
    FOREIGN KEY (`IdEstado`)
    REFERENCES `pedidos-pizzeria-web`.`estado` (`IdEstado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto_2`
    FOREIGN KEY (`idTipoProducto`)
    REFERENCES `pedidos-pizzeria-web`.`tipoProducto` (`idTipoProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`detallepedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`detallepedido` (
  `IdDetallePedido` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `IdPedido` INT NOT NULL,
  `idProducto` INT NOT NULL,
  `precio` DECIMAL(18,2) NULL,
  PRIMARY KEY (`IdDetallePedido`),
  INDEX `R_11` (`IdPedido` ASC),
  INDEX `fk_detallepedido_1_idx` (`idProducto` ASC),
  CONSTRAINT `DetallePedido_ibfk_1`
    FOREIGN KEY (`IdPedido`)
    REFERENCES `pedidos-pizzeria-web`.`pedido` (`IdPedido`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_detallepedido_1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `pedidos-pizzeria-web`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 53
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`tipopizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`tipopizza` (
  `IdTipoPizza` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(250) NOT NULL,
  `descripcion` VARCHAR(500) NULL,
  PRIMARY KEY (`IdTipoPizza`))
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`tamanho`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`tamanho` (
  `IdTamanho` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `cantidadPorciones` INT NOT NULL,
  PRIMARY KEY (`IdTamanho`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`pizza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`pizza` (
  `IdPizza` INT NOT NULL AUTO_INCREMENT,
  `IdTipoPizza` INT NOT NULL,
  `IdTamanho` INT NOT NULL,
  `IdEstado` INT NOT NULL,
  `idProducto` INT NOT NULL,
  PRIMARY KEY (`IdPizza`),
  INDEX `R_12` (`IdTipoPizza` ASC),
  INDEX `R_44` (`IdEstado` ASC),
  INDEX `Pizza_ibfk_2` (`IdTamanho` ASC),
  INDEX `fk_pizza_1_idx` (`idProducto` ASC),
  CONSTRAINT `Pizza_ibfk_1`
    FOREIGN KEY (`IdTipoPizza`)
    REFERENCES `pedidos-pizzeria-web`.`tipopizza` (`IdTipoPizza`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `Pizza_ibfk_2`
    FOREIGN KEY (`IdTamanho`)
    REFERENCES `pedidos-pizzeria-web`.`tamanho` (`IdTamanho`),
  CONSTRAINT `Pizza_ibfk_3`
    FOREIGN KEY (`IdEstado`)
    REFERENCES `pedidos-pizzeria-web`.`estado` (`IdEstado`),
  CONSTRAINT `fk_pizza_1`
    FOREIGN KEY (`idProducto`)
    REFERENCES `pedidos-pizzeria-web`.`producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `pedidos-pizzeria-web`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pedidos-pizzeria-web`.`usuario` (
  `IdUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombre_usuario` VARCHAR(50) NOT NULL,
  `contrasenha` VARCHAR(50) NOT NULL,
  `IdPersona` INT NOT NULL,
  `IdRol` INT NOT NULL,
  PRIMARY KEY (`IdUsuario`),
  INDEX `R_32` (`IdPersona` ASC),
  INDEX `R_34` (`IdRol` ASC),
  CONSTRAINT `Usuario_ibfk_1`
    FOREIGN KEY (`IdPersona`)
    REFERENCES `pedidos-pizzeria-web`.`persona` (`IdPersona`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `Usuario_ibfk_2`
    FOREIGN KEY (`IdRol`)
    REFERENCES `pedidos-pizzeria-web`.`roles` (`IdRol`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `pedidos-pizzeria-web` ;

-- -----------------------------------------------------
-- procedure SP_AccesoUsuario
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_AccesoUsuario`(
    IdUsuario int
)
BEGIN
    select 
        f.IdFormulario,
        f.nombre
    from formulario f 
    join acceso a on f.IdFormulario = a.IdFormulario
    join roles r on a.IdRol = r.IdRol 
    join usuario u on r.IdRol = u.IdRol
    where u.IdUsuario = IdUsuario;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_Cliente
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Cliente`(
	In IdCliente int
)
BEGIN
    select
		c.IdCliente,
        p.IdPersona,
		p.nombres,
		p.apellidos,
		p.telefono,
        p.IdTipoPersona,
        tp.nombre as tipoPersona,
        p.IdDocumentoIdentidad,
        di.numero as documentoIdentidad,
        di.IdTipoDocIdentidad,
        p.IdEstado,
        e.nombre as estado
    from cliente c inner join persona p on c.IdPersona = p.IdPersona
    inner join tipopersona tp on p.IdTipoPersona = tp.IdTipoPersona
    inner join documentoIdentidad di on p.IdDocumentoIdentidad = di.IdDocumentoIdentidad
    inner join estado e on p.IdEstado = e.IdEstado
    where c.IdCliente = idcliente;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ClienteDireccion
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteDireccion`(
	In idDireccion int
)
BEGIN
    select
		d.idDireccion,
        d.direccion,
        d.referencia,
        d.principal,
        d.IdDistrito,
        dt.nombre as distrito,
        dt.cobertura,
        d.IdCliente
    from direccion d
    join distrito dt on d.IdDistrito = dt.IdDistrito
    where d.idDireccion = idDireccion;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ClienteDireccionInserta
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteDireccionInserta`(
	Out IdDireccion int,
	In direccion varchar(100),
	In referencia varchar(150),
	In idcliente int,
	In iddistrito int,
	In principal tinyint
)
BEGIN
	
    if principal = 1 then
		update direccion d set d.principal = 0 where d.IdCliente = idcliente;
    end if;
    
    insert into direccion (direccion, referencia, IdCliente, IdDistrito, principal, IdEstado)
    values (direccion, referencia, idcliente, iddistrito, principal, 1); -- 1 = activo
    
    SET IdDireccion = LAST_INSERT_ID();
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ClienteDireccionLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteDireccionLista`(
	In idcliente int
)
BEGIN
    select
		d.idDireccion,
        d.direccion,
        d.referencia,
        d.principal,
        d.IdDistrito,
        dt.nombre as distrito,
        dt.cobertura
    from direccion d
    join distrito dt on d.IdDistrito = dt.IdDistrito
    where d.IdCliente = idcliente;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ClienteDireccionModifica
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteDireccionModifica`(
	In IdDireccion int,
	In direccion varchar(100),
	In referencia varchar(150),
    In idcliente int,
	In iddistrito int,
	In principal tinyint)
BEGIN
	if principal = 1 then
		update direccion d set d.principal = 0 where d.IdCliente = idcliente;
    end if;

    update direccion d
		set d.direccion = direccion,
        d.referencia = referencia,
        d.IdDistrito = iddistrito,
        d.principal = principal
    where d.IdDireccion = IdDireccion;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ClienteInserta
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteInserta`(
	OUT IdCliente int,
	In nombres varchar(100),
	In apellidos varchar(100),
    In telefono varchar(10),
	In IdTipoDocIdentidad int,
	In numero varchar(15)
)
BEGIN

    DECLARE last_insert_id INT;
    declare IdTipoPersona int;
    declare estado int;
    declare IdDocumentoIdentidad int;
    
    set IdTipoPersona = 4; -- tipo persona cliente
    set estado = 6; -- estado activo de tipo cliente
    
    insert into documentoIdentidad (numero, IdTipoDocIdentidad)
    value (numero, IdTipoDocIdentidad);

	SET IdDocumentoIdentidad = LAST_INSERT_ID();

	insert into persona (nombres, apellidos, IdTipoPersona, IdDocumentoIdentidad, IdEstado, telefono)
	values (nombres, apellidos, IdTipoPersona, IdDocumentoIdentidad, estado, telefono);
	
	SET last_insert_id = LAST_INSERT_ID(); -- assignment
	
	insert into cliente(IdPersona) values (last_insert_id);   
	
	SET IdCliente = LAST_INSERT_ID();

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ClienteLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteLista`(
	In idtipoDocIdentidad int,
	In numero varchar(15)
)
BEGIN
	declare idtipoDocIdentidad_ini int default 0;
    declare idtipoDocIdentidad_fin int default 999999;
	declare numero_ini varchar(15) default '';
    declare numero_fin varchar(15) default 'ZZZZZZZZZZ';
    
    if idtipoDocIdentidad <> 0 then
        set idtipoDocIdentidad_ini = idtipoDocIdentidad;
        set idtipoDocIdentidad_fin = idtipoDocIdentidad;
    end if;

    if numero <> '' then
        set numero_ini = numero;
        set numero_fin = numero;
    end if;

    select
		c.IdCliente,
        p.IdPersona,
		p.nombres,
		p.apellidos,
		p.telefono,
        p.IdTipoPersona,
        tp.nombre as tipoPersona,
        p.IdDocumentoIdentidad,
        di.numero as documentoIdentidad,
        di.IdTipoDocIdentidad,
        p.IdEstado,
        e.nombre as estado
    from cliente c inner join persona p on c.IdPersona = p.IdPersona
    inner join tipopersona tp on p.IdTipoPersona = tp.IdTipoPersona
    inner join documentoIdentidad di on p.IdDocumentoIdentidad = di.IdDocumentoIdentidad
    inner join estado e on p.IdEstado = e.IdEstado
    and di.IdTipoDocIdentidad between idtipoDocIdentidad_ini and idtipoDocIdentidad_fin
    and di.numero between numero_ini and numero_fin;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ClienteModifica
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClienteModifica`(
	In IdCliente int,
    In nombres varchar(100),
	In apellidos varchar(100),
    In telefono varchar(10),
	In IdTipoDocIdentidad int,
	In numero varchar(15)
)
BEGIN

    update cliente cli
        inner join persona per on cli.IdPersona = per.IdPersona
        inner join documentoIdentidad di on per.IdDocumentoIdentidad = di.IdDocumentoIdentidad
        set per.nombres = nombres,
            per.apellidos = apellidos,
            per.telefono = telefono,
            di.IdTipoDocIdentidad = IdTipoDocIdentidad,
            di.numero = numero
    where cli.idCliente = idcliente;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ClientexTipoDocNumero
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ClientexTipoDocNumero`(
	In idtipoDocIdentidad int,
	In numero varchar(15)
)
BEGIN
    select
		c.IdCliente,
        p.IdPersona,
		p.nombres,
		p.apellidos,
		p.telefono,
        p.IdTipoPersona,
        tp.nombre as tipoPersona,
        p.IdDocumentoIdentidad,
        di.numero as documentoIdentidad,
        di.IdTipoDocIdentidad,
        p.IdEstado,
        e.nombre as estado
    from cliente c inner join persona p on c.IdPersona = p.IdPersona
    inner join tipopersona tp on p.IdTipoPersona = tp.IdTipoPersona
    inner join documentoIdentidad di on p.IdDocumentoIdentidad = di.IdDocumentoIdentidad
    inner join estado e on p.IdEstado = e.IdEstado
    where di.IdTipoDocIdentidad = idtipoDocIdentidad
    and di.numero = numero;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_CoberturaRpt
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CoberturaRpt`(
    fechaCreacion_inicio date,
    fechaCreacion_fin date,
    distrito_id int
)
BEGIN
    declare distritoId_ini int default 0;
    declare distritoId_fin int default 999999;
	
    if distrito_id <> 0 then
        set distritoId_ini = distrito_id;
        set distritoId_fin = distrito_id;
    end if;

    select
        dis.nombre as nomdistrito,
        count(dis.IdDistrito) as cantidadtot,
        sum(com.monto) as preciototal
    from comprobante com
    join pedido p on com.IdPedido = p.IdPedido    
    join direccion d on p.IdDireccionEnvio = d.IdDireccion
    join distrito dis on d.IdDistrito = dis.IdDistrito    
    where p.fechacreacion between fechaCreacion_inicio and fechaCreacion_fin
    and dis.IdDistrito between distritoId_ini and distritoId_fin
    and p.IdEstado in (4,5)
    group by dis.IdDistrito;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_Comprobante
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Comprobante`(
    IdComprobante int
)
BEGIN
    select 
        c.IdComprobante,
        c.numero,
        c.fechaEmision,
        c.horaEmision,
        c.IdTipoComprobante,
        tc.nombre as tipoComprobante,
        c.monto,
        c.IdPedido,
        c.IdEstado,
        e.nombre as estado
    from comprobante c
    join tipocomprobante tc on c.IdTipoComprobante = tc.IdTipoComprobante
    join estado e on c.IdEstado = e.IdEstado
    where c.IdComprobante = IdComprobante;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ComprobanteCabecera
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ComprobanteCabecera`(
In idcomprobante int
)
BEGIN
	select 
        c.IdComprobante,
        c.numero,
        c.monto,
        p.IdPedido,
        p.fechacreacion,
        p.IdCliente,
        per.nombres as cliente,
        per.apellidos as clienteapellidos,
        docide.numero as clientedocIdentidad,
        tdi.nombre as clientetipodocidentidad,
        p.IdDireccionEnvio, 
        dir.direccion as direccionenvio
    from comprobante c 
    join pedido p on c.IdPedido = p.IdPedido
    join cliente cli on p.IdCliente = cli.IdCliente
    join persona per on cli.IdPersona = per.IdPersona
    join direccion dir on p.IdDireccionEnvio = dir.IdDireccion
    join documentoIdentidad docide on per.IdDocumentoIdentidad = docide.IdDocumentoIdentidad
    join tipodocumentoidentidad tdi on docide.IdTipoDocIdentidad = tdi.IdTipoDocIdentidad
    where c.IdComprobante = idcomprobante;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ComprobanteInsertar
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ComprobanteInsertar`(
In fechaemision date,
In horaemision time,
In idtipocomprobante int,
In monto decimal,
In idpedido int,
In idestado int,
Out idcomprobante int,
Out numero int)
BEGIN
    insert into comprobante (fechaemision, horaemision, idtipocomprobante, monto, idpedido, idestado)
    values (fechaEmision, horaEmision, IdTipoComprobante, monto, IdPedido, IdEstado);
    
    set idcomprobante = LAST_INSERT_ID();
    
    select numero into numero from comprobante where IdComprobante = idcomprobante;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ComprobanteLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ComprobanteLista`(
    numero int
)
BEGIN
    declare numero_ini int default 0;
    declare numero_fin int default 999999;
    if numero <> 0 then
        set numero_ini = numero;
        set numero_fin = numero;
    end if;
    select 
        c.IdComprobante,
        c.numero,
        c.monto,
        c.IdPedido,
        pe.IdCliente,
        per.Nombres,
        per.Apellidos        
	from comprobante c
    join pedido pe on c.IdPedido = pe.IdPedido
    join cliente cli on pe.IdCliente = cli.IdCliente
    join persona per on cli.IdPersona = per.IdPersona
    where c.numero between numero_ini and numero_fin;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ComprobanteModifica
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ComprobanteModifica`(
In fechaemision date,
In horaemision time,
In idtipocomprobante int,
In monto decimal,
In idpedido int,
In idestado int,
In idcomprobante int)
BEGIN
    update comprobante set fechaEmision = fechaemision, horaEmision = horaemision, 
    IdTipoComprobante = idtipocomprobante, monto = monto, IdEstado = idestado
    where IdComprobante = idcomprobante;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_ComprobanteXPedido
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ComprobanteXPedido`(
	IN IdPedido int
)
BEGIN
	select 
        c.IdComprobante,
        c.numero,
        c.fechaEmision,
        c.horaEmision,
        c.IdTipoComprobante,
        tc.nombre as tipoComprobante,
        c.monto,
        c.IdPedido,
        c.IdEstado,
        e.nombre as estado
    from comprobante c
    join tipocomprobante tc on c.IdTipoComprobante = tc.IdTipoComprobante
    join estado e on c.IdEstado = e.IdEstado
    where c.IdPedido = IdPedido;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_Distrito
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Distrito`(
    IdDistrito int
)
BEGIN
    select 
        d.IdDistrito,
        d.nombre,
        d.cobertura
    from distrito d
    where d.IdDistrito = IdDistrito;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_DistritoInserta
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DistritoInserta`(
    out IdDistrito int,
    nombre varchar(50),
    cobertura tinyint(1)
)
BEGIN
    insert into distrito (
        nombre,
        cobertura
    )
    values (
        nombre,
        cobertura
    );
    
    SET IdDistrito = LAST_INSERT_ID();
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_DistritoLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DistritoLista`()
BEGIN
    select 
        IdDistrito,
        nombre,
        cobertura
    from distrito d
    where d.cobertura = 1;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_DistritoListaTodos
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DistritoListaTodos`()
BEGIN
	select 
        IdDistrito,
        nombre,
        cobertura
    from distrito d;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_DistritoModifica
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DistritoModifica`(
    IdDistrito int,
    nombre varchar(50),
    cobertura tinyint(1)
)
BEGIN
    update distrito d
        set d.nombre = nombre,
        d.cobertura = cobertura
    where d.IdDistrito = IdDistrito;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_Envio
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Envio`(
	In idEnvio int
)
BEGIN
	select
		e.IdEnvio,
        e.numero,
        e.hora_inicio,
        e.hora_fin,
        e.IdPersona,
        p.nombres as personanombres,
        p.apellidos as personaapellidos,
        p.telefono as personatelefono,
        e.IdEstado,
        est.nombre as estado
	from envio e 
    inner join persona p on e.IdPersona = p.IdPersona
    inner join estado est on e.IdEstado = est.IdEstado
	where e.IdEnvio = idEnvio;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_EnvioDetalle
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EnvioDetalle`(
In iddetalleenvio int
)
BEGIN
    select 
		de.IdDetalleEnvio,
		de.IdEnvio,
        de.IdPedido,
        p.numero,
        cli.IdCliente,
        per.nombres as cliente,
        p.IdDireccionEnvio,
        dir.direccion,
        de.hora_fin,
        de.observaciones
    from detalleenvio de 
    inner join pedido p on de.IdPedido = p.IdPedido
    inner join cliente cli on p.IdCliente = cli.IdCliente
    inner join persona per on cli.IdPersona = per.Idpersona
    inner join direccion dir on p.IdDireccionEnvio = dir.IdDireccion
    where de.IdDetalleEnvio = iddetalleenvio;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_EnvioDetalleEliminar
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EnvioDetalleEliminar`(
In iddetalleenvio int)
BEGIN
    delete from detalleenvio de where de.IdDetalleEnvio = iddetalleenvio;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_EnvioDetalleInserta
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EnvioDetalleInserta`(
out IdDetalleEnvio int,
In hora_fin datetime, 
In observaciones varchar(100) , 
In idenvio int, 
In idpedido int
)
BEGIN
    
    insert into detalleenvio (hora_fin, observaciones, IdEnvio, IdPedido)
    values (hora_fin, observaciones, idenvio, idpedido);
    
    set IdDetalleEnvio = LAST_INSERT_ID();
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_EnvioDetalleLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EnvioDetalleLista`(
	In idenvio int
)
BEGIN
    select 
		de.IdDetalleEnvio,
		de.IdEnvio,
        de.IdPedido,
        p.numero,
        cli.IdCliente,
        per.nombres as cliente,
        p.IdDireccionEnvio,
        dir.direccion,
        de.hora_fin,
        de.observaciones
    from detalleenvio de 
    inner join pedido p on de.IdPedido = p.IdPedido
    inner join cliente cli on p.IdCliente = cli.IdCliente
    inner join persona per on cli.IdPersona = per.Idpersona
    inner join direccion dir on p.IdDireccionEnvio = dir.IdDireccion
    where de.IdEnvio = idenvio;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_EnvioDetalleModifica
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EnvioDetalleModifica`(
	in IdDetalleEnvio int,
	In hora_fin datetime, 
	In observaciones varchar(100),  
	In idpedido int
)
BEGIN
	update detalleenvio de
		set de.hora_fin = hora_fin,
		de.observaciones = observaciones,
		de.IdPedido = idpedido
    where de.IdDetalleEnvio = IdDetalleEnvio;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_EnvioInsertar
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EnvioInsertar`(
	OUT IdEnvio int,
    Out numeroenvio int,
	In horainicio datetime, 
	In horafin datetime, 
	In IdPersona int
)
BEGIN

	declare IdEstadoenvio int;
    declare IdEstadocomprobante int;
    set IdEstadoenvio = 1; -- generado para tipo estado envio
    
    select ifnull(max(numero), 0) +1 into numeroenvio from envio;    

    insert into envio (numero, hora_inicio, hora_fin, IdPersona, IdEstado)
    values (numeroenvio, horainicio, horafin, IdPersona, IdEstadoenvio);
    
    set IdEnvio = LAST_INSERT_ID();
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_EnvioLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EnvioLista`(
	In estado int
)
BEGIN

	declare estado_ini int default 0;
    declare estado_fin int default 999999;
    if estado <> 0 then
        set estado_ini = estado;
        set estado_fin = estado;
    end if;
    
	select
		e.IdEnvio,
        e.numero,
        e.hora_inicio,
        e.hora_fin,
        e.IdPersona,
        p.nombres as personanombres,
        p.apellidos as personaapellidos,
        p.telefono as personatelefono,
        e.IdEstado,
        est.nombre as estado
	from envio e 
    inner join persona p on e.IdPersona = p.IdPersona
    inner join estado est on e.IdEstado = est.IdEstado
	where e.IdEstado between estado_ini and estado_fin;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_EnvioModificar
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EnvioModificar`(
	In idenvio int,
	In horainicio datetime, 
	In horafin datetime, 
	In IdPersona int,
	In IdEstado int
)
BEGIN
	declare IdEstado_upd int;

    update envio e
		set e.hora_inicio = horainicio,
		e.hora_fin = horafin,
		e.IdPersona = IdPersona,
		e.IdEstado = IdEstado
    where e.IdEnvio = idenvio;
	
    /*
    Actualiza estado de pedidos del detalle
    En Camino || Finalizado || Finalizado con incidencias
    */
    if IdEstado = 3 or IdEstado = 4 or IdEstado = 5 then
		set IdEstado_upd = IdEstado;
        if IdEstado = 5 then
			set IdEstado_upd = 4;
		end if;
        
		update pedido p
		inner join detalleenvio de on p.IdPedido = de.IdPedido
        set p.IdEstado = IdEstado_upd
        where de.IdEnvio = idenvio;
    end if;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_Estado
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Estado`(
	IdEstado int
)
BEGIN
	select 
        e.IdEstado,
        e.nombre,
        e.IdTipoEstado
    from estado e
    where e.IdEstado = IdEstado;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_EstadoLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_EstadoLista`(
    IdTipoEstado int
)
BEGIN
    select 
        e.IdEstado,
        e.nombre,
        e.IdTipoEstado
    from estado e
    where e.IdTipoEstado = IdTipoEstado;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_Formulario
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Formulario`(
	IdFormulario int
)
BEGIN
	select 
        r.IdFormulario,
        r.nombre
    from Formulario r
    where r.IdFormulario = IdFormulario;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_FormularioLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FormularioLista`()
BEGIN
	select
		IdFormulario,
        nombre
    from formulario;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_Pedido
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Pedido`(
	In idpedido int
)
BEGIN
    select 
		p.IdPedido,
		p.numero,
        comp.numero as numerocomprobante,
		p.fechacreacion,
        p.horacreacion,
        p.IdDireccionEnvio,
        d.direccion as direccionEnvio,
        dis.IdDistrito as IdDistritoEnvio,
        dis.nombre as distritoEnvio,
        dis.cobertura as coberturaEnvio,
        p.IdCliente,
        per.nombres as cliente,
        p.observaciones,
        p.IdEstado,
        e.nombre as estado
	FROM pedido p 
    inner join cliente c on p.IdCliente = c.IdCliente
    inner join persona per on c.IdPersona = per.IdPersona
	inner join direccion d on p.IdDireccionEnvio = d.IdDireccion
    inner join distrito dis on d.IdDistrito = dis.IdDistrito
	inner join documentoIdentidad di on per.IdDocumentoIdentidad = di.IdDocumentoIdentidad
    inner join comprobante comp on p.IdPedido = comp.IdPedido
    inner join estado e on p.IdEstado = e.IdEstado
    where p.IdPedido = idpedido;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PedidoDetalle
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoDetalle`(
	In iddetallepedido int
)
BEGIN
    select
		dp.IdDetallePedido,
        dp.IdPedido,
		piz.IdPizza,
        piz.nombre,
        piz.IdTamanho,
        tam.nombre as tamanho,
        tam.cantidadPorciones,
        piz.IdTipoPizza,
        tp.nombre as tipoPizza,
        dp.cantidad,
        piz.precio
    from detallepedido dp 
    inner join pizza piz on dp.IdPizza = piz.IdPizza
    inner join tipopizza tp on piz.IdTipoPizza = tp.IdTipoPizza
    inner join tamanho tam on piz.IdTamanho = tam.IdTamanho
    where dp.IdDetallePedido = iddetallepedido;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PedidoDetalleElimina
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoDetalleElimina`(
	In iddetallepedido int,
    In idpedido int
)
BEGIN
    delete from detallepedido dp where dp.IdDetallePedido = iddetallepedido;
    
    -- actualiza monto de comprobante
    call SP_comprobanteActualizaMonto(idpedido);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PedidoDetalleInserta
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoDetalleInserta`(
	Out iddetallepedido int,
	In cantidad int,
	In idpedido int,
	In idpizza int
)
BEGIN
    insert into detallepedido (cantidad, IdPizza, IdPedido)
    values (cantidad, idpizza, idpedido );
    
    SET iddetallepedido = LAST_INSERT_ID();
    
    -- actualiza monto de comprobante
    call SP_comprobanteActualizaMonto(idpedido);
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PedidoDetalleLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoDetalleLista`(
	In idpedido int
)
BEGIN
    select 
		dp.IdDetallePedido,
        dp.IdPedido,
		piz.IdPizza,
        piz.nombre,
        piz.IdTamanho,
        tam.nombre as tamanho,
        tam.cantidadPorciones,
        piz.IdTipoPizza,
        tp.nombre as tipoPizza,
        dp.cantidad,
        piz.precio
    from detallepedido dp 
    inner join pizza piz on dp.IdPizza = piz.IdPizza
    inner join tipopizza tp on piz.IdTipoPizza = tp.IdTipoPizza
    inner join tamanho tam on piz.IdTamanho = tam.IdTamanho
    where dp.IdPedido = idpedido;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PedidoDetalleModifica
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoDetalleModifica`(
	In iddetallepedido int,
    In cantidad int,
    In idpedido int,
	In idpizza int
)
BEGIN
    update detallepedido dp
		set dp.cantidad = cantidad,
        dp.IdPizza = idpizza
    where dp.IdDetallePedido = iddetallepedido; 
    
    -- actualiza monto de comprobante
    call SP_comprobanteActualizaMonto(idpedido);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PedidoInsertar
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoInsertar`(
	Out idpedido int,
	Out numeropedido int,
    Out numerocomprobante int,
	In fechacreacion date,
	In horacreacion time,
	In iddireccionenvio int,
	In idcliente int,
    In idtipocomprobante int,
	In observaciones varchar(50)
)
BEGIN
    declare IdEstadopedido int;
    declare IdEstadocomprobante int;
    set IdEstadopedido = 1; -- generado para tipo estado pedido
    set IdEstadocomprobante = 8; -- pendiente para tipo estado comprobante
    
    select ifnull(max(numero), 0) +1 into numeropedido from pedido;    
    
    insert into pedido (numero, fechaCreacion, horaCreacion, IdDireccionEnvio, IdEstado, IdCliente, observaciones)
    values (numeropedido, fechacreacion, horacreacion, iddireccionenvio, IdEstadopedido, idcliente, observaciones);
    
    SET idpedido = LAST_INSERT_ID();
    
    -- ingresamos comprobante
    select ifnull(max(numero), 0) +1 into numerocomprobante from comprobante;    
    
    insert into comprobante(numero, fechaEmision, horaEmision, IdTipoComprobante, monto, IdPedido, IdEstado)
    values(numerocomprobante, fechacreacion, horacreacion, idtipocomprobante, 0, idpedido, IdEstadocomprobante);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PedidoLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoLista`(
	In idtipoDocIdentidad int,
	In numero varchar(15)
)
BEGIN

	declare idtipoDocIdentidad_ini int default 0;
    declare idtipoDocIdentidad_fin int default 999999;
	declare numero_ini varchar(15) default '';
    declare numero_fin varchar(15) default 'ZZZZZZZZZZ';
    
    if idtipoDocIdentidad <> 0 then
        set idtipoDocIdentidad_ini = idtipoDocIdentidad;
        set idtipoDocIdentidad_fin = idtipoDocIdentidad;
    end if;

    if numero <> '' then
        set numero_ini = numero;
        set numero_fin = numero;
    end if;

	select 
		p.IdPedido,
		p.numero,
        comp.numero as numerocomprobante,
		p.fechacreacion,
        p.horacreacion,
        p.IdDireccionEnvio,
        d.direccion as direccionEnvio,
        dis.IdDistrito as IdDistritoEnvio,
        dis.nombre as distritoEnvio,
        dis.cobertura as coberturaEnvio,
        p.IdCliente,
        per.nombres as cliente,
        p.observaciones,
        p.IdEstado,
        e.nombre as estado
	FROM pedido p 
    inner join cliente c on p.IdCliente = c.IdCliente
    inner join persona per on c.IdPersona = per.IdPersona
	inner join direccion d on p.IdDireccionEnvio = d.IdDireccion
    inner join distrito dis on d.IdDistrito = dis.IdDistrito
	inner join documentoIdentidad di on per.IdDocumentoIdentidad = di.IdDocumentoIdentidad
    inner join comprobante comp on p.IdPedido = comp.IdPedido
    inner join estado e on p.IdEstado = e.IdEstado
    and di.IdTipoDocIdentidad between idtipoDocIdentidad_ini and idtipoDocIdentidad_fin
    and di.numero between numero_ini and numero_fin;
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PedidoListaXClienteListoEntrega
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoListaXClienteListoEntrega`(
	In idtipoDocIdentidad int,
	In numero varchar(15)
)
BEGIN
	declare idtipoDocIdentidad_ini int default 0;
    declare idtipoDocIdentidad_fin int default 999999;
	declare numero_ini varchar(15) default '';
    declare numero_fin varchar(15) default 'ZZZZZZZZZZ';
    
    if idtipoDocIdentidad <> 0 then
        set idtipoDocIdentidad_ini = idtipoDocIdentidad;
        set idtipoDocIdentidad_fin = idtipoDocIdentidad;
    end if;

    if numero <> '' then
        set numero_ini = numero;
        set numero_fin = numero;
    end if;

	select 
		p.IdPedido,
		p.numero,
        comp.numero as numerocomprobante,
		p.fechacreacion,
        p.horacreacion,
        p.IdDireccionEnvio,
        d.direccion as direccionEnvio,
        dis.IdDistrito as IdDistritoEnvio,
        dis.nombre as distritoEnvio,
        dis.cobertura as coberturaEnvio,
        p.IdCliente,
        per.nombres as cliente,
        p.observaciones,
        p.IdEstado,
        e.nombre as estado
	FROM pedido p 
    inner join cliente c on p.IdCliente = c.IdCliente
    inner join persona per on c.IdPersona = per.IdPersona
	inner join direccion d on p.IdDireccionEnvio = d.IdDireccion
    inner join distrito dis on d.IdDistrito = dis.IdDistrito
	inner join documentoIdentidad di on per.IdDocumentoIdentidad = di.IdDocumentoIdentidad
    inner join comprobante comp on p.IdPedido = comp.IdPedido
    inner join estado e on p.IdEstado = e.IdEstado
    and di.IdTipoDocIdentidad between idtipoDocIdentidad_ini and idtipoDocIdentidad_fin
    and di.numero between numero_ini and numero_fin
    where p.IdEstado = 2 -- listo para entrega
    and p.IdPedido not in (select de.IdPedido from detalleenvio de); 

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PedidoModifica
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PedidoModifica`(
	In idpedido int,
	In iddireccionenvio int,
	In idcliente int,
    In idtipocomprobante int,
	In observaciones varchar(50),
    In idestado int
)
BEGIN

	update pedido p
    set p.IdDireccionEnvio = iddireccionenvio,
		p.IdEstado = idestado, 
		p.observaciones = observaciones
	where p.IdPedido = idpedido;
	
	update comprobante c
		set c.IdTipoComprobante = idtipocomprobante
	where c.IdPedido = idpedido;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_Persona
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Persona`(
	In idpersona int
 )
BEGIN
	select
		p.IdPersona,
        p.nombres,
        p.apellidos,
        p.telefono,
        tdi.IdTipoDocIdentidad,
        tdi.nombre as tipoDocIdentidad,
        tdi.cantidadCaracteres as tdicantidadCaracteres,
        di.IdDocumentoIdentidad,
        di.numero as documentoIdentidad,
        p.IdTipoPersona,
        tp.nombre as tipoPersona,
        p.IdEstado,
        e.nombre as estado
	from persona p 
    inner join tipopersona tp on p.IdTipoPersona = tp.IdTipoPersona 
	inner join documentoIdentidad di on p.IdDocumentoIdentidad = di.IdDocumentoIdentidad
	inner join tipodocumentoidentidad tdi on di.IdTipoDocIdentidad = tdi.IdTipoDocIdentidad
	inner join estado e on p.IdEstado = e.IdEstado
	where p.IdPersona = idpersona
    and p.IdTipoPersona <> 4; -- no cliente;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PersonaInserta
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PersonaInserta`(
	OUT IdPersona int,
    In nombres varchar(100),
    In apellidos varchar(100),
    In telefono varchar(10),
    In IdTipoDocIdentidad int,
    In numero varchar(15),
    In IdTipoPersona int,
    In IdRol int,
    In nombreUsuario varchar(50),
    In contrasenha varchar(50)
 )
BEGIN
	declare IdDocumentoIdentidad int;
    declare estado int;
    
    set estado = 6; -- estado activo
    
    insert into documentoIdentidad (numero, IdTipoDocIdentidad)
    value (numero, IdTipoDocIdentidad);

    SET IdDocumentoIdentidad = LAST_INSERT_ID();
    
    insert into persona (nombres, apellidos, IdTipoPersona, IdDocumentoIdentidad, IdEstado, telefono)
    values (nombres, apellidos, IdTipoPersona, IdDocumentoIdentidad, estado, telefono);
    
    set IdPersona = LAST_INSERT_ID();
    
    if IdRol <> 0 then
        insert into usuario (nombreUsuario, contrasenha, IdPersona, IdRol)
        values(nombreUsuario, contrasenha, IdPersona, IdRol);
    end if;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PersonaLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PersonaLista`(
	In idtipoDocIdentidad int,
	In numero varchar(15)
)
BEGIN
	declare idtipoDocIdentidad_ini int default 0;
    declare idtipoDocIdentidad_fin int default 999999;
	declare numero_ini varchar(15) default '';
    declare numero_fin varchar(15) default 'ZZZZZZZZZZ';
    
    if idtipoDocIdentidad <> 0 then
        set idtipoDocIdentidad_ini = idtipoDocIdentidad;
        set idtipoDocIdentidad_fin = idtipoDocIdentidad;
    end if;

    if numero <> '' then
        set numero_ini = numero;
        set numero_fin = numero;
    end if;

	select
		p.IdPersona,
        p.nombres,
        p.apellidos,
        p.telefono,
        tdi.IdTipoDocIdentidad,
        tdi.nombre as tipoDocIdentidad,
        tdi.cantidadCaracteres as tdicantidadCaracteres,
        di.IdDocumentoIdentidad,
        di.numero as documentoIdentidad,
        p.IdTipoPersona,
        tp.nombre as tipoPersona,
        p.IdEstado,
        e.nombre as estado
	from persona p 
    inner join tipopersona tp on p.IdTipoPersona = tp.IdTipoPersona 
	inner join documentoIdentidad di on p.IdDocumentoIdentidad = di.IdDocumentoIdentidad
	inner join tipodocumentoidentidad tdi on di.IdTipoDocIdentidad = tdi.IdTipoDocIdentidad
	inner join estado e on p.IdEstado = e.IdEstado
	and di.IdTipoDocIdentidad between idtipoDocIdentidad_ini and idtipoDocIdentidad_fin
    and di.numero between numero_ini and numero_fin
    where p.IdTipoPersona <> 4; -- no cliente

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PersonaListaXTipo
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PersonaListaXTipo`(
	IN IdTipoPersona INT
)
BEGIN
	select 
		p.IdPersona,
        p.nombres,
        p.apellidos,
        p.IdTipoPersona,
        p.telefono,
        tp.nombre as tipoPersona,  
		p.IdDocumentoIdentidad,
        di.numero as documentoIdentidad,
        pdi.IdTipoDocIdentidad,
        pdi.nombre as tipoDocumentoIdentidad,
        p.IdEstado,
        e.nombre as estado
	from persona p 
    inner join tipopersona tp on p.IdTipoPersona = tp.IdTipoPersona 
	inner join documentoIdentidad di on p.IdDocumentoIdentidad = di.IdDocumentoIdentidad
	inner join tipodocumentoidentidad pdi on di.IdTipoDocIdentidad = pdi.IdTipoDocIdentidad
	inner join estado e on p.IdEstado = e.IdEstado
	where p.IdTipoPersona = IdTipoPersona;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PersonaModifica
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PersonaModifica`(
	In IdPersona int,
	In nombres varchar(100),
	In apellidos varchar(100),
    In telefono varchar(10),
    In IdTipoDocIdentidad int,
    In numero varchar(15),
	In IdTipoPersona int,
	In IdRol int,
    In nombreUsuario varchar(50),
	In contrasenha varchar(50)
 )
BEGIN
	declare id_persona_exist int default 0;

	update persona p
    join documentoIdentidad di on p.IdDocumentoIdentidad = di.IdDocumentoIdentidad
		set p.nombres = nombres,
        p.apellidos = apellidos,
        p.telefono = telefono,
        p.IdTipoPersona = IdTipoPersona,
        di.IdTipoDocIdentidad = IdTipoDocIdentidad,
        di.numero = numero
	where p.idPersona = IdPersona;
    
    if IdRol <> 0 then
		
        set id_persona_exist = (select IdPersona from usuario ux where ux.IdPersona = IdPersona);
        
        if id_persona_exist <> 0 then
			update usuario u
			set u.nombreUsuario = nombreUsuario,
			u.contrasenha = contrasenha
			where u.IdPersona = IdPersona;
		else
			insert into usuario (nombreUsuario, contrasenha, IdPersona, IdRol)
			values(nombreUsuario, contrasenha, IdPersona, IdRol);
        end if;
    end if;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PersonaUsuario
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PersonaUsuario`(
	In IdPersona int
 )
BEGIN
	select
		u.IdUsuario,
		u.nombreUsuario,
        u.contrasenha as contrasenha,
        u.IdRol,
        r.nombre as rol
    from usuario u
    join roles r on u.IdRol = r.IdRol
    where u.IdPersona = IdPersona;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PersonaUsuarioInserta
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PersonaUsuarioInserta`(
In nombres varchar(100),
In apellidos varchar(100),
In IdTipoPersona int,
In IdDocumentoIdentidad int,
In IdEstado int,
In telefono varchar(10),
In nombreUsuario varchar(50),
In contrasenha varchar(50),
In IdRol int
 )
BEGIN
    DECLARE last_insert_id INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;
        insert into persona (nombres, apellidos, IdTipoPersona, IdDocumentoIdentidad, IdEstado, telefono)
        values (nombres, apellidos, IdTipoPersona, IdDocumentoIdentidad, IdEstado, telefono);
        
        SET last_insert_id = LAST_INSERT_ID(); -- assignment
        
        insert into usuario(nombreUsuario, contrasenha, IdPersona, IdRol)
        values (nombreUsuario, contrasenha, last_insert_id, IdRol);   
    COMMIT;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PersonaUsuarioModifica
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PersonaUsuarioModifica`(
In IdPersona int,
In nombres varchar(100),
In apellidos varchar(100),
In IdTipoPersona int,
In IdDocumentoIdentidad int,
In IdEstado int,
In telefono varchar(10),
In IdUsuario int,
In nombreUsuario varchar(50),
In contrasenha varchar(50),
In IdRol int
 )
BEGIN
    DECLARE last_insert_id INT;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION 
    
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;
        update persona set nombres = nombres, apellidos = apellidos, IdTipoPersona = IdTipoPersona, 
        IdDocumentoIdentidad = IdDocumentoIdentidad, IdEstado = IdEstado, telefono = telefono
        where IdPersona = IdPersona;            
        
        update usuario 
        set nombreUsuario = nombreUsuario, contrasenha = contrasenha, IdPersona = IdPersona, IdRol = IdRol
        where IdUsuario = IdUsuario;
        
    COMMIT;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_Pizza
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Pizza`(
    IdPizza int
)
BEGIN
    select
        p.IdPizza,
        p.nombre,
        p.precio,
        p.IdTipoPizza,
        tp.nombre as tipoPizza,
        p.IdTamanho,
        t.nombre as tamanho,
        p.IdEstado,
        e.nombre as estado
    from pizza p
    join tipopizza tp on p.IdTipoPizza = tp.IdTipoPizza
    join tamanho t on p.IdTamanho = t.IdTamanho
    join estado e on p.IdEstado = e.IdEstado
    where p.IdPizza = IdPizza;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PizzaInserta
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PizzaInserta`(
    out IdPizza int,
    nombre varchar(50),
    precio decimal(19,4),
    IdTipoPizza int,
    IdTamanho int,
    IdEstado int
)
BEGIN
    insert into pizza(
        nombre,
        precio,
        IdTipoPizza,
        IdTamanho,
        IdEstado
    )
    value (
        nombre,
        precio,
        IdTipoPizza,
        IdTamanho,
        IdEstado
    );
    SET IdPizza = LAST_INSERT_ID();
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PizzaLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PizzaLista`(
    IdTipoPizza int
)
BEGIN
    declare IdTipoPizza_ini int default 0;
    declare IdTipoPizza_fin int default 999999;
    if IdTipoPizza <> 0 then
        set IdTipoPizza_ini = IdTipoPizza;
        set IdTipoPizza_fin = IdTipoPizza;
    end if;

    select
        p.IdPizza,
        p.nombre,
        p.precio,
        p.IdTipoPizza,
        tp.nombre as tipoPizza,
        p.IdTamanho,
        t.nombre as tamanho,
        p.IdEstado,
        e.nombre as estado
    from pizza p
    join tipopizza tp on p.IdTipoPizza = tp.IdTipoPizza
    join tamanho t on p.IdTamanho = t.IdTamanho
    join estado e on p.IdEstado = e.IdEstado
    where p.IdTipoPizza between IdTipoPizza_ini and IdTipoPizza_fin;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PizzaListaxNombre
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PizzaListaxNombre`(
	In nombrepizza varchar(50)
)
BEGIN
    select 
		piz.IdPizza,
        piz.nombre,
        piz.precio,
        piz.IdTipoPizza,
        tp.nombre as tipoPizza,
        piz.IdTamanho,
        tam.nombre as tamanho,
        tam.cantidadPorciones,
        piz.IdEstado,
        e.nombre as estado
    from pizza piz
    inner join tamanho tam on piz.IdTamanho = tam.IdTamanho
    inner join tipopizza tp on piz.IdTipoPizza = tp.IdTipoPizza
    inner join estado e on piz.IdEstado = e.IdEstado
    where piz.nombre like concat('%', nombrepizza, '%')
    and piz.IdEstado = 11;

END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PizzaModifica
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PizzaModifica`(
    IdPizza int,
    nombre varchar(50),
    precio decimal(19,4),
    IdTipoPizza int,
    IdTamanho int,
    IdEstado int
)
BEGIN
    update pizza p
        set p.nombre = nombre,
        p.precio = precio,
        p.IdTipoPizza = IdTipoPizza,
        p.IdTamanho = IdTamanho,
        p.IdEstado = IdEstado
    where p.IdPizza = IdPizza;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_PizzasRpt
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PizzasRpt`(
    fechaCreacion_inicio date,
    fechaCreacion_fin date
)
BEGIN
    select
        tpz.nombre as tipoPizza,
        ta.nombre as tamanho,
        sum(dp.cantidad) as cantidad,
        sum(pz.precio*cantidad) as preciototal
    from detallepedido dp
    join pedido p on dp.IdPedido = p.IdPedido
    join pizza pz on dp.IdPizza = pz.IdPizza
    join tipopizza tpz on pz.IdTipoPizza = tpz.IdTipoPizza
    join tamanho ta on pz.IdTamanho = ta.IdTamanho
    where p.fechacreacion between fechaCreacion_inicio and fechaCreacion_fin
    and p.IdEstado in (4,5)
    group by tpz.IdTipoPizza,ta.IdTamanho
    order by tpz.nombre, ta.nombre;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_Rol
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Rol`(
    IdRol int
)
BEGIN
    select 
        r.IdRol,
        r.nombre
    from roles r
    where r.IdRol = IdRol;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_RolAccesoEliminaInserta
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RolAccesoEliminaInserta`(
    IdRol int,
    idsformulario varchar(50)
)
BEGIN
    
    declare idx,prev_idx int;
    declare v_id varchar(10);

    delete from acceso a 
    where a.IdRol = IdRol;

    set idx := locate(',', idsformulario,1);
    set prev_idx := 1;

    WHILE idx > 0 DO
        set v_id := substr(idsformulario, prev_idx, idx - prev_idx);
        insert into acceso (IdRol,IdFormulario) values (IdRol,v_id);
        set prev_idx := idx+1;
        set idx := locate(',', idsformulario, prev_idx);
    END WHILE;

    set v_id := substr(idsformulario, prev_idx);
    insert into acceso (IdRol,IdFormulario) values (IdRol,v_id);
    
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_RolAccesoLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RolAccesoLista`(
    IdRol int
)
BEGIN
    select
        a.IdAcceso,
        a.IdFormulario,
        f.nombre as Formulario
    from acceso a
    join formulario f on a.IdFormulario = f.IdFormulario
    join roles r on a.IdRol = r.IdRol
    where a.IdRol = IdRol;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_RolInserta
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RolInserta`(
    out IdRol int,
    nombre varchar(50)
)
BEGIN
    insert roles (
        nombre
    )
    value (
        nombre
    );
    SET IdRol = LAST_INSERT_ID();
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_RolLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RolLista`()
BEGIN
    select 
        r.IdRol,
        r.nombre
    from roles r;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_RolModifca
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RolModifca`(
    IdRol int,
    nombre varchar(50)
)
BEGIN
    update roles r
        set r.nombre = nombre
    where r.IdRol = IdRol;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_RolModifica
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RolModifica`(
    IdRol int,
    nombre varchar(50)
)
BEGIN
    update roles r
        set r.nombre = nombre
    where r.IdRol = IdRol;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TamanhoPizza
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TamanhoPizza`(
    IdTamanho int
)
BEGIN
    select 
        t.IdTamanho,
        t.nombre,
        t.cantidadPorciones
    from tamanho t
    where t.IdTamanho = IdTamanho;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TamanhoPizzaInserta
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TamanhoPizzaInserta`(
    out IdTamanho int,
    nombre varchar(30),
    cantidadPorciones int
)
BEGIN
    insert into tamanho(
        nombre,
        cantidadPorciones
    )
    value (
        nombre,
        cantidadPorciones
    );
    SET IdTamanho = LAST_INSERT_ID();
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TamanhoPizzaLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TamanhoPizzaLista`()
BEGIN
    select 
        t.IdTamanho,
        t.nombre,
        t.cantidadPorciones
    from tamanho t;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TamanhoPizzaModifica
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TamanhoPizzaModifica`(
    IdTamanho int,
    nombre varchar(30),
    cantidadPorciones int
)
BEGIN
    update tamanho t
        set t.nombre = nombre,
        t.cantidadPorciones = cantidadPorciones
    where t.IdTamanho = IdTamanho;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TipoComprobante
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TipoComprobante`(
	IdTipoComprobante int
)
BEGIN
	select
		tc.IdTipoComprobante,
        tc.nombre,
        tc.IdEstado,
        e.nombre as estado
    from tipocomprobante tc
    join estado e on tc.IdEstado = e.IdEstado
    where tc.IdTipoComprobante = IdTipoComprobante;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TipoComprobanteLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TipoComprobanteLista`()
BEGIN
	select
		tc.IdTipoComprobante,
        tc.nombre,
        tc.IdEstado,
        e.nombre as estado
    from tipocomprobante tc
    join estado e on tc.IdEstado = e.IdEstado;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TipoDocumento
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TipoDocumento`(
	IdTipoDocIdentidad int
)
BEGIN
	select
        tdi.IdTipoDocIdentidad,
        tdi.nombre,
        tdi.cantidadCaracteres
    from tipodocumentoidentidad tdi
    where tdi.IdTipoDocIdentidad = IdTipoDocIdentidad;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TipoDocumentoLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TipoDocumentoLista`()
BEGIN
    select
        tdi.IdTipoDocIdentidad,
        tdi.nombre,
        tdi.cantidadCaracteres
    from tipodocumentoidentidad tdi;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TipoPersona
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TipoPersona`(
    IdTipoPersona int
)
BEGIN
    select
        tp.IdTipoPersona,
        tp.nombre
    from tipopersona tp
    where tp.IdTipoPersona = IdTipoPersona;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TipoPersonaInserta
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TipoPersonaInserta`(
    out IdTipoPersona int,
    nombre varchar(50)
)
BEGIN
    insert into tipopersona(
        nombre
    )
    value (
        nombre
    );
    SET IdTipoPersona = LAST_INSERT_ID();
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TipoPersonaLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TipoPersonaLista`()
BEGIN
    select
        tp.IdTipoPersona,
        tp.nombre
    from tipopersona tp;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TipoPersonaModifica
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TipoPersonaModifica`(
    IdTipoPersona int,
    nombre varchar(50)
)
BEGIN
    update tipopersona tp
    set tp.nombre = nombre
    where tp.IdTipoPersona = IdTipoPersona;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TipoPizza
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TipoPizza`(
    IdTipoPizza int
)
BEGIN
    select 
        t.IdTipoPizza,
        t.nombre,
        t.descripcion
    from tipopizza t
    where t.IdTipoPizza = IdTipoPizza;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TipoPizzaInserta
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TipoPizzaInserta`(
    out IdTipoPizza int,
    nombre varchar(50),
    descripcion varchar(50)
)
BEGIN
    insert into tipopizza(
        nombre,
        descripcion
    )
    value (
        nombre,
        descripcion
    );
    SET IdTipoPizza = LAST_INSERT_ID();
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TipoPizzaLista
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TipoPizzaLista`()
BEGIN
    select 
        t.IdTipoPizza,
        t.nombre,
        t.descripcion
    from tipopizza t;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_TipoPizzaModifica
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TipoPizzaModifica`(
    IdTipoPizza int,
    nombre varchar(50),
    descripcion varchar(50)
)
BEGIN
    update tipopizza t
        set t.nombre = nombre,
        t.descripcion = descripcion
    where t.IdTipoPizza = IdTipoPizza;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_Usuario
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Usuario`(
    nombreUsuario varchar(50),
    contrasenha varchar(50)
)
BEGIN
    select 
        u.IdUsuario,
        u.nombreUsuario,
        u.IdRol,
        r.nombre as rol
    from usuario u
    join persona p on u.IdPersona = p.IdPersona
    join roles r on u.IdRol = r.IdRol
    where u.nombreUsuario = nombreUsuario
    and u.contrasenha = contrasenha
    and p.IdEstado = 6; -- activo
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_VentasRpt
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_VentasRpt`(
    fechaEmision_inicio date,
    fechaEmision_fin date
)
BEGIN
    select        
        c.numero,					
        t.nombre as tipoComprobante,        
        c.fechaEmision, 
        c.monto        
    from comprobante c
    join tipocomprobante t on c.IdTipoComprobante = t.IdTipoComprobante
    join pedido p on c.IdPedido = p.IdPedido
    where c.fechaEmision between fechaEmision_inicio and fechaEmision_fin
    and p.IdEstado in (4,5);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure SP_comprobanteActualizaMonto
-- -----------------------------------------------------

DELIMITER $$
USE `pedidos-pizzeria-web`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_comprobanteActualizaMonto`(
    In idpedido int
)
BEGIN
	-- actualiza monto de comprobante
    update comprobante c
    inner join (
		select dp.IdPedido, sum(dp.cantidad * pz.precio) as 'sumt'
        from detallepedido dp 
        join pizza pz on dp.IdPizza = pz.IdPizza
        GROUP by dp.IdPedido
    ) x on c.IdPedido = x.IdPedido
    set c.monto = x.sumt;

END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
