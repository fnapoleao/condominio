/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.util.Set;

import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

/**
 * Classe que representa um usuário vinculado a um condomino
 * 
 * @author Idelvane 25/02/2011
 * 
 */
@Entity
@DiscriminatorValue ("UCO")
public class UsuarioCondomino extends Usuario {

	private static final long serialVersionUID = 1L;

	/**
	 * Um condomino pode ter várias unidades, sendo que caso ele deixe de ter
	 * uma, basta retirá-la da coleção.
	 */
	@Transient
	private Set<Unidade> unidades;
	/*
	 * condomino vinculado ao usuário.
	 */
	@ManyToOne
	private Condomino condomino;

	public Set<Unidade> getUnidades() {
		return unidades;
	}

	public void setUnidades(Set<Unidade> unidades) {
		this.unidades = unidades;
	}

	public Condomino getCondomino() {
		return condomino;
	}

	public void setCondomino(Condomino condomino) {
		this.condomino = condomino;
	}

}
