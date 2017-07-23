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
			<h4><span class="glyphicon glyphicon-user"></span> ${student.firstName } ${student.lastName}</h4>
			<span class="glyphicon glyphicon-book"></span> ${student.collegeName}<br/>
			<span class="glyphicon glyphicon-education"></span> ${student.qualification }<br/>
			<span class="glyphicon glyphicon-envelope"></span> ${student.email }
			
		
		</div>
		<c:if test="${hasApplied == false}">
			<div id="exam-container" class="col-xs-9">
				<h1>${job.exam.name} - <span class='pull-right' style="color:red"><span style="font-size: 16px;" class='glyphicon glyphicon-time'></span> <span style="font-size: 20px;">Time : <span id="time"></span></span></span></h1>
				<form id="exam" action="">
				<c:forEach items="${job.exam.questions}" var="question">
					<div class="col-xs-12" style="border:1px solid #EEE; padding:2%;margin-bottom:2%;">
						<div class="col-xs-12">
							<label> ${question.question} </label>
						</div>
						<c:forEach items="${question.options}" var="option">
							<div class="col-xs-6"> <input type="radio" name="${question.id}" value="${option.id}"/> ${option.option}</div>
						</c:forEach>
					</div>
				</c:forEach>
				<button id="submit-exam" class="btn btn-primary">Submit</button>
				</form>
			</div>
		</c:if>
		<c:if test="${hasApplied == true}">
			<div class="col-xs-9" style="text-align: center;">
				<div class="alert alert-warning" role="alert" style="padding-top: 10%; padding-bottom: 10%; text-align: center;"><span class="glyphicon glyphicon-warning-sign" style="font-size: 70px;"></span><br/><br/><strong>You have already appeared for Exam. </strong><br/> Please check your email for further instruction </div>
				<a href="<c:url value='/'/>"class="btn btn-primary"><span class="glyphicon glyphicon-arrow-left"></span> Go back</a>
			</div>
		</c:if>
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
					//$("#submit-exam").trigger("click");	
				}
			}, 1000);
			
			
			$("#submit-exam").click(function(e){
				e.preventDefault();
				var btn = $(this).button("loading");
				var answers = $("#exam").serializeArray();
				var data = [];
				
				for(var i =0; i < answers.length; i++){
					var field = answers[i];
					var question = {
							"questionId" :field.name,
							"answerId":field.value
					}
					data.push(question);
				}
				
				$.ajax({
				      type: "POST",
				      contentType : 'application/json; charset=utf-8',
				      dataType : 'json',
				      url: "<c:url value='/exam/submit'/>?jobId=${id}",
				      data: JSON.stringify(data), 
				      success :function(result) {
				    	
				    	$("#exam-container").html('<div style="padding-top:10%;padding-bottom:10%" class="alert alert-success" role="alert"><span class="glyphicon glyphicon-check" style="font-size: 70px;"></span><br/><br/>Thank You, We will send Email with further instructions</div><a href="<c:url value="/"/>"class="btn btn-primary"><span class="glyphicon glyphicon-arrow-left"></span> Go back</a>');  
				    	$("#exam-container").css("text-align","center");
				    	$(btn).button("reset");
				    	  			      
				     }
				  });
			});
		});
		
		
		
	</script>
</body>
</html>