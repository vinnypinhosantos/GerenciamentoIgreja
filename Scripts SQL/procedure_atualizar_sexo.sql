CREATE PROCEDURE AtualizarSexo
    @IdPessoa INT,
    @NovoSexo VARCHAR(20)
AS
BEGIN
    UPDATE Pessoas
    SET Sexo = @NovoSexo
    WHERE IdPessoa = @IdPessoa;
END
