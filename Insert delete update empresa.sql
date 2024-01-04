/*⦁	Antes de realizar a inserção você precisará excluir a chave estrangeira da tabela departamento, 
e também a chave estrangeira da tabela empregado(a que envolve a coluna codigo_chefe).*/

alter table empregado drop foreign key fk_cod_dep;
alter table empregado drop foreign key fk_cod_cargo;

/*	INSERT
	Tabela CARGO*/


insert into cargo(codigo_cargo, salario_min, salario_max, nivel_graduacao,descricao_cargo) values
(101,500.00,7000.00,'M','gestor de qualidade software'),
(201,null,null,'n','auxiliar administrativo'),
(301,7000.00,9000.00,'d','gerente de projetos'),
(401,1000.00,9500.00,'n','vendedor'),
(501,8000.00,100000.00,'p','engenheiro software'),
(601,2000.00,3000.00,'g','gerente de vendas'),
(701,2500.00,8000.00,'m','administrador'),
(801,1000.00,8000.00,'d','gerente de recursos humanos'),
(802,1500.00,2000.00,'g','auxiliar de recursos humanos'),
(803,1000.00,25000.00,'h','auxiliar de recursos humanos');


/*	Tabela DEPARTAMENTO*/

alter table departamento add local varchar(30);
insert into departamento values
(306,'vendas',7728,'2001-06-06','1999-06-22','rio de janeiro'),
(501,'ti',3030,'2000-10-01','2000-10-01','sao paulo'),
(505,'administrativo',3687,'2005-04-22','1995-03-15','rio de janeiro'),
(627,'rh',7728,'2010-02-03','1969-01-01','nitoroi'),
(847,'compras',null,null,'1998-08-14','sao paulo');


/*Tabela EMPREGADO*/
alter table empregado add sobrenome varchar(30);
insert into empregado(codigo_empregado, nome, codigo_cargo, endereco, bairro, cidade, codigo_chefe, uf, data_nasc, sexo,  
salario, cpf ,sobrenome, codigo_dep) values
(1010,'jose luiz',201,'rua das flores 55','centro','rio de janeiro',3687,'rj', '1985-12-18','m',2000.00,12345678912, 'santos silva',505),
(1216,'luciana',802,'avenida tiradentes 159','boa vista','niteroi',4099,'rj', '1975-12-02','f',1895.00,87654321123, 'andrade dias',627),
(1555,'sandra',803,'rua tereza 229 apto 504','centro','niteroi',4099,'rj', '1970-06-01','f',2250.00,12345678956, 'andrade dias',627),
(2501,'carlos eduardo',101,'rua dos palmares 33','paineiras','santos',3030,'sp', '1964-10-22','m',5025.00,65498732125, 'raimundo nonato',501),
(2650,'jose eduardo',401,'rua treze de maio 6542','centro','santos',7728,'sp', '1975-12-25','m',3100.00,78945613245, 'nogueira',306),
(2659,'antonio',401,'avenida joaquim lobo','centro','sao paulo',7728,'sp', '1962-12-25','m',2600.00,98655432112, 'natalino',306),
(3030,'marcia',501,'rua setembrino de souza 325','centro','sao paulo',null,'sp', '1972-02-15','f',4000.00,42345684632, 'araujo alves ',501),
(3687,'ricardo',701,'avenida jk 544','botafogo','rio de janeiro',null,'rj', '1978-04-30','m',7000.00,12345698765, 'de mello reis',505),
(4099,'jorge',801,'rua 9 de julho 2000','centro','niteroi',null,'rj', '1965-07-17','m',5500.00,32215698765, 'amado batista',627),
(5566,'silva',201,'rua divina luz 168','centro','sao paulo',3687,'sp', '1980-12-20','f',1200.00,12416796326, 'costa e silva',505),
(7728,'rogerio',601,'rua santa clara 977','arpoador','rio de janeiro',null,'rj', '1972-01-25','m',6000.00,64698765432, 'dos anjos',306);


/*⦁	Tabela DEPENDENTE*/

insert into dependente values
(1216,'isadora','f','1999-10-12','filha'),
(1216,'pedro','m','2001-11-11','filho'),
(1555,'israel','m','2004-03-26','filho'),
(2501,'carolina','f','1995-09-12','filha'),
(2501,'kelly','f','1970-04-28','esposa'),
(2650,'jonas','m','2006-01-13','filho'),
(2659,'gabriel','m','2010-09-08','neto'),
(2659,'patricia','f','1982-05-29','filha'),
(7728,'sandra','f','1970-06-15','esposa');

/*⦁	Crie novamente as chaves estrangeiras que foram excluídas:
⦁	Tabela DEPARTAMENTO:
⦁	Faça o atributo CODIGO_GERENTE ser chave estrangeira da tabela coloque um apelido para esta chave.
*/

/*Desativando o modo de segurança do MySQL*/
SET foreign_key_checks=0;

alter table empregado add constraint fk_cod_dep foreign key(codigo_dep) references departamento(codigo_dep)
on update cascade on delete cascade;


alter table empregado add constraint fk_cod_cargo foreign key(codigo_cargo) references cargo(codigo_cargo)
on update cascade on delete cascade;

/*Ativando o modo de segurança do MySQL*/
SET foreign_key_checks=1;


/*⦁	Tabela EMPREGADO:
⦁	Faça o atributo CODIGO_CHEFE ser chave estrangeira da tabela coloque um apelido para esta chave.
*/



alter table empregado 
add index idx_codigo_chefe (codigo_chefe);

alter table empregado add constraint fk_cod_chefe foreign key(codigo_chefe) references cargo(codigo_cargo)
on update cascade on delete cascade;



/*DELETE:
⦁	Tabela DEPARTAMENTO:
⦁	Apague o departamento nomeado por 'Compras'.*/

/*Desativando o modo de segurança do MySQL*/
set sql_safe_updates=0;

delete from departamento where nome_dep = 'compras';


/*⦁	Tabela DEPENDENTE:
⦁	Apague o(s) dependente(s) do(s) empregado(s) em que a data de nascimento for menor que 1980-01-01.
*/
delete from dependente where data_nasc < '1980-01-01' ;

/*⦁	Tabela EMPREGADO:
⦁	Apague o(s) empregado(s) que trabalha(m) no departamento 'Administrativo'(505) e que possui(em) o cargo de 'Auxiliar Administrativo' (201).
*/

delete from departamento where nome_dep = 'administrativo';


/*Tabela CARGO:
Apague o(s) cargo(s) que não contém valor(es) de salário mínimo e nem de salário máximo.
*/
delete from cargo where salario_min is null and salario_max is null;

/*UPDATE:
Tabela DEPARTAMENTO:
Atualize o nome do departamento RH para Recursos Humanos.
*/
update departamento set nome_dep = 'Recursos Humanos' where nome_dep = 'rh';


/*Atualize a data de criação do departamento de TI para 2000-09-20.*/

update departamento set data_criacao = '2000-09-20' where data_criacao = '2000-10-01';


/*Atualize o nome do departamento TI para Tecnologia da Informação*/

update departamento set nome_dep = 'Tecnologia da Informação' where nome_dep ='ti';


/*Tabela DEPENDENTE:
Atualize a data de nascimento do dependente de nome Isadora do empregado 1216 para 1999-12-10.*/

update dependente set data_nasc = '1999-12-10' where nome_dependente='isadora';
/*Tabela EMPREGADO:
Atualize o endereço da empregada Luciana para Rua da Laguna 139.*/

update empregado set endereco = 'rua da laguna 139' where nome = 'luciana';

/*	Forneça um aumento de 10% para os empregados que possuem salário menor ou igual a R$2500.*/

update cargo set salario_min = 1.1*salario_min where salario_min <= 2500;

/*	Forneça uma redução de salário de 5% para os empregados que possuem salário maior ou igual a R$6000.
*/

update cargo set salario_max = 0.95*salario_max where salario_max >= 6000;

/*⦁	Atualize o sobrenome da empregada Sandra para Andrade Castro.
*/

update empregado set sobrenome = 'andrade castro' where nome = 'sandra';

/*⦁	Tabela CARGO:
⦁	Atualize o salário mínimo de todos os cargos para R$860.
*/

update cargo set salario_min = 860 where salario_min > 0;

/*⦁	Aumente em 20% o salário máximo a todos os cargos que possuem o nível de graduação igual a M.*/

update cargo set salario_max = 1.2*salario_max where nivel_graduacao ='m';

/*Ativando o modo de segurança do MySQL*/
set sql_safe_updates=1;