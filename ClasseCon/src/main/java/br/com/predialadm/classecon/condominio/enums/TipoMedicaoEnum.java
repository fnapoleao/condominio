/**
 * 
 */
package br.com.predialadm.classecon.condominio.enums;

/**
 * Classe que representa os tipos de medição de consumo. 	
 * @author Idelvane 25/02/2011
 *
 */
public enum TipoMedicaoEnum {
	
	LEITURA_MEDIDOR ("Leitura de Medidor"),
	CONSUMO_POR_UNIDADE ("Consumo por Unidade"),
	VALOR_REAIS ("Valor em Reais");
	
	private String tipo;
	
	private TipoMedicaoEnum(String tipo){
		this.tipo = tipo;
	}

	public String getTipo() {
		return tipo;
	}
}
