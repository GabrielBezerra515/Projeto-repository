create database Semaforos;
use Semaforos;

create table Cadastro (
idSemaforo int primary key,
rua varchar(40),
cep int,
bairro varchar(30),
cidade varchar(30),
estado varchar(20)
);

select * from cadastro;


insert into cadastro values 
(1, 'Av. Sérgio Trevisan', 09791480, 'Pq. Selecta', 'São Paulo', 'SP'),
(2, 'Av. Nações Unidas', 04578908, 'Brooklyn Paulista', 'São Paulo', 'SP'),
(3, 'Rua Zike Tuma', 04458000, 'Jd. Palmares', 'São Paulo', 'SP'),
(4, 'Rua Kasuo Ogura', 04921080, 'Jd. Marqueza', 'São Paulo', 'SP');

create table Eventos (
fkSemaforo int,
 foreign key (fkSemaforo) references Cadastro (idSemaforo),
dia varchar(20),
hora varchar(15),
statusSensor int primary key
);

insert into Eventos (fkSemaforo, dia, hora, statusSensor) values
(1,'10/03/2020', '02:00', 1),
(2, '10/03/2020', '01:00', 2),
(3, '10/03/2020', '23:00', 3),
(4, '10/03/2020', '04:00', 4);


select * from Eventos;


select * from Cadastro, Eventos where fkSemaforo = idSemaforo;


create table Sensor (
identSensor int,
foreign key (identSensor) references Eventos (statusSensor),
inicioHSensor varchar(20),
fimHSensor varchar(15),
qtdZeros varchar(10),
qtdDeUm varchar(10),
qtdPessoasA varchar(10),
qtdPessoasP varchar(10)
);

select * from sensor;


insert into sensor values
(1, '02:02', '02:12', 80, 15, 1, 3),
(2, '01:05', '01:15', 70, 25, 2, 4),
(3, '23:08', '23:18', 60, 35, 5, 8),
(4, '04:10', '04:20', 75, 20, 2, 3);
-- Exibir os dados de todas as tabelas
select * from Cadastro, Eventos, Sensor where fkSemaforo = idSemaforo and statusSensor = identSensor;

select idSemaforo, rua, inicioHsensor, fimHsensor from Cadastro, Eventos, Sensor where fkSemaforo = idSemaforo and statusSensor = identSensor;

select idSemaforo, cep, fkSemaforo, dia, hora, statusSensor, identSensor, inicioHSensor, fimHSensor, qtdPessoasA, qtdPessoasP 
from Cadastro, Eventos, Sensor where  idSemaforo = fkSemaforo and statusSensor = identSensor;
