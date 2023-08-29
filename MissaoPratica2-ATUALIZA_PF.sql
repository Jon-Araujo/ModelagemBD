UPDATE fisica
SET nome = pessoa.nome,
    logradouro = pessoa.logradouro,
    cidade = pessoa.cidade,
    estado = pessoa.estado,
    telefone = pessoa.telefone,
    email = pessoa.email
FROM pessoa
WHERE fisica.idpessoa = pessoa.idpessoa;