<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<style>
	button {
		color: white; 
		background-color: blue; 
		font-weight: bold; 
		cursor: pointer;
		padding: 8px 40px;
		margin: auto;
	}
	div {
		width: 100%;
	}
	p {
		font-weight: bold;
	}
	input {
		height: 20px;
	}
</style>

<title>Save Student</title>
</head>

<body>

	<div style="margin-left:50px; margin-right:50px;" >
		
		<h2>Student Directory</h2>
		<hr>
		
		<h3>Student Details</h3>
		
		<form action="/StudentManagement/student/save" method="POST" style="width:100%;" >
			
			<!-- Add hidden form field to handle update -->
			<input type="hidden" name="id" value="${Student.student_id}" />
			
			<div>
				<p> Name </p>
				<input type="text" name="name" value="${Student.name}" placeholder="Enter the Name">
			</div>
			
			<div>
				<p> Department </p>
				<input type="text" name="dept" value="${Student.department}" placeholder="Enter the Department">
			</div>
			
			<div>
				<p> Country </p>
				<input type="text" name="country" value="${Student.country}" placeholder="Enter the Country">
			</div>
			
			<br/><br/>
			
			<button type="submit"> Save </button>
			
		</form>
		
		<hr>
		<a href="/StudentManagement/student/list" >Back to Students List</a>
		
	</div>
</body>

</html>
