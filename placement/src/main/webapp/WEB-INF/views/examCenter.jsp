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
<title>Placement Forum - Exam Center</title>
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
				<a class="navbar-brand" href="#">Placement Forum</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="#">Edit Profile</a></li>

					<li><a href="<c:url value='/auth/logout'/>">Logout</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>
	<div class="container" >
		<a  class="btn btn-primary pull-right" href="<c:url value='/company/profile'/>"><span class="glyphicon glyphicon-arrow-left"></span> Go back</a>
				
		<div class="col-xs-4" >
			<table class="table table-bordered" >
				<thead>
					<tr><th>List Of The Exam</th></tr>
				</thead>
				<tbody>
					<c:forEach items="${examCenters}" var="examCenter">
						<tr>
							<td>${examCenter.name} </td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div class="col-xs-8">
			<div class="page-header">
			  <h1>Exam <small>Add new</small></h1>
			  
			</div>
			<form>
			<input id="exam-name" type="text" name="name" class="form-control question" 
					data-validation="required"
					data-validation-error-msg="Exam Title is Required."
					placeholder="Please Enter Exam Title">
			<hr/>	
			<div id="question-container">
				<div id="question-template" class="col-xs-12" style="border:1px solid #CCC;padding-top:2%;padding-bottom:2%;margin-bottom:2%;">
					<div class="form-group">
					    <label for="exampleInputEmail1">Question</label>
					    <input type="text" name="question" class="form-control" placeholder="Enter question">
					</div>	
					<div class='col-xs-12'>
						<div class='col-xs-6'>
							<div class="form-group">
							    <label>Option 1</label>
							    <div class="input-group">
							      <span class="input-group-addon">
							        <input type="radio" name="answer">
							      </span>
							    <input type="text" class="form-control option" placeholder="Enter Option" style='width:60%;'>
								</div>
							</div>
							<div class="form-group">
							    <label>Option 3</label>
							    <div class="input-group">
							    	<span class="input-group-addon">
							        	<input type="radio" name="answer">
							      	</span>
							    	<input type="text" class="form-control option" placeholder="Enter Option" style='width:60%;'>
								</div>
							</div>
						</div>
						<div class='col-xs-6'>
							<div class="form-group">
								    <label>Option 2</label>
								    <div class="input-group">
							    	<span class="input-group-addon">
							        	<input type="radio" name="answer">
							      	</span>
								    <input type="text" class="form-control option" placeholder="Enter Option" style='width:60%;'>
									</div>
							</div>
							<div class="form-group">
								    <label>Option 4</label>
								    <div class="input-group">
							    	<span class="input-group-addon">
							        	<input type="radio" name="answer">
							      	</span>
								    <input type="text" class="form-control option" placeholder="Enter Option" style='width:60%;'>
									</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12"  style="padding-top: 2%;margin-bottom:5%;">
				<button id="add-question" class="btn btn-primary">Add Question</button>
				<button id="save-exam" class="btn btn-primary">Save</button><br/><br/>
				
			</div>
			</form>
			
			
		</div>
	</div>
	<script src='<c:url value="/resources/js/jquery.js"/>'></script>
	<script src='<c:url value="/resources/js/bootstrap.js"/>'></script>
	<script src='<c:url value="/resources/js/jquery.form-validator.min.js"/>'></script>
	<script>
		$(document).ready(function(){
			
			$("#add-question").click(function(e){
				e.preventDefault();
				var question = $("#question-template").clone(true);	
				
				var count = $("#question-container > div").length;
				$(question).removeAttr("id");
				$(question).find("input[type='text']").val("");
				$(question).find("input[type='radio']").attr("name", "answer_"+count)
				$("#question-container").append(question);
			});
			
			$("#save-exam").click(function(e){
				e.preventDefault();
				var questions = [];
				var btn = $("#save-exam").button("loading");
				$("#question-container > div").each(function(index,element){
					var obj = {
							"question" : null,
							"options": []
					};
					var que = $(element).find("input[name='question']").val();
					obj.question = que;
					
					$(element).find(".option").each(function(i, e){
						var opt = {
								"option" : null,
								"answer": false
						};
						
						opt.option = $(e).val();
						opt.answer = $(e).parent().find("[type='radio']").is(":checked");
						
						obj.options.push(opt);
					});					
					questions.push(obj);	
				});
				
				var exam = {
						"name" : $("#exam-name").val(),
						"questions": questions
				};
				
				 $.ajax({
				      type: "POST",
				      contentType : 'application/json; charset=utf-8',
				      dataType : 'json',
				      url: "<c:url value='/exam/save'/>",
				      data: JSON.stringify(exam), 
				      success :function(result) {
				    	  $("input").val("");
				    	  $(btn).button("reset");
				    	  location.reload();				      
				     }
				  });
			});					
		});
	</script>
</body>
</html>