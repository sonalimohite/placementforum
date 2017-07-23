<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
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
					 <c:if test="${name != null}">                
	                  	<li>
	                    	<a href="<c:url value="/auth/logout"/>">Logout</a>
	                    </li>
                    </c:if>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<div class="container">
		<div class="col-xs-3">
			<h2>
				<span class="glyphicon glyphicon-briefcase"></span>
				${job.company.name}
			</h2>
			<h6>
				<span class="glyphicon glyphicon-user"></span> ${job.company.hrName}
			</h6>
			<span class="glyphicon glyphicon-home"></span><span>
				${job.company.address}</span>
			<h4>
				<span class="glyphicon glyphicon-envelope"></span>
				${job.company.email}
			</h4>
		</div>
		<div class="col-xs-9" style="border: 1px solid #CCC;margin-bottom:20px;padding-bottom:2%;">

			<h1>
				<span class="label label-default"></span> ${job.jobTitle}
			</h1>
			<label>Location : </label><span>${job.jobLocation }</span>
			<p><label>Job Description : </label> ${job.jobDescription }</p><br/>
			
			<label>Skills : </label><span>${job.keySkills }</span><br/>
			<label>Experience : </label><span>${job.experience }</span><br/>
			<label>Job Profile : </label><span>${job.jobProfile }</span><br/>
			
			<label>Company Profile</label><br/>
			<p>${job.company.companyDesc}</p>
			<br/>
			<a href="<c:url value='/job/apply?id='/>${job.id}" class="btn btn-primary">Apply</a>
			
		</div>
	</div>
	<script src='<c:url value="/resources/js/jquery.js"/>'></script>
	<script src='<c:url value="/resources/js/bootstrap.js"/>'></script>
</body>
</html>