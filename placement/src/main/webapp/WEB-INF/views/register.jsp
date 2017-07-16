<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Placement Forum - Register</title>
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
<link href='<c:url value="/resources/css/bootstrap.css"/>' rel="stylesheet">
<link href='<c:url value="/resources/css/heroic-features.css"/>' rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Placement Forum</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">About</a></li>
					<li><a href="#">Companies</a></li>
					<li><a href="#">Student</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<div class="container">
		<h3 style="margin-left: 17%;"> <span class="glyphicon glyphicon-briefcase"></span> Please enter your details below.</h3>
		<br/><br/>
		<form class="form-horizontal" action='<c:url value="/company/save"/>' method="POST">
			<div class="form-group">
				<label class="col-sm-2 control-label">Company Name</label>
				<div class="col-sm-10">
					<input type="text" name="name" class="form-control" placeholder="Please Enter Company Name"  data-validation="required" >
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Address</label>
				<div class="col-sm-10">
					<textarea name="address" class="form-control" rows="3"  data-validation="required" ></textarea>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">HR Name</label>
				<div class="col-sm-10">
					<input type="text" name="hrName" class="form-control" placeholder="Please Enter HR's Name"  data-validation="required" >
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
					<input type="password" name="password" class="form-control" placeholder="Please Enter Password"  data-validation="required" >
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">Company description</label>
				<div class="col-sm-10">
					<textarea name="companyDesc" class="form-control" rows="3"  data-validation="required" ></textarea>
				</div>
			</div>
			
			
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-floppy-open"></span> Register</button>
				</div>
			</div>
		</form>
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