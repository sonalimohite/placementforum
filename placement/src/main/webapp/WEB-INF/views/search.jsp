
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
<title>Placement Forum</title>
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro"
	rel="stylesheet">
<link href='<c:url value="/resources/css/bootstrap.css"/>'
	rel="stylesheet">
<link href='<c:url value="/resources/css/heroic-features.css"/>'
	rel="stylesheet">
</head>

<body>

	<!-- Navigation -->
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
				<a class="navbar-brand" href='<c:url value="/"/>'>Placement Forum</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">About</a></li>
					<li><a href="<c:url value='company/list'/>">Companies</a></li>
					<li><a href="<c:url value='student/list'/>">Students</a></li>
					<c:if test="${name == null}">
						<li><a href="<c:url value="/login"/>">Login</a></li>
					</c:if>
					<c:if test="${name != null}">
						<li><a href="<c:url value="/auth/logout"/>">Logout</a></li>
					</c:if>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Page Content -->
	<div class="container">
		<div class="row text-center">
        	<h2>Recent Posted Jobs</h2>
			<c:forEach items="${jobs}" var="job">
     			<div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                   <!--  <img src="http://placehold.it/800x500" alt=""> -->
	                    <div class="caption">
	                        <h3>${job.jobTitle}</h3>
	                        <span>${job.company.name}</span>
	                        
	                        <p>Skills : ${job.keySkills}</p>
	                        <p>
	                            <a href="<c:url value='/job/view?id='/>${job.id}" class="btn btn-primary">Apply</a> 
	                        </p>
	                    </div>
	                </div>
	            </div>
			</c:forEach>  
        </div>
	</div>
	<!-- /.container -->
	<script src='<c:url value="/resources/js/jquery.js"/>'></script>
	<script src='<c:url value="/resources/js/bootstrap.js"/>'></script>

</body>

</html>