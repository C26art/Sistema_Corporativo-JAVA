package model;

public class Fornecedor {
	private long idfornecedor;
	private String cnpj;
	private String produto;
	private String nome;
	private String telefone;
	private String email;
	private String endereco;

	public long getIdfornecedor() {
		return idfornecedor;
	}

	public void setIdfornecedor(long idfornecedor) {
		this.idfornecedor = idfornecedor;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public String getProduto() {
		return produto;
	}

	public void setProduto(String produto) {
		this.produto = produto;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

}
