package br.com.predialadm.classecon.condominio.enums;
/**
 * 
 * Enum que representa os tipos de notícia do sistema. NORMAL somente uma informação, AVISO noticia importante. 	
 * @author Idelvane 27/02/2011
 *
 */
public enum TipoNoticiaEnum {
	
	INFORMATIVO ("Informação"),
	AVISO ("Aviso (Importante)");
	
	private String descricao;
	
	private TipoNoticiaEnum(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}

}
