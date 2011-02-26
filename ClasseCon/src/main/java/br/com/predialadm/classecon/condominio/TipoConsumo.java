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
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import br.com.predialadm.classecon.condominio.enums.TipoMedicaoEnum;

/**
 * Classe quer representa um tipo de consumo no sistema ClasseCon.
 * 
 * @author Idelvane 25/02/2011
 * 
 */
@Entity
public class TipoConsumo implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private String unidadeMedida;
	
	private boolean consumoUnidade;
	
	@Column (precision = 19, scale = 2)
	private BigDecimal valorUnitario;
	
	@Enumerated (EnumType.ORDINAL)
	private TipoMedicaoEnum tipoMedicao;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUnidadeMedida() {
		return unidadeMedida;
	}

	public void setUnidadeMedida(String unidadeMedida) {
		this.unidadeMedida = unidadeMedida;
	}

	public boolean isConsumoUnidade() {
		return consumoUnidade;
	}

	public void setConsumoUnidade(boolean consumoUnidade) {
		this.consumoUnidade = consumoUnidade;
	}

	public BigDecimal getValorUnitario() {
		return valorUnitario;
	}

	public void setValorUnitario(BigDecimal valorUnitario) {
		this.valorUnitario = valorUnitario;
	}

	public TipoMedicaoEnum getTipoMedicao() {
		return tipoMedicao;
	}

	public void setTipoMedicao(TipoMedicaoEnum tipoMedicao) {
		this.tipoMedicao = tipoMedicao;
	}

}
