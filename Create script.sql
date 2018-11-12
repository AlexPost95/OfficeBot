create database OfficeManager;
use OfficeManager;

create table Organisatie (
id		numeric			not null		primary key,
naam	varchar(255)	not null
)

drop table Organisatie;

create table Medewerker (
id				numeric			not null	primary key,
naam			varchar(255)	not null,
email			varchar(255)	not null,
telefoon		numeric			null,
foto			image			null,
organisatie		numeric			not null,
foreign key (organisatie) references Organisatie(id)
)

drop table Medewerker;

create table Aanwezigheid (
medewerker		numeric			not null		primary key,
maandag			bit				not null,
dinsdag			bit				not null,
woensdag		bit				not null,
donderdag		bit				not null,
vrijdag			bit				not null,
zaterdag		bit				not null,
zondag			bit				not null,
foreign key (medewerker) references Medewerker(id)
)

drop table Aanwezigheid;

create table Boodschappenlijst (
id					numeric			not null		primary key,
naam				varchar(255)	not null,
organisatie			numeric			not null,
verzenddatum		date			not null,
foreign key(organisatie) references Organisatie(id)
)

drop table Boodschappenlijst;

create table Kantoorbenodigdheden (
id					numeric			not null		primary key,
naam				varchar(255)	not null,
organisatie			numeric			not null,
verzenddatum		date			not null,
foreign key(organisatie) references Organisatie(id)
)

drop table Kantoorbenodigdheden;

create table Artikel (
id			numeric				not null		primary key,
naam		varchar(255)		not null,
hoeveelheid	numeric				not null,
boodschappenlijst		numeric		not null,
foreign key (boodschappenlijst) references Boodschappenlijst(id)
)

drop table Artikel;

create table Kantoorartikel (
id			numeric				not null		primary key,
naam		varchar(255)		not null,
hoeveelheid	numeric				not null,
kantoorbenodigdhedenId		numeric		not null,
foreign key (kantoorbenodigdhedenId) references Kantoorbenodigdheden(id)
)

drop table Kantoorartikel;

create table Prikbord (
id			numeric			not null		primary key,
organisatie	numeric			not null,
naam		varchar(255)	not null,
foreign key (organisatie) references Organisatie(id)
)

drop table Prikbord;

create table Bericht (
id		numeric			not null		primary key,
tekst	varchar(1000)	not null,
datum	date			not null,
prikbordId	numeric		not null,
foreign key (prikbordId) references Prikbord(id)
)

drop table Bericht;

create table FacilitairVerzoek (
id			numeric			not null			primary key,
tekst		varchar(1000)	not null,
datum		date			not null,
organisatie	numeric			not null,
foreign key(organisatie) references Organisatie(id)
)

drop table FacilitairVerzoek;

insert into Organisatie values(1, 'Axendo');

select O.naam, M.naam, M.email, M.telefoon, A.maandag, A.dinsdag, A.woensdag, A.donderdag, A.vrijdag, A.zaterdag, A.zondag 
from Organisatie O inner join Medewerker M on O.id = M.organisatie, Aanwezigheid A inner join Medewerker P on A.medewerker = P.id;

insert into Medewerker values (1, 'Alex Post', 'alex@axendo.nl', 06554466544, null, 1);
insert into Medewerker values (2, 'Alex', 'alexpost@axendo.nl', 06554466544, null, 1);

insert into Aanwezigheid values (2, 1, 1, 1, 1, 0,0,0);

select * from Medewerker;
