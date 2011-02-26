/**
 * 
 */
package br.com.predialadm.classecon.condominio.enums;

/**
 * Classe que representa os tipos de pagamentos vinculados às informações financeiras do sistema.
 * 
 * @author Idelvane 25/02/2011
 *
 */
public enum TipoPagamentoEnum {
	
	CARTAO_DE_DEBITO ("Cartão de débito"),
	CARTAO_DE_CREDITO ("Cartão de crédito"),
	DEBITO_EM_CONTA ("Débito em conta"),
	BOLETO ("Boleto"),
	CHEQUE ("Cheque");
	
	private String descricao;
	
	private TipoPagamentoEnum(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}
	
}
