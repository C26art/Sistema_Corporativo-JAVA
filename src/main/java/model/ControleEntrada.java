package model;

import java.util.Date;

public class ControleEntrada {
	private long idEntrada;
	private int quantidadeEntrada;
	private Date dataEntrada;
	private String valorProduto;
	private String nomeProdutoEntrada;
	private Produtos produtos;
	private Fornecedor fornecedor;

	public ControleEntrada() {
	}

	public ControleEntrada(long idEntrada, int quantidadeEntrada, Date dataEntrada, String valorProduto,
			String nomeProdutoEntrada, Produtos produtos, Fornecedor fornecedor) {
		super();
		this.idEntrada = idEntrada;
		this.quantidadeEntrada = quantidadeEntrada;
		this.dataEntrada = dataEntrada;
		this.valorProduto = valorProduto;
		this.nomeProdutoEntrada = nomeProdutoEntrada;
		this.produtos = produtos;
		this.fornecedor = fornecedor;
	}

	public long getIdEntrada() {
		return idEntrada;
	}

	public void setIdEntrada(long idEntrada) {
		this.idEntrada = idEntrada;
	}

	public int getQuantidadeEntrada() {
		return quantidadeEntrada;
	}

	public void setQuantidadeEntrada(int quantidadeEntrada) {
		this.quantidadeEntrada = quantidadeEntrada;
	}

	public Date getDataEntrada() {
		return dataEntrada;
	}

	public void setDataEntrada(Date dataEntrada) {
		this.dataEntrada = dataEntrada;
	}

	public String getValorProduto() {
		return valorProduto;
	}

	public void setValorProduto(String valorProduto) {
		this.valorProduto = valorProduto;
	}

	public String getNomeProdutoEntrada() {
		return nomeProdutoEntrada;
	}

	public void setNomeProdutoEntrada(String nomeProdutoEntrada) {
		this.nomeProdutoEntrada = nomeProdutoEntrada;
	}

	public Produtos getProdutos() {
		return produtos;
	}

	public void setProdutos(Produtos produtos) {
		this.produtos = produtos;
	}

	public Fornecedor getFornecedor() {
		return fornecedor;
	}

	public void setFornecedor(Fornecedor fornecedor) {
		this.fornecedor = fornecedor;
	}

}