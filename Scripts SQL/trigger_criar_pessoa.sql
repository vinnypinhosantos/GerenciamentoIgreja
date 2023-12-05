CREATE TRIGGER TR_Pessoa_CriarUsuario
ON Pessoas
AFTER INSERT
AS
BEGIN
    DECLARE @IdPessoa INT

    SELECT @IdPessoa = IdPessoa FROM inserted

    DECLARE @IdDepartamento INT

    EXEC AdicionarPessoaDepartamento @IdPessoa, @IdDepartamento OUTPUT
END
