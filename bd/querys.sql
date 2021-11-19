#use `pedidos-pizzeria`;
use `pedidos-pizzeria-web`;

select r.nombre from roles r join usuario u on r.IdRol = u.IdRol where u.nombre_usuario = 'suuser';
select u.nombre_usuario, u.contrasenha from usuario u where u.nombre_usuario = 'suuser';


