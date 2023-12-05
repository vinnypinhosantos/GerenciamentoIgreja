CREATE PROCEDURE ExcluirPessoa
    @IdPessoa INT
AS
BEGIN
    DELETE FROM Pessoas
    WHERE IdPessoa = @IdPessoa;
END
