-- Criação do banco de dados filme
create database filme;

-- Seleciona o banco de dados filme
use filme;

-- Criação da tabela Filme
create table Filme (
  idFilme int primary key,
  titulo varchar(50),
  genero varchar(20),
  diretor varchar(40)
);

-- Inserção de um registro
insert into Filme values 
   (1,'Alien vs Predador','ação','Paul W. Anderson');

-- Exibição dos dados da tabela Filme
select * from Filme;

-- Inserção de mais registros, porém fornecendo apenas o idFilme e o título de cada filme
insert into Filme (idFilme, titulo) values
    (2,'Velozes e Furiosos 9'),
    (3,'Interestelar'),
    (4,'Sempre ao seu lado');
    
-- Inserção de mais registros, porém fornecendo o título e o idFilme, nessa ordem    
insert into Filme (titulo, idFilme) values
    ('Ratatouille', 5),
    ('Resident Evil',6);
    
-- Atualiza o genero e o diretor do filme com idFilme = 6    
update Filme set genero='terror',
                 diretor='Paul W. Anderson'
             where idFilme = 6;
             
-- Atualiza o genero dos filmes de idFilme = 3 e 4             
update Filme set genero= 'drama' where idFilme in (3, 4);

-- Atualiza o diretor dos filmes de idFilme = 3 e 4
-- Essa forma equivale ao where idFilme in (3,4)
-- Atenção: tem que ser OR, e não AND
update Filme set diretor= 'Fulano' 
        where idFilme = 3 or idFilme = 4;
        
-- Atualiza o genero e o diretor do filme de idFilme = 2        
update Filme set genero= 'ação', 
			     diretor= 'Justin Lin'
             where idFilme = 2;
             
-- Atualiza o diretor do filme de idFilme = 3             
update Filme set diretor = 'Christopher Nollan'
             where idFilme = 3;
             
-- Atualiza o diretor do filme de idFilme = 4             
update Filme set diretor = 'Lasse Hallstrom'
             where idFilme = 4;
             
-- Atualiza o genero e o diretor do filme de idFilme = 5             
update Filme set genero = 'animação',
                 diretor = 'Brad Bird'
             where idFilme = 5;
             
-- Exibe a descrição da tabela Filme
desc Filme;

-- Alterando a coluna genero para ter no máx 30 caracteres
alter table Filme modify genero varchar(30); 

-- Exibe a descrição da tabela Filme novamente para ver a alteração do tamanho da coluna genero
desc Filme;

-- Acrescentando uma coluna chamada ano
-- Pode ser um dos 2 comandos a seguir
alter table Filme add ano int; 
alter table Filme add column ano int; 
 -- a palavra column é opcional  

select * from Filme;
alter table filme drop ano;

select * from filme order by genero;
select * from filme order by genero, diretor;
select * from filme order by genero,titulo desc;
select * from filme order by genero desc ,titulo desc;

-- criar a tabela Pessoa 
create table Pessoa (idpessoa int primary key auto_increment, nome varchar(40), datanasc date ) auto_increment = 10;
insert into pessoa values (null,'Maria','2000-05-10');
select * from pessoa;

insert into pessoa values (null, 'josé', '2002-06-12');
insert into pessoa (nome, dataNasc) values ('Mickey', '1928-11-18'), ('Minnie','1928-11-18'),('pateta','1942-10-05');
delete from pessoa where idpessoa>=15;
insert into pessoa (nome, datanasc) values ('pluto','1940-07-10');
insert into pessoa values (22,'donald', '1950-10-17');
insert into pessoa values (null, 'Margarida','1952-05-05');

-- Alterar o nome de uma coluna
alter table pessoa rename column nome to nomepessoa;