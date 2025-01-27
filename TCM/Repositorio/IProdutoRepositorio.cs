﻿using TCM.Models;

namespace TCM.Repositorio
{
    public interface IProdutoRepositorio
    {
        //Adiciona Produto
        void AdicionarProduto(Produto produto);
        //Edita o produto
        void EditarProduto(Produto produto);
        //Deleta o produto
        void DeletarProduto(int id);
        Produto AcharProduto(int id);
        //Buscar todos os produtos
        IEnumerable<Produto> TodosProdutos();
        IEnumerable<Produto> TodosProdutosFornecedor(int id);
        IEnumerable<Produto> Pesquisa(string nome);
        void FinalizarCompra(int userId, int produtoId, int qtd);
        IEnumerable<Pedido> TodosPedidos(int userId);
        IEnumerable<Categoria> TodasCategorias();
        IEnumerable<Produto> ProdutosPorCategoria(int categoriaId);
        void NovaPromocao(string nomepromo, int porcentagem, string categoria, DateTime data);
        IEnumerable<Promocao> TodasPromocoes();
        IEnumerable<int> ProdutosEmPromocao();
        PromocaoItem ProdutoDaPromocao(int id);
        IEnumerable<PromocaoItem> TodosProdutosDaPromocao();
        void DeletarPromocao(int promoId);
        int TotalVendas(int userId);
        int TotalVendasSite();
        decimal ValorTotalVendas(int userId);
        decimal LucroSite();
    }
}
