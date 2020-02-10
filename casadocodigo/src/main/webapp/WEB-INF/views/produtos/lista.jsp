<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<c:url value="/resources/css/" var="cssPath" />
<link href="${cssPath }bootstrap.min.css" rel="stylesheet" />

</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="${s:mvcUrl('HC#index').build()}">Casa
			do Código</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a
					href="${s:mvcUrl('PC#listar').build()}" class="nav-link">Lista
						de Produtos</a></li>
				<li class="nav-item"><a href="${s:mvcUrl('PC#form').build()}"
					class="nav-link">Cadastro de Produtos</a></li>
				<li><a href="/carrinho" rel="nofollow" class="nav-link">Carrinho</a></li>
				<li><a href="/pages/sobre-a-casa-do-codigo" rel="nofollow"
					class="nav-link">Sobre Nós</a></li>
			</ul>		
			<ul class="navbar-nav">
				  <li class="nav-item"> 
				    <a href="#"  class="nav-link">
				        <security:authentication property="principal" var="usuario"/>
				        Usuário: ${usuario.username}
				    </a>
				  </li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="mt-3 mb-3">${sucesso}</div>
		<div class="mt-3 mb-3">${falha}</div>
		<div class="text-center mt-3 mb-3">
			<h1>Lista Produtos</h1>
		</div>
		<table class="table table-bordered table-striped table-hover">
			<tr>
				<th>Título</th>
				<th>Descrição</th>
				<th>Páginas</th>
			</tr>

			<c:forEach items="${produtos}" var="produto">
				<tr>
					<td><a
						href="${s:mvcUrl('PC#detalhe').arg(0, produto.id).build() }">
							${produto.titulo} </a></td>

					<td>${produto.descricao}</td>
					<td>${produto.paginas}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>