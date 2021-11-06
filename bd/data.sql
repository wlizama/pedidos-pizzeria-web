use `pedidos-pizzeria-web`;

insert into Formulario ( IdFormulario, nombre, alias, idSistema )
values 
( 0, 'Menu Pedidos', 'PED', 1 ),
( 0, 'Menu Delivery', 'DEL', 1 ),
( 0, 'Menu Mantenimiento', 'MANT', 1 ),
( 0, 'Menu Reportes', 'REP', 1 ),
( 0, 'Menu Mi sessión', 'SESS', 1 );
select * from Formulario;

-- tabla rol inicial
insert into Roles ( IdRol, nombre )
values 
( 0, 'Super usuario' ),
( 0, 'Cajero' ),
( 0, 'Administrador' );
select * from Roles;