CREATE PROCEDURE AtualizarNome
    @IdPessoa INT,
    @NovoNome VARCHAR(80)
AS
BEGIN
    UPDATE Pessoas
    SET Nome = @NovoNome
    WHERE IdPessoa = @IdPessoa;
END

SELECT * FROM Pessoas