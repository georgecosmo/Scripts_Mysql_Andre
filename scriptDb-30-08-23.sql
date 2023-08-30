-- criando um database
create database db_2dsa;

use db_2dsa;

create table tbl_Cliente(
	cd_Cliente int primary key auto_increment,
	nm_Cliente varchar(80) not null,
    no_CPF char(11) not null,
    nm_Logradouro varchar(80) not null,
    no_Logradouro varchar(5) not null,
    ds_Complemento varchar(30) null,
    no_CEP char(8) not null,
    nm_bairro varchar(30) not null,
    nm_Cidade varchar(30) not null,
    sg_UF char(2) not null,
    no_status bit not null
);

-- inserindo registros na tabela de clientes
insert into tbl_Cliente
(nm_Cliente, no_CPF, nm_Logradouro,no_Logradouro,ds_Complemento,no_CEP,nm_Bairro,nm_Cidade,sg_UF,no_Status)
values('Ana Maria Souza','11122233301','Rua da Paz','25','','05241021','Jd Osasco','Carapicuiba','SP',1);

insert into tbl_Cliente
(nm_Cliente,no_CPF,nm_LOgradouro,no_Logradouro,ds_Complemento,no_CEP,nm_Bairro,nm_Cidade,sg_UF,no_Status)
values('José Molinari','22233344405','Av. dos Autonomistas','1200','casa 3','02525000','Centro','Osasco','SP',0);

insert into tbl_Cliente
(nm_Cliente,no_CPF,nm_LOgradouro,no_Logradouro,ds_Complemento,no_CEP,nm_Bairro,nm_Cidade,sg_UF,no_Status)
values('Manoel Rodrigues','44455566601','Rua Amazonas','58','','01425001','Jd Adamastor','Carapicuiba','SP',1);

insert into tbl_Cliente
(nm_Cliente,no_CPF,nm_LOgradouro,no_Logradouro,ds_Complemento,no_CEP,nm_Bairro,nm_Cidade,sg_UF,no_Status)
values('Joca Santos','55566677708','Rua José Calixto','456','','08574566','Jd Felicidade','São Paulo','SP',1),
('Raul Gomes','66655544403','Rua Senador Queiroz','12','apto 24','01212321','Centro','São Paulo','SP',1),
('Maria dos Santos','88899966606','Rua Mario Covas','36','','00121312','Pirituba','São Paulo','SP',1);



-- consultando a tabela de clientes
select * from tbl_Cliente;

select nm_Cliente,no_CPF,nm_Cidade from tbl_Cliente;

select * from tbl_Cliente
where nm_Cidade = 'Carapicuiba';

/* faça uma consulta para exibir o nome do cliente, nm_logradouro, nm_bairro,
de todas as pessoas que moram na cidade de São Paulo;*/

select nm_Cliente,nm_Logradouro,nm_Bairro
from tbl_Cliente where nm_Cidade = 'São Paulo';

select nm_Cliente,nm_Logradouro,nm_Bairro
from tbl_Cliente where nm_Cidade != 'São Paulo';

create table tbl_TelefoneCliente(
	cd_telefone int primary key auto_increment,
    cd_Cliente int,
    no_Telefone varchar(11) not null,
    constraint foreign key(cd_Cliente) references tbl_Cliente(cd_Cliente)
);

select cd_Cliente, nm_Cliente from tbl_Cliente;

insert into tbl_telefoneCliente
(cd_Cliente,no_Telefone)
values(1,'11999886544'),
(1,'11999889543'),
(2,'11988757474'),
(3,'11999998888'),
(3,'11999997777'),
(4,'11988886666'),
(5,'11977774545'),
(6,'11999992211');

select * from tbl_telefoneCliente;


-- o registro abaixo não poderá ser inserido
-- o cliente de número 200 não existe
insert into tbl_TelefoneCliente
(cd_Cliente,no_Telefone)
values(200,'21987452121');

create table tbl_departamento(
	cd_Departamento int primary key auto_increment,
    ds_Departamento varchar(30) not null
);


insert into tbl_departamento(ds_departamento)
values("Vendas"),("Caixa"),("Auxiliar Administrativo"),("Auxiliar de Limpeza");


select * from tbl_departamento;

create table tbl_Funcionario(
cd_Funcionario int primary key auto_increment,
nm_Funcionario varchar(80) not null,
no_CPF char(11) not null,
ds_Login varchar(20),
ds_Senha char(6),
sg_NivelAcesso enum('V','C','A'),
cd_Departamento int not null,
no_Status bit not null,

-- constraint é uma regra, nesse caso regra chave estrangeira
constraint foreign key(cd_Departamento) references tbl_Departamento(cd_Departamento)
);

insert into tbl_funcionario
(nm_funcionario, no_CPF, ds_login, ds_senha, sg_NivelAcesso, cd_departamento, no_Status)
values("Sergio Gomes", "12345688809", "GomesSE", "123456", "V", 1, 1);

select * from tbl_funcionario;

alter table tbl_funcionario
-- alterando coluna de CPF para ser único, não poderá se repetir
modify column  no_CPF char(11) not null unique;

select * from tbl_funcionario;

insert into tbl_funcionario
(nm_funcionario, no_CPF, ds_login, ds_senha, sg_NivelAcesso, cd_departamento, no_Status)
values("Natalia Boldrin", "45612333311", "Boldrin", "147258", "V", 1, 1);

insert into tbl_funcionario
(nm_funcionario, no_CPF, ds_login, ds_senha, sg_NivelAcesso, cd_departamento, no_Status)
values("Joelma Batista", "14455533302", "Joelmab", "123123", "A", 3, 1);

insert into tbl_funcionario
(nm_funcionario, no_CPF, ds_login, ds_senha, sg_NivelAcesso, cd_departamento, no_Status)
values("Luzia Santos", "88811133301", "", "", "", 4, 1);

alter table tbl_funcionario
modify column sg_NivelAcesso enum("V", "C", "A", "") null;

desc tbl_funcionario;

insert into tbl_funcionario
(nm_funcionario, no_CPF, ds_login, ds_senha, sg_NivelAcesso, cd_departamento, no_Status)
values("Miguel Souza", "99966622222", "MiguelSo", "555111", "C", 2, 1);

insert into tbl_funcionario
(nm_funcionario, no_CPF, ds_login, ds_senha, sg_NivelAcesso, cd_departamento, no_Status)
values("Juarez Tavora", "11199911133", "JuarezTa", "666412", "A", 3, 1);

insert into tbl_funcionario
(nm_funcionario, no_CPF, ds_login, ds_senha, sg_NivelAcesso, cd_departamento, no_Status)
values("Maria Cleusa", "88888866612", "", "", "", 4, 1);

insert into tbl_funcionario
(nm_funcionario, no_CPF, ds_login, ds_senha, sg_NivelAcesso, cd_departamento, no_Status)
values("Karen Tavares", "99911122231", "", "", "", 4, 0);

-- Selecionando todos os funcionários que tem o no_Status igual a 0
select * from tbl_funcionario
where no_Status = 0;







