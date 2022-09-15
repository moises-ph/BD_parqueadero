/* create database Parcking; */
/* use Parcking; */

create table ticket_entrada(
	id_ticket int primary key,
    id_tarifa int not null,
    hora_entrada datetime not null,
    placa varchar(6) not null);
    
create table tarifa(
	id_tarifa int primary key,
    tipo_vehiculo varchar(10) not null,
    costo_tarifa int not null,
    reacargo_nocturno int not null
);

create table check_out(
	id_out int primary key,
    hora_salida datetime not null,
    id_ticket int not null
);

create table descuentos(
	id_descuento int primary key,
    id_ticket int not null,
    monto_descuento int not null
);

create table factura(
	id_factura int primary key,
    sub_total int not null,
    impuestos int not null,
    costo int not null,
    total int not null,
    id_ticket int not null,
    id_out int not null,
    id_descuento int not null
);

alter table ticket_entrada add constraint fk_ticket_tarifa foreign key (id_tarifa) references tarifa(id_tarifa);
alter table check_out add constraint fk_ticket_check_out foreign key (id_ticket) references ticket_entrada(id_ticket);
alter table descuentos add constraint fk_ticket_descuento foreign key (id_ticket) references ticket_entrada(id_ticket);
alter table factura add constraint fk_factura_ticket foreign key (id_ticket) references ticket_entrada(id_ticket);
alter table factura add constraint fk_factura_out foreign key (id_out) references check_out(id_out);
alter table factura add constraint fk_factura_descuento foreign key (id_descuento) references descuentos(id_descuento);
    