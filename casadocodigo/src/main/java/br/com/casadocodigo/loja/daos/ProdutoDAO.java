package br.com.casadocodigo.loja.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.casadocodigo.loja.model.Produto;

@Repository
//habilita o hibernate para cuidar das transacoes
@Transactional
public class ProdutoDAO {
	
	//persistenceContext faz o spring injetar o entity manager  
	@PersistenceContext
	private EntityManager em;
	
	public void gravar(Produto produto) {
		em.persist(produto);
	}

	public List<Produto> listar() {		
		return em.createQuery("select p from Produto p" , Produto.class).getResultList();
	}
}
