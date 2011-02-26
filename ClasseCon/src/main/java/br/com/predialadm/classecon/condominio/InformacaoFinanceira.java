/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import br.com.predialadm.classecon.condominio.enums.TipoPagamentoEnum;

/**
 * Classe que representa as informações financeiras de um elemento que precise possuí-las.
 * 
 * @author Idelvane 25/02/2011
 * 
 */
@Entity
public class InformacaoFinanceira implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue (strategy = GenerationType.AUTO)
	private Long id;
	private String conta;
	private String agencia;
	
	@OneToOne 
	//TODO como mapear corretamente?
	private Banco banco;
	
	/**
	 * Representa a forma de pagamento vinculada a essa informação financeira.
	 */
	@Enumerated (EnumType.ORDINAL)
	private TipoPagamentoEnum tipoPagamento;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getConta() {
		return conta;
	}

	public void setConta(String conta) {
		this.conta = conta;
	}

	public String getAgencia() {
		return agencia;
	}

	public void setAgencia(String agencia) {
		this.agencia = agencia;
	}

	public Banco getBanco() {
		return banco;
	}

	public void setBanco(Banco banco) {
		this.banco = banco;
	}

	public TipoPagamentoEnum getTipoPagamento() {
		return tipoPagamento;
	}

	public void setTipoPagamento(TipoPagamentoEnum tipoPagamento) {
		this.tipoPagamento = tipoPagamento;
	}

}
