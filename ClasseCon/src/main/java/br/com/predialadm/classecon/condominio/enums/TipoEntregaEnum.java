/**
 * 
 */
package br.com.predialadm.classecon.condominio.enums;

/**
 * Classe que representa os meios de entrega de cobranças das unidades de um condomínio.	
 * @author Idelvane 22/02/2011
 *
 */
public enum TipoEntregaEnum {
	
	CONDOMINIO ("Pelo Condomínio"),
	CORREIOS ("Pelos Correios"),
	INTERNET ("Pela Internet"),
	OUTROS ("Outros");
	
	private String descricao;
	
	private TipoEntregaEnum(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}

}
