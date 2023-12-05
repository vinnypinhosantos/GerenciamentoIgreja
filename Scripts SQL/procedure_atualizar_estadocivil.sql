CREATE PROCEDURE AtualizarEstadoCivil
    @IdPessoa INT,
    @NovoEstadoCivil VARCHAR(50)
AS
BEGIN
    UPDATE Pessoas
    SET EstadoCivil = @NovoEstadoCivil
    WHERE IdPessoa = @IdPessoa;
END
