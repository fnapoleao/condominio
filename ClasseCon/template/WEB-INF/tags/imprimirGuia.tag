<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="infoway" %>

<%@ attribute name="titulo" required="true" %>
<div class="only-for-print" style="font-family: Courier;">
	<pre>
	<c:if test="${!empty titulo}"> 
	<center><b>UNIPLAM</b></center>
	
	<center><b>- ${titulo} -</b></center>

	-- <b>INFORMA&Ccedil;&Otilde;ES DA GUIA</b> -------------------------------------------------
	Autoriza&ccedil;&atilde;o:    <infoway:abbreviate text="${guia.autorizacao}" size="29" align="left"/> Atendimento: <fmt:formatDate var="dataAtendimento" value="${guia.dataAtendimento}" pattern="dd/MM/yyyy" scope="request"/><infoway:abbreviate text="${dataAtendimento}" size="10" align="left"/>
	Tipo:           <infoway:abbreviate text="${guia.tipo}" size="64" align="left"/>
	Situa&ccedil;&atilde;o Atual: <infoway:abbreviate text="${guia.situacao.descricao}" size="24" align="left"/> Data da Situa&ccedil;&atilde;o: <fmt:formatDate var="dataSituacao" value="${guia.situacao.dataSituacao}" pattern="dd/MM/yyyy" scope="request"/><infoway:abbreviate text="${dataSituacao}" size="10" align="left"/>
	Especialidade:  <infoway:abbreviate text="${guia.especialidade.descricao}" size="64" align="left"/>

	-- <b>INFORMA&Ccedil;&Otilde;ES DO SEGURADO</b> ---------------------------------------------
	N&uacute;mero do Cart&atilde;o: <infoway:abbreviate text="${guia.segurado.numeroDoCartao}" size="41" align="left"/><%--Empresa: <infoway:abbreviate text="${guia.segurado.grupo.descricao}" size="23" align="left"/>--%>
	Nome: <infoway:abbreviate text="${guia.segurado.pessoaFisica.nome}" size="50" align="left"/>Tel: <infoway:abbreviate text="${guia.segurado.pessoaFisica.telefoneResidencial}" size="23" align="left"/>
	Sexo: <infoway:abbreviate text="${guia.segurado.pessoaFisica.descricaoDoSexo}" size="42" align="left"/> Nascimento: <fmt:formatDate var="dataNascimento" value="${guia.segurado.pessoaFisica.dataNascimento}" pattern="dd/MM/yyyy" scope="request"/><infoway:abbreviate text="${dataNascimento}" size="23" align="left"/>
	Endere&ccedil;o: <infoway:abbreviate text="${endereco}" size="40" align="left"/>Municipio: <infoway:abbreviate text="${guia.segurado.pessoaFisica.endereco.municipio.descricao}" size="23" align="left"/>

	-- <b>INFORMA&Ccedil;&Otilde;ES DO PRESTADOR</b> --------------------------------------------
	Prestador: <infoway:abbreviate text="${guia.prestador.pessoaJuridica.fantasia}" size="45" align="left"/>Tel:  <infoway:abbreviate text="${guia.prestador.pessoaJuridica.telefone}" size="22" align="left"/>
	Endere&ccedil;o: <infoway:abbreviate text="${guia.prestador.pessoaJuridica.endereco.descricaoCompleta}" size="40" align="left"/>Municipio: <infoway:abbreviate text="${guia.prestador.pessoaJuridica.endereco.municipio.descricao}" size="22" align="left"/><c:if test="${guia.exame || guia.internacao}">
	Solicitante: <infoway:abbreviate text="${guia.solicitante.pessoaFisica.nome}" size="64" align="left"/></c:if><c:if test="${guia.consulta || guia.consultaUrgencia || guia.atendimentoUrgencia}">
	Profissional: <infoway:abbreviate text="${guia.profissional.pessoaFisica.nome}" size="64" align="left"/></c:if>
	<c:if test="${guia.simples}">
	<c:if test="${guia.exameOdonto}">
	-- <b>PROCEDIMENTOS SOLICITADOS:</b> -------------------------------------------------
    	+--------+------------------------+---+---+---+----+----+--------+------------+
    	| C&Oacute;DIGO | DESCRI&Ccedil;&Atilde;O              | D | A | Q | d  | F  |  DATA  | ASSINATURA |
    	+--------+------------------------+---+---+---+----+----+--------+------------+
    	<c:forEach var="procedimento" items="${guia.procedimentos}"><br/>        |<infoway:abbreviate text="${procedimento.procedimentoDaTabelaCBHPM.codigo}" size="8" align="left"/>| <infoway:abbreviate text="${procedimento.procedimentoDaTabelaCBHPM.descricao}" size="22" align="left"/> | ${procedimento.denticao.descricaoFormatada} | ${procedimento.arcada.descricaoFormatada} | ${procedimento.quadrante.descricaoFormatada} | ${procedimento.dente.descricaoFormatada} | ${procedimento.face.descricaoFormatada} |<c:choose><c:when test="${procedimento.situacao.descricao eq 'Ativo(a)'}"><fmt:formatDate  var="dataProcedimento" value="${procedimento.situacao.dataSituacao}" pattern="dd/MM/yy" scope="request"/>${dataProcedimento}</c:when><c:otherwise>__/__/__</c:otherwise></c:choose>|____________|</c:forEach>
    	+--------+------------------------+---+---+---+----+----+--------+------------+
    	|               	T O T A L                Valor Total(R$) |<infoway:abbreviate text="${guia.valorTotalFormatado}" size="12" align="right"/>|   
 	+-----------------------------------------------------------------------------+
	D - Denti&ccedil;&atilde;o | A - Arcada | Q - Quadrante | d - Dente | F - Face</c:if> <c:if test="${guia.exameOdonto ne true}">
	-- <b>PROCEDIMENTOS:</b> ------------------------------------------------------
	+----------+------------------+------+---------+----------+------------+
	|  C&Oacute;DIGO  | DESCRI&Ccedil;&Atilde;O        |Quant.|Bilateral|Valor(R$) |
	+----------+------------------+------+---------+----------+------------+<c:forEach var="procedimento" items="${guia.procedimentos}"><br/>        |<infoway:abbreviate text="${procedimento.procedimentoDaTabelaCBHPM.codigo}" size="9" align="left"/> | <infoway:abbreviate text="${procedimento.procedimentoDaTabelaCBHPM.descricao}" size="16" align="left"/> |<infoway:abbreviate text="${procedimento.quantidade}" size="6" align="right"/>|<infoway:abbreviate text="${procedimento.bilateral eq true ? 'Sim' : 'Nao'}" size="9" align="right"/>| <infoway:abbreviate text="${procedimento.valorTotalFormatado}" size="9" align="right"/>|</c:forEach>
	+----------+------------------+------+---------+----------+------------+
	</c:if></c:if><c:if test="${guia.completa}"><c:if test="${guia.internacao}"><c:if test="${fn:length (guia.cids) > 0}">
	-- <b>HIP&Oacute;TESES DIAGN&Oacute;STICAS (CID):</b>----------------------------------------
	+--------+-------------------------------------------------------------+
	| C&Oacute;DIGO | DESCRI&Ccedil;&Atilde;O                                                   |
	+--------+-------------------------------------------------------------+<c:forEach var="cid" items="${guia.cids}"><br/>        |<infoway:abbreviate text="${cid.codigo}" size="7" align="left"/> | <infoway:abbreviate text="${cid.descricaoDaDoenca}" size="59" align="left"/> |</c:forEach>
	+--------+-------------------------------------------------------------+ 
	</c:if><c:if test="${fn:length (guia.quadrosClinicos) > 0}">
	-- <b>QUADRO CL&Iacute;NICO:</b> -----------------------------------------------------
	+-----------+----------------------------------------------------------+
	| Data      | DESCRI&Ccedil;&Atilde;O                                                |
	+-----------+----------------------------------------------------------+<c:forEach var="quadroClinico" items="${guia.quadrosClinicos}"><br/>        |<fmt:formatDate value="${quadroClinico.dataJustificativa}" type="date" dateStyle="short" />   | <infoway:abbreviate text="${quadroClinico.justificativa}" size="56" align="left"/> | </c:forEach>
	+-----------+----------------------------------------------------------+ 
	</c:if></c:if><c:if test="${fn:length (guia.procedimentosSimples) > 0}">
	-- <b>PROCEDIMENTOS/EXAMES:</b> -----------------------------------------------
	+----------+-------------------------------+------+---------+----------+
	|  C&Oacute;DIGO  | DESCRI&Ccedil;&Atilde;O                     |Quant.|Bilateral|Valor(R$) |
	+----------+-------------------------------+------+---------+----------+<c:forEach var="procedimento" items="${guia.procedimentosSimples}"><br/>        |<infoway:abbreviate text="${procedimento.procedimentoDaTabelaCBHPM.codigo}" size="9" align="left"/> | <infoway:abbreviate text="${procedimento.procedimentoDaTabelaCBHPM.descricao}" size="29" align="left"/> |<infoway:abbreviate text="${procedimento.quantidade}" size="5" align="right"/> |<infoway:abbreviate text="${procedimento.bilateral eq true ? 'Sim' : 'Nao'}" size="9" align="right"/>| <infoway:abbreviate text="${procedimento.valorTotalFormatado}" size="9" align="right"/>|</c:forEach>
	+----------+-------------------------------+------+---------+----------+
	</c:if><c:if test="${fn:length (guia.procedimentosCirurgicos) > 0}">
	-- <b>PROCEDIMENTOS CIR&Uacute;RGICOS:</b> -------------------------------------------
	+----------+-----------------------------------+----------+------------+
	|  C&Oacute;DIGO  | DESCRI&Ccedil;&Atilde;O                         |Valor(R$) |Co-part.(R$)|
	+----------+-----------------------------------+----------+------------+<c:forEach var="procedimento" items="${guia.procedimentosCirurgicos}"><br/>        |<infoway:abbreviate text="${procedimento.procedimentoDaTabelaCBHPM.codigo}" size="9" align="left"/> | <infoway:abbreviate text="${procedimento.procedimentoDaTabelaCBHPM.descricao}" size="33" align="left"/> | <infoway:abbreviate text="${procedimento.valorTotalFormatado}" size="9" align="right"/>|<infoway:abbreviate text="${procedimento.valorCoParticipacaoFormatado}" size="12" align="right"/>|</c:forEach>
	+----------+-----------------------------------+----------+------------+ 	</c:if><c:if test="${fn:length (guia.itensPacote) > 0}">
	-- <b>PACOTES:</b>-------------------------------------------------------------
	+---------------------------------------------------------+------------+
	| DESCRI&Ccedil;&Atilde;O                                               | Valor      |          
	+---------------------------------------------------------+------------+<c:forEach var="item" items="${guia.itensPacote}"><br/>        |<infoway:abbreviate text="${item.pacote.descricao}" size="56" align="left"/> | <infoway:abbreviate text="${item.pacote.valorTotal}" size="10" align="right"/> |</c:forEach>
	+---------------------------------------------------------+------------+
	 </c:if><c:if test="${fn:length (guia.itensDiaria) > 0}">
	-- <b>DI&Aacute;RIAS:</b>-------------------------------------------------------------
	+---------------------------------------------------------+------------+
	| DESCRI&Ccedil;&Atilde;O                                               | Valor      |          
	+---------------------------------------------------------+------------+<c:forEach var="item" items="${guia.itensDiaria}"><br/>        |<infoway:abbreviate text="${item.diaria.descricao}" size="56" align="left"/> | <infoway:abbreviate text="${item.diaria.valor}" size="10" align="right"/> |</c:forEach>
	+---------------------------------------------------------+------------+ 	</c:if><c:if test="${fn:length (guia.itensTaxa) > 0}">
	-- <b>TAXAS:</b>---------------------------------------------------------------
	+---------------------------------------------------------+------------+
	| DESCRI&Ccedil;&Atilde;O                                               | Valor      |          
	+---------------------------------------------------------+------------+<c:forEach var="item" items="${guia.itensTaxa}"><br/>        |<infoway:abbreviate text="${item.taxa.descricao}" size="56" align="left"/> | <infoway:abbreviate text="${item.taxa.valor}" size="10" align="right"/> |</c:forEach>
	+---------------------------------------------------------+------------+ </c:if>    <c:if test="${fn:length (guia.itensGasoterapia) > 0}">
	-- <b>GASOTERAPIAS:</b>--------------------------------------------------------
	+---------------------------------------------------------+------------+
	| DESCRI&Ccedil;&Atilde;O                                               | Valor      |          
	+---------------------------------------------------------+------------+<c:forEach var="item" items="${guia.itensGasoterapia}"><br/>        |<infoway:abbreviate text="${item.gasoterapia.descricao}" size="56" align="left"/> | <infoway:abbreviate text="${item.gasoterapia.valor}" size="10" align="right"/> |</c:forEach>
	+---------------------------------------------------------+------------+ </c:if>    </c:if>
    <%-- c:if test="${guia.completa}">
    <c:if test="${guia.situacao.descricao ne 'Auditado(a)'}"> 
    	-- <b>VALORES DE MATERIAIS</b>-------------------------------------------------
    	+---------------------------------------------------------+------------+
    	|  APARTEMENTO                                            | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMateriaisMedicosApartamento}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  UTI                                                    | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMateriaisMedicosUTI}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  BLOCO CIR&Uacute;RGICO                                        | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMateriaisMedicosBlocoCirurgico}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  PRONTO SOCORRO                                         | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMateriaisProntoSocorro}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
 		
        -- <b>VALORES DE MEDICAMENTOS</b>----------------------------------------------
    	+---------------------------------------------------------+------------+
    	|  APARTEMENTO                                            | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMedicamentosApartamento}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  UTI                                                    | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMedicamentosUTI}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  BLOCO CIR&Uacute;RGICO                                        | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMedicamentosBlocoCirurgico}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  PRONTO SOCORRO                                         | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMedicamentosProntoSocorro}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	
    	-- <b>VALORES MAT/MED ESPECIAIS</b>-------------------------------------------
    	+---------------------------------------------------------+------------+
    	|  SOLU&Ccedil;&Otilde;ES PARENTERAIS                                   | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalSolucoesParenterais}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  OPMES                                                  | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalOPMES}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
	</c:if><c:if test="${guia.situacao.descricao eq 'Auditado(a)'}"> 
    	-- <b>VALORES DE MATERIAIS</b>------------------------------------------------
    	+---------------------------------------------------------+------------+
    	|  APARTEMENTO                                            | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMateriaisMedicosApartamentoAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  UTI                                                    | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMateriaisMedicosUTIAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  BLOCO CIR&Uacute;RGICO                                        | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMateriaisMedicosBlocoCirurgicoAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  PRONTO SOCORRO                                         | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMateriaisProntoSocorroAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
 		
        -- <b>VALORES DE MEDICAMENTOS</b>----------------------------------------------
    	+---------------------------------------------------------+------------+
    	|  APARTEMENTO                                            | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMedicamentosApartamentoAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  UTI                                                    | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMedicamentosUTIAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  BLOCO CIR&Uacute;RGICO                                        | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMedicamentosBlocoCirurgicoAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  PRONTO SOCORRO                                         | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalMedicamentosProntoSocorroAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	
    	-- <b>VALORES MAT/MED ESPECIAIS</b>-------------------------------------------
    	+---------------------------------------------------------+------------+
    	|  SOLU&Ccedil;&Otilde;ES PARENTERAIS                                   | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalSolucoesParenteraisAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
    	|  OPMES                                                  | <infoway:abbreviate text="${guia.valoresMatMed.valorTotalOPMESAuditado}" size="11" align="right"/>|
    	+---------------------------------------------------------+------------+
	</c:if></c:if--%><c:if test="${guia.exameOdonto ne true}"> 
    	                                                            +----------+
	                                                            |Valor(R$) |
        +-----------------------------------------------------------+----------+
        |  V A L O R  T O T A L                                     | <infoway:abbreviate text="${guia.valorTotalFormatado}" size="9" align="right"/>|   
        +-----------------------------------------------------------+----------+
	</c:if>
                                          
	--------------------------------------   --------------------------------------
	       Assinatura do Paciente                  Assinatura do Prestador

	-------------------------------------------------------------------------------
	 Autentica&ccedil;&atilde;o: ${guia.numeroAutenticacao}
	<b><center>		 
	IMPORTANTE!!
	Caso o atendimento n&atilde;o seja realizado, EXIJA o cancelamento dessa guia!
	</center></b>
	 </c:if>
	</pre>
	</div>