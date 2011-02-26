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
 * 
 * @author Idelvane 22/02/2011
 * 
 */

@Entity
public class AreaLazer implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String descricao;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	@Override
	public boolean equals(Object object) {
		if (!(object instanceof AreaLazer)) {
			return false;
		}
		
		AreaLazer otherObject = (AreaLazer) object;
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
