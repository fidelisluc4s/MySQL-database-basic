alter table empregado add primary key(codigo_empregado);
alter table departamento add primary key(codigo_dep);
alter table cargo add primary key(codigo_cargo);
alter table dependente add primary key(codigo_empregado, nome_dependente);

alter table dependente add constraint fk_em_dep foreign key(codigo_empregado)
references empregado(codigo_empregado) on delete cascade on update cascade;

alter table departamento add constraint fk_dep_em foreign key(codigo_gerente)
references empregado(codigo_empregado) on delete cascade on update cascade;

alter table empregado add constraint fk_emp_cargo foreign key(codigo_cargo)
references cargo(codigo_cargo) on delete cascade on update cascade;

alter table empregado add constraint fk_emp_departamento foreign key(codigo_dep)
references departamento(codigo_dep) on delete cascade on update cascade;

alter table empregado add constraint fk_emp_chefe foreign key(codigo_chefe)
references empregado(codigo_empregado) on delete cascade on update cascade;