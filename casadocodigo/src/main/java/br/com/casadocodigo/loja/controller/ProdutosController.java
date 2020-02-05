package br.com.casadocodigo.loja.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.casadocodigo.loja.daos.ProdutoDAO;
import br.com.casadocodigo.loja.model.Produto;
import br.com.casadocodigo.loja.model.TipoPreco;

@Controller
@RequestMapping("produtos")
public class ProdutosController {
	
	/*Utilizamos o @AutoWired para indicar ao Spring que o objeto anotado é um Bean dele 
	e que queremos que ele nos dê uma instância por meio do recurso de injeção de dependência.*/
	@Autowired
	private ProdutoDAO produtoDao;
	
	@RequestMapping("/form")
	public ModelAndView form() {
		
		ModelAndView modelAndView = new ModelAndView("/produtos/form");
		modelAndView.addObject("tipos",TipoPreco.values());		
		return modelAndView;
	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String grava(Produto produto) {
		System.out.println(produto);
		produtoDao.gravar(produto);
		return "/produtos/ok";
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView listar() {
	List<Produto> produtos = produtoDao.listar();
		ModelAndView modelAndView = new ModelAndView("produtos/lista");
		modelAndView.addObject("produtos", produtos);
		return modelAndView;
	}

}
