SELECT * FROM sistema_corporativo.fornecedor;
use sistema_corporativo;
CREATE TABLE IF NOT EXISTS controle_saida(
idSaida smallint not null auto_increment,
quantidadeSaida int(50) UNSIGNED,
dataSaida date,
estoque int (50) not null,
idProduto int (50),
valor double not null,
desconto int  not null,
preco_total int as (valor * quantidadeSaida) STORED,
preco_desconto int as (valor * quantidadeSaida * (1 - desconto / 100)) STORED,
estoque_atual int GENERATED ALWAYS AS (estoque - quantidadeSaida) virtual,
PRIMARY KEY(idSaida),
CONSTRAINT fk_controle_saida_produto FOREIGN KEY (idProduto) REFERENCES produto(idProduto));

CREATE TABLE IF NOT EXISTS controle_entrada (
idEntrada smallint not null auto_increment,
quantidadeEntrada int(45) not null,
valor double not null,
dataEntrada date,
IdProduto int (50) not null,
Idfornecedor smallint not null,
PRIMARY KEY(idEntrada),
CONSTRAINT fk_controle_entrada_produto FOREIGN KEY (idProduto) REFERENCES produto(idProduto),
CONSTRAINT fk_controle_entrada_fornecedor FOREIGN KEY (Idfornecedor) REFERENCES fornecedor(idFornecedor));