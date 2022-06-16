package br.com.controller;

import java.util.ArrayList;

import DAO.FornecedorDao;
import model.Fornecedor;



public class FornecedorController {
FornecedorDao dao = new FornecedorDao();
	
	public void cadastrar(Fornecedor d) {
		dao.cadastrar(d);
	}
	
	public void alterar(Fornecedor d) {
		dao.alterar(d);
	}
	
	public ArrayList<Fornecedor>listar(String nome){
		return dao.listar(nome);
	}
	
	public Fornecedor buscar(long idfornecedor) {
		return dao.buscar(idfornecedor);
	}
	
	public void excluir(Fornecedor d) {
		dao.excluir(d);
	}	

}

