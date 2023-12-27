
/*Tabela EMPRESA2:
Inclua o atributo CPF do tipo caractere com 11 dígitos;*/

alter table empregado add column cpf char(11),

/*Altere o tamanho do atributo NOME fazendo com que seja do tipo caractere com 15 caracteres;*/

change column nome nome varchar(15),


/*Inclua um atributo SOBRENOME do tipo caractere com 15 caracteres.*/

add sobrenome varchar(15),

/*Altere o tamanho do atributo CODIGO_CARGO fazendo com que seja 
do tipo decimal com 3 dígitos decimais;*/

change codigo_cargo codigo_cargo decimal(3),

/*Elimine o atributo FILIACAO.*/

drop filiacao,

/*Inclua o atributo CODIGO_DEP do tipo decimal com 3 dígitos decimais;*/

add codigo_dep decimal(3),

/*Altere o atributo CODIGO_CARGO para ser um atributo não nulo;*/

modify codigo_cargo decimal(3) not null;
desc empregado;

/*Tabela CARGO:
Elimine o atributo DESCRICAO_CARGO;*/

alter table cargo drop decricao_cargo;

/*Inclua o atributo NOME_CARGO do tipo caractere que pode receber de 0 a 40 caracteres.*/

alter table cargo add nome_cargo varchar(40);

/*Tabela Departamento:
Inclua o atributo LOCAL do tipo caractere com 20 caracteres que pode receber de 0 a 20 caracteres.*/

alter table departamento add local varchar(20);

/*Tabela Dependente:
Altere o atributo CODIGO_EMPREGADO para ser um atributo não nulo.*/

alter table dependente modify codigo_empregado decimal(6) not null;
desc dependete;