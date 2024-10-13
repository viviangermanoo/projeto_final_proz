CREATE TABLE Cliente 
( 
 nome VARCHAR(50),  
 email VARCHAR(50),  
 telefone VARCHAR(10),  
 id_cliente serial PRIMARY KEY,  
 logradouro VARCHAR(200),  
 cidade VARCHAR(50) 
); 

CREATE TABLE Prestador 
( 
 id serial,  
 Nome VARCHAR(50),  
 Logradouro VARCHAR(200),  
 id_prestador serial PRIMARY KEY,  
 cidade VARCHAR(30)  
); 

CREATE TABLE Servico 
( 
 nome VARCHAR(50),  
 id_servico SERIAL PRIMARY KEY,  
 idavaliacao INT  
); 

CREATE TABLE avaliacao 
( 
 id_avaliacao serial PRIMARY KEY,  
 nota INT,  
 observacao VARCHAR(200),  
 id_servico INT,
 FOREIGN KEY (id_servico) REFERENCES servico(id_servico)
 ); 

CREATE TABLE OrdemServico 
( 
 id_cliente INT,  
 id_servico INT,  
 OS serial PRIMARY KEY ,  
FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
FOREIGN KEY (id_servico) REFERENCES servico(id_servico)  
); 

ALTER TABLE ordemservico
ADD id_prestador INT,
ADD CONSTRAINT fk_prestador FOREIGN KEY (id_prestador) REFERENCES prestador(id_prestador);

ALTER TABLE ordemservico
DROP COLUMN id_servico
;



SELECT * FROM cliente

INSERT INTO cliente (nome,email,telefone,logradouro,cidade) VALUES
('Emerson Andrade','emerson@gmail.com','99999999','Rua 10, n° 10, Centro','Belo Horizonte')

INSERT INTO cliente (nome,email,telefone,logradouro,cidade) VALUES
('Lorival Pereira','lorival@gmail.com','99998888','Rua goiaba, n° 222, Tatuape','São Paulo'),
('Pirilampo de Oliveira','piri@gmail.com','99997777','Rua da boiada, n° 2552, prado','Campo Grande'),
('Astrogildo Gomes','astro@gmail.com','99996666','Rua sao tome, n° 2266, Centro','Belo Horizonte')

INSERT INTO cliente (nome,email,telefone,logradouro,cidade) VALUES
('Zigfrida','zig@gmail.com','99995555','Rua ali, n° 25, Pindorama','Belo Horizonte'),
('Amarilda ','amarinha@gmail.com','99997777','Rua 2, n° 256, California','Belo Horizonte'),
('Maristela','mara@gmail.com','99994444','Rua santana, n° 36, Pompeia','Belo Horizonte')


INSERT INTO prestador (nome,logradouro,cidade) VALUES
('Hamilton Santos','Rua bananeira, n° 689, Tatuape','São Paulo'),
('Devair Bastos','Rua cheque, n° 556, Pampulha','Belo Horizonte'),
('Sebastiana Fonseca','Rua Medicos, n° 227, Alipio de Melo','Belo Horizonte'),
('Antonieta Bernadete','Rua chuchu, n° 778, floresta','Campo Grande')

SELECT * from prestador

ALTER TABLE prestador
DROP COLUMN id

SELECT cliente.nome as "Nome do Cliente", cliente.cidade, prestador.nome as "Nome do Prestador"
from cliente RIGHT JOIN prestador
on cliente.cidade = prestador.cidade


ALTER TABLE prestador
ADD servico INT,
ADD CONSTRAINT fk_servico FOREIGN KEY (servico) REFERENCES servico(id_servico);

CREATE TABLE Servico 
( 
 nome VARCHAR(50),  
 id_servico SERIAL PRIMARY KEY,  
 idavaliacao INT  
); 


INSERT INTO servico (nome) VALUES
('salao de beleza'),
('pilates'),
('Engenharia'),
('consultoria')

SELECT * from cliente
SELECT * from prestador
SELECT * from servico
SELECT * from ordemservico


DELETE FROM prestador WHERE id_prestador = 1;

UPDATE prestador
SET nome = 'Beleza Rara', cidade = 'Belo Horizonte'
WHERE id_prestador = 3;

UPDATE prestador
SET servico = 1
WHERE id_prestador = 3;

INSERT INTO prestador (nome,logradouro,cidade,servico) VALUES
('Corpo&Mente','Rua pirapora, n° 689, Tatuape','Belo Horizonte',2),
('Movimento do Corpo','Rua cheque, n° 556, Pampulha','Belo Horizonte',2),
('Saúde&Vida','Rua santo antonio, n° 227, Alipio de Melo','Belo Horizonte',2),
('Moretti Engenharia e Construções','Rua 25, n° 778, floresta','Belo Horizonte',3),
('KIIL Soluções Contabeis','Rua 4, n° 78, Santa Cruz','Sabará',4),
('LV Consultoria de Impacto Social','Avenida Getulio Vargas, n° 1122, Funcionários','Belo Horizonte',4)

INSERT INTO ordemservico (id_cliente,id_prestador) VALUES
(5,6),
(4,8),
(6,1)

INSERT INTO ordemservico (id_cliente,id_prestador) VALUES
(1,9);


SELECT ordemservico.os AS "Ordem de serviço", cliente.nome AS "Nome do cliente", 
prestador.nome AS "Prestador"
FROM ordemservico
INNER JOIN cliente ON ordemservico.id_cliente = cliente.id_cliente
INNER JOIN prestador ON ordemservico.id_prestador = prestador.id_prestador;






