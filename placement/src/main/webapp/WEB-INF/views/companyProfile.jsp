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
				<a class="navbar-brand" href="#">Placement Forum</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
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
		<div class="col-xs-3" style="padding:0%">
			<div class="col-xs-12" style="border: 1px solid #CCC;padding:2%">
				<h2><span class="glyphicon glyphicon-lock"></span> ${company.name}</h2>
				<small><span class="glyphicon glyphicon-user"></span> ${company.hrName}</small><br /> 
				<span class="glyphicon glyphicon-envelope"></span> ${company.email}<br />
				<span class="glyphicon glyphicon-home"></span> ${company.address}<br />
			</div>
			<button type="button" class="btn btn-primary" style="width: 100%;margin-top: 5%;" data-toggle="modal" data-target=".bs-example-modal-lg"><span class="glyphicon glyphicon-bullhorn"></span> Post new job</button>
		</div>
		<div class="col-xs-9">
			<c:forEach items="${jobs}" var="job">
				<div class="panel-group" id="accordion_${job.id}" role="tablist"
					aria-multiselectable="true">
					<div class="panel panel-default">
						<div class="panel-heading" role="tab" id="headingOne_${job.id}">
							<h4 class="panel-title">
								<a role="button" data-toggle="collapse"
									data-parent="#accordion_${job.id}"
									href="#collapseOne_${job.id}" aria-expanded="true"
									aria-controls="collapseOne_${job.id}"> ${job.jobTitle} </a>
							</h4>
						</div>
						<div id="collapseOne_${job.id}" class="panel-collapse collapse"
							role="tabpanel" aria-labelledby="headingOne_${job.id}">
							<div class="panel-body">
								<label>Skills : </label> ${job.keySkills } <br /> <label>Description
									: </label>${job.jobDescription }


							</div>
							<div class="panel-footer">
								<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span> Edit</button>
								<button type="button" class="btn btn-danger"> <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Delete</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	    	<div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-bullhorn"></span> Post new job</h4>
      </div>
      <div class="modal-body">
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
		</div>
	    </div>
	  </div>
	</div>
		

	<script src='<c:url value="/resources/js/jquery.js"/>'></script>
	<script src='<c:url value="/resources/js/bootstrap.js"/>'></script>
</body>
</html>