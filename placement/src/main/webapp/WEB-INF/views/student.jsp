<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Placement Forum - Login</title>
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
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="<c:url value='/company/list'/>">Companies</a>
                    </li>
                    <li>
                        <a href="<c:url value='/student/list'/>">Students</a>
                    </li>
                    <li>
                    	<a href="<c:url value="/login"/>">Login</a>
                    </li>
                </ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<div class="container">
		<c:forEach items="${students}" var="student">
		${student.firstName} ${student.lastName}
	
	</c:forEach>
	</div>

	<script src='<c:url value="/resources/js/jquery.js"/>'></script>
	<script src='<c:url value="/resources/js/bootstrap.js"/>'></script>
</body>
</html>