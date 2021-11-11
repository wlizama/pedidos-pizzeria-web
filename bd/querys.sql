#use `pedidos-pizzeria`;
use `pedidos-pizzeria-web`;


select r.nombre from roles r join usuario u on r.IdRol = u.IdRol where u.nombre_usuario = 'suuser';


