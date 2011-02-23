package br.com.predialadm.classecon.address;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

/**
 * Representa um município no sistema.
 * @author Idelvane 22/02/2011
 */
public class Municipio {

	private Long id;
	private String descricao;
	private String codigoIBGE;
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