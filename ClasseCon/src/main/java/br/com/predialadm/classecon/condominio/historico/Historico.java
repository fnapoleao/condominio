/**
 * 
 */
package br.com.predialadm.classecon.condominio.historico;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 * Classe que representa uma coleção de históricos para um objeto. Quando um determinado histórico precisar de um histórico, basta que ele tenha 
	um atributo do tipo Historico;
	
 * @author Idelvane 27/02/2011
 *
 */
@Entity
public class Historico implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue (strategy = GenerationType.AUTO)
	private Long id;

	@OneToMany (fetch = FetchType.LAZY, mappedBy = "historico")
	private Set<ItemHistorico> itensHistoricos;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Set<ItemHistorico> getItensHistoricos() {
		return itensHistoricos;
	}

	public void setItensHistoricos(Set<ItemHistorico> itensHistoricos) {
		this.itensHistoricos = itensHistoricos;
	}
	
	/**
	 * 
	 * Método responsável por adicionar um novo item histórico ao histórico
	 * @param item
	 */
	public void addItemHistorico(ItemHistorico item){
		item.setHistorico(this);
		this.getItensHistoricos().add(item);
	}
}
