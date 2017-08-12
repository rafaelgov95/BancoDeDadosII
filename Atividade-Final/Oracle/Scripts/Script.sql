rem Atividate Banco de Dados II - RafaelViana
rem eliminando tabelas
rem ************************************************************
    drop sequence policial_proximo;
    drop sequence arsenal_proximo;
    drop sequence arma_proximo;
    drop sequence municao_proximo;
    drop table arsenal;
    drop table arma;
    drop table categoria;
    drop table municao;
    drop table calibre;
    drop table restricao;
    drop table policial;
rem criando tabelas
rem ************************************************************

CREATE SEQUENCE arma_proximo
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE municao_proximo
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE arsenal_proximo
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE policial_proximo
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

create table policial
   (cod_policial      number(3)    constraint policial_pk primary key,
    nome_policial     varchar2(30) constraint policial_nome_nu not null,
    tel_policial         varchar2(20),
    matricula          varchar2(15),
    patente           char(5)      default 'SD' constraint policial_patente_set
                            check (patente in ('SD', 'CB', 'SGT', 'TEN', 'CAP', 'MAJ', 'SD')),
    cadastro_criado            date default sysdate);


create table restricao
   (nome_restricao varchar2(30) constraint restricao_pk primary key,
    nivel   number(2) constraint restricao_nivel_nu not null,
    modificacao    date default sysdate);

create table calibre
   (nome_calibre varchar2(20) constraint calibre_pk primary key,
    restricao  constraint calibre_restricao_fk references restricao(nome_restricao),
    modificacao    date default sysdate);

create table municao
   (cod_municao    number(3)    constraint municao_pk primary key,
    nome_municao    varchar2(30) constraint municao_nome_nu not null,    
    calibre  constraint municao_calibre_fk references calibre(nome_calibre),
    modificacao    date default sysdate);

create table categoria
   (nome_categoria varchar2(20) constraint categorio_pk primary key,
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

insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Lura Harrison', '378-(336)405-1906', 'SD', '54569-1873');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Agna Lempel', '33-(401)163-8782', 'CAP', '16729-197');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Atlanta Piolli', '46-(394)446-6310', 'CB', '66391-0604');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Sisile Orrock', '86-(491)796-5577', 'CAP', '0378-6321');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Ariela Donke', '242-(435)414-7992', 'CB', '66490-691');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Tymon Jedryka', '55-(978)153-1498', 'SD', '41250-393');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
 values (policial_proximo.nextval, 'Ronda Leaburn', '86-(370)509-5097', 'SD', '23155-015');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Giorgia Constanza', '62-(470)434-4155', 'SD', '57896-629');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Suzy McGilbon', '46-(982)978-2414', 'SD', '59676-303');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Vi Double', '52-(167)698-7568', 'SGT', '68016-206');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Gran Stilly', '359-(673)175-5721', 'CAP', '36987-1900');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Milzie Fills', '86-(709)835-6813', 'SGT', '55111-530');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Juieta Challis', '62-(468)420-3304', 'CB', '61722-086');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Herminia Ingamells', '86-(349)260-2679', 'CB', '51079-926');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Gwenny Seebert', '81-(335)124-7664', 'SGT', '36987-2096');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Van McSDstie', '52-(582)704-3202', 'SGT', '54473-214');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Deirdre Hampson', '46-(805)444-4763', 'SD', '36987-2159');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Jewell Jordine', '63-(447)494-5165', 'SD', '16590-116');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Charleen McIlmorie', '377-(149)545-5799', 'SD', '0268-6651');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Christel Stooders', '229-(329)135-6680', 'SD', '98132-711');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Emelita Spread', '62-(733)647-0543', 'TEN', '36987-2128');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Wade Hallward', '225-(912)680-0385', 'SD', '59746-386');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Lee Mayberry', '63-(428)406-9358', 'SGT', '68084-128');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Christian Prettejohns', '994-(134)983-1599', 'SD', '52544-039');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Erhart Flaxman', '48-(861)713-6011', 'TEN', '63187-167');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Brynna Slowgrove', '216-(432)537-2033', 'SD', '0054-0251');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Joshua Cajkler', '46-(863)951-8410', 'CAP', '50666-006');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Julina Napleton', '970-(959)467-3476', 'SD', '49349-417');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Guglielma Anelay', '31-(103)809-0555', 'SD', '61625-682');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Garrik Busby', '63-(765)197-1345', 'SD', '0054-0115');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
 values (policial_proximo.nextval, 'Mildred Mantione', '62-(124)450-2254', 'CB', '75874-424');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Louisa Mayman', '33-(455)243-7018', 'SD', '55513-053');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Marlo Cleworth', '63-(705)650-7939', 'CB', '63629-1397');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Atlante Belhomme', '49-(461)255-4276', 'CB', '59351-0304');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Dill Izakson', '55-(605)783-4589', 'SGT', '45014-152');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Harley Scogings', '46-(607)235-4945', 'TEN', '52124-3201');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Glynda Domenge', '62-(305)502-0377', 'SGT', '50436-9022');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Adella Ridgers', '55-(712)290-4066', 'TEN', '10056-666');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Alexis Galer', '212-(745)490-0471', 'TEN', '49288-0821');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Rosaleen Parkhouse', '55-(132)826-3581', 'TEN', '68084-074');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Codie Hurran', '57-(682)429-7181', 'SD', '41250-014');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Chicky Tregona', '86-(745)777-1687', 'CAP', '29033-018');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Glyn Millmore', '86-(234)673-8372', 'SGT', '15821-101');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Karleen Howells', '62-(428)199-4209', 'CB', '0093-0263');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Cullin Schimmang', '420-(454)625-7864', 'SD', '0268-1284');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Brigid Bythell', '374-(816)852-7764', 'SD', '63736-203');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Sibilla Coggles', '20-(880)216-2388', 'CAP', '54868-5409');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Nye Beller', '62-(503)832-9560', 'CAP', '0093-0028');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Vivyanne Whittingham', '420-(123)163-4828', 'SD', '51009-001');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Donnajean Chaudrelle', '48-(754)392-0206', 'TEN', '61010-2111');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Wilt Chastang', '420-(255)370-7362', 'SD', '13107-154');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Antonella Dahmel', '62-(219)316-6687', 'CB', '67253-234');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Olivier Lademann', '20-(540)922-6793', 'SD', '0904-5892');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Merl Rayman', '7-(536)381-5430', 'CB', '59779-216');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Emalee Kirkby', '62-(359)458-7782', 'CB', '64117-888');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Nevile O''Callaghan', '976-(373)216-8728', 'SGT', '59762-5032');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Steffie Antonin', '47-(159)637-1706', 'SGT', '54868-2361');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Clareta Richfield', '235-(138)655-6029', 'CB', '49348-828');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Patric Sydall', '420-(420)130-5681', 'CAP', '54575-168');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Timotheus Housegoe', '420-(208)353-6741', 'SD', '0173-0388');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Harald Le Fleming', '86-(160)793-5083', 'TEN', '47682-936');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Rubin Silson', '62-(355)648-3759', 'TEN', '49999-327');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Berkeley Galsworthy', '503-(220)683-6227', 'SD', '51486-002');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Rowen Fullagar', '381-(224)964-7086', 'CAP', '49288-0188');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Shadow Moules', '62-(163)835-0139', 'TEN', '68084-255');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Bentley Lugard', '55-(994)829-6771', 'TEN', '36987-2591');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Jammal Jewett', '93-(554)825-4823', 'MAJ', '43269-676');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Carmel Dugall', '46-(224)420-5452', 'MAJ', '60429-318');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Hansiain Cooney', '358-(476)186-8309', 'CAP', '63304-451');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Winnifred Hardinge', '62-(720)241-7587', 'SGT', '49726-021');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Edythe Dunbobin', '86-(129)252-5844', 'CAP', '40032-161');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Hildagarde Rawstorn', '33-(134)232-7005', 'CAP', '36987-2375');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Dewain Davers', '998-(632)834-6644', 'CB', '0409-7075');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Kaitlynn SDucher', '7-(899)848-2709', 'MAJ', '0378-4519');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Rosamond Harkess', '86-(143)837-9461', 'MAJ', '59779-099');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Berthe Adolphine', '46-(765)551-4155', 'SGT', '75862-021');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Cart McFaell', '420-(539)255-6712', 'SD', '68788-9422');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Barnaby McGifford', '86-(838)793-7660', 'MAJ', '0904-0012');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Nichole Sallter', '46-(928)618-9106', 'SD', '63354-140');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Trenton Alliston', '84-(211)324-7845', 'MAJ', '60505-0166');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Culley Luker', '33-(610)638-7931', 'SD', '42291-710');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Tove Kilban', '86-(232)674-6795', 'CB', '55648-987');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Allan Lemar', '264-(293)870-2132', 'CB', '43742-0404');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Fabe Kulver', '507-(887)741-4851', 'MAJ', '0053-8132');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Rachael Riccardo', '86-(306)283-0115', 'SD', '51672-4069');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Rheba Kipping', '63-(941)730-0372', 'CB', '36987-2431');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Mick Stansall', '506-(219)158-7494', 'CB', '67405-435');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Karol Ramalho', '962-(133)818-5488', 'SGT', '50730-8717');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Darbee Antonsen', '590-(919)757-4369', 'CB', '55154-8386');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Gregor Pitkins', '48-(702)979-7756', 'CAP', '36987-3158');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Mathian Garoghan', '86-(109)563-9635', 'SD', '27293-012');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Barton Snowsill', '30-(934)132-7033', 'SD', '54868-3713');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Bent Middlemass', '81-(969)832-3034', 'SD', '76420-470');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Elvyn Kerss', '994-(174)234-3667', 'CB', '44567-310');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Dallis Aberchirder', '86-(329)836-2158', 'CB', '51770-154');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Trevor Duncan', '1-(539)412-0160', 'TEN', '64942-1235');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Gilburt Beebe', '62-(542)427-5660', 'CB', '50458-830');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Ulrica Tambling', '998-(427)593-0161', 'TEN', '51143-641');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Woodie Isakson', '62-(507)346-6506', 'SGT', '36987-1547');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Burt Fitzharris', '86-(747)529-4555', 'CAP', '63044-401');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Felizio Marusic', '92-(936)947-7950', 'SGT', '0409-9633');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Rhianon Calder', '86-(504)334-1107', 'CAP', '57469-022');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Corny Rennix', '251-(925)269-3832', 'TEN', '0228-3262');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Ilaire Spellsworth', '63-(214)987-3923', 'MAJ', '68788-9683');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Karia Ciotto', '46-(460)889-5586', 'TEN', '63629-1394');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Doris Powe', '93-(853)425-6721', 'CB', '31722-302');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Francklin Benettolo', '86-(188)231-8802', 'SD', '55154-3189');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Nilson Brickstock', '86-(778)842-7730', 'SD', '58668-2021');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Kale De Laci', '33-(417)678-4470', 'SD', '53489-161');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Liuka Loosemore', '86-(610)894-5933', 'SD', '0268-1324');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Miner Arnfield', '1-(737)641-7263', 'SD', '17478-114');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Aristotle Redler', '62-(897)126-5902', 'TEN', '52125-198');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Charyl Oxherd', '98-(531)689-8714', 'SGT', '62584-259');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Ketti Coey', '55-(646)787-0787', 'SD', '21695-145');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Constantia Pehrsson', '358-(955)561-8935', 'MAJ', '54575-426');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Gus Clitheroe', '62-(474)228-2011', 'SD', '43846-0030');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Cynthea Caroli', '51-(797)902-0882', 'SD', '0113-0857');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Gerri Worral', '269-(180)788-0518', 'SD', '21130-009');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Hort Sola', '86-(233)957-5678', 'CB', '43479-204');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Helena Wernher', '55-(100)215-9838', 'MAJ', '24236-083');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Germana Dethloff', '46-(348)682-2192', 'CB', '49999-881');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Luci Cuppleditch', '46-(796)295-0034', 'CB', '10544-381');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Harley Belhome', '48-(753)222-0445', 'SD', '61957-1114');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Brennan Paffett', '86-(776)215-2431', 'SGT', '55154-3276');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Torey Grigorio', '30-(567)199-3758', 'CB', '0168-0275');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Fredelia Letty', '352-(128)570-8591', 'MAJ', '36987-1926');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Rozamond Snoding', '351-(927)393-3722', 'CB', '0615-3596');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Carolee Guinery', '7-(912)256-5209', 'SD', '67457-456');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Ari Ramirez', '351-(221)387-6792', 'TEN', '75870-003');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Ripley Ravenscraft', '595-(641)403-2096', 'TEN', '64616-080');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Ina Sipson', '86-(809)834-8341', 'SGT', '63629-4368');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Orsa Trunkfield', '504-(969)273-5780', 'SGT', '56062-437');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Yalonda Bretland', '380-(337)719-1781', 'SD', '68180-122');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Martica Menat', '86-(718)331-8722', 'SD', '13537-434');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
 values (policial_proximo.nextval, 'Nataniel McLeod', '46-(789)585-7626', 'MAJ', '61995-2388');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Conway Gercke', '62-(973)561-8790', 'TEN', '66608-515');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Tanner Kaveney', '94-(858)250-5649', 'TEN', '55154-2028');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Katalin Raitt', '355-(558)536-6345', 'SD', '0536-3113');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Blondie SDwch', '1-(816)779-3880', 'CAP', '58118-8943');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Chrysler Zaple', '62-(391)307-3642', 'CAP', '52125-582');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Cecil Diggles', '1-(850)436-0269', 'MAJ', '49744-0001');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Tansy Steels', '7-(342)493-1169', 'TEN', '43547-256');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Veronike Connerly', '62-(789)595-8465', 'TEN', '65923-011');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Hayyim Libero', '55-(306)806-7272', 'SGT', '43275-100');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Selene Enos', '33-(576)464-1116', 'SD', '65862-079');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Melody Bastow', '86-(993)215-8588', 'SD', '68084-333');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Ailyn Battyll', '7-(157)280-0555', 'MAJ', '68788-9432');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Ronalda Dodgshon', '381-(666)706-4984', 'CB', '58118-0211');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Lucila Kincey', '98-(269)924-1854', 'CAP', '0179-0023');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Sanson Appleyard', '51-(277)338-1485', 'CAP', '49288-0565');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Sigfried Weippert', '86-(341)125-5542', 'MAJ', '52125-702');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Yorgo Craske', '7-(716)944-2612', 'TEN', '42893-021');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Tailor Radford', '48-(900)674-3755', 'MAJ', '66975-350');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Peri Noon', '62-(121)642-9142', 'SGT', '55714-2249');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Harvey Bushell', '7-(149)911-4582', 'MAJ', '49288-0474');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Devland Hansman', '234-(217)295-7928', 'TEN', '42507-210');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Avram Crawshaw', '507-(207)182-3851', 'MAJ', '68016-117');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Mavis Adriani', '43-(598)638-8587', 'SD', '58668-4081');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Allx Goodsall', '381-(590)516-2424', 'SGT', '76436-130');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Ebony Marquess', '92-(891)770-3151', 'SD', '0268-0825');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Zsa zsa Lopez', '380-(826)941-4883', 'MAJ', '0591-5238');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Doro Torrejon', '420-(519)664-2636', 'SGT', '61703-408');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Andriana Priddle', '33-(423)480-4638', 'CB', '54868-5074');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Perren Forrest', '351-(542)676-3448', 'SGT', '37000-091');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Vicki Bullin', '351-(684)202-9225', 'SD', '55910-799');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Janey Le Friec', '48-(554)491-8818', 'SD', '58980-811');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Zackariah Bradnocke', '55-(281)999-5545', 'SD', '59762-0047');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Nancy Haddow', '62-(484)970-2754', 'CB', '37808-425');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) values (policial_proximo.nextval, 'Estrella Guerry', '380-(955)466-8053', 'MAJ', '65121-010');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Kristi Bitten', '55-(805)733-9923', 'CAP', '0597-0137');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Patricio Alves', '1-(757)657-3038', 'TEN', '36987-1435');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Alaine Joust', '55-(743)626-7297', 'CAP', '51523-022');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Sloane Sherrett', '234-(296)451-5582', 'TEN', '63824-215');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Jimmie Spain-Gower', '33-(546)830-6023', 'MAJ', '54868-5991');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Darrelle Elsip', '963-(592)141-9689', 'CB', '33342-072');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Lockwood Medlen', '267-(872)874-3217', 'TEN', '53499-2590');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Norry McPhillips', '86-(770)146-1463', 'MAJ', '13537-550');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Colan Succamore', '7-(397)694-4626', 'CAP', '0615-2519');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Sammy Byard', '7-(775)369-9727', 'SD', '0069-0103');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Hagen Martellini', '51-(807)214-8592', 'TEN', '54973-9123');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Willdon Perago', '55-(654)141-7898', 'SD', '0054-8176');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Nahum Meneur', '1-(817)938-6996', 'SD', '0069-8140');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Candida Kryzhov', '86-(820)454-3016', 'SD', '48951-1208');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Merissa Gillam', '52-(898)781-5364', 'TEN', '59564-251');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Debee Ivanishev', '7-(156)678-7382', 'CB', '53208-418');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Edwina Raynton', '380-(830)892-4751', 'SD', '36987-2293');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Lorianne Grzegorczyk', '1-(812)248-7378', 'CAP', '0268-0626');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Lana Borrel', '81-(795)764-5499', 'SGT', '42549-628');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Sioux Traill', '86-(251)661-7567', 'SGT', '13107-077');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Elna Skinley', '46-(893)471-9092', 'SGT', '11822-0404');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Thorstein MacMurray', '52-(871)198-3851', 'MAJ', '43742-0133');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Cathie Jowers', '351-(427)161-9047', 'SD', '43857-0211');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Hetti Dobeson', '81-(351)364-8773', 'SD', '0173-0242');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Jelene Pritty', '30-(445)305-6314', 'CB', '0185-0940');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Brooks Garnall', '7-(180)986-4781', 'MAJ', '55789-2401');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Finlay Pettigree', '267-(635)337-2398', 'MAJ', '65044-2486');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Darell Bourgour', '20-(188)933-9614', 'TEN', '55111-231');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula) 
values (policial_proximo.nextval, 'Andros Colvie', '62-(601)968-1300', 'CB', '67877-225');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Stormy Rapsey', '351-(401)787-9306', 'TEN', '49288-0251');
insert into policial (cod_policial, nome_policial, tel_policial, patente, matricula)
values (policial_proximo.nextval, 'Matty Heaford', '63-(315)790-1440', 'SGT', '54723-150');

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
insert into calibre ( nome_calibre,restricao)
values ('.30','Forcas Armadas');
insert into calibre ( nome_calibre,restricao)
values ('.50','Forcas Armadas');
insert into calibre ( nome_calibre,restricao)
values ('22','Civil');
insert into calibre ( nome_calibre,restricao)
values ('380','Forcas Especiais');
insert into calibre ( nome_calibre,restricao)
values ('12','Militar');
insert into calibre ( nome_calibre,restricao)
values ('.45','Forcas Armadas');
insert into calibre ( nome_calibre,restricao)
values ('38','Civil');
rem ************************************************************
rem Insert Categoria
rem ************************************************************
insert into categoria ( nome_categoria)
values ( 'Pistola');
insert into categoria ( nome_categoria)
values ( 'Revolver');
insert into categoria ( nome_categoria)
values ( 'Fuzil Longo');
insert into categoria ( nome_categoria)
values ( 'Fuzil Baixo');
insert into categoria ( nome_categoria)
values ( 'Metralhadora');
insert into categoria ( nome_categoria)
values ( 'Escopeta');
insert into categoria ( nome_categoria)
values ( 'Carabina');
insert into categoria ( nome_categoria)
values ( 'Fuzil Médio');
rem ************************************************************
rem Insert Municao
rem ************************************************************
insert into municao (cod_municao,nome_municao,calibre)
values (municao_proximo.nextval, 'CBC TTDL','22');
insert into municao (cod_municao,nome_municao,calibre)
values (municao_proximo.nextval, 'RTD LDQ','12');
insert into municao (cod_municao,nome_municao,calibre)
values (municao_proximo.nextval, 'TAURUS 2020','380');
insert into municao (cod_municao,nome_municao,calibre)
values (municao_proximo.nextval, 'CBC TDDL','22');
insert into municao (cod_municao,nome_municao,calibre)
values (municao_proximo.nextval, 'TAURUS DAQL','12');
insert into municao (cod_municao,nome_municao,calibre)
values (municao_proximo.nextval, 'CBC 23D','380');
insert into municao (cod_municao,nome_municao,calibre)
values (municao_proximo.nextval, 'CBC 398','.45');
insert into municao (cod_municao,nome_municao,calibre)
values (municao_proximo.nextval, 'TAURUS DCQ','.45');
insert into municao (cod_municao,nome_municao,calibre)
values (municao_proximo.nextval, 'TAURUS QDL','.45');
insert into municao (cod_municao,nome_municao,calibre)
values (municao_proximo.nextval, 'TAURUS 38','38');
rem ************************************************************
rem Insert Arma
rem ************************************************************
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (arma_proximo.nextval, 'AK-47','Fuzil Longo',1,'TAURUS');
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (arma_proximo.nextval, 'AK-34','Fuzil Baixo',7,'TAURUS');
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (arma_proximo.nextval, 'Beretta 84FS Cheetah','Pistola',4,'CBC');
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (arma_proximo.nextval,'Luger P08','Pistola',5,'TAURUS');
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (arma_proximo.nextval, 'Colt Special Combat de Co2','Pistola',5,'TAURUS');
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (arma_proximo.nextval, 'Smith & Wesson model Governor','Pistola',2,'CBC');
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (arma_proximo.nextval, 'Taurus the Judge','Pistola',4,'TAURUS');
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (arma_proximo.nextval, 'ASG Dan Wesson','Revolver',4,'TAURUS');
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (arma_proximo.nextval, 'Taurus RT44','Revolver',3,'CBC');
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (arma_proximo.nextval, 'IMI Desert Eagle','Pistola',5,'CBC');
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (arma_proximo.nextval, 'Walther PPK/S','Pistola',2,'CBC');
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (arma_proximo.nextval, 'Glock 9mm','Pistola',4,'CBC');
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (arma_proximo.nextval, 'MP4','Metralhadora',1,'TAURUS');
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (arma_proximo.nextval, 'MP3','Metralhadora',7,'TAURUS');
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (arma_proximo.nextval, 'Beretta  Cheetah','Metralhadora',4,'CBC');
insert into arma (cod_arma, nome_arma,categoria,municao,fabricante)
values (arma_proximo.nextval,'Luger P08','Pistola',5,'TAURUS');



rem ************************************************************
rem Insert Arsenal
rem ************************************************************
insert into arsenal(cod_arsenal, cod_policial, cod_arma,valor_arma)
values (arsenal_proximo.nextval, 1,1,'50000');

insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 122, 1, 39421);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 86, 6, 58304);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 125, 9, 24783);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 24, 1, 97383);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 83, 14, 99559);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 34, 10, 64882);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 17, 1, 65255);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 51, 14, 71692);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 23, 12, 59602);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 33, 7, 88775);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 18, 6, 51689);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 128, 8, 84219);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 32, 6, 87588);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 46, 7, 17150);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 11, 3, 72089);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 125, 14, 17276);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 80, 2, 44527);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 4, 11, 47310);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 15, 4, 55125);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 117, 7, 67177);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 84, 12, 22923);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 73, 1, 27683);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 122, 1, 56681);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 80, 4, 63907);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 126, 8, 88389);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 4, 15, 68449);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 116, 2, 84582);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 28, 11, 83885);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 76, 8, 76709);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 4, 6, 59712);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 118, 11, 18221);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 103, 5, 87174);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 29, 12, 42045);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 38, 12, 62098);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 52, 11, 52262);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 53, 6, 94197);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 114, 13, 22283);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 120, 12, 83390);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 67, 14, 39299);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 116, 9, 78516);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 39, 14, 56343);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 69, 12, 84887);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 3, 13, 65963);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 125, 8, 42909);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 24, 12, 62986);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 119, 9, 26800);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 9, 4, 93607);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 64, 14, 17357);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 126, 6, 76394);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 85, 4, 60604);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 100, 4, 57231);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 40, 2, 91845);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 9, 14, 18450);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 81, 2, 70474);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 6, 15, 90642);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 37, 5, 67478);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 46, 4, 56974);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 31, 6, 48541);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 21, 6, 18421);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 14, 14, 50339);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 19, 12, 82726);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 4, 1, 61976);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 1, 14, 54871);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 56, 10, 93932);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 89, 8, 18932);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 49, 15, 54185);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 109, 14, 40845);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 40, 5, 35014);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 104, 10, 33410);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 1, 10, 93875);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 62, 2, 91458);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 4, 11, 82295);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 74, 12, 38241);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 21, 2, 29568);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 35, 5, 69867);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 112, 9, 50927);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 12, 12, 58539);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 71, 1, 79416);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 21, 5, 95326);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 52, 15, 58698);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 8, 4, 44554);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 123, 14, 45778);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 13, 6, 77670);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 30, 1, 55114);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 97, 11, 75325);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 72, 5, 26009);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 8, 6, 95490);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 106, 2, 44332);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 21, 6, 58661);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 45, 5, 47451);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 40, 6, 51774);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 36, 10, 19308);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 12, 1, 57503);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 62, 13, 39512);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 17, 1, 61545);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 107, 7, 16252);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 111, 14, 23774);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 58, 13, 73706);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 61, 4, 73650);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 38, 13, 58102);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 33, 15, 72541);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 38, 6, 15363);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 35, 6, 94008);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 123, 13, 20062);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 93, 11, 69407);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 29, 10, 69357);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 94, 12, 40713);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 14, 5, 56503);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 79, 7, 90271);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 57, 15, 65631);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 111, 10, 89840);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 47, 15, 48315);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 23, 10, 52371);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 119, 12, 43115);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 111, 4, 85498);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 81, 10, 14058);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 93, 12, 89552);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 63, 8, 75016);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 26, 13, 70841);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 33, 8, 89620);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 56, 14, 72182);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 56, 13, 77703);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 88, 1, 14943);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 85, 10, 69028);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 7, 15, 88192);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 47, 14, 19898);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 71, 2, 63868);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 49, 3, 15181);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 43, 6, 56637);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 106, 3, 43617);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 31, 10, 73694);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 46, 9, 34768);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 32, 12, 40081);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 109, 4, 17191);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 106, 10, 33617);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 91, 9, 79173);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 107, 15, 84175);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 61, 13, 76322);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 118, 6, 41529);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 122, 15, 70580);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 118, 6, 68241);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 123, 2, 44063);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 107, 11, 97648);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 120, 13, 44798);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 48, 11, 22942);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 13, 4, 65793);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 38, 15, 57126);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 85, 9, 39788);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 127, 3, 98413);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 7, 8, 16516);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 45, 6, 92728);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 86, 7, 94396);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 51, 14, 46348);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 81, 11, 71816);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 91, 3, 42899);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 13, 9, 62742);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 36, 15, 94263);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 56, 12, 86843);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 124, 9, 21280);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 64, 8, 80428);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 16, 14, 35316);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 89, 6, 73869);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 41, 12, 67404);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 2, 6, 74851);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 75, 8, 27914);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 58, 5, 60442);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 121, 4, 96226);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 7, 6, 65124);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 120, 2, 79501);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 94, 15, 21201);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 97, 5, 77902);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 93, 13, 63598);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 80, 1, 23715);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 69, 14, 37721);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 94, 9, 33969);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 9, 10, 55306);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 123, 1, 71916);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 7, 2, 18727);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 19, 5, 53786);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 79, 9, 44048);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 7, 13, 34008);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 46, 4, 74233);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 16, 1, 32500);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 66, 2, 64363);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 53, 6, 80014);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 73, 13, 30611);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 29, 8, 14837);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 109, 9, 90130);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 67, 8, 76393);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 32, 15, 47075);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 59, 13, 50273);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 118, 3, 55664);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 6, 1, 83300);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 73, 1, 34968);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 81, 2, 71189);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 17, 6, 36987);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 58, 3, 62465);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 11, 14, 39986);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 98, 1, 96859);
insert into arsenal (cod_arsenal, cod_policial, cod_arma, valor_arma) values (arsenal_proximo.nextval, 8, 12, 15584);

rem ************************************************************​