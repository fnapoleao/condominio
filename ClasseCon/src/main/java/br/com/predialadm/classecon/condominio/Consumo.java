/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * Classe que representa os consumos que uma unidade possui com o tempo.
 * 
 * @author Idelvane 25/02/2011
 * 
 */
@Entity
public class Consumo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue (strategy = GenerationType.AUTO)
	private Long id;
	
	@Column (precision = 19, scale = 2)
	private BigDecimal leituraDoMes;
	
	@Column (precision = 19, scale = 2)
	private BigDecimal referenciaDoMes;
	
	@Column (precision = 19, scale = 2)
	private BigDecimal valor;
	
	@Enumerated (EnumType.ORDINAL)
	private TipoConsumo tipoConsumo;
	
	@ManyToOne (fetch = FetchType.LAZY)
	@JoinColumn (name ="idUnidade")
	private Unidade unidade;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public BigDecimal getLeituraDoMes() {
		return leituraDoMes;
	}

	public void setLeituraDoMes(BigDecimal leituraDoMes) {
		this.leituraDoMes = leituraDoMes;
	}

	public BigDecimal getReferenciaDoMes() {
		return referenciaDoMes;
	}

	public void setReferenciaDoMes(BigDecimal referenciaDoMes) {
		this.referenciaDoMes = referenciaDoMes;
	}

	public BigDecimal getValor() {
		return valor;
	}

	public void setValor(BigDecimal valor) {
		this.valor = valor;
	}

	public TipoConsumo getTipoConsumo() {
		return tipoConsumo;
	}

	public void setTipoConsumo(TipoConsumo tipoConsumo) {
		this.tipoConsumo = tipoConsumo;
	}

	public Unidade getUnidade() {
		return unidade;
	}

	public void setUnidade(Unidade unidade) {
		this.unidade = unidade;
	}

}
