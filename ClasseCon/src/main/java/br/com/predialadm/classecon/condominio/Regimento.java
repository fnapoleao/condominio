/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

/**
 * Classe responsável por	
 * @author Idelvane 22/02/2011
 *
 */

@Entity
public class Regimento implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long idRegimento;
	private String descricao;
	
	public Long getIdRegimento() {
		return idRegimento;
	}
	
	public void setIdRegimento(Long idRegimento) {
		this.idRegimento = idRegimento;
	}
	
	public String getDescricao() {
		return descricao;
	}
	
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Regimento)) {
			return false;
		}
		
		Regimento otherObject = (Regimento) object;
		return new EqualsBuilder()
			.append(this.getDescricao(), otherObject.getDescricao())
			.isEquals();
	}
	
	@Override
	public int hashCode() {
		return new HashCodeBuilder()
			.append(this.getDescricao())
			.toHashCode();
	}

}
