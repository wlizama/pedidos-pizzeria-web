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