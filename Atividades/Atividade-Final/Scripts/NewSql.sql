rem eliminando tabelas
rem ************************************************************
    drop table arsenal;
    drop table arma;
    drop table categoria;
    drop table municao;
    drop table calibre;
    drop table restricao;
    drop table policial;

rem criando tabelas
rem ************************************************************


create table policial
   (cod_policial      number(3)    constraint policial_pk primary key,
    nome_policial     varchar2(30) constraint policial_nome_nu not null,
    tel_policial         varchar2(10),
    matricula          varchar2(15),
    patente           char(5)      default 'SD' constraint policial_patente_set
                            check (patente in ('SD', 'CB', 'SGT', 'TEN', 'CAP', 'MAJ', 'CRO')),
    cadastro_criado            date default sysdate);

create table restricao
   (nome_restricao varchar2(30) constraint restricao_pk primary key,
    nivel   number(2) constraint restricao_nivel_nu not null,
    modificacao    date default sysdate);

create table calibre
   (nome_calibre varchar2(20) constraint calibre_pk primary key,
    modificacao    date default sysdate);

create table categoria
   (nome_categoria varchar2(20) constraint categorio_pk primary key,
    restricao  constraint categoria_restricao_fk references restricao(nome_restricao),
    modificacao    date default sysdate);

create table municao
   (cod_municao    number(3)    constraint municao_pk primary key,
    nome_municao    varchar2(30) constraint municao_nome_nu not null,
    calibre  constraint municao_calibre_fk references calibre(nome_calibre),
    restricao  constraint municao_restricao_fk references restricao(nome_restricao),
    modificacao    date default sysdate);

create table arma
   (cod_arma      number(3)    constraint arma_pk primary key,
    nome_arma     varchar2(30) constraint arma_nome_nu not null,
    categoria constraint arma_categoria_fk references categoria(nome_categoria),
    municao constraint arma_municao_fk references municao(cod_municao),
    fabricante   varchar2(30) constraint arma_fabricante_nome_nu not null,
    modificacao    date default sysdate);

create table arsenal
   (cod_arsenal  number(3),
    cod_policial  constraint arsenal_policial_fk references policial (cod_policial),
    cod_arma   constraint arsenal_arma_fk references arma (cod_arma),
    valor_arma number(20),
    cadastro_criado  date default sysdate,
    constraint arsenal_pk primary key (cod_arsenal,cod_policial));


rem Insert Policial
rem ************************************************************
insert into policial (cod_policial, nome_policial, tel_policial, matricula,patente)
values (1, 'Rafael  Viana', '344-8788','33232-33232','MAJ');
rem ************************************************************
rem Insert Restricao
rem ************************************************************
insert into restricao ( nome_restricao, nivel)
values ( 'Civil',1);
insert into restricao ( nome_restricao, nivel)
values ( 'Militar',3);
insert into restricao ( nome_restricao, nivel)
values ( 'Forcas Armadas',5);
insert into restricao ( nome_restricao, nivel)
values ( 'Forcas Especiais',6);
rem ************************************************************
rem Insert Calibre
rem ************************************************************
insert into calibre ( nome_calibre)
values ('.45');
rem ************************************************************
rem Insert Categoria
rem ************************************************************
insert into categoria ( nome_categoria,restricao)
values ( 'Fuzil Longo','Forcas Armadas');
rem ************************************************************
rem Insert Municao
rem ************************************************************
insert into municao (cod_municao,nome_municao,restricao,calibre)
values (1, 'Expansiva','Forcas Armadas','.45');
rem ************************************************************
rem Insert Arma
rem ************************************************************
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (1, 'AK-47','Fuzil Longo',1,'Rusia');
rem ************************************************************
rem Insert Arsenal
rem ************************************************************
insert into arsenal(cod_arsenal, cod_policial, cod_arma,valor_arma)
values (1, 1,1,'50000');
rem ************************************************************