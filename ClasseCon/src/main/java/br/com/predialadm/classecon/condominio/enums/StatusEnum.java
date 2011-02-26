package br.com.predialadm.classecon.condominio.enums;

/**
 * 
 * Classe que representa os status de um objeto.
 * 
 * @author Idelvane 25/02/2011
 * 
 */
public enum StatusEnum {

	ATIVO("Ativo(a)"), 
	SUSPENSO("Suspenso(a)"), 
	CANCELADO("Cancelado(a)");

	private String status;

	private StatusEnum(String descricao) {
		this.status = descricao;
	}

	public String getStatus() {
		return status;
	}
}
