/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * Classe que representa uma filial de uma empresa que utilize o ClasseCon.	
 * @author Idelvane 27/02/2011
 *
 */
@Entity
@DiscriminatorValue ("FIL")
public class Filial extends Empresa{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@ManyToOne (fetch = FetchType.LAZY)
	@JoinColumn (name ="idMatriz", nullable = false)
	private Empresa matriz;

	public Empresa getMatriz() {
		return matriz;
	}

	public void setMatriz(Empresa matriz) {
		this.matriz = matriz;
	}
	
}
