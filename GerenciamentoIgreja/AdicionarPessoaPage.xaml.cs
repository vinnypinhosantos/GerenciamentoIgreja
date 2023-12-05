using Microsoft.Maui.Controls;
using System;
using System.Data.SqlClient;

namespace GerenciamentoIgreja
{
    public partial class AdicionarPessoaPage : ContentPage
    {
        private const string ConnectionString = "Server=localhost,1433;Database=GerenciamentoIgreja;User ID=sa;Password=Woody327YNWA!;Trusted_Connection=False;TrustServerCertificate=True;";

        public AdicionarPessoaPage()
        {
            InitializeComponent();
            CarregarDepartamentos();
        }

        private async void CarregarDepartamentos()
        {
            using (var connection = new SqlConnection(ConnectionString))
            {
                connection.Open();

                // Consulta SQL para obter os departamentos existentes
                using (var command = new SqlCommand("SELECT Nome FROM Departamentos", connection))
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        // Adicione os departamentos ao Picker
                        DepartamentoPicker.Items.Add(reader["Nome"].ToString());
                    }
                }
            }
        }

        private async void SalvarButton_Clicked(object sender, EventArgs e)
        {
            try
            {
                // Obtenha os valores dos campos do formulário
                var pessoa = new
                {
                    Nome = NomeEntry.Text,
                    Rua = RuaEntry.Text,
                    Bairro = BairroEntry.Text,
                    Cidade = CidadeEntry.Text,
                    Estado = EstadoEntry.Text,
                    Pais = PaisEntry.Text,
                    DataNasc = DataNascDatePicker.Date,
                    Sexo = SexoPicker.SelectedItem.ToString()[0],
                    EstadoCivil = EstadoCivilEntry.Text,
                    Telefone1 = Telefone1Entry.Text,
                    Telefone2 = Telefone2Entry.Text,
                    Telefone3 = Telefone3Entry.Text
                };

                using (var connection = new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    var departamentoSelecionado = DepartamentoPicker.SelectedItem.ToString();
                    var query = $"SELECT IdDepartamento FROM Departamentos WHERE Nome = '{departamentoSelecionado}'";

                    using (var command = new SqlCommand(query, connection))
                    {
                        var idDepartamento = command.ExecuteScalar();
                        using (var insertPessoaCommand = new SqlCommand(
                            "INSERT INTO Pessoas (Nome, Rua, Bairro, Cidade, Estado, Pais, DataNasc, Sexo, EstadoCivil, Telefone1, Telefone2, Telefone3, IdDepartamento) " +
                            "VALUES (@Nome, @Rua, @Bairro, @Cidade, @Estado, @Pais, @DataNasc, @Sexo, @EstadoCivil, @Telefone1, @Telefone2, @Telefone3, @IdDepartamento)",
                            connection))
                        {
                            insertPessoaCommand.Parameters.AddWithValue("@Nome", pessoa.Nome);
                            insertPessoaCommand.Parameters.AddWithValue("@Rua", pessoa.Rua);
                            insertPessoaCommand.Parameters.AddWithValue("@Bairro", pessoa.Bairro);
                            insertPessoaCommand.Parameters.AddWithValue("@Cidade", pessoa.Cidade);
                            insertPessoaCommand.Parameters.AddWithValue("@Estado", pessoa.Estado);
                            insertPessoaCommand.Parameters.AddWithValue("@Pais", pessoa.Pais);
                            insertPessoaCommand.Parameters.AddWithValue("@DataNasc", pessoa.DataNasc);
                            insertPessoaCommand.Parameters.AddWithValue("@Sexo", pessoa.Sexo);
                            insertPessoaCommand.Parameters.AddWithValue("@EstadoCivil", pessoa.EstadoCivil);
                            insertPessoaCommand.Parameters.AddWithValue("@Telefone1", pessoa.Telefone1);
                            insertPessoaCommand.Parameters.AddWithValue("@Telefone2", pessoa.Telefone2);
                            insertPessoaCommand.Parameters.AddWithValue("@Telefone3", pessoa.Telefone3);
                            insertPessoaCommand.Parameters.AddWithValue("@IdDepartamento", idDepartamento);

                            insertPessoaCommand.ExecuteNonQuery();
                        }
                    }
                }

                await DisplayAlert("Sucesso", "Pessoa adicionada com sucesso!", "OK");
            }
            catch (Exception ex)
            {
                await DisplayAlert("Erro", $"Erro ao adicionar pessoa: {ex.Message}", "OK");
            }
        }
    }
}
