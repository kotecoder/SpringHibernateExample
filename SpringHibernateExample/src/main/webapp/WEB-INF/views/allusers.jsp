<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JavaRush Test</title>



<!-- Bootstrap CSS -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<style type="text/css">
.myrow-container {
	margin: 20px;
}

.btn {
	padding: 2px 2px;
	width: 5em;
	height: 2em;
	background-color: #4d3a1e;
	color: #f1f1f1;
	border-radius: 0;
	transition: .2s;
}

.btn:hover, .btn:focus {
	border: 1px solid #4d3a1e;
	background-color: #fff;
	color: #000;
}

a.aEdit:link, a.aDelete:link {
	color: #a83016;
}

a.aEdit:visited, a.aDelete:visited {
	color: #947872;
}

a.aEdit:hover, a.aDelete:hover {
	color: #60a870;
}

a.aEdit:active, a.aDelete:active {
	color: #ded728;
}

a.aCreateUser:link {
	color: #d1cbbc;
}

a.aCreateUser:visited {
	color: #c4bba5;
}

a.aCreateUser:hover {
	color: #a0cc95;
}

.panel-footer a {
	font-size: 1em;
}

.panel-footer a:link {
	color: #d1cbbc;
}

.panel-footer a:visited {
	color: #c4bba5;
}

.panel-footer a:hover {
	color: #a0cc95;
}

.panel-footer a:active {
	color: #ded728;
}

.header-align {
	vertical-align: bottom;
}

.first-child {
	font-weight: bold;
	background-color: #C6C9C4;
}
</style>


</head>


<body>
	<table>
		<tr class="header-align">
			<td>
				<h1>
					<a href="<c:url value='/' />">LIST OF USERS &emsp;</a>
				</h1>
			</td>

			<%--SEARCHING FORM --%>

			<td><form:form method="GET"
					action="/SpringHibernateExample/search" commandName="name">
					<input type="text" id="txt" name="name"
						placeholder="type searching name">
					<input type="hidden" id="txt" name="page" value="1">
					<input type="submit" value="SEARCH" />
				</form:form></td>

			<td><form:form method="GET" action="/SpringHibernateExample/new">

					<input type="submit" value="+ ADD USER" />
				</form:form></td>

		</tr>
	</table>

	<%--DATA VIEW --%>
	<c:set var="link " value="/" />

	<c:if test="${not empty searchedName} }">

		<c:set var="link " value="/search" />


	</c:if>


	<c:choose>
		<c:when test="${not empty userList}">

			<table class="table table-hover table-bordered">

				<tr class="first-child" align="left">
					<td>Name</td>
					<td>Age</td>
					<td>Joining Date</td>
					<td>isAdmin</td>
					<td></td>
					<td></td>
				</tr>
				<c:forEach items="${userList}" var="user">
					<tr>
						<td>${user.name}</td>
						<td>${user.age}</td>
						<td><fmt:formatDate value="${user.joiningDate}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>

						<td>${user.admin}</td>
						<td><a href="<c:url value='/edit-${user.email}-user' />">update</a></td>
						<td><a href="<c:url value='/delete-${user.email}-user' />">delete</a></td>
					</tr>
				</c:forEach>
			</table>



			<br />

		</c:when>
		<c:when test="${ empty userList && not empty searchedName}">
			<div class="text-danger">
				<h3>
					No results for Name
					<ins> ${searchedName}</ins>
				</h3>
			</div>

		</c:when>
		<c:when test="${searchedName == ''}">
			<div class="text-danger">
				<h3>Please, type the name what are you looking for.</h3>
			</div>


		</c:when>


	</c:choose>



	<br />


	<%--PAGINATION --%>


	<div align="center" class="panel-footer"
		style="background-color: #8C92AC" id="pagination">

		<c:set var="begin" value="1" />


		<c:url value="${link}" var="prev">
			<c:param name="page" value="${page-1}" />
			<c:param name="name" value="${searchedName}" />
		</c:url>
		<c:if test="${page > 1}">
			<a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
		</c:if>


		<c:forEach begin="${begin}" end="${maxPages}" step="1" varStatus="i">

			<c:choose>
				<c:when test="${page == i.index}">
					<span>${i.index}</span>
				</c:when>
				<c:otherwise>
					<c:url value="${link}" var="url">
						<c:param name="page" value="${i.index}" />
						<c:param name="name" value="${searchedName}" />
					</c:url>
					<a href='<c:out value="${url}" />'>${i.index}</a>
				</c:otherwise>
			</c:choose>

		</c:forEach>
		<c:url value="${link}" var="next">
			<c:param name="page" value="${page + 1}" />
			<c:param name="name" value="${searchedName}" />
		</c:url>
		<c:if test="${page + 1 <= maxPages}">
			<a href='<c:out value="${next}" />' class="pn next">Next</a>
		</c:if>
	</div>


</body>
</html>