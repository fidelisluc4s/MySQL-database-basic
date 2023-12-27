/*1) Crie o banco de dados empresa. Utilize o comando CREATE DATABASE.*/
create database empresa;
/*Selecionando a base de dados que eu irei utilizar*/
use empresa;

/*2)Crie as seguintes tabelas:*/
/*a) Empregado*/
/*Faça o atributo CODIGO_EMPREGADO ser a chave primária da tabela coloque um nome para esta chave primária
  Faça o atributo CODIGO_CARGO ser chave estrangeira da tabela coloque um nome para esta chave.
  Faça o atributo CODIGO_DEP ser chave estrangeira da tabela coloque um nome para esta chave.
  Faça com que o atributo CPF seja uma chave alternativa (candidata).
*/

CREATE TABLE empregado (
    codigo_empregado DECIMAL(6),
    nome VARCHAR(50),
    codigo_cargo DECIMAL(5),
    endereco VARCHAR(50),
    bairro VARCHAR(20),
    cidade VARCHAR(20),
    codigo_chefe DECIMAL(6),
    uf CHAR(2),
    data_nasc DATE,
    sexo CHAR(1),
    filiacao VARCHAR(60),
    salario DECIMAL(10,2),
    cpf varchar(11) not null unique,
    codigo_dep decimal(6), 
    constraint pk_codi_emp primary key(codigo_empregado),
    constraint fk_cod_cargo foreign key(codigo_cargo) references cargo(codigo_cargo)
    on delete cascade on update cascade,
    constraint fk_cod_dep foreign key(codigo_dep) references departamento(codigo_dep)
    on delete cascade on update cascade
    );
    drop database empresa;
/*b)Cargo*/
CREATE TABLE cargo (
    codigo_cargo DECIMAL(3),
    descricao_cargo VARCHAR(30),
    salario_min DECIMAL(7, 2),
    salario_max DECIMAL(8, 2),
    nivel_graduacao CHAR(1),
    constraint pk_cod_cargo primary key(codigo_cargo)
);

/*c) Dependente*/
CREATE TABLE dependente (
    codigo_empregado DECIMAL(6),
    nome_dependente VARCHAR(50),
    sexo CHAR(1),
    data_nasc DATE,
    parentesco VARCHAR(15),
    constraint pk_dependente primary key(codigo_empregado, nome_dependente),
    constraint fk_cod_emp foreign key(codigo_empregado) references empregado(codigo_empregado)
    on delete restrict
    
);
/*d) Departamento*/
CREATE TABLE departamento (
    codigo_dep DECIMAL(3),
    nome_dep VARCHAR(30),
    codigo_gerente DECIMAL(6),
    data_inicio_gerente DATE,
    data_criacao DATE,
    constraint pk_cod_dep primary key(codigo_dep)
);

/*Deletar todas as tabelas*/
drop database empresa;