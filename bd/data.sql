use `pedidos-pizzeria-web`;

insert into formulario ( IdFormulario, nombre, alias, idSistema )
values 
( 0, 'Menu Pedidos', 'PED', 1 ),
( 0, 'Menu Delivery', 'DEL', 1 ),
( 0, 'Menu Mantenimiento', 'MANT', 1 ),
( 0, 'Menu Reportes', 'REP', 1 ),
( 0, 'Menu Mi sessión', 'SESS', 1 );
select * from formulario;

-- tabla rol inicial
insert into roles ( IdRol, nombre )
values 
( 0, 'Super usuario' ),
( 0, 'Cajero' ),
( 0, 'Administrador' );
select * from roles;

-- tabla Accesos
insert into acceso ( IdAcceso, acceso, IdFormulario, IdRol )
values 
# Rol Super usuario
( 0, 1, 6, 5),
( 0, 1, 7, 5),
( 0, 1, 8, 5),
( 0, 1, 9, 5),
( 0, 1, 10, 5),
# Rol Cajero
( 0, 1, 6, 6),
( 0, 1, 7, 6),
( 0, 0, 8, 6),
( 0, 0, 9, 6),
( 0, 1, 10, 6),
# Rol Administrador
( 0, 0, 6, 7),
( 0, 0, 7, 7),
( 0, 1, 8, 7),
( 0, 1, 9, 7),
( 0, 1, 10, 7);
select * from acceso;

-- tabla TipoPersona
insert into tipoPersona ( IdTipoPersona, nombre )
values 
( 0, 'Gerencia' ),
( 0, 'Cajero' ),
( 0, 'Delivery' ),
( 0, 'Cocinero' ),
( 0, 'Cliente' ),
( 0, 'Otros' );
select * from tipoPersona;

-- tabla rol inicial
insert into tipoDocumentoIdentidad ( IdTipoDocIdentidad, nombre, cantidad_caracteres )
values
(0, 'L.E / DNI', 8),
(0, 'CARNET EXT.', 12),
(0, 'RUC', 11),
(0, 'PASAPORTE', 12),
(0, 'PART. DE NACIMIENTO-IDENTIDAD', 15),
(0, 'OTROS', 15);
select * from tipoDocumentoIdentidad;

insert into tipoestado( IdTipoEstado, nombre )
values
(0, 'Pedido'),
(0, 'Envio'),
(0, 'Envio - Detalle'),
(0, 'Usuario'),
(0, 'Comprobante'),
(0, 'Producto'),
(0, 'Pizza');
select * from tipoestado;

insert into estado( IdEstado, nombre, IdTipoEstado )
values
# Pedido
(0, 'Registrado', 5),
(0, 'En preparación', 5),
(0, 'Preparado', 5),
(0, 'En camino', 5),
(0, 'Entregado', 5),
(0, 'No entregado', 5),
# Envio
(0, 'En curso', 6),
(0, 'Finalizado', 6),
(0, 'Observado', 6),
# Envio - Detalle
(0, 'Registrado', 7),
(0, 'En camino', 7),
(0, 'Entregado', 7),
(0, 'No entregado', 7),
# Usuario
(0, 'Activo', 8),
(0, 'Inactivo', 8),
# Comprobante
(0, 'Pendiente', 9),
(0, 'Finalizado', 9),
# Producto
(0, 'Anulado', 10),
(0, 'Disponible', 10),
(0, 'No Disponible', 10),
# Pizza
(0, 'Anulado', 11),
(0, 'Disponible', 11),
(0, 'No Disponible', 11);
select * from estado;

-- super usuario de sistema
insert into documentoIdentidad ( IdDocumentoIdentidad, numero, IdTipoDocIdentidad )
value( 0, 'XXXXXXXXXXXXXXX', 12 );
select * from documentoIdentidad;
insert into persona ( IdPersona, nombres, apellidos, telefono, celular,  IdTipoPersona, IdDocumentoIdentidad, IdEstado )
value(0, 'Super Usuario de Sistema', null, null, null, 13, 30, 27);
select * from persona;
insert into usuario ( IdUsuario, nombre_usuario, contrasenha, IdPersona, IdRol )
value( 0, 'suuser' , 123456, 29, 5 ); #SHA1('123456')
select * from usuario;
update usuario set contrasenha = SHA1('123456')

