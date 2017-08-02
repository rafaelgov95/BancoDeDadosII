rem eliminando tabelas
rem ************************************************************
    drop table arsenal;
    drop table categoria;
    drop table municao;
    drop table arma;
    drop table calibre;
    drop table policial;
    drop table restricao;

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
   (cod_restricao      number(3)    constraint restricao_pk primary key,
    nome_restricao     varchar2(30) constraint restricao_nome_nu not null,
    nivel   number(2) constraint restricao_nivel_nu not null,
    modificacao    date default sysdate);

create table calibre
   (cod_calibre      number(3)    constraint calibre_pk primary key,
    nome_calibre     varchar2(30) constraint calibre_nome_nu not null,
    restricao  constraint calibre_restricao_fk references restricao(cod_restricao),
    modificacao    date default sysdate);

create table categoria
   (cod_categoria    number(3)    constraint categoria_pk primary key,
    nome_categoria    varchar2(30) constraint categoria_nome_nu not null,
    modificacao    date default sysdate);

create table municao
   (cod_municao    number(3)    constraint municao_pk primary key,
    nome_municao    varchar2(30) constraint municao_nome_nu not null,
    calibre  constraint municao_calibre_fk references calibre(cod_calibre),
    modificacao    date default sysdate);

create table arma
   (cod_arma      number(3)    constraint arma_pk primary key,
    nome_arma     varchar2(30) constraint arma_nome_nu not null,
    categoria constraint arma_categoria_fk references categoria(cod_categoria),
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
insert into restricao (cod_restricao, nome_restricao, nivel)
values (1, 'Forças Armadas',1);
rem ************************************************************
rem Insert Calibre
rem ************************************************************
insert into calibre (cod_calibre,  nome_calibre, restricao)
values (1, '.45', 1);
rem ************************************************************
rem Insert Categoria
rem ************************************************************
insert into categoria (cod_categoria,  nome_categoria, restricao)
values (1, 'Fuzil Longo', 1);
rem ************************************************************
rem Insert Municao
rem ************************************************************
insert into municao (cod_municao,  nome_municao, calibre)
values (1, 'Expansiva',1);
rem ************************************************************
rem Insert Arma
rem ************************************************************
insert into arma (cod_arma, nome_arma,categoria, municao,fabricante)
values (1, 'AK-47',1,1,'Rusia');
rem ************************************************************
rem Insert Arsenal
rem ************************************************************
insert into arsenal(cod_arsenal,  cod_policial, cod_arma,valor_arma)
values (1, 1,1,'50000');
rem ************************************************************