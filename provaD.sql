/*⦁	Crie a tabela abaixo a partir da figura e especificações:*/

create table cidada(
codigocidade decimal(4) primary key,
nomecidade varchar(40)
);

/*Tabela aeronave:
⦁	O atributo fabricante deverá se chamar nomefabricante;
⦁	Adicione o atributo capacidade do tipo inteiro.
*/

alter table aeronave change fabricante nomefabricante varchar(20),
add capacidade int;


/*Tabela assento:
⦁	O atributo classe deverá receber o valor padrão Econômica;
⦁	Adicione o atributo status do tipo caractere que pode receber 
de 0 a 15 caracteres;
⦁	O atributo status deverá receber o valor padrão Disponível;
*/

alter table assento modify classe varchar(20) default 'Econômica',
add status varchar(15) default 'Disponível';
desc assento;

/*Tabela cidade:
⦁	O atributo nomecidade não poderá receber o valor nulo.
*/

alter table cidada modify nomecidade varchar(40) not null;


/*Tabela cliente:
⦁	O atributo cpf deverá ser a chave candidata.	
⦁	Altere o atributo endereco para ser atributo do tipo caractere 
que pode receber de 0 a 45 caracteres;*/

alter table cliente modify  cpf varchar(13) unique,
modify endereco varchar(45);

desc cliente;

/*Tabela reserva:
⦁	O atributo codigocliente não poderá receber o valor nulo.
*/

alter table reserva modify codigocliente decimal(5) not null;

desc reserva;

/*Tabela voo:
⦁	O atributo numerovoo não poderá receber o valor nulo.	
⦁	Adicione o atributo status do tipo caractere que pode receber 
de 0 a 15 caracteres;*/

alter table voo modify numerovoo decimal(4) not null,
add status varchar(15);

/*⦁	Faça as seguintes inserções:
Tabela cidade:
*/

insert into cidada values
(1234,'rio de janeiro'),
(2345,'sao paulo'),
(3456,'belo horizonte'),
(4567,'brasilia'),
(5678,'juiz de fora');

/*⦁	Crie as seguintes chaves estrangeiras na tabela voo:
⦁	O atributo cidadeorigem é a chave estrangeira da tabela voo. 
Este atributo referencia a tabela cidade na coluna codigocidade.
⦁	O atributo cidadedestino é a chave estrangeira da tabela voo. 
Este atributo referencia a tabela cidade na coluna codigocidade.
Crie as chaves estrangeiras com on update cascade e on delete cascade.*/

alter table voo add constraint fk_cidade_origem
foreign key(cidadeorigem) references cidada(codigocidade)
on update cascade on delete cascade,
add constraint fk_cidade_destino 
foreign key(cidadedestino) references cidada(codigocidade)
on update cascade on delete cascade;


/*⦁	Faça as seguintes exclusões:
⦁	Tabela aeronave:
⦁	Elimine a aeronave do fabricante FABE.
*/

delete from aeronave where nomefabricante = 'fabe';

/*delete from aeronave where nomefabricante = 'fabe'	
Error Code: 1175. You are using safe update mode and you tried 
to update a table without a WHERE that uses a KEY column.  
To disable safe mode, toggle the option in Preferences -> 
SQL Editor and reconnect.*/

/*permissao*/
set sql_safe_updates= 0;

delete from aeronave where nomefabricante = 'fabe';

/*⦁	Tabela assento:
⦁	Elimine o(s) assento(s) de primeira classe e número K8.
*/

delete from assento where classe = 'primeira classe';

/*⦁	Tabela cliente:
⦁	Elimine os clientes que moram no endereço Olípio Costa, 
Rio de Janeiro – RJ ou possuem o cpf 20120120122.
*/

delete from cliente where endereco ='olípio costa, rio de janeiro - rj'
 and cpf = 20120120122;


/*⦁	Tabela reserva:
⦁	Elimine as reservas feitas em ‘2014-12-08’.*/


delete from reserva where datareserva = '2014-02-11';


/*⦁	Tabela voo:
⦁	Elimine os voos com em que o status é cancelado*/


delete from voo where status = 'disponivel';


/*⦁	Faça as seguintes atualizações:
⦁	Tabela aeronave:
⦁	Altere o ano de fabricação da aeronave PR-AZB para 2011.
⦁	Altere a capacidade do BOING para 525.
⦁	Altere a capacidade do AIRBUS para 215.
⦁	Aumente em 15% a capacidade do AIRBUS*/

update aeronave set anofabricacao =2011 where  prefixo = 'PR-AZB';

update aeronave set capacidade = 525 where nomefabricante = 'BOING';

update aeronave set capacidade = 215 where nomefabricante = 'airbus';

update aeronave set capacidade = 1.15*capacidade where nomefabricante = 'airbus';

/*⦁	Tabela assento:
⦁	Altere o status do assento K06 para Disponível e a 
classe para primeira classe.
⦁	Altere o status de todos os assentos para disponível.*/

update assento set status = 'Disponível' and classe = 'primeira classe'
where numeroassento = 'k16';

update assento set status= 'Disponível';


/*⦁	Tabela reserva:
Aumente em 10% o preço das reservas feitas a partir de 2014-12-01.*/

update reserva set preco = 1.1*preco where datareserva >= '2014-12-01';



/*desativando permissao*/
set sql_safe_updates= 1;












