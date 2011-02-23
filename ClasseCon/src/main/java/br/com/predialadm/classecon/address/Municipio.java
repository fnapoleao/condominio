package br.com.predialadm.classecon.address;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

/**
 * Representa um município no sistema.
 * @author Idelvane 22/02/2011
 */

@Entity
public class Municipio implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	private String descricao;
	
	private String codigoIBGE;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="idEstado")
	private Estado estado;

	public Municipio() {
		super();
	}

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return this.descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Estado getEstado() {
		return estado;
	}

	public void setEstado(Estado estado) {
		this.estado = estado;
	}

	public String getCodigoIBGE() {
		return this.codigoIBGE;
	}

	public void setCodigoIBGE(String codigoIBGE) {
		this.codigoIBGE = codigoIBGE;
	}

	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Municipio)) {
			return false;
		}
		Municipio otherObject = (Municipio) object;
		return new EqualsBuilder()
			.append(this.id, otherObject.getId())
			.append(this.descricao, otherObject.getDescricao())
			.isEquals();
	}
	
	@Override
	public int hashCode() {
		return new HashCodeBuilder()
			.append(this.id)
			.append(this.descricao)
			.toHashCode();
	}

}