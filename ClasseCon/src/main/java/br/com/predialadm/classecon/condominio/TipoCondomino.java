/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Classe responsável por dizer quais os tipos de condômino do sistema. Um condômino pode ser: <br>
 * 
 * <li> Inquilino
 * <li> Proprietário
 * <li> Proprietário/Inquilino
 * <li> Imobiliária
 * 
 * @author Idelvane 22/02/2011
 * 
 */
@Entity
public class TipoCondomino implements Serializable {

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

}
