DROP DATABASE IF exists assignment1;
CREATE DATABASE IF NOT EXISTS assignment1;
USE assignment1;
create table Company(
    NIF CHAR(9) not null,
    name CHAR(15) not null,
    phone CHAR(9),
    email CHAR(25),
    primary key(NIF)
    );
    
create table Route(
    id_route integer not null,
    category CHAR(20) not null check (category in('Prebenjamin','Benjamin','Alevín','Infantil','Cadete','Juvenil',
    'Junior','Promesa', 'Senior','Veteranos A','Veteranos B','Veteranos C')) ,
    distance integer,
    price integer,
    primary key(id_route)); 

create table Running(
    id_running integer not null,
    name CHAR(15),
    dateRunning date,
    gender CHAR(10) default 'mixed' check (gender in('male','female','mixed')) ,
    location CHAR(40),
    id_route integer not null,
    primary key(id_running),
    foreign key (id_route) references Route(id_route)
    );
    
create table Sponsors(
    NIF CHAR(9) not null,
    id_running integer not null,
    sponsorDescription CHAR(200),
    primary key(NIF, id_running),
    foreign key(NIF) references Company(NIF),
    foreign key(id_running) references Running(id_running)
    );

create table Competitor(
    dni CHAR(9) not null,
    name CHAR(15) not null,
    phone CHAR(9) not null,
    email CHAR(25),
    address CHAR(25),
    nacionality CHAR(10),
    gender CHAR(6) not null check (gender in ('male', 'female')) ,
    birthday date not null,
    primary key(dni)
    );

create table Participation(
    id_participation integer not null,
    posicion integer,
    tiempo TIMESTAMP, 
    id_running integer not null,
    dni CHAR(9) not null,
    category CHAR(20) not null check (category in('Prebenjamin','Benjamin','Alevín','Infantil','Cadete','Juvenil',
    'Junior','Promesa', 'Senior','Veteranos A','Veteranos B','Veteranos C')) ,
    primary key(id_participation),
    foreign key (id_running) references running(id_running),
    foreign key (dni) references competitor(dni)
    );