<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!-- Import da taglib -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Livros</title>
<c:url value="/resources/css/" var="cssPath"/>
<link href="${cssPath }bootstrap.min.css" rel="stylesheet"/>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="${s:mvcUrl('HC#index').build()}">Casa do Código</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a href="${s:mvcUrl('PC#listar').build()}" class="nav-link">Lista de Produtos</a>
      </li>    
      <li class="nav-item">
        <a href="${s:mvcUrl('PC#form').build()}" class="nav-link">Cadastro de Produtos</a>
      </li>
    </ul>
  </div>
</nav>
<div class="container">

<div class="mt-3 mb-3 text-center"><h1>Cadastro de Produtos</h1></div>
	<form:form action="${s:mvcUrl('PC#grava').build() }" method="post" commandName="produto" 
	enctype="multipart/form-data">
	    <div class="form-group">
	        <label>Título</label>	      
	        <form:input path="titulo" name="titulo" cssClass="form-control"/>
	        <form:errors path="titulo"/>
	    </div>
	    <div class="form-group">
	        <label>Descrição</label>	 
	        <form:textarea path="descricao" rows="5" cols="100" cssClass="form-control"/>       
	        <form:errors path="descricao"/>
	    </div>
	    <div class="form-group">
	        <label>Páginas</label>	     
	        <form:input path="paginas" cssClass="form-control"/>
	        <form:errors path="paginas"/>
	    </div>	   
	    
	    <div class="form-group">
		    <label>Data de Lançamento</label>
		    <form:input path="dataLancamento" cssClass="form-control"/>
		    <form:errors path="dataLancamento" />
		</div> 
	      
	    <c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
	        <div class="form-group">
	            <label>${tipoPreco}</label>
	            <form:input path="precos[${status.index}].valor" cssClass="form-control"/>
	            <form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}" />
	        </div>
   		 </c:forEach>
   		 <div class="form-group">
   		 	<label>Sumário</label>
   		 	<input type="file" name="sumario" class="form-control">
   		 </div>
   		    		 
	    <button type="submit" class="btn btn-primary">Cadastrar</button>
	</form:form>
</div>
</body>
</html>