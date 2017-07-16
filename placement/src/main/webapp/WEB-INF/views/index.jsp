<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Placement Forum</title>
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet"> 
    <link href='<c:url value="/resources/css/bootstrap.css"/>' rel="stylesheet">
    <link href='<c:url value="/resources/css/heroic-features.css"/>' rel="stylesheet">     
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Placement Forum</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Companies</a>
                    </li>
                    <li>
                        <a href="#">Student</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <div class="container">

        <!-- Jumbotron Header -->
        <header class="jumbotron hero-spacer">
            <h1>Welcome!</h1>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa, ipsam, eligendi, in quo sunt possimus non incidunt odit vero aliquid similique quaerat nam nobis illo aspernatur vitae fugiat numquam repellat.</p>
            <p><a class="btn btn-primary btn-large"  href='<c:url value="/login"/>'>Login</a>
            
			
			<a class="btn btn-primary btn-large" href='<c:url value="/register"/>'>Register</a>
            </p>
        </header>

        <hr>

        <!-- Title -->
        <div class="row">
            <div class="col-lg-12">
                <!--  h3>Jobs</h3 -->
            </div>
        </div>
        <!-- /.row -->

        <!-- Page Features -->
        <div class="row text-center">
        	<h4>Recent Posted Jobs</h4>
			<c:forEach items="${uiJobs}" var="job">
     			<div class="col-md-3 col-sm-6 hero-feature">
	                <div class="thumbnail">
	                   <!--  <img src="http://placehold.it/800x500" alt=""> -->
	                    <div class="caption">
	                        <h3>${job.jobTitle}</h3>
	                        <span>${job.company.name}</span>
	                        
	                        <p>Skills : ${job.keySkills}</p>
	                        <p>
	                            <a href="#" class="btn btn-primary">Apply</a> <a href="#" class="btn btn-default">More Info</a>
	                        </p>
	                    </div>
	                </div>
	            </div>
			</c:forEach>  
        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
     <script src='<c:url value="/resources/js/jquery.js"/>'></script>
    

    <!-- Bootstrap Core JavaScript -->
    
    <script src='<c:url value="/resources/js/bootstrap.js"/>' ></script>

</body>

</html>
