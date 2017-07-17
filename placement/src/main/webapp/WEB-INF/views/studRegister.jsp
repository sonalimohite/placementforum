<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Placement Forum - Register</title>
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
<link href='<c:url value="/resources/css/bootstrap.css"/>' rel="stylesheet">
<link href='<c:url value="/resources/css/heroic-features.css"/>' rel="stylesheet">
<style>
	.form-control{
		border: none;
		box-shadow: none;
		border-bottom: 1px solid grey;
		border-radius: 0;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value='/'/>">Placement Forum</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">About</a></li>
					<li><a href="<c:url value='/company/list'/>">Companies</a></li>
					<li><a href="<c:url value='/student/list'/>">Student</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<div class="container">
		<h3 align="center"> <span class="glyphicon glyphicon-user"></span> Student Registration</h3>
		<hr style="width:20%"/>
		<h5 align="center">Enter your details</h5>
		<br/>
		<div style="width:60%;margin: 0 auto;">
			<form class="form-horizontal" action='<c:url value="/student/save"/>' method="POST">
				<div class="form-group">
					<label class="col-sm-2 control-label">First Name</label>
					<div class="col-sm-10">
						<input type="text" name="firstName" class="form-control" placeholder="Please Enter First Name"  data-validation="required" >
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Last Name</label>
					<div class="col-sm-10">
						<input type="text" name="lastName" class="form-control" placeholder="Please Enter Last Name"  data-validation="required" >
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">College Name</label>
					<div class="col-sm-10">
						<input type="text" name="collegeName" class="form-control" placeholder="Please Enter College Name"  data-validation="required" >
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="text" name="email" class="form-control" placeholder="Please Enter Email"  data-validation="required" >
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" name="password" class="form-control" placeholder="Please Enter Email"  data-validation="required" >
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">Qualification</label>
					<div class="col-sm-10">
						<input type="text" name="qualification" class="form-control" placeholder="Please Enter qualification"  data-validation="required" >
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">Year of Passing</label>
					<div class="col-sm-10">
						<input type="text" name="yearOfPassing" class="form-control" placeholder="Please Enter Year of Passing"  data-validation="required" >
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label">Branch</label>
					<div class="col-sm-10">
						<input type="text" name="branch" class="form-control" placeholder="Please Enter Branch"  data-validation="required" >
					</div>
				</div>
				
				
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-open"></span> Register</button>
					</div>
				</div>
			</form>
		</div>
		<h5 align="center">${msg}</h5>
	</div>
	
	<script src='<c:url value="/resources/js/jquery.js"/>'></script>
	<script src='<c:url value="/resources/js/bootstrap.js"/>'></script>
	<script src='<c:url value="/resources/js/jquery.form-validator.min.js"/>'></script>
	<script>
	  $.validate();
	</script>
</body>
</html>