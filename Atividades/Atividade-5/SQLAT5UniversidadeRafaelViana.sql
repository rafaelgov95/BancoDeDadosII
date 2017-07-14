drop table Matriculado;
drop table Aula;
drop table Disciplina;
drop table Estudante;
drop table Prof;

Rem ********************************

create table Estudante(
ENUM INT PRIMARY KEY,
ENOME VARCHAR(25),
Curso VARCHAR(25),
Idade INT,
Periodo INT
);


create table Prof(
PId INT PRIMARY KEY,
PNome VARCHAR(25),
Dept VARCHAR(25)
);

create table Disciplina(
DId INT PRIMARY KEY,
DNome VARCHAR(25),
PId INT,
    FOREIGN KEY (PId) REFERENCES Prof(PId)
);

create table Matriculado(
ENUM int,
DId int,
    PRIMARY KEY (ENUM,DId),
    foreign key (DId) references  Disciplina(DId),
   
    foreign key (ENUM) references Estudante (ENUM)
   
);
create table Aula(
    DId int ,
    DiaSemana varchar(25),
    Sala varchar(25),
    Horario varchar(25),
    primary key (DId,DiaSemana),
   foreign key (DId) references Disciplina(DId)
);

rem Inserir Estudantes
insert into Estudante (ENUM,ENOME,Curso,Idade,Periodo) values (0,'Rafael Viana','Ciência da Computação',21,5);
insert into Estudante (ENUM,ENOME,Curso,Idade,Periodo) values (1,'Higor Chaves','SISTEMAS DE INFORMACAO',18,2);
insert into Estudante (ENUM,ENOME,Curso,Idade,Periodo) values (2,'Ramon Santos','Ciência da Computação',21,1);
insert into Estudante (ENUM,ENOME,Curso,Idade,Periodo) values (3,'Paulo Junqueira','Ciência da Computação',32,1);
insert into Estudante (ENUM,ENOME,Curso,Idade,Periodo) values (4,'Luiz Felipe','SISTEMAS DE INFORMACAO',31,1);
insert into Estudante (ENUM,ENOME,Curso,Idade,Periodo) values (5,'Ricardo Pedro','SISTEMAS DE INFORMACAO',35,1);

rem Inserir Prof
insert into Prof(PId,PNome,Dept) values(0,'Prof. João Ricardo','Sistemas de Informação');
insert into Prof(PId,PNome,Dept) values(1,'Prof. Kleber Kruger','Sistemas de Informação');
insert into Prof(PId,PNome,Dept) values(2,'Prof. Angelo','Sistemas de Informação');
insert into Prof(PId,PNome,Dept) values(3,'Prof. Ekler Kruger','Sistemas de Informação');
insert into Prof(PId,PNome,Dept) values(4,'Prof. Juliana','Sistemas de Informação');
insert into Prof(PId,PNome,Dept) values(5,'Prof. Marcel','Sistemas de Informação');
insert into Prof(PId,PNome,Dept) values(6,'Prof. Gedson','Sistemas de Informação');
insert into Prof(PId,PNome,Dept) values(7,'Prof. Prof. Antônio','Ciência da Computação');

rem Inserir Disciplina
insert into Disciplina(DId,Dnome,PId)values(0,'Redes de Computadores',0);
insert into Disciplina(DId,Dnome,PId)values(1,'Estrutura de Dados I',1);
insert into Disciplina(DId,Dnome,PId)values(2,'Algoritmos I',2);
insert into Disciplina(DId,Dnome,PId)values(3,'Arq. de Computadores',2);

rem Inserir Matricula
insert into Matriculado(ENUM,DId)values(0,0);
insert into Matriculado(ENUM,DId)values(0,1);
insert into Matriculado(ENUM,DId)values(0,2);
insert into Matriculado(ENUM,DId)values(0,3);
insert into Matriculado(ENUM,DId)values(1,0);
insert into Matriculado(ENUM,DId)values(1,1);
insert into Matriculado(ENUM,DId)values(1,2);
insert into Matriculado(ENUM,DId)values(1,3);
insert into Matriculado(ENUM,DId)values(2,0);
insert into Matriculado(ENUM,DId)values(2,1);
insert into Matriculado(ENUM,DId)values(2,2);
insert into Matriculado(ENUM,DId)values(2,3);
insert into Matriculado(ENUM,DId)values(3,0);
insert into Matriculado(ENUM,DId)values(3,1);
insert into Matriculado(ENUM,DId)values(3,2);
insert into Matriculado(ENUM,DId)values(3,3);
insert into Matriculado(ENUM,DId)values(5,0);

rem Inserir Aula
insert into Aula (DId,DiaSemana,Sala,Horario)values(1,'Sexta-Feira','1','13:00');
insert into Aula (DId,DiaSemana,Sala,Horario)values(2,'Segunda-Feira','1','14:00');    
insert into Aula (DId,DiaSemana,Sala,Horario)values(2,'Sexta-Feira','1','20:00');
insert into Aula (DId,DiaSemana,Sala,Horario)values(1,'Terça-Feira','1','15:00');
insert into Aula (DId,DiaSemana,Sala,Horario)values(0,'Sexta-Feira','1','17:00');
insert into Aula (DId,DiaSemana,Sala,Horario)values(3,'Sexta-Feira','1','13:00');

