CREATE PROCEDURE AdicionarPessoaDepartamento
    @IdPessoa INT,
    @IdDepartamento INT OUTPUT
AS
BEGIN
    DECLARE @IdCelula INT

    DECLARE @Idade INT
    SELECT @Idade = DATEDIFF(YEAR, DataNasc, GETDATE()) FROM Pessoas WHERE IdPessoa = @IdPessoa

    DECLARE @Sexo CHAR, @EstadoCivil VARCHAR(50)
    SELECT @Sexo = Sexo, @EstadoCivil = EstadoCivil FROM Pessoas WHERE IdPessoa = @IdPessoa

    IF @EstadoCivil = 'Solteiro' AND @Idade > 12
        SET @IdDepartamento = (SELECT IdDepartamento FROM Departamentos WHERE Nome = 'Rede de Jovens Revival')
    ELSE IF @EstadoCivil = 'Solteiro' AND @Idade <= 12
        SET @IdDepartamento = (SELECT IdDepartamento FROM Departamentos WHERE Nome = 'Rede Kids')
    ELSE IF @EstadoCivil = 'Casado' AND @Sexo = 'F'
        SET @IdDepartamento = (SELECT IdDepartamento FROM Departamentos WHERE Nome = 'Rede de Mulheres')
    ELSE IF @EstadoCivil = 'Casado' AND @Sexo = 'M'
        SET @IdDepartamento = (SELECT IdDepartamento FROM Departamentos WHERE Nome = '300 - Rede de Homens')

    IF @IdDepartamento IS NOT NULL
    BEGIN
        INSERT INTO PessoasDepartamentos (IdPessoa, IdDepartamento, Funcao) VALUES (@IdPessoa, @IdDepartamento, 'Membro')
    END

    SELECT @IdDepartamento AS 'IdDepartamento'
END
