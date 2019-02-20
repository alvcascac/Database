DROP DATABASE IF exists assignment2;
CREATE DATABASE IF NOT EXISTS assignment2;
USE assignment2;

create table Company(
    NIF VARCHAR(9) not null,
    name VARCHAR(50) not null,
    phone VARCHAR(50),
    email VARCHAR(50),
    primary key(NIF)
    );

create table Running(
    id_running integer not null,
    name VARCHAR(50),
    dateRunning date,
    gender VARCHAR(10) default 'mixed' check (gender in('male','female','mixed')) ,
    location VARCHAR(50),
    primary key(id_running)
    );
    
create table Route(
    id_route integer not null,
    category VARCHAR(10) not null check (category in('Children','Youth','Adult','Senior')) ,
    distance integer,
    price integer,
    id_running integer not null,
    primary key(id_route),
    foreign key (id_running) references Running(id_running)
    );
    
create table Sponsors(
    NIF VARCHAR(9) not null,
    id_running integer not null,
    sponsorDescription VARCHAR(200),
    primary key(NIF, id_running),
    foreign key(NIF) references Company(NIF),
    foreign key(id_running) references Running(id_running)
    );

create table Competitor(
    dni VARCHAR(9) not null,
    name VARCHAR(50) not null,
    phone VARCHAR(50) not null,
    email VARCHAR(50),
    address VARCHAR(50),
    nacionality VARCHAR(50),
    gender VARCHAR(10) not null check (gender in ('male', 'female')) ,
    birthday date not null,
    primary key(dni)
    );

create table Participation(
    dni VARCHAR(9) not null,
    id_running integer not null,
    posicion integer,
    tiempo TIMESTAMP, 
    category VARCHAR(10) not null check (category in('Children','Youth','Adult','Senior')) ,
    primary key(dni, id_running),
    foreign key (id_running) references running(id_running),
    foreign key (dni) references competitor(dni)
    );