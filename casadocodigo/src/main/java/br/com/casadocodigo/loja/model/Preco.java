package br.com.casadocodigo.loja.model;

import java.math.BigDecimal;

import javax.persistence.Embeddable;

//vincula o preco ao produto em uma tabela gerenciada pelo hibernate
@Embeddable
public class Preco {

	private BigDecimal valor;
	private TipoPreco tipo;
	
	public BigDecimal getValor() {
		return valor;
	}
	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}
	public TipoPreco getTipo() {
		return tipo;
	}
	public void setTipo(TipoPreco tipo) {
		this.tipo = tipo;
	}
	@Override
	public String toString() {
		return "Preco [valor=" + valor + ", tipo=" + tipo + "]";
	}	
	
	
}
