/**
 * 
 */
package br.com.predialadm.classecon.condominio.enums;

/**
 * Classe que representa um role (papel) no sistema.
 * 
 * @author Idelvane 27/02/2011
 *
 */
public enum RoleEnum {
	
	ADMINISTRADOR_GERAL ("Administrador Geral"),
	ADMINISTRADOR_EMPRESA ("Administrador Empresa"),
	ADMINISTRADOR_FILIAL ("Administrador Filial");
	
	private String role;
	
	private RoleEnum(String papel) {
		this.role = papel;
	}

	public String getRole() {
		return role;
	}
	
}
