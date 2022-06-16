package model;

import java.util.Date;

public class ControleSaida {
	private long idSaida;
	private int quantidadeSaida;
	private Date dataSaida;
	private String estoque;
	private Produtos produtos;
	private String valor;

	public ControleSaida() {
	}

	public ControleSaida(long idSaida, int quantidadeSaida, Date dataSaida, String estoque, Produtos produtos,
			String valor) {
		super();
		this.idSaida = idSaida;
		this.quantidadeSaida = quantidadeSaida;
		this.dataSaida = dataSaida;
		this.estoque = estoque;
		this.produtos = produtos;
		this.valor = valor;
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

	public Date getDataSaida() {
		return dataSaida;
	}

	public void setDataSaida(Date dataSaida) {
		this.dataSaida = dataSaida;
	}

	public String getEstoque() {
		return estoque;
	}

	public void setEstoque(String estoque) {
		this.estoque = estoque;
	}

	public Produtos getProdutos() {
		return produtos;
	}

	public void setProdutos(Produtos produtos) {
		this.produtos = produtos;
	}

	public String getValor() {
		return valor;
	}

	public void setValor(String valor) {
		this.valor = valor;
	}

}