package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Conexao;
import model.Funcionarios;

public class FuncionarioDao extends Conexao {
	public void cadastrar(Funcionarios f) {
		String sql = "insert into funcionario " + "(nome, cpf, email, endereco, telefone, sexo) values "
				+ "(?, ?, ?, ?, ?, ?)";

		try {

			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setString(1, f.getNome());
			ps.setString(2, f.getCpf());
			ps.setString(3, f.getEmail());
			ps.setString(4, f.getEndereco());
			ps.setString(5, f.getTelefone());
			ps.setString(6, f.getSexo());
			ps.execute();

		} catch (SQLException e) {
			System.out.println("Deu problema no Insert ");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}

	}

	public void alterar(Funcionarios f) {
		String sql = "update funcionario set " + "nome = ?, " + "cpf = ?, " + "email = ?, " + "endereco = ?, "
				+ "telefone = ?, " + "sexo = ? " + "where id =? ";
		try {
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setString(1, f.getNome());
			ps.setString(2, f.getCpf());
			ps.setString(3, f.getEmail());
			ps.setString(4, f.getEndereco());
			ps.setString(5, f.getTelefone());
			ps.setString(6, f.getSexo());
			ps.setLong(7, f.getId());
			ps.execute();

		} catch (SQLException e) {
			System.out.println("Erro no Update");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}
	}

	public ArrayList<Funcionarios> listar(String nomeBusca) {
		ArrayList<Funcionarios> lista = new ArrayList<Funcionarios>();

		String sql = "select * from funcionario " + "where nome like? " + "order by nome";
		try {
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setString(1, "%" + nomeBusca + "%");

			ResultSet rs = ps.executeQuery();
			Funcionarios f;
			while (rs.next()) {
				f = new Funcionarios();
				f.setId(rs.getLong("id"));
				f.setNome(rs.getString("nome"));
				f.setCpf(rs.getString("cpf"));
				f.setEmail(rs.getString("email"));
				f.setEndereco(rs.getString("endereco"));
				f.setTelefone(rs.getString("telefone"));
				f.setSexo(rs.getString("sexo"));
				lista.add(f);
			}

		} catch (SQLException e) {
			System.out.println("Erro ao Listar");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}

		return lista;

	}

	public Funcionarios buscar(long id) {
		Funcionarios funcionario = null;

		String sql = "select * from funcionario " + "where id = ? ";

		try {
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setLong(1, id);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				funcionario = new Funcionarios();
				funcionario.setId(rs.getLong("id"));
				funcionario.setNome(rs.getString("nome"));
				funcionario.setCpf(rs.getString("cpf"));
				funcionario.setEmail(rs.getString("email"));
				funcionario.setEndereco(rs.getString("endereco"));
				funcionario.setTelefone(rs.getString("telefone"));
				funcionario.setSexo(rs.getString("sexo"));
			}

		} catch (SQLException e) {
			System.out.println("Erro ao Listar");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}

		return funcionario;
	}

	public void excluir(Funcionarios f) {
		String sql = "delete  from funcionario where id = ? ";

		try {
			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setLong(1, f.getId());

			ps.execute();

		} catch (SQLException e) {
			System.out.println("Erro na exclusão");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}
	}

}
