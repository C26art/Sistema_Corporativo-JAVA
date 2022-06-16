package br.com.controller;

import java.util.ArrayList;

import DAO.LoginDao;
import model.Login;

public class LoginController {
	LoginDao dao = new LoginDao();

	public Login logar(String login, String senha) {
		return dao.buscarLogin(login, senha);

	}
	
	public void cadastrar(Login l) {
		dao.cadastrar(l);
	}
	
	public void alterar(Login l) {
		dao.alterar(l);
	}
	
	public ArrayList<Login>listar(String nome){
		return dao.listar(nome);
	}
	
	public void excluir(Login l) {
		dao.excluir(l);
	}	
	
	public Login buscar(long id) {
		return dao.buscar(id);
	}

}


