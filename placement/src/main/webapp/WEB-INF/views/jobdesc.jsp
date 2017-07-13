<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Placement Forum - Job details</title>
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
		<h2 align="center">Please enter job details below.</h2>
		<br/><br/>
		<form class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">Job description</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="3"></textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">Salary</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" >
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">Industry</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" >
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">Role</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" >
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">Employement Type</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" >
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">Key skill's</label>
				<div class="col-sm-10">
					<input type="checkbox"  value="java" id="1" />
					<label for="1">Java</label><br>
					<input type="checkbox"  value="java" id="2" />
					<label for="2">PHP</label><br>
					<input type="checkbox"  value="java" id="3" />
					<label for="3">SQL</label><br>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">Contact details</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" >
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-sm-2 control-label">Company website</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" >
				</div>
			</div>
			
			<div  class="form-group" >
			<div  class="col-sm-offset-2 col-sm-2"> 
					<input type="submit" align="right" class="btn btn-lg btn-primary btn-block" value="Apply" > 
				<%--   <a  href='<c:url value="/login"/>'></a>  --%>
				</div>
			</div>
		</form>
	</div>
	
	<srcipt src='<c:url value="/resources/js/jquery.js"/>'></srcipt>

	<script src='<c:url value="/resources/js/bootstrap.js"/>'></script>
</body>
</html>