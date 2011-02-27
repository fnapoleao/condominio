/**
 * 
 */
package br.com.predialadm.classecon.condominio.historico;

/**
 * Classe que representa os tipos de histórico do sistema.
 * 
 * @author Idelvane 27/02/2011
 * 
 */
public enum TipoHistoricoEnum {

	ALTERACAO_CADASTRAL("Alteração de Cadastro");

	private String tipo;

	private TipoHistoricoEnum(String tipo) {
		this.tipo = tipo;
	}

	public String getTipo() {
		return tipo;
	}

}
