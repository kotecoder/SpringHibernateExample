<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Registration Form</title>



<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<style type="text/css">
.myrow-container {
	margin: 20px;
}

.panel-title {
	color: #d1cbbc;
}

.error {
	color: #ff0000;
}
</style>

</head>


<body class=".container-fluid" style="background-color: whitesmoke">
	<div class="container myrow-container">
		<div class="panel ">
			<div class="panel-heading" style="background-color: #8C92AC">
				<h2 class="panel-title" style="color: #d1cbbc">User Details</h2>
			</div>
			<div class="panel-body">



				<form:form method="POST" cssClass="form-horizontal"
					modelAttribute="user">
					<form:input type="hidden" path="id" id="id" />
					<table>
						<tr>

							<td><label for="name">Name: </label></td>
							<td><form:input path="name" id="name" /></td>
							<td><form:errors path="name" cssClass="error" /></td>

						</tr>

						<tr>
							<td><label for="age">Age: </label></td>
							<td><form:input path="age" id="age" /></td>
							<td><form:errors path="age" cssClass="error" /></td>
						</tr>

						<tr>
						
							<td><form:input type="hidden" path="joiningDate"
									id="joiningDate" /></td>
							<td><form:errors path="joiningDate" cssClass="error" /></td>
						</tr>

						<tr>
							<td><label for="admin">isAdmin: </label></td>
							<td><form:radiobutton path="admin" value="true" />Yes <form:radiobutton
									path="admin" value="false" />No</td>

							<td><form:errors path="admin" cssClass="error" /></td>
						</tr>

						<tr>
							<td><label for="email">Email: </label></td>
							<td><form:input path="email" id="email" /></td>
							<td><form:errors path="email" cssClass="error" /></td>
						</tr>

						<tr>
							<td colspan="3"><c:choose>
									<c:when test="${edit}">
										<input type="submit" value="Update" />
									</c:when>
									<c:otherwise>
										<input type="submit" value="Register"  />
									</c:otherwise>
								</c:choose></td>
						</tr>
					</table>
				</form:form>
			</div>
		</div>
	</div>
	<br />
	<br /> Go back to
	<a href="<c:url value='/' />">List of All Users</a>
</body>
</html>