<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="/resources/common.jsp"></jsp:include>
</head>
<body>
	<div class="container my-5">
		<h3 class="text-center mb-5">Welcome From MMIT</h3>
		<div class="row ">
			<div class="col-12 col-md-6 offset-md-3">
				<div class="card shadow">
					<div class="card-header text-center">
						<h3>Login</h3>
					</div>
					<div class="card-body">
					<c:if test="${not empty message }">
							<div class="alert alert-danger text-center col-6 offset-2">${message}</div>
					</c:if>
					<c:url var="save" value="/login"></c:url>
						<form action="${save }" class="form" method="post">
							<div class="form-group">
								<label for="">Email</label>
								<input type="email" name="email" placeholder="Enter Email" class="form-control"/>
							</div>
							<div class="form-group">
								<label for="">Password</label>
								<input type="password" name="password" placeholder="Enter Password" class="form-control"/>
							</div>
							<div class="form-group row">
							    <div class="col-sm-10">
							      <div class="form-check">
							        <input class="form-check-input" type="checkbox" id="gridCheck1">
							        <label class="form-check-label" for="gridCheck1">
							          Remember password
							        </label>
							      </div>
							    </div>
							  </div>
							  <div class="form-group">
							  	<a href="">Forgot password?</a>
							  	<button type="submit" class="btn btn-outline-secondary offset-7">Login</button>
							  </div>
						</form>
					</div>
					<div class="card-footer">
						<div class="form-group text-center">
							<a href="">Need an account? Sign up!</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>