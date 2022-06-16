package model;

public class Produtos {
	
		private String idProduto;
		private String nome;
		private String descricao;
		private String quantidade;	
		private String categoria;	
		private String marca;
		private String valor;
		
		
		
		public Produtos() {
			super();
			// TODO Auto-generated constructor stub
		}



		public Produtos(String idProduto, String nome, String descricao, String quantidade, String categoria,
				String marca, String valor) {
			super();
			this.idProduto = idProduto;
			this.nome = nome;
			this.descricao = descricao;
			this.quantidade = quantidade;
			this.categoria = categoria;
			this.marca = marca;
			this.valor = valor;
		}



		public String getIdProduto() {
			return idProduto;
		}



		public void setIdProduto(String idProduto) {
			this.idProduto = idProduto;
		}



		public String getNome() {
			return nome;
		}



		public void setNome(String nome) {
			this.nome = nome;
		}



		public String getDescricao() {
			return descricao;
		}



		public void setDescricao(String descricao) {
			this.descricao = descricao;
		}



		public String getQuantidade() {
			return quantidade;
		}



		public void setQuantidade(String quantidade) {
			this.quantidade = quantidade;
		}



		public String getCategoria() {
			return categoria;
		}



		public void setCategoria(String categoria) {
			this.categoria = categoria;
		}



		public String getMarca() {
			return marca;
		}



		public void setMarca(String marca) {
			this.marca = marca;
		}



		public String getValor() {
			return valor;
		}



		public void setValor(String valor) {
			this.valor = valor;
		}	
		
}