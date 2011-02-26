/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

/**
 * Classe que representa a empresa que presta serviços de contabilidade para o
 * conselho de determinado condomínio.
 * 
 * @author Idelvane 25/02/2011
 * 
 */
@Entity
public class EmpresaContabilidade implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String nome;
	/**
	 * Número CRC (Conselho Regional de Contabilidade)
	 */
	private String crc;
	/**
	 * Nome do responsável da empresa de contabilidade
	 */
	private String responsavel;
	
	/**
	 * Conselhos vinculados a empresa.
	 */
	@OneToMany(fetch = FetchType.LAZY, mappedBy ="empresaContabilidade")
	private Set<Conselho> conselhos;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCrc() {
		return crc;
	}

	public void setCrc(String crc) {
		this.crc = crc;
	}

	public String getResponsavel() {
		return responsavel;
	}

	public void setResponsavel(String responsavel) {
		this.responsavel = responsavel;
	}

	public Set<Conselho> getConselhos() {
		return conselhos;
	}

	public void setConselhos(Set<Conselho> conselhos) {
		this.conselhos = conselhos;
	}

}
