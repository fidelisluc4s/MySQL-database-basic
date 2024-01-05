/* Crie a tabela musica a partir da figura e especificações:
• id: atributo do inteiro
• id_album: atributo do tipo inteiro
• nome: atributo do tipo caractere que poderá receber de 0 a 50 caracteres.
• duracao: atributo do tipo decimal com 4 digitos, sendo 2 reservados a escala.
Chave primária:
• O atributo id é a chave primária da tabela musica.
*/

create table musica(
id int primary key,
id_album int,
nome varchar(50),
duracao decimal(4,2)
);

/*Tabela gravadora:
Altere o nome do atributo nome para nome_gravadora
o Adicione o atributo endereço do tipo varchar(70)*/

alter table gravadora change nome nome_gravadora varchar(70);

/*Tabela artista:
o Adicione o atributo cpf do tipo inteiro. Esse atributo também deverá ser chave 
candidata
o O atributo nome não poderá receber o valor nulo.
*/
alter table artista add cpf int (11) unique,
modify nome varchar(50) not null;

desc artista;

/*Tabela album:
o Adicione o atributo pago que deverá ser do tipo caractere com 3 caracteres. os 
valores permitidos para esse atributo são sim e não.
o O atributo ano deverá conter o valor padrão 2023*/

alter table album add pago varchar(3) check(pago in('Sim','Não'));

desc album;

/*: Faça as seguintes inserções:
Tabela musica*/

insert into musica values
(1,1,'one',7.25),
(2,1,'backened',6.42),
(3,2,'enter sandman',5.3),
(4,2,'sad but true',5.29),
(5,3,'master of puppets',8.25),
(6,3,'battery',5.25),
(7,4,'dialectic chaos',3.25),
(8,4,'endgame',6.27),
(9,5,'peace sells',6.26),
(10,5,'the conjuring',6.25),
(11,6,'madhouse',3.25),
(12,6,'i am the law',9.25),
(13,7,'reptile',12.25),
(14,7,'modern girl',6.26),
(15,8,'tiding with the king',33.25),
(16,8,'key to the highway',15.25);

/*Crie a seguinte chave estrangeira na tabela musica:
• O atributo id_album é a chave estrangeira da tabela musica. 
Este atributo referencia a tabela album na coluna id.
Crie a chave estrangeira com on update cascade e on delete cascade.*/

create index fk_id_album on album(id);

alter table musica add constraint fk_id_album
foreign key(id_album) references album(id)
on update cascade on delete cascade;


/*ERRO alter table musica add constraint fk_id_album 
foreign key(id_album) references album(id) on update cascade on 
delete cascade	Error Code: 3780. Referencing column 'id_album' and 
referenced column 'id' in foreign key constraint 'fk_id_album' are incompatible.
*/
alter table album modify id int;
desc album;






