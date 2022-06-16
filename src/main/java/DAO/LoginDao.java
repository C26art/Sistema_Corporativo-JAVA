package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Conexao;
import model.Login;

public class LoginDao extends Conexao {

	public Login buscarLogin(String login, String senha) {
		Login usr = null;

		try {
			String sql = "select * from funcionariolog where login = ? and senha = ? ";

			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setString(1, login);
			ps.setString(2, senha);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				usr = new Login();
				usr.setId(rs.getLong("id"));
				usr.setNome(rs.getString("nome"));
				usr.setLogin(rs.getString("login"));
			}

		} catch (SQLException e) {
			System.out.println("Erro na consulta");

		} finally {
			fecharConexao();
		}
		return usr;
	}
	
	public void cadastrar(Login l) {
		String sql = "insert into funcionariolog " + "(nome, login, senha) values "
				+ "(?, ?, ?)";

		try {

			PreparedStatement ps = getConexion().prepareStatement(sql);
			ps.setString(1, l.getNome());
			ps.setString(2, l.getLogin());
			ps.setString(3, l.getSenha());			
			ps.execute();
		

		} catch (SQLException e) {
			System.out.println("Deu problema no Insert ");
			e.printStackTrace();

		} finally {
			fecharConexao();
		}

	}
		
		public void alterar(Login l) {
			String sql = "update funcionariolog set " + "nome = ?, " + "login = ?, " + "senha = ? " +  "where id =? ";
			try {
				PreparedStatement ps = getConexion().prepareStatement(sql);
				ps.setString(1, l.getNome());
				ps.setString(2, l.getLogin());
				ps.setString(3, l.getSenha());				
				ps.setLong(4, l.getId());
				ps.execute();

			} catch (SQLException e) {
				System.out.println("Erro no Update");
				e.printStackTrace();

			} finally {
				fecharConexao();
			}		
		}
		
		public ArrayList<Login> listar(String nomeBusca) {
			ArrayList<Login> lista = new ArrayList<Login>();

			String sql = "select * from funcionariolog " + "where nome like? " + "order by nome";
			try {
				PreparedStatement ps = getConexion().prepareStatement(sql);
				ps.setString(1, "%" + nomeBusca + "%");

				ResultSet rs = ps.executeQuery();
				Login l;
				while (rs.next()) {
					l = new Login();
					l.setId(rs.getLong("id"));
					l.setNome(rs.getString("nome"));
					l.setLogin(rs.getString("login"));
					l.setSenha(rs.getString("senha"));					
					lista.add(l);
				}

			} catch (SQLException e) {
				System.out.println("Erro ao Listar");
				e.printStackTrace();

			} finally {
				fecharConexao();
			}

			return lista;
		}
		
		public void excluir (Login l) {
			String sql = "delete  from funcionariolog where id = ? ";
			
			try {
				PreparedStatement ps = getConexion().prepareStatement(sql);
				ps.setLong(1, l.getId());
				
				ps.execute();
				
			} catch (SQLException e) {
				System.out.println("Erro na exclusão");
				e.printStackTrace();
				
			}finally {
				fecharConexao();
			}
		}
		
		public Login buscar(long id) {
			Login login = null;

	String sql = "select * from funcionariolog " +
			"where id = ? ";

	try {
		PreparedStatement ps = getConexion().prepareStatement(sql);
		ps.setLong(1, id);
		
		ResultSet rs = ps.executeQuery();
		
		if (rs.next()) {
			login = new Login();
			login.setId(rs.getLong("id"));
			login.setNome(rs.getString("nome"));
			login.setLogin(rs.getString("login"));
			login.setSenha(rs.getString("senha"));								
		}
		
	}catch (SQLException e) {
		System.out.println("Erro ao Listar");	
		e.printStackTrace();
		
	}finally {
		fecharConexao ();
	}
								
	return login;
		}
				
	}
		
		
	


