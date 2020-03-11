create database Semaforo;
use Semaforo;

create table Cadastro (
idSemaforo varchar(10) primary key,
localização varchar(40),
cep int,
bairro varchar(30),
cidade varchar(30),
estado varchar(20)
);

select * from cadastro;


insert into cadastro values 
('SM1', 'Av. Sérgio Trevisan', 09791480, 'Pq. Selecta', 'São Paulo', 'SP'),
('SM2', 'Av. Nações Unidas', 04578908, 'Brooklyn Paulista', 'São Paulo', 'SP'),
('SM3', 'Rua Zike Tuma', 04458000, 'Jd. Palmares', 'São Paulo', 'SP'),
('SM4', 'Rua Kasuo Ogura', 04921080, 'Jd. Marqueza', 'São Paulo', 'SP');

create table Eventos (
fkSemaforo varchar(10),
 foreign key (fkSemaforo) references Cadastro (idSemaforo),
dia varchar(20),
hora varchar(15),
DadosSensor varchar(10) primary key
);

insert into Eventos (fkSemaforo, dia, hora, DadosSensor) values
('SM1','10/03/2020', '02:00', 'DS1'),
('SM2', '10/03/2020', '01:00', 'DS2'),
('SM3', '10/03/2020', '23:00', 'DS3'),
('SM4', '10/03/2020', '04:00', 'DS4');


select * from Eventos;


select * from Cadastro, Eventos where fkSemaforo = idSemaforo;


create table Sensor (
identSensor varchar(10),
foreign key (identSensor) references Eventos (DadosSensor),
inicioHSensor varchar(20),
fimHSensor varchar(15),
qtdZeros varchar(10),
qtdDeUm varchar(10),
qtdPessoasA varchar(10),
qtdPessoasP varchar(10)
);

select * from sensor;


insert into sensor values
('DS1', '02:02', '02:12', 80, 15, 1, 3),
('DS2', '01:05', '01:15', 70, 25, 2, 4),
('DS3', '23:08', '23:18', 60, 35, 5, 8),
('DS4', '04:10', '04:20', 75, 20, 2, 3);
-- Exibir os dados de todas as tabelas
select * from Cadastro, Eventos, Sensor where fkSemaforo = idSemaforo and DadosSensor = identSensor;


select Cadastro.*, dia, hora, DadosSensor, inicioHSensor, fimHSensor, qtdZeros, qtdDeUm, qtdPessoasA, qtdPessoasP from Cadastro, Eventos, Sensor where 
idSemaforo = fkSemaforo and DadosSensor = identSensor; 