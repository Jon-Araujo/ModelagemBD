CREATE SEQUENCE id_seq_pessoa START WITH 1;
CREATE SEQUENCE id_seq_movimentacoes START WITH 1;

CREATE TABLE Pessoa 
( 
 idPessoa INT DEFAULT nextval('id_seq_pessoa') PRIMARY KEY,  
 nome VARCHAR,  
 logradouro VARCHAR,  
 cidade VARCHAR,  
 estado VARCHAR,  
 telefone VARCHAR,  
 email VARCHAR
); 

CREATE TABLE produto
( 
 idProduto INT PRIMARY KEY,  
 quantidade INT,  
 nome VARCHAR,  
 precoVenda NUMERIC
);

CREATE TABLE Fisica 
(
 idPessoaFisica INT DEFAULT nextval('id_seq_pessoa') PRIMARY KEY,
 nome VARCHAR,
 logradouro VARCHAR,
 cidade VARCHAR,
 estado VARCHAR,
 telefone VARCHAR,
 email VARCHAR,
 idpessoa int,
 cpf VARCHAR
); 

CREATE TABLE Juridica 
(
 idPessoaJuridica INT DEFAULT nextval('id_seq_pessoa') PRIMARY KEY,
 idPessoa INT,
 dadosPessoa VARCHAR,
 cnpj VARCHAR,  
 FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa)
); 

CREATE TABLE Compra 
( 
 idCompra INT PRIMARY KEY,
 idProduto INT,
 idPessoaFisica INT,
 FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),  
 FOREIGN KEY (idPessoaFisica) REFERENCES fisica(idPessoaFisica)
); 

CREATE TABLE Venda 
(
 idVenda INT PRIMARY KEY,
 idProduto INT,
 idPessoaJuridica INT,
 FOREIGN KEY (idProduto) REFERENCES Produto(idProduto),
 FOREIGN KEY (idPessoaJuridica) REFERENCES juridica(idPessoaJuridica)
);

CREATE TABLE usuarios
(
    idUsuario INT,
    login VARCHAR,
    senha VARCHAR
);

CREATE TABLE movimentacoes
(   
    idMovimento INT DEFAULT nextval('id_seq_movimentacoes'),
    idUsuario INT,
    idPessoa INT,
    idProduto INT,
    quantidade INT,
    tipo VARCHAR,
    valorUnitario DECIMAL
);