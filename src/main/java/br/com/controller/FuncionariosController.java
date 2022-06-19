package br.com.controller;

import java.util.ArrayList;

import DAO.FuncionarioDao;
import model.Funcionarios;

public class FuncionariosController {
	FuncionarioDao dao = new FuncionarioDao();

	public void cadastrar(Funcionarios f) {
		dao.cadastrar(f);
	}

	public void alterar(Funcionarios f) {
		dao.alterar(f);
	}

	public ArrayList<Funcionarios> listar(String nome) {
		return dao.listar(nome);
	}

	public Funcionarios buscar(long id) {
		return dao.buscar(id);
	}

	public void excluir(Funcionarios f) {
		dao.excluir(f);
	}

}