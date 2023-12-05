CREATE PROCEDURE AtualizarEndereco
    @IdPessoa INT,
    @NovaRua VARCHAR(120),
    @NovoBairro VARCHAR(50),
    @NovaCidade VARCHAR(80),
    @NovoEstado VARCHAR(2),
    @NovoPais VARCHAR(50)
AS
BEGIN
    UPDATE Pessoas
    SET Rua = @NovaRua,
        Bairro = @NovoBairro,
        Cidade = @NovaCidade,
        Estado = @NovoEstado,
        Pais = @NovoPais
    WHERE IdPessoa = @IdPessoa;
END
