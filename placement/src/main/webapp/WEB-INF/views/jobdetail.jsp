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
				<a class="navbar-brand" href="<c:url value='/company/profile'/>">Placement Forum</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">Edit Profile</a></li>
					<li><a href="<c:url value='/job/add'/>">Add Job</a></li>
					<li><a href="<c:url value='/auth/logout'/>">Logout</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<div class="container">
		<br/>
		<form class="form-horizontal" action='<c:url value="/job/save"/>' method="POST">
			
			<div class="form-group">
				<label class="col-sm-2 control-label">Job Title</label>
				<div class="col-sm-10">
					<input type="text" name="jobTitle" class="form-control" placeholder="Please Enter Job Title">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">Job Description</label>
				<div class="col-sm-10">
					<textarea name="jobDescription" class="form-control" rows="3"></textarea>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">Job Location</label>
				<div class="col-sm-10">
					<input type="text" name="jobLocation" class="form-control" placeholder="Please Enter Job Location">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">Key Skills</label>
				<div class="col-sm-10">
					<textarea name="keySkills" class="form-control" rows="3"></textarea>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">Experience</label>
				<div class="col-sm-10">
					<input type="text" name="experience" class="form-control" placeholder="Please Enter Experience">
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">Job Profile</label>
				<div class="col-sm-10">
					<input type="text" name="jobProfile" class="form-control" placeholder="Please Enter Job Profile">
				</div>
			</div>
			
			
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">Save</button>
				</div>
			</div>
		</form>
		<h5 align="center">${msg}</h5>
	</div>
	
	<script src='<c:url value="/resources/js/jquery.js"/>'></script>
	<script src='<c:url value="/resources/js/bootstrap.js"/>'></script>
</body>
</html>