<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Placement Forum - Register</title>
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro"
	rel="stylesheet">
<link href='<c:url value="/resources/css/bootstrap.css"/>'
	rel="stylesheet">
<link href='<c:url value="/resources/css/heroic-features.css"/>'
	rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value='/'/>">Placement Forum</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
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
		<div class="col-xs-4">
			<h4><span class="glyphicon glyphicon-user"></span> ${student.firstName } ${student.lastName}</h4>
			<span class="glyphicon glyphicon-book"></span> ${student.collegeName}<br/>
			<span class="glyphicon glyphicon-education"></span> ${student.qualification }<br/>
			<span class="glyphicon glyphicon-envelope"></span> ${student.email }
			
		
		</div>
		<div class="col-xs-8">
			<h1>${job.exam.name} - <span class='pull-right' style="color:red"><span style="font-size: 16px;" class='glyphicon glyphicon-time'></span> <span style="font-size: 20px;">Time : <span id="time"></span></span></span></h1>
			<form id="exam" action="">
			<c:forEach items="${job.exam.questions}" var="question">
				<div class="col-xs-12" style="border:1px solid #EEE; padding:2%;margin-bottom:2%;">
					<div class="col-xs-12">
						<label> ${question.question} </label>
					</div>
					<c:forEach items="${question.options}" var="option">
						<div class="col-xs-6"> <input type="radio" name="${question.id}"/> ${option.option}</div>
					</c:forEach>
				</div>
			</c:forEach>
			<button class="btn btn-primary">Submit</button>
			</form>
		</div>
	</div>
	<script src='<c:url value="/resources/js/jquery.js"/>'></script>
	<script src='<c:url value="/resources/js/bootstrap.js"/>'></script>
	<script>
		var time = 900000;
		$("#time").text((time/60000).toFixed(2));
		$(document).ready(function(){


			window.setInterval(function(){
				time = time - 1000;
				$("#time").text((time/60000).toFixed(2));
				
				if(time <= 0){
					$("#exam").submit();	
				}
			}, 1000);
		});
		
	</script>
</body>
</html>