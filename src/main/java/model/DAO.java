package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAO {

	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/projetointegrador?useTimezone=true&serverTimezone=UTC";
	private String user = "root";
	private String password = "";

	/**
	 * Conectar.
	 *
	 * @return the connection
	 */
	private Connection conectar() {
		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			return con;

		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	/**
	 * Inserir cadastro.
	 *
	 * @param cadastro the cadastro
	 */
	public void inserirCadastro(Produtos cadastro) {
		String create = "insert into produto (nome,descricao,quantidade,categoria,marca,valor) values (?,?,?,?,?,?)";
		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(create);
			pst.setString(1, cadastro.getNome());
			pst.setString(2, cadastro.getDescricao());
			pst.setString(3, cadastro.getQuantidade());
			pst.setString(4, cadastro.getCategoria());
			pst.setString(5, cadastro.getMarca());
			pst.setString(6, cadastro.getValor());
			pst.executeUpdate();
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public ArrayList<Produtos> listarCadastro() {
		ArrayList<Produtos> cadastros = new ArrayList<>();
		String read = "select * from produto order by nome";

		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(read);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				String idProduto = rs.getString(1);
				String nome = rs.getString(2);
				String descricao = rs.getString(3);
				String quantidade = rs.getString(4);
				String categoria = rs.getString(5);
				String marca = rs.getString(6);
				String valor = rs.getString(7);
				cadastros.add(new Produtos(idProduto, nome, descricao, quantidade, categoria, marca, valor));
			}
			con.close();
			return cadastros;

		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
		
		/**
		 * Selecionar cadastro.
		 *
		 * @param cadastro the cadastro
		 */
		public void selecionarCadastro(Produtos cadastro) {
			String read2 = "select * from produto where idProduto = ?";
			try {
				Connection con = conectar();
				PreparedStatement pst = con.prepareStatement(read2);
				pst.setString(1, cadastro.getIdProduto());
				ResultSet rs = pst.executeQuery();
				while (rs.next()) {
					cadastro.setIdProduto(rs.getString(1));
					cadastro.setNome(rs.getString(2));
					cadastro.setDescricao(rs.getString(3));
					cadastro.setQuantidade(rs.getString(4));
					cadastro.setCategoria(rs.getString(5));
					cadastro.setMarca(rs.getString(6));
					cadastro.setValor(rs.getString(7));
				}
				con.close();

			} catch (Exception e) {
				System.out.println(e);
		}		
	}
		/**
		 * Alterar cadastro.
		 *
		 * @param cadastro the cadastro
		 */
		public void alterarCadastro(Produtos cadastro) {
			String update = "update produto set nome=?,descricao=?,quantidade=?,categoria=?,marca=?,valor=? where idProduto=?";
			try {

				Connection con = conectar();
				PreparedStatement pst = con.prepareStatement(update);
				pst.setString(1, cadastro.getNome());
				pst.setString(2, cadastro.getDescricao());
				pst.setString(3, cadastro.getQuantidade());
				pst.setString(4, cadastro.getCategoria());
				pst.setString(5, cadastro.getMarca());
				pst.setString(6, cadastro.getValor());
				pst.setString(7, cadastro.getIdProduto());
				pst.executeUpdate();
				con.close();

			} catch (Exception e) {
				System.out.println(e);
			}
		}
		/**
		 * Deletar cadastro.
		 *
		 * @param cadastro the cadastro
		 */
		public void deletarCadastro(Produtos cadastro) {
			String delete = "delete from produto where idProduto=?";

			try {
				Connection con = conectar();
				PreparedStatement pst = con.prepareStatement(delete);
				pst.setString(1, cadastro.getIdProduto());
				pst.executeUpdate();
				con.close();

			} catch (Exception e) {
				System.out.println(e);
			}

		}
	}
