/**
 * 
 */
package br.com.predialadm.classecon.condominio;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.apache.commons.lang.builder.EqualsBuilder;
import org.apache.commons.lang.builder.HashCodeBuilder;

/**
 * Classe que representa os dados contratuais de cada condominio.
 * 
 * @author Idelvane 27/02/2011
 * 
 */
@Embeddable
public class DadosContrato implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Column(precision = 19, scale = 2)
	private BigDecimal valorContrato;

	private String indexador;

	@Temporal(TemporalType.DATE)
	private Date dataPlanejamentoOrcamentario;

	@Temporal(TemporalType.DATE)
	private Date dataContrato;

	@Temporal(TemporalType.DATE)
	private Date dataVencimentoContrato;

	@Temporal(TemporalType.DATE)
	private Date dataConstrucao;

	private String construtora;
	/**
	 * Area total do condominio
	 */
	private double areaTotal;
	
	/**
	 * Área por unidade do condomínio
	 */
	private double areaPorUnidade;
	
	private int quantidadeUnidades;

	private boolean aguaIndividualizada;
	
	private boolean gasIndividualizado;

	public BigDecimal getValorContrato() {
		return valorContrato;
	}

	public void setValorContrato(BigDecimal valorContrato) {
		this.valorContrato = valorContrato;
	}

	public String getIndexador() {
		return indexador;
	}

	public void setIndexador(String indexador) {
		this.indexador = indexador;
	}

	public Date getDataPlanejamentoOrcamentario() {
		return dataPlanejamentoOrcamentario;
	}

	public void setDataPlanejamentoOrcamentario(Date dataPlanejamentoOrcamentario) {
		this.dataPlanejamentoOrcamentario = dataPlanejamentoOrcamentario;
	}

	public Date getDataContrato() {
		return dataContrato;
	}

	public void setDataContrato(Date dataContrato) {
		this.dataContrato = dataContrato;
	}

	public Date getDataVencimentoContrato() {
		return dataVencimentoContrato;
	}

	public void setDataVencimentoContrato(Date dataVencimentoContrato) {
		this.dataVencimentoContrato = dataVencimentoContrato;
	}

	public Date getDataConstrucao() {
		return dataConstrucao;
	}

	public void setDataConstrucao(Date dataConstrucao) {
		this.dataConstrucao = dataConstrucao;
	}

	public String getConstrutora() {
		return construtora;
	}

	public void setConstrutora(String construtora) {
		this.construtora = construtora;
	}

	public double getAreaTotal() {
		return areaTotal;
	}

	public void setAreaTotal(double areaTotal) {
		this.areaTotal = areaTotal;
	}

	public int getQuantidadeUnidades() {
		return quantidadeUnidades;
	}

	public void setQuantidadeUnidades(int quantidadeUnidades) {
		this.quantidadeUnidades = quantidadeUnidades;
	}

	public boolean isAguaIndividualizada() {
		return aguaIndividualizada;
	}

	public void setAguaIndividualizada(boolean aguaIndividualizada) {
		this.aguaIndividualizada = aguaIndividualizada;
	}

	public boolean isGasIndividualizado() {
		return gasIndividualizado;
	}

	public void setGasIndividualizado(boolean gasIndividualizado) {
		this.gasIndividualizado = gasIndividualizado;
	}

	public double getAreaPorUnidade() {
		return areaPorUnidade;
	}

	public void setAreaPorUnidade(double areaPorUnidade) {
		this.areaPorUnidade = areaPorUnidade;
	}
		
	@Override
	public boolean equals(Object object) {
		if (!(object instanceof DadosContrato)) {
			return false;
		}
		
		DadosContrato otherObject = (DadosContrato) object;
		return new EqualsBuilder()
			.append(this.getAreaPorUnidade(), otherObject.getAreaPorUnidade())
			.append(this.getDataConstrucao(), otherObject.getDataConstrucao())
			.append(this.getDataContrato(), otherObject.getDataContrato())
			.append(this.getConstrutora(), otherObject.getConstrutora())
			.append(this.getDataVencimentoContrato(), otherObject.getDataVencimentoContrato())
			.append(this.getAreaTotal(), otherObject.getAreaTotal())
			.isEquals();
	}
	
	@Override
	public int hashCode() {
		return new HashCodeBuilder()
			.append(this.getAreaPorUnidade())
			.append(this.getDataConstrucao())
			.append(this.getDataContrato())
			.append(this.getConstrutora())
			.append(this.getDataVencimentoContrato())
			.append(this.getAreaTotal())
			.toHashCode();
	}
}
