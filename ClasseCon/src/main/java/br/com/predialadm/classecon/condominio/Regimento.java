/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

/**
 * Classe que representa itens do regimento a serem inseridos no sistema. A coleção de regimentos será chamada de "Sumário de Informações".
 * 	
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
	
	@Temporal (TemporalType.DATE)
	private Date dataInclusao;
	
	@ManyToOne (fetch = FetchType.LAZY)
	@JoinColumn (name = "idCondominio")
	private Condominio condominio;
	
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
	
	public Date getDataInclusao() {
		return dataInclusao;
	}

	public void setDataInclusao(Date dataInclusao) {
		this.dataInclusao = dataInclusao;
	}
	
	public Condominio getCondominio() {
		return condominio;
	}

	public void setCondominio(Condominio condominio) {
		this.condominio = condominio;
	}

	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Regimento)) {
			return false;
		}
		
		Regimento otherObject = (Regimento) object;
		return new EqualsBuilder()
			.append(this.getDescricao(), otherObject.getDescricao())
			.append(this.getDataInclusao(), otherObject.getDataInclusao())
			.append(this.getCondominio(), otherObject.getCondominio())
			.isEquals();
	}
	
	@Override
	public int hashCode() {
		return new HashCodeBuilder()
			.append(this.getDescricao())
			.append(this.getDataInclusao())
			.append(this.getCondominio())
			.toHashCode();
	}

}
