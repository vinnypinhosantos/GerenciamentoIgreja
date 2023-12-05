CREATE PROCEDURE AtualizarTelefones
    @IdPessoa INT,
    @NovoTelefone1 VARCHAR(11),
    @NovoTelefone2 VARCHAR(11),
    @NovoTelefone3 VARCHAR(11)
AS
BEGIN
    UPDATE Pessoas
    SET Telefone1 = @NovoTelefone1,
        Telefone2 = @NovoTelefone2,
        Telefone3 = @NovoTelefone3
    WHERE IdPessoa = @IdPessoa;
END
