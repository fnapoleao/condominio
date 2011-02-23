package br.com.predialadm.classecon.address;

import java.util.Set;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

/**
 * Representa uma unidade da federação.
 * @author Idelvane 22/02/2011
 */
public class Estado {

	private Long id;
	private String descricao;
	private String uf;
	private Set<Municipio> municipios;
	
	public Estado() {
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

	public Set<Municipio> getMunicipios() {
		return this.municipios;
	}

	public void setMunicipios(Set<Municipio> municipios) {
		this.municipios = municipios;
	}

	public String getUf() {
		return this.uf;
	}

	public void setUf(String uf) {
		this.uf = uf;
	}
	
	@Override
	public boolean equals(Object object) {
		if (!(object instanceof Estado)) {
			return false;
		}
		Estado otherObject = (Estado) object;
		return new EqualsBuilder()
			.append(this.id, otherObject.getId())
			.append(this.descricao, otherObject.getDescricao())
			.append(this.uf, otherObject.getUf())
			.isEquals();
	}
	
	@Override
	public int hashCode() {
		return new HashCodeBuilder()
			.append(this.id)
			.append(this.descricao)
			.append(this.uf)
			.toHashCode();
	}
		
}