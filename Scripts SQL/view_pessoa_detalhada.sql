CREATE VIEW ViewPessoaDetalhada
AS
SELECT
    P.IdPessoa,
    P.Nome,
    P.DataNasc,
    D.Nome AS NomeDepartamento
FROM
    Pessoas P
    INNER JOIN PessoasDepartamentos PD ON P.IdPessoa = PD.IdPessoa
    INNER JOIN Departamentos D ON PD.IdDepartamento = D.IdDepartamento;
