create database sistema_bancario;
/*⦁	numero_agencia: atributo do tipo caractere que pode receber de 0 a 5 caracteres;
⦁	nome_agencia: atributo do tipo caractere que pode receber de 0 a 15 caracteres;
⦁	cidade_agencia: atributo do tipo caractere que pode receber de 0 a 30 caracteres;
Chave primária:
⦁	O atributo numero_agencia é a chave primária da tabela agência.
*/
create table agencia(
numero_agencia varchar(5),
nome_agencia varchar(15),
cidade_agencia varchar(30),
constraint pk_numero_agencia primary key(numero_agencia));

alter table agencia change nome_agencia nome varchar(15),
change cidade_agencia cidade_agencia varchar(25);
insert into agencia values
('12345','metropolitana', 'juiz de fora'),
('23456','lago sul', 'juiz de fora'),
('34567','zona norte', 'juiz de fora'),
('45678','zona sul', 'juiz de fora'),
('56789','park sul', 'juiz de fora'),
('67890','cascatinha', 'juiz de fora'),
('78901','sao mateus', 'juiz de fora');

alter table conta add constraint fk_numero_agencia foreign key(numero_agencia) references agencia(numero_agencia)
on update cascade on delete cascade;
create table cliente(
numero_cliente varchar(15),
nome_cliente varchar(25),
rua_cliente varchar(20),
cidade_cliente varchar(25),
estado varchar(20),
telefone varchar(20));
/*⦁	Adicione o atributo uf do tipo caractere que poderá receber 2 caracteres;
⦁	Adicione o atributo cpf do tipo decimal com 11 digitos. O atributo cpf deverá ser chave candidata;
⦁	O atributo sexo não poderá receber o valo nulo.
⦁	Altere o nome do atributo rua_cliente para endereco*/
alter table cliente add uf varchar(2),
add cpf decimal(11) primary key,
add sexo char(1) not null,
change rua_cliente endereco varchar(20); 


create table emprestimo(
numero_emprestimo varchar(20),
numero_agencia varchar(20));

/*Tabela empréstimo:
⦁	Adicione o atributo ano_emprestimo que deverá ser do tipo ano com 4 digitos.
⦁	O atributo ano_emprestimo deverá receber o valor padrão 2017*/

alter table emprestimo modify ano_emprestimo decimal(4) default '2017';

create table conta(
numero_conta varchar(20),
numero_agencia varchar(20),
numero_cliente varchar(20),
saldo varchar(20),
ano_abertura date);
/*⦁	Adicione o atributo data_abertura que deverá ser do tipo data.*/
alter table conta change ano_abertura data_abertura date;

create table tomador(
numero_cliente varchar(20),
numero_emprestimo varchar(20));

/*criando index antes de criar a conequição da chave estrangeira */
CREATE INDEX idx_numero_cliente ON conta(numero_cliente);

alter table cliente add constraint fk_num_cliente foreign key(numero_cliente) 
references conta(numero_cliente) on update cascade on delete cascade;

create index idx_numero_cliente on tomador(numero_cliente);

alter table conta add constraint fk_n_cliente foreign key(numero_cliente)
references tomador(numero_cliente) on update cascade on delete cascade;

create index idx_numero_emprestimo on emprestimo(numero_emprestimo);

alter table tomador add constraint fk_numero_emprestimo foreign key(numero_emprestimo)
references emprestimo(numero_emprestimo) on update cascade on delete cascade;

create index fk_numero_agencia on emprestimo(numero_agencia);

alter table agencia add constraint fk_numero_agencia foreign key(numero_agencia)
references emprestimo(numero_agencia) on update cascade on delete cascade;