--Autor : Rafael Viana
--Banco de Dados II

--Segue abaixo alguns comando que serão utilizados para realizar consultas pelos policias do 5BPM, são de verdadeiros valores.

--- Quantas armas  estão cadastrados?

select count(*) from arma  

--- listar munições ?

select * from municao

--- listar categorias ?

select count(*) from categoria  
 
--- Quantos policiais estão cadastrados?

select count(*) from policial  

--- Quantos registro existe de cadastro de arma de fogo ?

select count(*) from arsenal  

--- Lista o Arsenal de Armas

select cod_arsenal as "Codigo",(select nome_policial from policial p where a.cod_policial= p.cod_policial) as "Policial" ,(select nome_arma from arma p where a.cod_arma= p.cod_arma) as "Arma", valor_arma as "Valor da Arma", cadastro_criado as"Dia Do Cadastro" from arsenal a 

--- Quantas armas Allan Lemar possui 
select count(cod_arma) from arsenal a, policial p where  a.cod_policial = p.cod_policial and p.nome_policial like 'Lura Harrison'

