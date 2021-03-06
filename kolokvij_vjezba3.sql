drop database if exists kolokvij_vjezba3;
create database kolokvij_vjezba3;
use kolokvij_vjezba3;

create table cura(
	sifra int not null primary key auto_increment,
	duskerica varchar(49),
	maraka decimal(13,7),
	drugiputa datetime,
	majica varchar(49),
	novcica decimal(15,8),
	ogrlica int not null
);

create table svekar(
	sifra int not null primary key auto_increment,
	novcica decimal(16,8) not null,
	suknja varchar(44) not null,
	bojakose varchar(36),
	prstena int,
	narukvica int not null,
	cura int not null
);

create table brat(
	sifra int not null primary key auto_increment,
	jmbag char(11),
	ogrlica int not null,
	ekstrovertno bit
);

create table prijatelj_brat(
	sifra int not null primary key auto_increment,
	prijatelj int not null,
	brat int not null
);

create table prijatelj(
	sifra int not null primary key auto_increment,
	kuna decimal(16,10),
	haljina varchar(37),
	lipa decimal(13,10),
	dukserica varchar(31),
	indiferentno bit not null
);

create table ostavljena(
	sifra int not null primary key auto_increment,
	kuna decimal(17,5),
	lipa decimal(15,6),
	majica varchar(36),
	modelnaocala varchar(31) not null,
	prijatelj int
);

create table snasa (
	sifra int not null primary key auto_increment,
	introvertno bit,
	kuna decimal(15,6) not null,
	eura decimal(12,9) not null,
	treciputa datetime,
	ostavljena int not null
);

create table punica(
	sifra int not null primary key auto_increment,
	asocijlano bit,
	kratkamajica varchar(44),
	kuna decimal(13,8) not null,
	vesta varchar(32) not null,
	snasa int
);

alter table svekar add foreign key (cura) references cura(sifra);
alter table prijatelj_brat add foreign key (brat) references brat(sifra);
alter table prijatelj_brat add foreign key (prijatelj) references prijatelj(sifra);
alter table ostavljena add foreign key (prijatelj) references prijatelj(sifra);
alter table snasa add foreign key (ostavljena) references ostavljena(sifra);
alter table punica add foreign key (snasa) references snasa(sifra);


insert into prijatelj(indiferentno) values
(1);
insert into ostavljena(modelnaocala) values
('Timberland');
insert into snasa(kuna,eura,ostavljena) values
(69.45,57.45,1);
insert into brat(ogrlica,ekstrovertno) values
(1,1);
insert into prijatelj_brat(prijatelj,brat) values
(1,1);

select * from prijatelj;
select * from ostavljena;
select * from snasa;
select * from brat;
select * from prijatelj_brat;

insert into cura(ogrlica) values
(1);
insert into svekar(novcica,suknja,narukvica,cura) values
(42.69,'plava',1,1);
select * from svekar;

update svekar set suknja='Osijek';

insert into ostavljena(modelnaocala) values
('Timberland');
insert into snasa(kuna,eura,ostavljena) values
(100.99,72.99,1);
insert into punica(kuna,vesta) values
(125.99,'Techwear');
select * from punica;

delete from punica where kratkamajica='AB';

insert into prijatelj(indiferentno) values
(1);
insert into ostavljena(lipa,modelnaocala) values
(9,'Timberland'),
(24,'Timberland'),
(20,'Timberland'),
(48,'Timberland'),
(30,'Timberland'),
(73,'Timberland'),
(35,'Timberland');
select majica from ostavljena where lipa not in (9,10,20,30,35);

select b.ekstrovertno, pu.vesta, s.kuna
from brat b inner join prijatelj_brat pb on b.sifra=pb.brat
inner join prijatelj p on p.sifra=pb.prijatelj
inner join ostavljena o on p.sifra=o.prijatelj
inner join snasa s on o.sifra=s.ostavljena
inner join punica pu on s.sifra=pu.snasa
where o.lipa !=91 and p.haljina like '%ba%';

select p.haljina, p.lipa 
from prijatelj p
where not exists
(select * from prijatelj_brat pb where pb.prijatelj = p.sifra);