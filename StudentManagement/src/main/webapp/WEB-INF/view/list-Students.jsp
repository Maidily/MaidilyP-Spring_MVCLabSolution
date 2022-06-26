<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<style>
	table, th, td {
		border: 2px solid black;
		border-collapse: collapse;
	}
	button {
		color:white; 
		background-color: blue; 
		font-weight: bold; 
		cursor: pointer;
		padding: 8px 40px;
	}
</style>

<title>Students Directory</title>
</head>

<body>

	<div style="margin-left:50px; margin-right:50px;" >

		<h2>Students Directory</h2>
		<hr>

		<!-- Add a Add-Student form -->

		<form action="/StudentManagement/student/showFormForAdd">
			<!-- Add a button -->
			<button type="submit"> Add Student </button>
		</form>
		
		<br/><br/>
		
		<table style="width:50%; " >
			<thead>
				<tr>
					<th>Student Id</th>
					<th>Name</th>
					<th>Department</th>
					<th>Country</th>
					<th>Action</th>				
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${Students}" var="tempStudent">
					<tr>
						<td><c:out value="${tempStudent.student_id}" /></td>
						<td><c:out value="${tempStudent.name}" /></td>
						<td><c:out value="${tempStudent.department}" /></td>
						<td><c:out value="${tempStudent.country}" /></td>
						<td>
							<!-- Add "update" link --> 
							<a href="/StudentManagement/student/showFormForUpdate?studentId=${tempStudent.student_id}"> Update </a> 
							
							 &nbsp; &nbsp;
							 
							<!-- Add "delete" link -->
							<a href="/StudentManagement/student/delete?studentId=${tempStudent.student_id}" style="color:red;"
							onclick="if (!(confirm('Are you sure you want to delete this Student?'))) return false"> Delete </a>

						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<hr>
		<!-- Add a Return to HomePage link -->
		<a href="/StudentManagement/">Back to Home Page</a>
		
	</div>

</body>
</html>
