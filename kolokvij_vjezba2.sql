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
	bojakose varchar(37) not null,
	novcica decimal(15,9),
	lipa decimal(15,8) not null,
	indiferentno bit not null
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
('zelena',69.42,1);


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


insert into svekar(ogrlica,asocijalno) values
(1,1);
insert into prijatelj(treciputa,ekstrovertno,svekar) values
('2001-10-02',1,1);
update prijatelj set treciputa='2020-04-30';
select * from prijatelj;


insert into neprijatelj(haljina,modelnaocala,kuna) values
('zelena','crna',17.99),
('crvena','crvena',20.99),
('plava','smeda',69.99);
insert into brat(ogrlica,asocijalno,neprijatelj) values
(23,1,1),
(22,1,1),
(14,1,1);
select * from brat;
delete from brat where ogrlica!=14;
select * from brat;


select * from cura;
insert into cura(haljina,drugiputa,majica) values
('bijela','2021-05-22','roza'),
('crvena','2021-05-23','plava'),
('crna','2021-05-22','tirkizna'),
('smeda','2021-05-23','krem'),
('plava','2021-05-24','crna');

select * from cura where drugiputa is null;


select z.novcica, b.neprijatelj, n.haljina 
from zarucnica z inner join decko_zarucnica dz on z.sifra=dz.zarucnica
inner join decko d on dz.decko=d.sifra
inner join cura c on d.sifra=c.decko
inner join neprijatelj n on c.sifra=n.cura
inner join brat b on n.sifra=b.neprijatelj 
where c.drugiputa is not null and d.vesta like '%ba%';




