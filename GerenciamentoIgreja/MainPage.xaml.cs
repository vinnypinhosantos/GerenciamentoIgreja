﻿namespace GerenciamentoIgreja
{
    public partial class MainPage : ContentPage
    {
        int count = 0;

        public MainPage()
        {
            InitializeComponent();
        }

        private async void OnAdicionarPessoaClicked(object sender, EventArgs e)
        {
            await Navigation.PushAsync(new AdicionarPessoaPage());
        }
    }

}
