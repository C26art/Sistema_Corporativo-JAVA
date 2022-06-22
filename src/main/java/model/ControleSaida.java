package model;

import java.util.Date;

public class ControleSaida {
	private long idSaida;
	private int quantidadeSaida;
	private String dataSaida;
	private String estoque;
	private String idProduto;
	private int valor;
	private String desconto;
	private String preco_total;
	private String preco_desconto;
	private String estoque_atual;
	
	public ControleSaida() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ControleSaida(long idSaida, int quantidadeSaida, String dataSaida, String estoque, String idProduto,
			int valor, String desconto, String preco_total, String preco_desconto, String estoque_atual) {
		super();
		this.idSaida = idSaida;
		this.quantidadeSaida = quantidadeSaida;
		this.dataSaida = dataSaida;
		this.estoque = estoque;
		this.idProduto = idProduto;
		this.valor = valor;
		this.desconto = desconto;
		this.preco_total = preco_total;
		this.preco_desconto = preco_desconto;
		this.estoque_atual = estoque_atual;
	}

	public long getIdSaida() {
		return idSaida;
	}

	public void setIdSaida(long idSaida) {
		this.idSaida = idSaida;
	}

	public int getQuantidadeSaida() {
		return quantidadeSaida;
	}

	public void setQuantidadeSaida(int quantidadeSaida) {
		this.quantidadeSaida = quantidadeSaida;
	}

	public String getDataSaida() {
		return dataSaida;
	}

	public void setDataSaida(String dataSaida) {
		this.dataSaida = dataSaida;
	}

	public String getEstoque() {
		return estoque;
	}

	public void setEstoque(String estoque) {
		this.estoque = estoque;
	}

	public String getIdProduto() {
		return idProduto;
	}

	public void setIdProduto(String idProduto) {
		this.idProduto = idProduto;
	}

	public int getValor() {
		return valor;
	}

	public void setValor(int valor) {
		this.valor = valor;
	}

	public String getDesconto() {
		return desconto;
	}

	public void setDesconto(String desconto) {
		this.desconto = desconto;
	}

	public String getPreco_total() {
		return preco_total;
	}

	public void setPreco_total(String preco_total) {
		this.preco_total = preco_total;
	}

	public String getPreco_desconto() {
		return preco_desconto;
	}

	public void setPreco_desconto(String preco_desconto) {
		this.preco_desconto = preco_desconto;
	}

	public String getEstoque_atual() {
		return estoque_atual;
	}

	public void setEstoque_atual(String estoque_atual) {
		this.estoque_atual = estoque_atual;
	}	
	
}