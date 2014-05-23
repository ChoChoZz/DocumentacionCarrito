create database Base;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `Base` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Base` ;

-- -----------------------------------------------------
-- Table `Base`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Base`.`USUARIO` (
  `correo` VARCHAR(60) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `aPaterno` VARCHAR(45) NOT NULL,
  `aMaterno` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  `sexo` VARCHAR(45) NULL,
  `edad` INT NULL,
  PRIMARY KEY (`correo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Base`.`PROVEEDOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Base`.`PROVEEDOR` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NOT NULL,
  `imagen` VARCHAR(45) NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Base`.`CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Base`.`CATEGORIA` (
  `idCategoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` TEXT NULL,
  `imagen` VARCHAR(100) NULL,
  PRIMARY KEY (`idCategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Base`.`PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Base`.`PRODUCTO` (
  `idProducto` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` FLOAT NOT NULL,
  `cantidad` INT NOT NULL,
  `descripcion` TEXT NULL,
  `idProveedor` INT NOT NULL,
  `idCategoria` INT NOT NULL,
  `imagen` VARCHAR(100) NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `fk_proveedor_idx` (`idProveedor` ASC),
  INDEX `fk_categoria_idx` (`idCategoria` ASC),
  CONSTRAINT `fk_proveedor`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `Base`.`PROVEEDOR` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categoria`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `Base`.`CATEGORIA` (`idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Base`.`PEDIDO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Base`.`PEDIDO` (
  `idPedido` INT NOT NULL,
  `idUsuario` VARCHAR(20) NOT NULL,
  `fecha` DATE NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPedido`, `idUsuario`),
  INDEX `fk_usuario_idx` (`idUsuario` ASC),
  CONSTRAINT `fk_usuario`
    FOREIGN KEY (`idUsuario`)
    REFERENCES `Base`.`USUARIO` (`correo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Base`.`PEDIDO_PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Base`.`PEDIDO_PRODUCTO` (
  `idPedido` INT NOT NULL,
  `idProducto` VARCHAR(20) NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`idPedido`),
  INDEX `fk_producto_idx` (`idProducto` ASC),
  CONSTRAINT `fk_pedido`
    FOREIGN KEY (`idPedido`)
    REFERENCES `Base`.`PEDIDO` (`idPedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producto`
    FOREIGN KEY (`idProducto`)
    REFERENCES `Base`.`PRODUCTO` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Base`.`USUARIO`
-- -----------------------------------------------------
START TRANSACTION;
USE `Base`;
INSERT INTO `Base`.`USUARIO` (`correo`, `nombre`, `aPaterno`, `aMaterno`, `direccion`, `password`, `tipo`, `telefono`, `sexo`, `edad`) VALUES ('ya@gmail.com', 'José Jaime', 'Lopéz', 'Rabadán', 'Santa Fe, Mex. D.F.', 'ya', 'administrador', 5519177559, 'masculino', 28);
INSERT INTO `Base`.`USUARIO` (`correo`, `nombre`, `aPaterno`, `aMaterno`, `direccion`, `password`, `tipo`, `telefono`, `sexo`, `edad`) VALUES ('chochozz@gmail.com', 'Gerar Haran ', 'Rodríguez', 'Molina', 'Nezahualcoyotl Edo. de Méx', 'chochozz', 'cliente', 5531469515, 'masculino', 21);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Base`.`PROVEEDOR`
-- -----------------------------------------------------
START TRANSACTION;
USE `Base`;
INSERT INTO `Base`.`PROVEEDOR` (`idProveedor`, `nombre`, `descripcion`, `imagen`) VALUES (1, 'Zapateria León', 'Surtidor de calzado para dama y caballero.', './img/categorias/zapaterias.jpg');
INSERT INTO `Base`.`PROVEEDOR` (`idProveedor`, `nombre`, `descripcion`, `imagen`) VALUES (2, 'La Perla', 'Proveedor primario de consumibles.', './img/categorias/laperla.jpg');
INSERT INTO `Base`.`PROVEEDOR` (`idProveedor`, `nombre`, `descripcion`, `imagen`) VALUES (3, 'HP', 'Prooverdor de mercancías generales.', './img/categorias/hp.jpg');
INSERT INTO `Base`.`PROVEEDOR` (`idProveedor`, `nombre`, `descripcion`, `imagen`) VALUES (4, 'Marca Tres, S.A. de C.V', 'Ropa.', './img/categorias/ropa-jpg');
INSERT INTO `Base`.`PROVEEDOR` (`idProveedor`, `nombre`, `descripcion`, `imagen`) VALUES (5, 'Apple Operations México, S.A. de C.V.', 'Spark.', './img/categorias/apple.jpg');
INSERT INTO `Base`.`PROVEEDOR` (`idProveedor`, `nombre`, `descripcion`, `imagen`) VALUES (6, 'Nestlé', 'Proveedor de abarrotes.', './img/categorias/nestle.gif');
INSERT INTO `Base`.`PROVEEDOR` (`idProveedor`, `nombre`, `descripcion`, `imagen`) VALUES (7, 'Hasbró', 'Proveedor de juguetes.', './img/categorias/hasbro.jpg');
INSERT INTO `Base`.`PROVEEDOR` (`idProveedor`, `nombre`, `descripcion`, `imagen`) VALUES (8, 'Matel', 'Proveedor de juguetes.', './img/categorias/matel.jpg');
INSERT INTO `Base`.`PROVEEDOR` (`idProveedor`, `nombre`, `descripcion`, `imagen`) VALUES (9, 'Distribuidora Carranza', 'Proveedor de muebles.', './img/categorias/mueblez.jpg');
INSERT INTO `Base`.`PROVEEDOR` (`idProveedor`, `nombre`, `descripcion`, `imagen`) VALUES (10, 'Samsumg', 'Proveedor de electrodomesticos, electronica y linea blanca.', './img/categorias/samsumng.png');
INSERT INTO `Base`.`PROVEEDOR` (`idProveedor`, `nombre`, `descripcion`, `imagen`) VALUES (11, 'Wilson', 'Proveedor de articulos deportivos.', './img/categorias/wilson.jpg');
INSERT INTO `Base`.`PROVEEDOR` (`idProveedor`, `nombre`, `descripcion`, `imagen`) VALUES (12, 'Weekend', 'Proveedor de ropa para dama y caballero.', './img/categorias/wee.jpg');
INSERT INTO `Base`.`PROVEEDOR` (`idProveedor`, `nombre`, `descripcion`, `imagen`) VALUES (13, 'Nike', 'Proveedor de equipo deportivo y calzado.', './img/categorias/like.pg');
INSERT INTO `Base`.`PROVEEDOR` (`idProveedor`, `nombre`, `descripcion`, `imagen`) VALUES (14, 'Electric', 'Proveedor de electronica', './img/categorias/electri.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Base`.`CATEGORIA`
-- -----------------------------------------------------
START TRANSACTION;
USE `Base`;
INSERT INTO `Base`.`CATEGORIA` (`idCategoria`, `nombre`, `descripcion`, `imagen`) VALUES (1, 'Electronica', 'Pantallas, Cámaras digitales, videojuegos, Estereos, ...', './img/elec.jpg');
INSERT INTO `Base`.`CATEGORIA` (`idCategoria`, `nombre`, `descripcion`, `imagen`) VALUES (2, 'Linea Blanca', 'Refrigeradores, lavadoras, licuadoras, estufas, ...', './img/linea.jpg');
INSERT INTO `Base`.`CATEGORIA` (`idCategoria`, `nombre`, `descripcion`, `imagen`) VALUES (3, 'Juguetes', 'Juegos de mesa, figuras de acción, carritos, muñecas, ...', './img/jugueteria.jpg');
INSERT INTO `Base`.`CATEGORIA` (`idCategoria`, `nombre`, `descripcion`, `imagen`) VALUES (4, 'Deportes', 'Caminadoras, pesas, bicicletas, tiendas de campaña, ...', './img/deportes.jpg');
INSERT INTO `Base`.`CATEGORIA` (`idCategoria`, `nombre`, `descripcion`, `imagen`) VALUES (5, 'Caballeros', 'Playeras, pantalones, Camisas, Trajes, ...', './img/caballeros.jpg');
INSERT INTO `Base`.`CATEGORIA` (`idCategoria`, `nombre`, `descripcion`, `imagen`) VALUES (6, 'Muebles', 'Salas, mesas, sillas, repisas, ...', './img/muebles.jpg');
INSERT INTO `Base`.`CATEGORIA` (`idCategoria`, `nombre`, `descripcion`, `imagen`) VALUES (7, 'Calzado', 'Botas, zapatos, mocasines, sandalias, ...', './img/calzado.jpg');
INSERT INTO `Base`.`CATEGORIA` (`idCategoria`, `nombre`, `descripcion`, `imagen`) VALUES (8, 'Damas', 'Lenceria, blusas, jeans, abrigos, ...', './img/DAMAS.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Base`.`PRODUCTO`
-- -----------------------------------------------------
START TRANSACTION;
USE `Base`;
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('1', 'Bermuda Azul ', 299.00, 10, 'Bermuda Azul 100% algodón', 4, 5, './img/productos/caballeros/bermudaazul.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('2', 'Boxer colores', 70.50, 50, 'Boxer varios colores', 4, 5, './img/productos/caballeros/boxer.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('3', 'Pantalon de mesclilla', 210.99, 24, 'Pantalon de mesclilla color azul', 4, 5, './img/productos/caballeros/pantalon1.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('4', 'Pants azul Wilson', 399.99, 40, 'Pants azul Wilson varios tonos.', 11, 5, './img/productos/caballeros/pants.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('5', 'Playera sport verde', 124.99, 42, 'Playera sport verde exclusiva para correr', 4, 5, './img/productos/caballeros/playerasport.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('6', 'Playera de rayas', 82.50, 60, 'Playera de rayas colo gris marca Weekend', 12, 5, './img/productos/caballeros/rayas.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('7', 'Bermuda beige mediana', 230.00, 30, 'Bermuda de gabardina color beige mediana ideal para el calor', 4, 5, './img/productos/caballeros/bermudabeige.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('8', 'Patalon vaquero obscuro', 375.90, 18, 'Patalon vaquero obscuro marca Levis todas las medidas', 4, 5, './img/productos/caballeros/pantalon1.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('9', 'Pantalón de mesclilla azul claro', 320.40, 36, 'Pantalón de mesclilla azul claro', 4, 5, './img/productos/caballeros/pantalon2.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('10', 'Playera gris marca Pepe Jeans', 247.99, 25, 'Playera gris  con estampado moderno marca Pepe Jeans', 4, 5, './img/productos/caballeros/playeragris.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('11', 'Neglille negro', 370.50, 9, 'Neglille negro de Victoria Secret idela para una ocasión especial', 4, 8, './img/productos/damas/010.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('12', 'Blusa de cuadros', 210.79, 28, 'Blusa de cuadros azul con gris marca Weekend', 12, 8, './img/productos/damas/bermuda.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('13', 'Jeans OGGI azul', 549.99, 27, 'Jeans OGGI color azul corte recto', 4, 8, './img/productos/damas/blusa1.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('14', 'Blusa blanca con estampado', 150.25, 12, 'Blusa blanca con estampado marca Dyu', 4, 8, './img/productos/damas/blusablanca.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('15', 'Jeans OGGI azul', 549.99, 27, 'Jeans OGGI color azul corte recto', 4, 8, './img/productos/damas/jeanskaty.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('16', 'Pijama color rojo', 138.65, 34, 'Pijama color rojo marca Vely', 4, 8, './img/productos/damas/pijama.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('17', 'Top color morado', 150.70, 21, 'Top color morado de dama todas las medidas', 4, 8, './img/productos/damas/top.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('18', 'Bermuda rosa', 174.99, 39, 'Bermuda rosa marca vanity', 12, 8, './img/productos/damas/bermuda.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('19', 'Blusa roja tiras', 278.99, 36, 'Blusa color roja con tiras marca vanity', 4, 8, './img/productos/damas/blusa2.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('20', 'Perfume BVLFGARI', 799.99, 23, 'Perfume BVLFGARI para dama escencia natural', 4, 8, './img/productos/damas/bvgari.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('21', 'Balón Basquetbol', 78.90, 4, 'Balón Basquetbol fiba', 11, 4, './img/productos/deportes/baloncesto.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('22', 'Balón de futbol soccer', 35.60, 2, 'Balón de fubtol soccer #3', 11, 4, './img/productos/deportes/balonsoccer.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('23', 'Bicicleta de monataña Benotto', 1750.00, 4, 'Bicicleta de monataña Benotto azul con diseño', 11, 4, './img/productos/deportes/bicicleta.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('24', 'Guantes de box negros', 320.50, 7, 'Guantes de box negros', 11, 4, './img/productos/deportes/guantesbox.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('25', 'Guantes fox para ejercicio', 200.00, 21, 'Guantes fox para ejercicio color rojo', 11, 4, './img/productos/deportes/guantesfox.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('26', 'Mancuerna 5 kg.', 95.50, 6, 'Mancuerna 5 kg. marca Wilson', 13, 4, './img/productos/deportes/mancuerna.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('27', 'Par de pesas marca Nike 2 Kg.', 136.20, 15, 'Par de pesas marca Nike 2Kg.', 13, 4, './img/productos/deportes/pardepesas.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('28', 'Pesa de hexagono 3 Kg.', 76.20, 11, 'Pesa de hexagono 3 Kg.', 13, 4, './img/productos/deportes/pesahexagonal.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('29', 'Short para nadar', 179.99, 16, 'Short para nadar azul Nike ', 13, 4, './img/productos/deportes/short.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('30', 'Tapete para yoga', 99.90, 39, 'Tapete para yoga marca Wilson', 11, 4, './img/productos/deportes/tapeteyoga.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('31', 'Laptop Alienware M325 ', 13578.50, 12, 'Laptop Alienware M325 color roja', 14, 1, './img/productos/electronica/alienware.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('32', 'Audifonos Apple azul', 4299.90, 17, 'Audifonos Apple azul our ear', 5, 1, './img/productos/electronica/audifonos.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('33', 'Blu ray Soy T34', 955.50, 43, 'Blu ray Soy T34 color negro USB y Wifi', 14, 1, './img/productos/electronica/bluyraysony.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('34', 'Camara Nikon S1100', 3490.00, 35, 'Camara Nikon S1100 morada', 14, 1, './img/productos/electronica/camranikon.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('35', 'DVD Sony ', 699.90, 15, 'DVD Sony color negro con USB', 14, 1, './img/productos/electronica/duvdsony.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('36', 'Minicomponente Genezi ', 4590.00, 17, 'Minicomponente Genezi 3000 watts', 14, 1, './img/productos/electronica/genezi.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('37', 'Ipod touch 5 negro 16 Gb', 4999.90, 5, 'Ipod touch 5 negro 16 Gb', 5, 1, './img/productos/electronica/ipodtouch5.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('38', 'Pantalla 40 pulgadas led 3D', 7890.90, 13, 'Pantalla 40 pulgadas led 3D con USB and SmartTV', 10, 1, './img/productos/electronica/pantalla.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('39', 'Consola Play Station 4', 7980.90, 10, 'Consola Play Station 4', 14, 1, './img/productos/electronica/play4.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('40', 'Consola Xbox One 200 Gb', 6990.00, 16, 'Xbox One 200 Gb negron con Fifa 2014 incluido', 14, 1, './img/productos/electronica/xboxone.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('41', 'Caballete para niño', 1250.00, 7, 'Caballete para niño rojo para niños de 3 a 6 años', 7, 3, './img/productos/jugueteria/caballete.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('42', 'Dora en patines ', 567.89, 3, 'Dora en patines incluye a Botas', 7, 3, './img/productos/jugueteria/dora.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('43', 'Elefante didactico ', 689.90, 39, 'Elefante didactico para mayores de 2 años', 7, 3, './img/productos/jugueteria/elefante.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('44', 'Figura de acción Star Wars ', 199.90, 46, 'Figura de acción Star Wars The game Stropp', 7, 3, './img/productos/jugueteria/figurastarwars.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('45', 'Harley electrica con 2 velociodades', 6790.00, 2, 'Harley electrica con 2 velociodades', 7, 3, './img/productos/jugueteria/harley.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('46', 'Helicoptero control remoto', 990.00, 8, 'Helicoptero a control remoto varias presentaciones', 8, 3, './img/productos/jugueteria/helicoptero.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('47', 'Rompezabezas Lego Turtles', 890.00, 11, 'Rompezabezas Lego Turtles 6-12 años', 8, 3, './img/productos/jugueteria/lego.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('48', 'Rompezabezas Lego Castle', 890.00, 13, 'Rompezabezas Lego Castle 6-12 años', 8, 3, './img/productos/jugueteria/lego1.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('49', 'Figura de acción Sully que habla', 1456.00, 9, 'Figura de acción Sully que habla OK', 8, 3, './img/productos/jugueteria/sully.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('50', 'Tren Thomas básico', 890.00, 17, 'Tren Thomas básico 1 - 6 años', 8, 3, './img/productos/jugueteria/trenthomas.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('51', 'Cafetera negra Hamilton & Beach', 1460.00, 4, 'Cafetera negra Hamilton & Beach', 14, 2, './img/productos/lineablanca/cafetera.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('52', 'Estufa 6 parrillas mabe', 3450.00, 8, 'Estufa 6 parrillas blanca Mabe', 14, 2, './img/productos/lineablanca/estufa.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('53', 'Lavadora Samsumg blanca', 7890.00, 9, 'Lavadora Samsumg blanca', 10, 2, './img/productos/lineablanca/lavadora1.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('54', 'Lavadora y secadora Samsumg', 12450.00, 6, 'Lavadora y secadora Samsumg T54', 10, 2, './img/productos/lineablanca/lavadora2.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('55', 'Lavaplatos Samsumg WR12', 7290.00, 3, 'Lavaplatos Samsumg WR12 gris', 10, 2, './img/productos/lineablanca/lavaplatos.gif');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('56', 'Licuadora Hamilton & Beach', 1000.00, 16, 'Licuadora Hamilton & Beach con 10 veolcidades', 14, 2, './img/productos/lineablanca/licuadora.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('57', 'Microondas Samsumg', 1200.00, 21, 'Microondas Samsumg gris W1290', 10, 2, './img/productos/lineablanca/microondas.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('58', 'Plancha azul Black & Decker', 1490.00, 31, 'Plancha azul con blanco Black & Decker ', 10, 2, './img/productos/lineablanca/plancha.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('59', 'Purificador de agua', 2390.00, 12, 'Purificador de agua WQ18 Samsumg', 10, 2, './img/productos/lineablanca/purificador.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('60', 'Refrigerador Samsumg 2 puertas', 9890.00, 8, 'Refrigerador Samsumg 2 puertas gris 10ft', 14, 2, './img/productos/lineablanca/refrigerador.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('61', 'Cantina con sillas', 10090.0, 2, 'Cantina con sillas acabdos de roble', 9, 6, './img/productos/muebles/cantina.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('62', 'Comedor seis sillas ', 12000.00, 4, 'Comedor seis sillas acabados finos', 9, 6, './img/productos/muebles/comedor.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('63', 'Comedor 4 sillas ', 9000.00, 6, 'Comedor seis sillas acabados de madera', 9, 6, './img/productos/muebles/comedor2.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('64', 'Libro 4 secciones chocolate', 3789.90, 5, 'Libro 4 secciones color chocolate ', 9, 6, './img/productos/muebles/librero.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('65', 'Mesa de cristal mini', 1300.00, 7, 'Mesa de triangular de cristal mini', 9, 6, './img/productos/muebles/mesacristal.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('66', 'Modulo central para TV', 8390.00, 3, 'Modulo central para TV con cajonera incluida', 9, 6, './img/productos/muebles/modulocentral.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('67', 'Recamara 2 stands', 17000.00, 7, 'Recamara 2 stands inlcuye cabecera y tocador', 9, 6, './img/productos/muebles/recamara.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('68', 'Sala completa negra', 12450.00, 3, 'Sala completa negra acabados en piel', 9, 6, './img/productos/muebles/salachocolate.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('69', 'Sillón reclinable blanco', 4670.00, 9, 'Sillón reclinable blanco con 3 posiciones', 9, 6, './img/productos/muebles/sillon.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('70', 'Sillón negro piel', 3456.00, 8, 'Sillón negro acabado de piel, comodo por naturaleza y ergonico.', 9, 6, './img/productos/muebles/sillon2.jpg');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('71', 'Ballerina color rosa', 300.00, 5, 'Ballerina para dama color rosa ', 1, 7, './img/productos/zapateria/ballerina.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('72', 'Chancla para caballero negra', 250.00, 4, 'Chancla para caballero negra con blanco', 1, 7, './img/productos/zapateria/chancla.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('73', 'Mocasin azul', 789.90, 6, 'Mocasin azul conb acabados cafés todas las medidas', 1, 7, './img/productos/zapateria/mocasin.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('74', 'Sandalia para dama princess', 490.00, 7, 'Sandalia para dama princess todas las medidas', 1, 7, './img/productos/zapateria/sandalia.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('75', 'Sandalia para dama queen', 450.00, 9, 'Sandalia para dama queen acabados dorados', 1, 7, './img/productos/zapateria/sandaliaw.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('76', 'Sandalia roja con tacón', 760.00, 3, 'Sandalia moderna color rojo con tacón ', 1, 7, './img/productos/zapateria/sandaroja.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('77', 'Tenis Spalding varios colores', 590.00, 65, 'Tenis Spalding varios colores', 1, 7, './img/productos/zapateria/spalding.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('78', 'Tenis para dama beige', 789.00, 15, 'Tenis para dama beige acabados naranjas', 1, 7, './img/productos/zapateria/tenis2w.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('79', 'Zapato para caballero negro', 890.00, 21, 'Zapato para caballero negro ', 1, 7, './img/productos/zapateria/zaapto.png');
INSERT INTO `Base`.`PRODUCTO` (`idProducto`, `nombre`, `precio`, `cantidad`, `descripcion`, `idProveedor`, `idCategoria`, `imagen`) VALUES ('80', 'Zapato para caballero cafe', 890.00, 19, 'Zapato para caballero cafe', 1, 7, './img/productos/zapateria/zapatocafe.png');

COMMIT;

