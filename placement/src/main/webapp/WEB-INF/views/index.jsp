<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
    response.setHeader("Pragma", "no-cache"); //HTTP 1.0
    response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>

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
                        <a href="<c:url value='company/list'/>">Companies</a>
                    </li>
                    <li>
                        <a href="<c:url value='student/list'/>">Students</a>
                    </li>
                    <c:if test="${name == null}">
	                    <li>
	                    	<a href="<c:url value="/login"/>">Login</a>
	                    </li>
                    </c:if>
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

    <!-- Page Content -->
    <div class="container">

        <!-- Jumbotron Header -->
        <!-- header class="jumbotron hero-spacer" 
        style="background-image: url('<c:url value="/resources/img/jobs.jpg"/>');background-repeat: no-repeat;background-size: cover;" -->
         <header class="jumbotron hero-spacer">
            
            <c:if test="${name != null }">
            	<h1>Welcome ${name}!</h1>
            </c:if>
            
            <c:if test="${name == null }">
            	<h1>Welcome !</h1>
           
	            <p>Looking for a job register as student, or looking for employee register as company.</p>
	            <p><a class="btn btn-primary btn-large"  href='<c:url value="student/register"/>'>Register as Student</a>
	            
				
				<a class="btn btn-primary btn-large" href='<c:url value="company/register"/>'>Register as Company</a>
	            </p>
             </c:if>
        </header>

       

        <!-- Title -->
        <div class="row">
			<div class="col-lg-12"
				style="padding-left: 20%; padding-right: 20%; text-align: center;">
				<form action="<c:url value='/search'/>" method="POST">
					<input type="text" class="form-control" name="query"
						placeholder='Enter skill to search for..' style="font-size: 18px;" />
					<br />
					<button type="submit" class="btn btn-primary" style="width: 200px;">Search</button>
				</form>
			</div>
		</div>
        <!-- /.row -->
        <br/>
		<hr>
		 
        <!-- Page Features -->
        <div class="row text-center">
        	<h2>Recent Posted Jobs</h2>
			<c:forEach items="${uiJobs}" var="job">
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
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                   
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
