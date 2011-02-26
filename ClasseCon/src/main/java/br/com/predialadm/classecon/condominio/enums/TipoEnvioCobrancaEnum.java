package br.com.predialadm.classecon.condominio.enums;

/**
 * 
 * Classe que representa os tipos de envio de correspondência de cobrança a uma unidade. 	
 * @author Idelvane 25/02/2011
 *
 */
public enum TipoEnvioCobrancaEnum {
	
	IMPRESSO ("Impresso"),
	EMAIL ("E-mail"),
	IMPRESSO_EMAIL ("Impresso e e-mail"),
	NENHUM ("Nenhum");
	
	private String descricao;
	
	private TipoEnvioCobrancaEnum(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}
}
