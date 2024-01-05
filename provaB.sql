/* Crie a tabela produto_vendido a partir da figura e especificações:
• nr_venda: atributo do inteiro
• id_produto: atributo do tipo inteiro
• quantidade: atributo do tipo decimal com 5 dígitos, sendo 2 reservados a escala.
Chave primária:
• Os atributos nr_venda e id_produto compõem a primária da tabela produto_vendido.*/
create table produto_vendido (
nr_venda int,
id_produto int,
quantidade decimal(5,2),
constraint pk_produto_vendido primary key(nr_venda,id_produto));

/*: Realize as seguintes alterações:
Tabela cliente:
o Altere o nome do atributo nome para nome_cliente
o Adicione o atributo cpf do tipo inteiro. Esse atributo também deverá ser chave 
candidata.
o O atributo sexo deverá receber o valor padrão ‘M’
*/

alter table cliente change nome nome_cliente varchar(45),
add cpf int(11) unique,
modify sexo char(1) default 'M';
desc cliente;

/*Tabela produto:
o Adicione o atributo descricao do tipo caracter que poderá conter de 0 a 100 
caracteres.
o O atributo nome não poderá receber o valor nulo*/

alter table produto add descricao varchar(100) not null;

desc produto;

/*Tabela venda:
o Adicione o atributo pago que deverá ser do tipo caractere com 3 caracteres, os 
valores permitidos para esse atributo são sim e não.
*/

alter table venda add pago varchar(3) check(pago in('Sim', 'Não'));

desc venda;

/*Tabela produto_vendido:*/

insert into produto_vendido values
(1000,100,10.00),
(1000,110,2.00),
(1000,120,1.00),
(1000,140,1.00),
(1000,150,1.00),
(1000,170,1.00),
(1001,100,2.00),
(1002,100,1.00),
(1002,140,5.00),
(1002,160,1.00),
(1002,170,1.00),
(1003,140,1.00),
(1003,150,1.00),
(1004,110,1.00),
(1004,150,1.00),
(1004,160,1.00);

/* Crie as seguintes chaves estrangeiras na tabela produto_vendido:
• O atributo nr_venda é a chave estrangeira da tabela produto_vendido. 
Este atributo referencia a tabela venda na coluna nr_venda.• 
O atributo id_produto é a chave estrangeira da tabela produto_vendido. 
Este atributo referencia a tabela produto na coluna id_produto.
Crie a chave estrangeira com on update cascade e on delete cascade.*/


alter table produto_vendido add constraint fk_nr_venda 
foreign key (nr_venda) references venda(nr_venda) 
on update cascade on delete cascade,
add constraint fk_id_produto 
foreign key (id_produto) references produto(id_produto)
on update cascade on delete cascade;