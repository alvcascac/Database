DROP DATABASE IF exists assignment2;

CREATE DATABASE IF NOT EXISTS assignment2;

USE assignment2;

create table Company(
    NIF CHAR(9) not null,
    name CHAR(50) not null,
    phone CHAR(50),
    email CHAR(50),
    primary key(NIF)
    );

create table Running(
    id_running integer not null,
    name CHAR(50),
    dateRunning date,
    gender CHAR(10) default 'mixed' check (gender in('male','female','mixed')) ,
    location CHAR(50),
    primary key(id_running));
    
create table Route(
    id_route integer not null,
    category CHAR(30) not null check (category in('Prebenjamin','Benjamin','Alevín','Childish','Cadet','Youth',
	'Senior')) ,
    distance integer,
    price integer,
    id_running integer not null,
    primary key(id_route), 
    foreign key (id_running) references Running(id_running));

create table Sponsor(
    NIF CHAR(9) not null,
    id_running integer not null,
    sponsorDescription CHAR(255),
    primary key(NIF, id_running),
    foreign key(NIF) references Company(NIF),
    foreign key(id_running) references Running(id_running)
    );

create table Competitor(
    dni CHAR(9) not null,
    name CHAR(50) not null,
    phone CHAR(50) not null,
    email CHAR(50),
    address CHAR(50),
    nationality CHAR(50),
    gender CHAR(10) not null check (gender in ('male', 'female')) ,
    birthday date not null,
    primary key(dni)
    );

create table Participation(
    id_running integer not null,
    dni CHAR(9) not null,
    position integer,
    time time, 
    category CHAR(30) not null check (category in('Prebenjamin','Benjamin','Alevín','childish','Cadet','Youth',
	'Senior')) ,
    primary key(dni, id_running),
    foreign key (id_running) references running(id_running),
    foreign key (dni) references competitor(dni)
    );

