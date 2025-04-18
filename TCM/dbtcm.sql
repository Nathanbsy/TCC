-- drop database dbtcm;
create database dbtcm;
use dbtcm;

create table tblogin(
IdLogin int primary key auto_increment,
Nome varchar(80) not null,
Email varchar(40) not null unique,
Usuario varchar(40) not null unique,
Senha varchar(16) not null,
FotoPerfil mediumblob,
Tipo ENUM("Cliente", "Administrador", "Colaborador") default "Cliente"
);

create table tbCliente(
IdCliente int primary key,
CPF varchar(14) not null unique,
Genero ENUM("M", "F"),
DataNasc date not null,
constraint FK_IdUserCliente foreign key (IdCliente) references tblogin(IdLogin) on delete cascade
);

create table tbadmin(
IdAdmin int primary key,
Salario decimal(9,2) not null,
UserId int not null,
DataNasc date not null,
CPF varchar(14) not null unique,
foreign key (IdAdmin) references tblogin(IdLogin) on delete cascade,
foreign key (UserId) references tblogin(IdLogin) on delete cascade
);

create table tbcolaborador(
IdColaborador int primary key,
CNPJ varchar(20) not null,
foreign key (IdColaborador) references tblogin(IdLogin) on delete cascade
);

create table tbcategoria(
CodCat int primary key auto_increment,
Categoria varchar(40) not null
);


create table tbcarrinho (
Id int primary key auto_increment,
UserId int not null,
ProdutoId int not null,
Quantidade int unsigned not null,
PrecoCar decimal(9,2) not null,
foreign key (ProdutoId) references tbproduto(CodProd),
foreign key (UserId) references tblogin(IdLogin)
);

create table tbproduto(
CodProd int primary key auto_increment,
NomeProd varchar(40) not null,
Descricao varchar(80) not null,
Preco decimal(9,2) not null,
Qtd int unsigned not null,
UserId int not null,
Imagem mediumblob not null,
CategoriaId int not null,
Vendas int not null default 0,
Avaliacoes int not null default 0,
Nota decimal(3,2) not null default 0
);

create table tbcarrinho (
Id int primary key auto_increment,
UserId int not null,
ProdutoId int not null,
Quantidade int unsigned not null,
PrecoCar decimal(9,2) not null,
foreign key (ProdutoId) references tbproduto(CodProd),
foreign key (UserId) references tblogin(IdLogin)
);

create table tbpedido(
CodPed int primary key auto_increment,
UserId int not null,
QtdPed int unsigned not null,
PrecoPed decimal(9,2) not null,
DataPed datetime default current_timestamp,
StatusPed varchar(150) default "Pagamento Aprovado"
);

create table tbitempedido(
IdItemPedido int primary key auto_increment,
IdPedido int not null,
IdProduto int not null,
foreign key (IdPedido) references tbpedido(CodPed),
foreign key (IdProduto) references tbproduto(CodProd)
);

create table tbPromocao(
PromoId int primary key auto_increment,
NomePromo varchar(80) not null,
Porcentagem tinyint not null,
data_exclusao datetime not null,
CategoriaId int
);

create TABLE tbPromocaoItem(
PromoIdItem INT PRIMARY KEY AUTO_INCREMENT,
ProdutoId INT NOT NULL,
PromoId INT NOT NULL,
Porcentagem tinyint not null,
PrecoPromo DECIMAL(9,2) NOT NULL,
FOREIGN KEY (ProdutoId) REFERENCES tbproduto(CodProd),
FOREIGN KEY (PromoId) REFERENCES tbPromocao(PromoId)
);

select * from tbcarrinho;

create table tbcomentario(
ComentId int primary key auto_increment,
UserId int not null,
ProdutoId int not null,
Comentario varchar(255),
DataComent datetime default	current_timestamp,
Avaliacao int not null
);

CREATE TABLE tbEndereco (
    IdEndereco INT AUTO_INCREMENT PRIMARY KEY,
    Logradouro VARCHAR(150) NOT NULL,
    Numero VARCHAR(10),                   
    Complemento VARCHAR(50),              
    Bairro varchar(50) NOT NULL,
    Cidade varchar(50) NOT NULL,
    IdEstado int NOT NULL,    
    UserId int not null,
    CEP VARCHAR(9) NOT NULL         
);

create table tbEstado(
IdEstado int primary key auto_increment,
NomeEstado varchar(35),
SiglaEstado char(2)
);

INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Acre', 'AC');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Alagoas', 'AL');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Amapá', 'AP');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Amazonas', 'AM');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Bahia', 'BA');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Ceará', 'CE');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Distrito Federal', 'DF');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Espírito Santo', 'ES');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Goiás', 'GO');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Maranhão', 'MA');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Mato Grosso', 'MT');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Mato Grosso do Sul', 'MS');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Minas Gerais', 'MG');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Pará', 'PA');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Paraíba', 'PB');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Paraná', 'PR');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Pernambuco', 'PE');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Piauí', 'PI');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Rio de Janeiro', 'RJ');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Rio Grande do Norte', 'RN');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Rio Grande do Sul', 'RS');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Rondônia', 'RO');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Roraima', 'RR');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Santa Catarina', 'SC');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('São Paulo', 'SP');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Sergipe', 'SE');
INSERT INTO tbEstado (NomeEstado, SiglaEstado) VALUES ('Tocantins', 'TO');

alter table tbEndereco add constraint FK_IdEstadoEndereco foreign key (IdEstado) references tbEstado(IdEstado);
alter table tbEndereco add constraint FK_UserIdEndereco foreign key (UserId) references tblogin(IdLogin);

alter table tbcomentario add constraint FK_UserIdComentario foreign key (UserId) references tblogin(IdLogin);
alter table tbcomentario add constraint FK_ProdutoIdComentario foreign key (ProdutoId) references tbproduto(CodProd);


alter table tbproduto add constraint FK_UserId_tbProduto foreign key (UserId) references tblogin(IdLogin) on delete cascade;
alter table tbproduto add constraint FK_CategoriaId_tbProduto foreign key (CategoriaId) references tbcategoria(CodCat);

select * from tblogin;

select tbpedido.CodPed, tbpedido.ProdutoId, tbpedido.UserId, tbpedido.DataPed, tbproduto.NomeProd, tbproduto.Preco, tbpedido.QtdPed from tbpedido join tbproduto on tbpedido.ProdutoId = tbproduto.CodProd where tbpedido.UserId = 1;

alter table tbpedido add constraint FK_ProdutoIdPedido foreign key (ProdutoId) references tbproduto(CodProd);
alter table tbpedido add constraint FK_UserIdPedido foreign key (UserId) references tblogin(IdLogin);
alter table tbpromocao add constraint FK_CategoriaIdPromocao foreign key (CategoriaId) references tbcategoria(CodCat);

delimiter $$
create procedure spInserirCarrinho(vUserId int, vProdutoId int , vQuantidade int)
begin
declare vPreco decimal(9,2); 
if exists(select PrecoPromo from tbpromocaoitem where ProdutoId = vProdutoId)then
	set vPreco := (select PrecoPromo from tbpromocaoitem where ProdutoId = vProdutoId);
else
	set vPreco := (select Preco from tbproduto where CodProd = vProdutoId);
end if;

if(select Qtd from tbproduto where CodProd = vProdutoId != 0) then
	if not exists(select * from tbcarrinho where UserId = vUserId and ProdutoId = vProdutoId) then
		if exists(select PrecoPromo from tbpromocaoitem where ProdutoId = vProdutoId) then
            insert into tbcarrinho (UserId, ProdutoId, Quantidade, PrecoCar) values (vUserId, vProdutoId, vQuantidade, vPreco);
            update tbproduto set Qtd = Qtd - vQuantidade where CodProd = vProdutoId;
		else
			insert into tbcarrinho (UserId, ProdutoId, Quantidade, PrecoCar) values (vUserId, vProdutoId, vQuantidade, vPreco);
			update tbproduto set Qtd = Qtd - vQuantidade where CodProd = vProdutoId;
        end if;
	else 
    update tbcarrinho set Quantidade = Quantidade + vQuantidade where UserId = vUserId and ProdutoId = vProdutoId;
    update tbproduto set Qtd = Qtd - vQuantidade where CodProd = vProdutoId;
    end if;
end if;
end
$$

delimiter ;

delimiter $$

create procedure spExcluirDoCarrinho(vUserId int, vProdutoId int , vQuantidade int)
begin
declare vQtd int;
set vQtd := (select Quantidade from tbcarrinho where UserId = vUserId and ProdutoId = vProdutoId);
if(vQtd <= 0 or vQtd = 1)then
	delete from tbcarrinho where UserId = vUserId and ProdutoId = vProdutoId;
	update tbproduto set Qtd = Qtd + vQuantidade where CodProd = vProdutoId;
    else
    update tbcarrinho set Quantidade = Quantidade - vQuantidade where UserId = vUserId and ProdutoId = vProdutoId;
    update tbproduto set Qtd = Qtd + vQuantidade where CodProd = vProdutoId;
    end if;
end
$$

delimiter ;

delimiter $$

create procedure spZerosCarrinho()
begin
	delete from tbcarrinho where Quantidade = 0;
end
$$

delimiter ;

DELIMITER $$

CREATE PROCEDURE spLogin(vUsuario VARCHAR(40), vSenha VARCHAR(16))
BEGIN
    DECLARE vId INT;
    SET vId := (SELECT IdLogin FROM tblogin WHERE Email = vUsuario AND Senha = vSenha);

    IF vId IS NOT NULL THEN
        -- Verifica se o usuário é um fornecedor
        IF EXISTS (SELECT 1 FROM tbcolaborador WHERE IdColaborador = vId) THEN
            SELECT u.IdLogin, u.Nome, u.Email, u.Usuario, u.Senha, u.Tipo, 
                   f.IdColaborador, f.CNPJ 
            FROM tblogin u
            JOIN tbcolaborador f ON u.IdLogin = f.IdColaborador
            WHERE u.IdLogin = vId;

        -- Verifica se o usuário é um funcionário
        ELSEIF EXISTS (SELECT 1 FROM tbadmin WHERE IdAdmin = vId) THEN
            SELECT u.IdLogin, u.Nome, u.Email, u.Usuario, u.Senha, u.Tipo, 
                   f.IdAdmin, f.Salario, f.UserId 
            FROM tblogin u
            JOIN tbadmin f ON u.IdLogin = f.IdAdmin
            WHERE u.IdLogin = vId;

        -- Caso contrário, retorna apenas os dados do usuário normal
        ELSE
            SELECT u.IdLogin, u.Nome, u.Email, u.Usuario, u.Senha, u.Tipo 
            FROM tblogin u
            WHERE u.IdLogin = vId;
        END IF;
    ELSE
        -- Retorna um resultado vazio se o login falhar
        SELECT NULL AS IdLogin, NULL AS Nome, NULL AS Email, NULL AS Usuario, 
               NULL AS Senha, NULL AS Tipo;
    END IF;
END
$$

DELIMITER ;


delimiter ;

delimiter $$
create procedure spExcluirPromocao(vPromocaoId int)
begin
	delete from tbpromocaoitem where PromoId = vPromocaoId;
    delete from tbpromocao where PromoId = vPromocaoId;
end$$
delimiter ;

delimiter $$
create procedure spFinalizarCompra(vUserId int, vProdutoId int, vQtdVenda int, vVenda int)
begin
	declare vPreco decimal(9,2);
	if exists(select ProdutoId from tbpromocaoitem where ProdutoId = vProdutoId) then
		set vPreco := (select PrecoPromo from tbpromocaoitem where ProdutoId = vProdutoId);
		insert into tbpedido (ProdutoId, UserId, PrecoPed, QtdPed) values (vProdutoId, vUserId, vPreco, vQtdVenda);
        update tbproduto set Vendas = Vendas + vVenda where CodProd = vProdutoId;
	else
		set vPreco := (select Preco from tbproduto where CodProd = vProdutoId);
        insert into tbpedido (ProdutoId, UserId, PrecoPed, QtdPed) values (vProdutoId, vUserId, vPreco, vQtdVenda);
        update tbproduto set Vendas = Vendas + vVenda where CodProd = vProdutoId;
	end if;
end$$
delimiter ;

delimiter $$

create procedure spCadastrarUsuario(vNome varchar(80), vEmail varchar(40), vUsuario varchar(40), vSenha varchar(16), vFoto blob, vData date, vCPF varchar(14))
begin
	insert into tblogin(Nome, Email, Usuario, Senha, FotoPerfil, Tipo) values (vNome, vEmail, vUsuario, vSenha, vFoto, "Cliente");
	insert into tbcliente(IdCliente, DataNasc, CPF) values (last_insert_id(), vData, vCPF);
end
$$

delimiter ;

delimiter $$

create procedure spCadastrarAdministrador(vNome varchar(80), vEmail varchar(40), vUsuario varchar(40), vSenha varchar(16), vFoto blob)
begin
	insert into tblogin(Nome, Email, Usuario, Senha, FotoPerfil, Tipo) values (vNome, vEmail, vUsuario, vSenha, vFoto, "Administrador");
end
$$

delimiter ;

delimiter $$

create procedure spCadastrarFuncionario(vNome varchar(80), vEmail varchar(40), vUsuario varchar(40), vSenha varchar(16), vSalario decimal(9,2), vUserId int, vData date, vCPF varchar(14))
begin
	insert into tblogin(Nome, Email, Usuario, Senha, Tipo) values (vNome, vEmail, vUsuario, vSenha, "Funcionario");
    insert into tbadmin(IdAdmin, Salario, UserId, DataNasc, CPF) values (last_insert_id(), vSalario, vUserId, vData, vCPF);
end
$$

delimiter ;

delimiter $$

create procedure spCadastrarColaborador(vNome varchar(80), vEmail varchar(40), vUsuario varchar(40), vSenha varchar(16), vCNPJ varchar(20))
begin
	insert into tblogin(Nome, Email, Usuario, Senha, Tipo) values (vNome, vEmail, vUsuario, vSenha, "Fornecedor");
    insert into tbcolaborador(IdColaborador, CNPJ) values (last_insert_id(), vCNPJ);
end
$$

delimiter ;

delimiter $$

create procedure spComentar(vUserId int, vProdutoId int, vComentario varchar(255), vAvaliacao int)
begin
declare vNota double;
	insert into tbcomentario (UserId, ProdutoId, Comentario, Avaliacao) values (vUserId, vProdutoId, vComentario, vAvaliacao); 
    update tbproduto set avaliacoes = avaliacoes + 1 where CodProd = vProdutoId;
    set vNota := (select sum(tbcomentario.avaliacao / tbproduto.avaliacoes) from tbcomentario join tbproduto where ProdutoId = vProdutoId);
    update tbproduto set nota = vNota;
end
$$

delimiter ;

delimiter $$

create procedure spExcluirComentario(vComentarioId int)
begin
declare vNota double;
declare vProdutoId int;
set vProdutoId := (select ProdutoId from tbcomentario where ComentId);
	delete from tbcomentario where ComentId = vComentarioId;
    update tbproduto set avaliacoes = avaliacoes - 1 where CodProd = vProdutoId;
    set vNota := (select sum(tbcomentario.avaliacao / tbproduto.avaliacoes) from tbcomentario join tbproduto where ProdutoId = vProdutoId);
    update tbproduto set nota = vNota;
end
$$

delimiter ;

DELIMITER $$

create PROCEDURE spInserirPromocao(
    vNomePromo VARCHAR(80), 
    vPorcentagem TINYINT, 
    vCategoria VARCHAR(80), 
    vdata_exclusao DATETIME
)
BEGIN
    DECLARE vPromoId INT;
    declare vCategoriaId int;
    declare vPorcentagemCerta decimal(3,2);
    set vPorcentagemCerta := concat("0.", vPorcentagem);

    -- Verificar a categoria e inserir na tbPromocaoItem
    IF vCategoria = "Todos" THEN
		INSERT INTO tbPromocao (NomePromo, Porcentagem, data_exclusao)
		VALUES (vNomePromo, vPorcentagem, vdata_exclusao);
        SET vPromoId = LAST_INSERT_ID();
        -- Inserir todos os itens de todos os produtos
        INSERT INTO tbPromocaoItem (ProdutoId, PromoId, Porcentagem, PrecoPromo)
        SELECT p.CodProd, vPromoId, vPorcentagem, (p.Preco - (p.Preco * vPorcentagemCerta)) 
        FROM tbProduto p;
    ELSE
		set vCategoriaId := (select CodCat from tbcategoria where Categoria = vCategoria);
		INSERT INTO tbPromocao (NomePromo, Porcentagem, data_exclusao, CategoriaId)
		VALUES (vNomePromo, vPorcentagem, vdata_exclusao, vCategoriaId);
        SET vPromoId = LAST_INSERT_ID();
        -- Inserir itens de uma categoria específica
        INSERT INTO tbPromocaoItem (ProdutoId, PromoId, Porcentagem, PrecoPromo)
        SELECT p.CodProd, vPromoId, vPorcentagem, (p.Preco - (p.Preco * vPorcentagemCerta))
        FROM tbProduto p
        JOIN tbCategoria c ON p.CategoriaId = c.CodCat
        WHERE c.Categoria = vCategoria;
    END IF;

END$$

DELIMITER ;

select sum(tbcomentario.avaliacao / tbproduto.avaliacoes) from tbcomentario join tbproduto where ProdutoId = 2;

select sum(vendas * preco) from tbproduto;

select * from tbpromocao;
select * from tbpromocaoitem;

insert into tbcategoria (Categoria) values ("Comida Japonesa");
insert into tbcategoria (Categoria) values ("Comida Italiana");
insert into tbcategoria (Categoria) values ("Pizza");
insert into tbcategoria (Categoria) values ("Massas");
insert into tbcategoria (Categoria) values ("Hamburguer");
insert into tbcategoria (Categoria) values ("Aperitivos");
insert into tbcategoria (Categoria) values ("Sorvete");
insert into tbcategoria (Categoria) values ("Milkshake");
insert into tbcategoria (Categoria) values ("Açai");
insert into tbcategoria (Categoria) values ("Bebidas");

call spCadastrarAdministrador("Admin", "admin@gmail.com", "Admin1", "12345", null, "Ativo", current_date());
call spCadastrarColaborador("nome da empresa real", "fornecedorteste@gmail.com", "Fornecedor teste", "12345", "00.623.904/0001-73");
call spCadastrarUsuario("Nathan", "nathanbs1227@gmail.com", "Nathanbsy", "12345", null, "2005-08-15", "333.333.333.33");

select * from tblogin join tbcolaborador where tipo = "Fornecedor";
select * from tblogin join tbadmin where tipo = "Funcionario";
select * from tblogin join tbcliente on tblogin.IdLogin = tbCliente.IdCliente;
select * from tbcarrinho;
select * from tbproduto;
select * from tbcategoria;
select * from tbcomentario;

SELECT SUM(Avaliacao) FROM tbcomentario WHERE ProdutoId = 1;
select sum(Vendas) from tbproduto where UserId = 1;
