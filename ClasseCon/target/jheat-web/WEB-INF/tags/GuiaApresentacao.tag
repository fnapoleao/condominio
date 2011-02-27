<%@ taglib uri="/tags/ajax" prefix="ajax"%>
<%@ taglib uri="jheat-tags" prefix="jheat"%>
<%@ taglib uri="/tags/displayTags" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="infoway"%>

<%@ attribute name="guiaApresentacao" required="true"
	type="br.com.infowaypi.ecarebc.atendimentos.GuiaSimples"%>

<br />
<div class="not-for-print">
<fieldset name="sessionParam" class=""><legend>Informa&ccedil;&otilde;es da Guia</legend>
<table class="yellowTable">

	<c:if test="${guiaApresentacao.autorizacao != null}">
		<tr class="even">
			<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
			<span>Autoriza&ccedil;&atilde;o: </span></td>
			<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.autorizacao}</span>
			</td>
		</tr>
	</c:if>
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Tipo: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.tipo}</span>
		</td>
	</tr>
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Dt. de Atendimento: </span></td>
		<td style="text-align:left;"><span class="valuesColumn"><fmt:formatDate
			value="${guiaApresentacao.dataAtendimento}" pattern="dd/MM/yyyy" /></span>
		</td>
	</tr>
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Situa&ccedil;&atilde;o Atual: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.situacao.descricao}</span></td>
	</tr>
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Data da Situa&ccedil;&atilde;o: </span></td>
		<td style="text-align:left;"><span class="valuesColumn"><fmt:formatDate
			value="${guiaApresentacao.situacao.dataSituacao}"
			pattern="dd/MM/yyyy" /></span></td>
	</tr>
	<%--tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>P. Solicitante: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.solicitante.pessoaFisica.nome}</span></td>
	</tr--%>
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Especialidade: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.especialidade.descricao}</span></td>
	</tr>



	<%--c:if test="${guiaApresentacao.completa}">	
	
		<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Prazo Prorrogado: </span></td>
				<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.prazoProrrogado}</span></td>
		</tr>
		<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Prazo Autorizado: </span></td>
				<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.prazoAutorizado}</span></td>
		</tr>
		
		<tr class="even">
			<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>
					Valor de Materiais M&eacute;dicos em Apartamento: 
				</span>
			</td>
			<td style="text-align:left;">
				<span class="valuesColumn">
					<fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorMateriaisApartamento}" pattern="R$ ###,##0.00" />
				</span>
			</td>
		</tr>
		
		<tr class="even">
			<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>
					Valor de Materiais M&eacute;dicos em UTI: 
				</span>
			</td>
			<td style="text-align:left;">
				<span class="valuesColumn">
					<fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorMateriaisUti}" pattern="R$ ###,##0.00" />
				</span>
			</td>
		</tr>
		
		<tr class="even">
			<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>
					Valor de Materiais M&eacute;dicos em Bloco Cir&uacute;rgico: 
				</span>
			</td>
			<td style="text-align:left;">
				<span class="valuesColumn">
					<fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorMateriaisCirurgicos}" pattern="R$ ###,##0.00" />
				</span>
			</td>
		</tr>
		
		<tr class="even">
			<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>
					Valor de Medicamentos em Apartamento:
				</span>
			</td>
			<td style="text-align:left;">
				<span class="valuesColumn">
					<fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorMedicamentosApartamento}" pattern="R$ ###,##0.00" />
				</span>
			</td>
		</tr>
		
		<tr class="even">
			<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>
					Valor de Medicamentos em UTI: 
				</span>
			</td>
			<td style="text-align:left;">
				<span class="valuesColumn">
					<fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorMedicamentosUti}" pattern="R$ ###,##0.00" />
				</span>
			</td>
		</tr>
		
		<tr class="even">
			<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>
					Valor de Medicamentos em Bloco Cir&uacute;rgico: 
				</span>
			</td>
			<td style="text-align:left;">
				<span class="valuesColumn">
					<fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorMedicamentosCirurgicos}" pattern="R$ ###,##0.00" />
				</span>
			</td>
		</tr>
		
		<tr class="even">
			<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>
					Valor Total de Solu&ccedil;&otilde;es Parenterais: 
				</span>
			</td>
			<td style="text-align:left;">
				<span class="valuesColumn">
					<fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorSolucoesParenterais}" pattern="R$ ###,##0.00" />
				</span>
			</td>
		</tr>
		
	</c:if --%>

	<infoway:tableSeparator titulo="Hist&oacute;rico da Guia" colspan="2" />
	<tr>
		<td colspan="2"><display:table id="item"
			name="${guiaApresentacao.situacoes}" export="false"
			class="yellowTable">

			<display:column title="Data" sortable="false">
				<fmt:formatDate value="${item.dataSituacao}"
					pattern="dd/MM/yyyy HH:mm" />
			</display:column>
			<display:column property="descricao" decorator=""
				title="Situa&ccedil;&atilde;o" sortable="false" />
			<display:setProperty name="basic.empty.showtable" value="true" />
			<display:column property="motivo" decorator=""
				title="Descri&ccedil;&atilde;o" sortable="false" />
			<display:column property="usuario.login" decorator=""
				title="Usu&aacute;rio" sortable="false" />
			<display:setProperty name="basic.empty.showtable" value="true" />

		</display:table></td>
	</tr>


	<infoway:tableSeparator titulo="Informa&ccedil;&otilde;es do Benefici&aacute;rio"
		colspan="2" />
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Tipo: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.segurado.tipoDeSegurado}</span></td>
	</tr>
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>N&uacute;mero do cart&atilde;o: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.segurado.numeroCartaoAtual}</span></td>
	</tr>
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Nome: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.segurado.pessoaFisica.nome}</span></td>
	</tr>
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Sexo: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.segurado.pessoaFisica.descricaoDoSexo}</span></td>
	</tr>
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Nascimento: </span></td>
		<td style="text-align:left;"><span class="valuesColumn"><fmt:formatDate
			value="${guiaApresentacao.segurado.pessoaFisica.dataNascimento}"
			pattern="dd/MM/yyyy" /></span></td>
	</tr>
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Telefone: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.segurado.pessoaFisica.telefoneResidencial}</span></td>
	</tr>
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Endere&ccedil;o: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.segurado.pessoaFisica.endereco}</span></td>
	</tr>
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Munic&iacute;pio: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.segurado.pessoaFisica.endereco.municipio}</span></td>
	</tr>


	<infoway:tableSeparator titulo="Informa&ccedil;&otilde;es do Prestador"
		colspan="2" />
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Prestador: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.prestador.pessoaJuridica.fantasia}</span></td>
	</tr>
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Profissional: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.profissional.pessoaFisica.nome}</span></td>
	</tr>
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Telefone: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.prestador.pessoaJuridica.telefone}</span></td>
	</tr>
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Endere&ccedil;o: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.prestador.pessoaJuridica.endereco}</span></td>
	</tr>
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Munic&iacute;pio: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.prestador.pessoaJuridica.endereco.municipio}</span></td>
	</tr>


	<c:if
		test="${((guiaApresentacao.consulta) || (guiaApresentacao.exame)) && !(guiaApresentacao.exameOdonto)}">
		<infoway:tableSeparator titulo="Procedimentos" colspan="2" />
		<tr>
			<td colspan="2"><display:table id="item"
				name="${guiaApresentacao.procedimentos}" export="false"
				class="yellowTable">
				<display:column property="procedimentoDaTabelaCBHPM.codigo"
					decorator="" title="C&oacute;digo" sortable="false" />
				<display:column property="procedimentoDaTabelaCBHPM.descricao"
					decorator="" title="Descri&ccedil;&atilde;o" sortable="false" />
				<display:column headerClass="sortable" title="Bilateral">${item.bilateral eq true ? 'Sim' : 'N&atilde;o'}</display:column>
				<display:column property="quantidade" title="Quant." sortable="false" />
				<display:column property="valorAtualDoProcedimento"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="V. Unit&aacute;rio" sortable="false" />
				<display:column property="valorTotal"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="V. Total" sortable="false" />
				<display:column property="valorCoParticipacao"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="Valor Co-part." sortable="false" />
				<display:column property="situacao.descricao"
					title="Situa&ccedil;&atilde;o" sortable="false" />
				<display:setProperty name="basic.empty.showtable" value="true" />
			</display:table></td>
		</tr>
	</c:if>
	
	<c:if test="${guiaApresentacao.exame}">
			<infoway:tableSeparator titulo="Valores Complementares Solicitados:" colspan="2" />
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Materiais</span></td>
				<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.valorMaterialComplementarSolicitado}</span>
				</td>
			</tr>
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Medicamentos</span></td>
				<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.valorMedicamentoComplementarSolicitado}</span>
				</td>
			</tr>
			<infoway:tableSeparator titulo="Valores Complementares Auditados:" colspan="2" />
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Materiais</span></td>
				<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.valorMaterialComplementarAuditado}</span>
				</td>
			</tr>
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Medicamentos</span></td>
				<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.valorMedicamentoComplementarAuditado}</span>
				</td>
			</tr>
	</c:if>

	<c:if test="${(guiaApresentacao.exameOdonto)}">
		<infoway:tableSeparator titulo="Procedimentos Solicitados" colspan="2" />
		<tr>
			<td colspan="2"><display:table id="item"
				name="${guiaApresentacao.procedimentos}" export="false"
				class="yellowTable">
				<display:column property="procedimentoDaTabelaCBHPM.codigo"
					decorator="" title="C&oacute;digo" sortable="false" />
				<display:column property="procedimentoDaTabelaCBHPM.descricao"
					decorator="" title="Descri&ccedil;&atilde;o" sortable="false" />
				 
				<display:column property="arcada.descricaoFormatada" decorator=""
					title="Arcada" sortable="false" />
				<display:column property="quadrante.descricaoFormatada" decorator=""
					title="Quadrante" sortable="false" />
				<display:column property="dente.descricaoFormatada" decorator=""
					title="Dente" sortable="false" />
				<display:column property="face.descricaoFormatada" decorator=""
					title="Face" sortable="false" />
				<display:column property="valorTotal"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="Valor Bruto" sortable="false" />
				<display:column property="valorCoParticipacao"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="Co-part." sortable="false" />
				<display:setProperty name="basic.empty.showtable" value="true" />
			</display:table></td>
		</tr>
		<c:if
			test="${fn:length (guiaApresentacao.procedimentosRealizados) > 0}">
			<infoway:tableSeparator titulo="Procedimentos Realizados" colspan="2" />
			<tr>
				<td colspan="2"><display:table id="item"
					name="${guiaApresentacao.procedimentosRealizados}" export="false"
					class="yellowTable">
					<display:column property="procedimentoDaTabelaCBHPM.codigo"
						decorator="" title="C&oacute;digo" sortable="false" />
					<display:column property="procedimentoDaTabelaCBHPM.descricao"
						decorator="" title="Descri&ccedil;&atilde;o" sortable="false" />
					<display:column property="denticao.descricaoFormatada" decorator=""
						title="Denti&ccedil;&atilde;o" sortable="false" />
					<display:column property="arcada.descricaoFormatada" decorator=""
						title="Arcada" sortable="false" />
					<display:column property="quadrante.descricaoFormatada"
						decorator="" title="Quadrante" sortable="false" />
					<display:column property="dente.descricaoFormatada" decorator=""
						title="Dente" sortable="false" />
					<display:column property="face.descricaoFormatada" decorator=""
						title="Face" sortable="false" />
					<display:column property="valorTotal"
						decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
						title="Valor Bruto" sortable="false" />
					<display:column property="valorCoParticipacao"
						decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
						title="Co-participa&ccedil;&atilde;o" sortable="false" />
					<display:setProperty name="basic.empty.showtable" value="true" />
				</display:table></td>
			</tr>
		</c:if>
	</c:if>

	<c:if test="${guiaApresentacao.completa}">

		<c:if test="${guiaApresentacao.internacao}">
			<infoway:tableSeparator titulo="Perman&ecirc;ncia (Horas)"
				colspan="2" />
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Solicitada: </span></td>
				<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.prazoProrrogado}</span></td>
			</tr>

			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Autorizada: </span></td>
				<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.prazoAutorizado}</span></td>
			</tr>
		</c:if>

		<c:if test="${(guiaApresentacao.consultaUrgencia) || (guiaApresentacao.atendimentoUrgencia)}">
			<infoway:tableSeparator titulo="Perman&ecirc;ncia(h)" colspan="2" />
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Solicitada: </span></td>
				<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.prazoProrrogado}</span></td>
			</tr>
			<%-- infoway:tableSeparator titulo="Motivo Prorroga&ccedil;&atilde;o"
				colspan="2" />
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Descri&ccedil;&atilde;o: </span></td>
				<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.motivoProrrogacaoInternacao}</span></td>
			</tr --%>
		</c:if>

		<infoway:tableSeparator titulo="CID Registrados" colspan="2" />
		<tr>
			<td colspan="2"><display:table id="itemCids"
				name="${guiaApresentacao.cids}" export="false" class="yellowTable">
				<display:column property="codigo" decorator="" title="C&oacute;digo"
					sortable="false" />
				<display:column property="descricaoDaDoenca" decorator=""
					title="Descri&ccedil;&atilde;o" sortable="false" />
				<display:setProperty name="basic.empty.showtable" value="true" />
			</display:table></td>
		</tr>

		<%--infoway:tableSeparator titulo="Items Farmac&ecirc;uticos Solicitados" colspan="2" />
		<tr>
			<td colspan="2">
			  <display:table id="itemFarmaceuticos"
				name="${guiaApresentacao.itensFarmaceuticos}" export="false"
				class="yellowTable" >
				<display:column property="quantidade"
					decorator="" title="Quantidade" sortable="false" />
				<display:column property="apresentacao.descricao"
					decorator="" title="Apresenta&ccedil;&atilde;o" sortable="false" />
				<display:column property="tabelaBrasindice.itemBrasindice.nome"
					decorator="" title="Nome" sortable="false" />	
				<display:column property="valorPago"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper" 
					title="Valor Pago"sortable="false" />
				<display:setProperty name="basic.empty.showtable" value="true" />		
			  </display:table>
			</td>
		</tr--%>
			
		<%-- c:if test="${(guiaApresentacao.consultaUrgencia) || (guiaApresentacao.atendimentoUrgencia) || (guiaApresentacao.internacao)}">
			<infoway:tableSeparator titulo="Guias Externas" colspan="2" />
			<tr>
				<td colspan="2">
				  <display:table id="guiaExterna"
					name="${guiaApresentacao.guiasExameExterno}" export="false"
					class="yellowTable" decorator="br.com.infowaypi.jheat.webcontent.utils.AjaxBasicWrapper">
					<display:column style="text-align: center" decorator="" title="Autoriza&ccedil;&atilde;o"
						sortable="false">
						<a
							href="javascript:JHeat.ajaxReadDetails('${guiaExterna.class.simpleName}',${guiaExterna.idGuia},'/JHeatAction.do?action=ajaxDetails&className=${guiaExterna.class.name}&id=${guiaExterna.idGuia}');">${guiaExterna.autorizacao}</a>
					</display:column>
					<display:column property="segurado.pessoaFisica.nome"
						decorator="" title="Segurado" sortable="false" />
					<display:column property="prestador.pessoaJuridica.fantasia"
						decorator="" title="Prestador" sortable="false" />	
					<display:column property="situacao.descricao"
						decorator="" title="Situa&ccedil;&atilde;o" sortable="false" />
					<display:column property="tipo"
						decorator="" title="Tipo" sortable="false" />
					<display:column property="valorTotal"
						decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper" 
						title="Valor Total"sortable="false" />
					<display:setProperty name="basic.empty.showtable" value="true" />		
				  </display:table>
				</td>
			</tr>	
		</c:if--%>
			
		<infoway:tableSeparator titulo="Consulta/Exames" colspan="2" />
		<tr>
			<td colspan="2"><display:table id="itemProcedimentosSimples"
				name="${guiaApresentacao.procedimentosSimples}" export="false"
				class="yellowTable">
				<display:column property="procedimentoDaTabelaCBHPM.codigo"
					decorator="" title="C&oacute;digo" sortable="false" />
				<display:column property="procedimentoDaTabelaCBHPM.descricao"
					decorator="" title="Descri&ccedil;&atilde;o" sortable="false" />
				<display:column headerClass="sortable" title="Bilateral">${bilateral eq true ? 'Sim' : 'N&atilde;o'}</display:column>
				<display:column property="quantidade" title="Quant." sortable="false" />
				<display:column property="valorAtualDoProcedimento"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="V. Unit&aacute;rio" sortable="false" />
				<display:column property="valorTotal"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="V. Total" sortable="false" />
				<%--display:column property="valorCoParticipacao"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="Valor Co-part." sortable="false" /--%>
				<display:column property="situacao.descricao"
					title="Situa&ccedil;&atilde;o" sortable="false" />
				<display:setProperty name="basic.empty.showtable" value="true" />
			</display:table></td>
		</tr>

		<%--infoway:tableSeparator
			titulo="Procedimentos Cl&iacute;nicos/Cir&uacute;rgicos" colspan="2" />
		<tr>
			<td colspan="2"><display:table id="itemProcedimentosCirurgicos"
				name="${guiaApresentacao.procedimentosCirurgicos}" export="false"
				class="yellowTable">
				<display:column property="procedimentoDaTabelaCBHPM.codigo"
					decorator="" title="C&oacute;digo" sortable="false" />
				<display:column property="procedimentoDaTabelaCBHPM.descricao"
					decorator="" title="Descri&ccedil;&atilde;o" sortable="false" />
				<display:column property="profissionalResponsavel.pessoaFisica.nome"
					decorator="" title="Profissional Respons&aacute;vel"
					sortable="false" />
				<display:column property="profissionalAuxiliar1.pessoaFisica.nome"
					decorator="" title="1&#176 Auxiliar" sortable="false" />
				<display:column property="profissionalAuxiliar2.pessoaFisica.nome"
					decorator="" title="2&#176 Auxiliar" sortable="false" />
				<display:column property="profissionalAuxiliar3.pessoaFisica.nome"
					decorator="" title="3&#176 Auxiliar" sortable="false" />
				<display:column property="anestesista.pessoaFisica.nome"
					decorator="" title="Anastesista" sortable="false" />
				<display:column property="valorTotal"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="Valor Total" sortable="false" />
				<display:column
					property="situacao.descricao"
					decorator="" title="Situa&ccedil;&atilde;o" sortable="false" />
				<display:setProperty name="basic.empty.showtable" value="true" />
			</display:table></td>
		</tr --%>
		
		<%--infoway:tableSeparator
			titulo="Outros Procedimentos" colspan="2" />
		<tr>
			<td colspan="2"><display:table id="itemOutrosProcedimentos"
				name="${guiaApresentacao.procedimentosOutros}" export="false"
				class="yellowTable">
				<display:column property="procedimentoDaTabelaCBHPM.codigo"
					decorator="" title="C&oacute;digo" sortable="false" />
				<display:column property="procedimentoDaTabelaCBHPM.descricao"
					decorator="" title="Descri&ccedil;&atilde;o" sortable="false" />
				<display:column
					property="situacao.descricao"
					decorator="" title="Situa&ccedil;&atilde;o" sortable="false" />
				<display:column property="profissionalResponsavel.pessoaFisica.nome"
					decorator="" title="Profissional"
					sortable="false" />
					<display:column property="procedimentoDaTabelaCBHPM.valorModerado"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="Valor Unit&aacute;rio" sortable="false" />
				<display:column property="quantidade"
					decorator="" title="Quantidade"
					sortable="false" />
				<display:column property="valorTotal"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="Valor Total" sortable="false" />
				<display:setProperty name="basic.empty.showtable" value="true" />
			</display:table></td>
		</tr--%>
		
		<%-- ################ VALORES MAT/MED ############### --%>
		
		<%--c:if test="${guiaApresentacao.situacao.descricao ne 'Auditado(a)'}">
			<infoway:tableSeparator titulo="Materiais e Medicamentos Solicitados" colspan="2" />
			<infoway:tableSeparator titulo="Valores de Materiais em:" colspan="2" />
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Apartamento</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalMateriaisMedicosApartamento}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>UTI</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalMateriaisMedicosUTI}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Bloco Cir&uacute;rgico</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalMateriaisMedicosBlocoCirurgico}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Pronto Socorro</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalMateriaisProntoSocorro}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			
			<infoway:tableSeparator titulo="Valores de Medicamentos em:" colspan="2" />
			
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Apartamento</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalMedicamentosApartamento}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>UTI</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalMedicamentosUTI}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Bloco Cir&uacute;rgico</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalMedicamentosBlocoCirurgico}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Pronto Socorro</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalMedicamentosProntoSocorro}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			
			<infoway:tableSeparator titulo="Valores de Materiais e Medicamentos Especiais:" colspan="2" />
			
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Solu&ccedil;&otilde;es Parenterais</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalSolucoesParenterais}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>OPMES</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalOPMES}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
		</c:if --%>
		
		<%--c:if test="${guiaApresentacao.situacao.descricao eq 'Auditado(a)'}">
			<infoway:tableSeparator titulo="Materiais e Medicamentos Auditados" colspan="2" />
			<infoway:tableSeparator titulo="Valores de Materiais em:" colspan="2" />
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Apartamento</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalMateriaisMedicosApartamentoAuditado}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>UTI</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalMateriaisMedicosUTIAuditado}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Bloco Cir&uacute;rgico</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalMateriaisMedicosBlocoCirurgicoAuditado}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Pronto Socorro</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalMateriaisProntoSocorroAuditado}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			
			<infoway:tableSeparator titulo="Valores de Medicamentos em:" colspan="2" />
			
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Apartamento</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalMedicamentosApartamentoAuditado}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>UTI</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalMedicamentosUTIAuditado}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Bloco Cir&uacute;rgico</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalMedicamentosBlocoCirurgicoAuditado}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Pronto Socorro</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalMedicamentosProntoSocorroAuditado}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			
			<infoway:tableSeparator titulo="Valores de Materiais e Medicamentos Especiais:" colspan="2" />
			
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>Solu&ccedil;&otilde;es Parenterais</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalSolucoesParenteraisAuditado}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
			<tr class="even">
				<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
				<span>OPMES</span></td>
				<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber value="${guiaApresentacao.valoresMatMed.valorTotalOPMESAuditado}" pattern="R$ ###,##0.00" /></span>
				</td>
			</tr>
		</c:if --%>
	
	<%-- ################## FIM DE VALORES MAT/MED ################### --%>	

		<%--infoway:tableSeparator titulo="Observa&ccedil;&otilde;es do Auditor"
			colspan="2" />
		<tr>
			<td colspan="2"><display:table id="itemObservacoes"
				name="${guiaApresentacao.observacoes}" export="false"
				class="yellowTable">
				<display:column property="texto" decorator=""
					title="Observa&ccedil;&atilde;o" sortable="false" />
				<display:setProperty name="basic.empty.showtable" value="true" />
			</display:table></td>
		</tr--%>

		<%--infoway:tableSeparator titulo="Quadro Cl&iacute;nico" colspan="2" />
		<tr>
			<td colspan="2"><display:table id="quadroClinico"
				name="${guiaApresentacao.quadrosClinicos}" export="false"
				class="yellowTable">
				<display:column title="Data" sortable="false">
					<fmt:formatDate value="${dataJustificativa}" pattern="dd/MM/yyyy" />
				</display:column>
				<display:column property="justificativa" decorator=""
					title="Descri&ccedil;&atilde;o" sortable="false" />
				<display:setProperty name="basic.empty.showtable" value="true" />
			</display:table></td>
		</tr-->

		<%--infoway:tableSeparator titulo="Pacotes" colspan="2" />
		<tr>
			<td colspan="2"><display:table id="itemPacotes"
				name="${guiaApresentacao.itensPacote}" export="false"
				class="yellowTable">
				<display:column property="pacote.descricao" decorator=""
					title="Descri&ccedil;&atilde;o" sortable="false" />
				<--display:column property="profissionalResponsavel.pessoaFisica.nome"
					decorator="" title="Profissional Respons&aacute;vel"
					sortable="false" />
				<display:column property="profissionalAuxiliar1.pessoaFisica.nome"
					decorator="" title="1&#176 Auxiliar" sortable="false" />
				<display:column property="profissionalAuxiliar2.pessoaFisica.nome"
					decorator="" title="2&#176 Auxiliar" sortable="false" />
				<display:column property="profissionalAuxiliar3.pessoaFisica.nome"
					decorator="" title="3&#176 Auxiliar" sortable="false" />
				<display:column property="anestesista.pessoaFisica.nome"
					decorator="" title="Anestesista" sortable="false" /-->
				<display:column property="valor.valor"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="Valor" sortable="false" />
				<display:column property="situacao.descricao"
					decorator="" title="Situa&ccedil;&atilde;o" sortable="false" />
				<display:setProperty name="basic.empty.showtable" value="true" />
			</display:table></td>
		</tr--%>

		<%--infoway:tableSeparator titulo="Di&aacute;rias" colspan="2" />
		<tr>
			<td colspan="2"><display:table id="itemDiarias"
				name="${guiaApresentacao.itensDiaria}" export="false"
				class="yellowTable">
				<display:column property="diaria.descricao" decorator=""
					title="Acomoda&ccedil;&atilde;o" sortable="false" />	
				<display:column property="horas" decorator="" title="Quantidade (h)"
					sortable="false" />
				<display:column property="valorTotal"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="Valor Total" sortable="false" />	
				<display:column property="situacao.descricao" decorator=""
					title="Situa&ccedil;&atilde;o" sortable="false" />
				<display:setProperty name="basic.empty.showtable" value="true" />
			</display:table></td>
		</tr--%>

		<%--infoway:tableSeparator titulo="Gasoterapias" colspan="2" />
		<tr>
			<td colspan="2"><display:table id="itemGasoterapias"
				name="${guiaApresentacao.itensGasoterapia}" export="false"
				class="yellowTable">
				<display:column property="gasoterapia.descricao" decorator=""
					title="Descri&ccedil;&atilde;o" sortable="false" />
				<display:column property="valor.valor"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="Valor Unit&aacute;rio (h)" sortable="false" />
				<display:column property="valor.quantidade" decorator=""
					title="Quantidade" sortable="false" />
				<display:column property="valorTotal"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="Valor Total" sortable="false" />	
				<display:setProperty name="basic.empty.showtable" value="true" />
			</display:table></td>
		</tr--%>

		<%--infoway:tableSeparator titulo="Taxas" colspan="2" />
		<tr>
			<td colspan="2"><display:table id="itemTaxas"
				name="${guiaApresentacao.itensTaxa}" export="false"
				class="yellowTable">
				<display:column property="taxa.descricao" decorator=""
					title="Descri&ccedil;&atilde;o" sortable="false" />
				<display:column property="valor.valor"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="Valor" sortable="false" />
				<display:column property="valor.quantidade" decorator=""
					title="Quantidade" sortable="false" />
				<display:column property="valorTotal"
					decorator="br.com.infowaypi.jheat.webcontent.utils.MoneyWrapper"
					title="Valor Total" sortable="false" />	
				<display:setProperty name="basic.empty.showtable" value="true" />
			</display:table></td>
		</tr--%>
	</c:if>

	<infoway:tableSeparator titulo="Valores" colspan="2" />
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Valor Total da Guia: </span></td>
		<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber
			value="${guiaApresentacao.valorTotal}" pattern="R$ ###,##0.00" /></span></td>
	</tr>
	<%--tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Valor Total de Co-participa&ccedil;&atilde;o: </span></td>
		<td style="text-align:left;"><span class="valuesColumn"><fmt:formatNumber
			value="${guiaApresentacao.valorCoParticipacao}"
			pattern="R$ ###,##0.00" /></span></td>
	</tr--%>

	<infoway:tableSeparator titulo="Autentica&ccedil;&atilde;o" colspan="2" />
	<tr class="even">
		<td style="color: rgb(153, 51, 0); text-align: right;" width="100">
		<span>Autentica&ccedil;&atilde;o: </span></td>
		<td style="text-align:left;"><span class="valuesColumn">${guiaApresentacao.numeroAutenticacao}</span></td>
	</tr>

</table>
</fieldset>
</div>
<br />
