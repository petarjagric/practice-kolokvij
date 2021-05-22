drop database if exists kolokvij_vjezba2;
create database kolokvij_vjezba2;
use kolokvij_vjezba2;

create table brat(
	sifra int not null primary key auto_increment,
	suknja varchar(47),
	ogrlica int not null,
	asocijalno bit not null,
	neprijatelj int not null
);

create table neprijatelj(
	sifra int not null primary key auto_increment,
	majica varchar(32),
	haljina varchar(43) not null,
	lipa decimal(16,8),
	modelnaocala varchar(49) not null,
	kuna decimal (12,8) not null,
	jmbag char(11),
	cura int
);

create table cura(
	sifra int not null primary key auto_increment,
	haljina varchar(33) not null,
	drugiputa datetime not null,
	suknja varchar(38),
	narukvica int,
	introvertno bit,
	majica varchar(40) not null,
	decko int
);

create table decko(
	sifra int not null primary key auto_increment,
	indiferetno int,
	vesta varchar(34),
	asocijalno int not null
);

create table decko_zarucnica(
	sifra int not null primary key auto_increment,
	decko int not null,
	zarucnica int not null
);

create table zarucnica(
	sifra int not null primary key auto_increment,
	narukvica int,
	bojakosa varchar(37) not null,
	novcica decimal(15,9),
	lipa decimal(15,8) not null,
	indiferetno bit not null
);

create table prijatelj(
	sifra int not null primary key auto_increment,
	modelnaocala varchar(37),
	treciputa datetime not null,
	ekstrovertno bit not null,
	prviputa datetime,
	svekar int not null
);

create table svekar(
	sifra int not null primary key auto_increment,
	stilfrizura varchar(48),
	ogrlica int not null,
	asocijalno bit not null
);


alter table prijatelj add foreign key (svekar) references svekar(sifra);
alter table brat add foreign key (neprijatelj) references neprijatelj(sifra);
alter table neprijatelj add foreign key (cura) references cura(sifra);
alter table cura add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (decko) references decko(sifra);
alter table decko_zarucnica add foreign key (zarucnica) references zarucnica(sifra);


insert into zarucnica(bojakose,lipa,indiferentno) values
('zelena',69.420,2);


insert into decko(asocijalno) values
(3);

insert into decko_zarucnica(decko,zarucnica) values
(1,1),
(1,1),
(1,1);

insert into cura(haljina,drugiputa,majica) values
('tirkizna','2021-03-09','violet'),
('crvena','2021-05-09','plava'),
('roza','2021-04-09','crvena');

insert into neprijatelj(haljina,modelnaocala,kuna) values
('plava','zute',15.98),
('crvena','narancasta',25.89),
('crna','bijela',67.58);

select * from zarucnica;
select * from decko;
select * from decko_zarucnica;
select * from cura;
select * from neprijatelj;

