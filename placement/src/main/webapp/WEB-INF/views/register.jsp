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
		<h2 align="center">Please enter your details below.</h2>
		<br/><br/>
		<form class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">Company Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="Please Enter Company Name">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Address</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="3"></textarea>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">HR Name</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="Please Enter HR's Name">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">Email</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" placeholder="Please Enter Email">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">Company description</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="3"></textarea>
				</div>
			</div>
			
			
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">Register</button>
				</div>
			</div>
		</form>
	</div>
	
	<srcipt src='<c:url value="/resources/js/jquery.js"/>'></srcipt>

	<script src='<c:url value="/resources/js/bootstrap.js"/>'></script>
</body>
</html>