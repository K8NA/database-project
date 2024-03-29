USE guest;

DROP DATABASE IF EXISTS SUPERMERCADO;

CREATE DATABASE IF NOT EXISTS SUPERMERCADO;
USE SUPERMERCADO;

DROP TABLE IF EXISTS FUNCIONARIO, PRODUTO, FORNECEDOR, LOJA, TELEMOVEL, TRABALHA_PARA, CATEGORIA;

CREATE TABLE FUNCIONARIO (

 NumId INT PRIMARY KEY AUTO_INCREMENT,
 Nome VARCHAR(128) NOT NULL,
 NumTelefone INT DEFAULT NULL,
 DataNasc DATE NOT NULL,
 Salario decimal(6,2) DEFAULT NULL,
 Email VARCHAR(64) NOT NULL,
 Supervisor INT DEFAULT NULL,
 Loja VARCHAR(64) NOT NULL
 
);

ALTER TABLE FUNCIONARIO ADD FOREIGN KEY(Supervisor) REFERENCES FUNCIONARIO(NumId);

INSERT INTO FUNCIONARIO(NumId,Nome,NumTelefone,DataNasc,Salario,Email,Supervisor,Loja)
VALUES 
(1000,'Jorge Coelho',934848392,'12-09-1999',800.34,'jorgebunny@exc.pt',1001,'ChinaStore'),
(1001,'Rúben Castro',934877390,'11-02-1995',765.34,'josafe@osl.pt',1000,'ToiStore'),
(1002,'Amália Leitão',912765932,'11-09-1999',800.34,'amalia@exc.pt',1000,'ChinaStore'),
(1003,'Anabela Silva',967584939,'23-07-2002',706.34,'anasilsva@cls.pt',1002,'UmaStore'),
(1004,'Felisberto Jacinto',961723920,'11-03-1997',808.88,'felisjacks@yt.pt',1005,'YotaStore'),
(1005,'Catarina Paulina',915069432,'04-02-1998',901.93,'',1003,'ToiStore'),
(1006,'Paulo Manuel',903421490,'12-11-2000',924.04,'',1000,'YotaStore'),
(1007,'Gabriela Pedrosa',992036075,'22-01-2003',855,93,'',1000,'PaoStore'),
(1008,'Joana Cardoso',912346697,'02-05-2003',994.92,'joaneta@cls.pt',1002,'UmaStore'),
(1009,'Onésimo Teixeira',930457704,'11-04-2002',1000.04,'',1003,'PaoStore');

CREATE TABLE FORNECEDOR (
 
 NumId INT PRIMARY KEY AUTO_INCREMENT,
 NomeFornecedor VARCHAR(64) NOT NULL
);

INSERT INTO FORNECEDOR(NumId,NomeFornecedor)
VALUES
(4000 , 'GrandLine' ),
(4001 , 'Wano' ),
(4002 , 'Logue'),
(4003 , 'Alabasta'),
(4004 , 'Arlong'),
(4005 , 'ThrillerBark'),
(4006 , 'Zou');

CREATE TABLE LOJA (

 Nome VARCHAR(64) PRIMARY KEY NOT NULL,
 Rua VARCHAR(64) NOT NULL,
 Num INT NOT NULL,
 Andar INT DEFAULT NULL,
 Localidade VARCHAR(64) NOT NULL,
 CodPostal INT DEFAULT NULL,
 Responsavel INT NOT NULL
);

ALTER TABLE LOJA ADD FOREIGN KEY(Responsavel) REFERENCES FUNCIONARIO(NumId);

CREATE TABLE PRODUTO (

 NumId INT PRIMARY KEY NOT NULL,
 Nome VARCHAR(64) NOT NULL,
 Preco_Compra decimal(6,2) NOT NULL,
 Preco_Venda decimal(6,2) NOT NULL,
 Validade DATE NOT NULL,
 Fornecedor INT NOT NULL,
 Loja VARCHAR(32) NOT NULL
);

ALTER TABLE PRODUTO ADD FOREIGN KEY(Fornecedor) REFERENCES FORNECEDOR(NumId);
ALTER TABLE PRODUTO ADD FOREIGN KEY(Loja) REFERENCES LOJA(Nome);


INSERT INTO PRODUTO(NumId,Nome,Preco_Compra,Preco_Venda,Validade,Fornecedor,Loja)
VALUES
(2031,'Swashabi saquetas',6.09,6.45,'2021-05-12',4000,'ChinaStore'),
(2131,'Playmobila',17.09,20.45,'',4000,'ChinaStore'),
(2341,'SwashPotatoes',6.39,7.45,'12-05-2022',4001,'ChinaStore'),
(2201,'Rebuçados',6.09,6.85,'12-05-2021',4002,'ToiStore'),
(2921,'Padas',0.39,0.45,'12-05-2021',4003,'PaoStore'),
(2001,'Baguetes',1.09,1.45,'12-06-2023',4004,'PaoStore'),
(2410,'Hortaliças',7.09,9.45,'1-02-2022',4005,'UmaStore'),
(2192,'BiclasXPTO',30.09,35.45,'',4005,'YotaStore');


CREATE TABLE TELEMOVEL (
 
 NumId INT NOT NULL,
 Numero INT NOT NULL,
 PRIMARY KEY(NumId,Numero)
);

ALTER TABLE TELEMOVEL ADD FOREIGN KEY(NumId) REFERENCES FUNCIONARIO(NumId);

CREATE TABLE TRABALHA_PARA (

Funcionario INT NOT NULL,
Loja VARCHAR(32) NOT NULL,
Horas INT NOT NULL,
PRIMARY KEY(Funcionario,Loja)
);

ALTER TABLE TRABALHA_PARA ADD FOREIGN KEY(Funcionario) REFERENCES FUNCIONARIO(NumId);
ALTER TABLE TRABALHA_PARA ADD FOREIGN KEY(Loja) REFERENCES LOJA(Nome);

INSERT INTO TRABALHA_PARA(Funcionario,Loja,Horas)
VALUES
(1000, 'ChinaStore', 8),
(1001, 'ToiStore', 7),
(1002, 'PaoStore', 8),
(1003, 'UmaStore', 6),
(1004, 'YotaStore', 5),
(1005, 'PaoStore', 6),
(1006, 'ChinaStore', 4),
(1007, 'YotaStore', 6),
(1008, 'ToiStore' , 8),
(1009 ,'UmaStore', 7);


CREATE TABLE CATEGORIA (

NumId INT PRIMARY KEY NOT NULL,
NomeCategoria VARCHAR(16) NOT NULL
);

ALTER TABLE CATEGORIA ADD FOREIGN KEY(NumId) REFERENCES PRODUTO(NumId);

INSERT INTO CATEGORIA(NumId,NomeCategoria)
VALUES
(2031,'Outros'),
(2131,'Brinquedos'),
(2341,'Outros'),
(2201,'Doces'),
(2921,'Padaria'),
(2410,'Legumes'),
(2001,'Padaria'),
(2192,'Desporto');


