﻿namespace TCM.Models
{
    public class Endereco
    {
        public int IdEndereco { get; set; }
        public string? Logradouro { get; set; }
        public string Numero { get; set; }
        public string Complemento { get; set; }
        public string? Bairro { get; set; }
        public string? Cidade { get; set; }
        public int IdEstado { get; set; }
        public string? Estado { get; set; }
        public int UserId { get; set; }
        public string? CEP { get; set; }
    }
}
