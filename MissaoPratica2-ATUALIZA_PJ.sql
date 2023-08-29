UPDATE juridica
SET nome = pessoa.nome,
    logradouro = pessoa.logradouro,
    cidade = pessoa.cidade,
    estado = pessoa.estado,
    telefone = pessoa.telefone,
    email = pessoa.email
FROM pessoa
WHERE juridica.idpessoa = pessoa.idpessoa;