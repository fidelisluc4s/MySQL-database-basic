create table locacao(
codigo_locacao decimal(5),
codigo_cliente decimal(4),
codigo_filme decimal(3),
valor double (5,2),
data_locacao date,
constraint pk_cod_loca primary key(codigo_locacao));


/*abela cliente:
o Altere o atributo rua para endereço do tipo varchar(70);
o Elimine os atributos bairro, cidade e cep.
o O atributo cpf deverá ser chave candidata.
o O atributo datanasc não poderá ter o valor nulo.*/
alter table cliente change rua endereco varchar(70),
drop bairro,
drop cidade,
drop cep,
drop primary key,
add constraint pk_cpf primary key(cpf),
modify datanasc date not null;

/*Tabela filme:
o O atributo duracao não poderá receber o valor nulo.
o O atributo estreia deverá ter o valor padrão ‘2022-01-01’*/

desc filme;

alter table filme modify duracao decimal(40) not null,
modify estreia date default '2022-01-01';

/*Tabela diretor:
o O atributo nome_diretor não poderá receber o valor nulo.
o Adicione os atributos rua, bairro,cidade,cep,cpf e telefone com o tipo que achar 
mais apropriado.*/

alter table diretor modify nome_diretor varchar(50) not null,
add rua varchar(30),
add bairro varchar(30),
add cidade varchar(30),
add cep decimal(8),
add cpf decimal(11),
add telefone varchar(11);


/*Tabela genero:
o O atributo nome_genero deverá ser do tipo varchar(30) 
e o deverá receber o valor padrão comédia.*/

alter table genero modify nome_genero varchar(30) 
default 'comédia';

desc genero;

/*Tabela locacao:
o Adicione o atributo data_entrega do tipo data*/

alter table locacao add data_entrega date;

insert into locacao values
(1,1111,300,5.00,'2016-05-01','2016-05-03'),
(2,1111,310,5.50,'2016-05-09','2016-05-19'),
(3,1111,320,5.30,'2016-04-22','2016-04-28'),
(4,1212,301,6.80,'2016-03-10','2016-03-15'),
(5,1212,302,5.70,'2016-03-12','2016-03-17'),
(6,1313,321,7.00,'2016-06-13','2016-06-18');

/*QUESTÃO 4 (2 pontos): Crie as seguintes chave 
estrangeira na tabela locacao:• O atributo codigo_cliente
 é a chave estrangeira da tabela locacao. Este atributo 
 referencia a tabela cliente na coluna codigo_cliente.
• O atributo codigo_filme é a chave estrangeira da tabela 
locacao. Este atributo referencia a tabela 
filme na coluna codigo_filme.
Crie a chave estrangeira com on update cascade e 
on delete cascade.*/

create index fk_cod_cliente on cliente(codigo_cliente);

create index fk_cod_filme on filme(codigo_filme);

alter table locacao add constraint fk_cod_cliente
foreign key(codigo_cliente) references cliente(codigo_cliente)
on update cascade on delete cascade,
add constraint fk_cod_filme 
foreign key(codigo_filme) references filme(codigo_filme) 
on update cascade on delete cascade;
