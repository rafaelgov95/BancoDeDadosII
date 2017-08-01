rem eliminando tabelas
rem ************************************************************
   drop table arsenal;
    drop table categoria;
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
   (cod_categoria    number(3)    constraint restricao_pk primary key,
    nome_categoria    varchar2(30) constraint restricao_nome_nu not null,
    nivel   number(2) constraint categoria_nivel_nu not null,
    modificacao    date default sysdate);

create table arma
   (cod_arma      number(3)    constraint arma_pk primary key,
    nome_arma     varchar2(30) constraint arma_nome_nu not null,
    categoria constraint arma_categoria_fk references categoria(cod_categoria),
    calibre  constraint arma_calibre_fk references calibre(cod_calibre),
    fabricante   varchar2(30) constraint arma_fabricante_nome_nu not null,
    modificacao    date default sysdate);

create table arsenal
   (cod_arma     constraint arsenal_arma_fk references arma (cod_arma),
    cod_policial  constraint arsenal_policial_fk references policial (cod_policial),
    valor_arma varchar2(20),
    cadastro_criado  date default sysdate,
    constraint arsenal_pk primary key (cod_arma, cod_policial));

rem Insert Policial
rem ************************************************************
insert into policial (cod_policial, nome_policial, tel_policial, matricula,patente)
values (1, 'Rafael  Viana', '344-8788','33232-33232','MAJ');
rem ************************************************************
rem Insert Policial
rem ************************************************************
insert into calibre (cod_calibre,  nome_calibre, restricao)
values (1, 'Forças Armadas', 1);
rem ************************************************************
rem Insert Policial
rem ************************************************************