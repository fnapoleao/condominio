/**
 * 
 */
package br.com.predialadm.classecon.condominio;


/**
 * Classe responsável por dizer quais os tipos de condômino do sistema. Um condômino pode ser: <br>
 * 
 * <li> Inquilino
 * <li> Proprietário
 * <li> Proprietário/Inquilino
 * <li> Imobiliária
 * 
 * @author Idelvane 22/02/2011
 * 
 */
public enum TipoCondominoEnum {

	PROPRIETARIO ("Proprietário"),
	IMOBILIARIA ("Imobiliária"),
	LOCATARIO ("Locatário"),
	PROCURADOR ("Procurador"),
	BENEFICIARIO ("Beneficiário"),
	COMODATARIO ("Comodatário");
	
	private String descricao;
	
	private TipoCondominoEnum(String descricao) {
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}

}
