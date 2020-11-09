<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title></title>

<jsp:include page="/resources/common.jsp"></jsp:include>

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<jsp:include page="/resources/menu.jsp"></jsp:include>
		<!-- End of Sidebar -->


		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<jsp:include page="/resources/navbar.jsp"></jsp:include>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid mb-5">
						<div class="btn-gp text-right mb-3">
						<c:url var="add" value="/company"></c:url>
						<a href="${add }" class="btn btn-secondary">
						<i class="fas fa-arrow-left mx-2"></i><span>Back</span>
						</a>
					</div>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Company Info</h6>
						</div>
						<div class="card-body">
							
							<c:url var="save" value="/company-add"></c:url>
							<form action="${save }" class="form" method="post">
						
								<input type="hidden" name="companyid" value="${company.id}"/>
							
								<div class="form-row">
									<div class="form-group col-md-6">
										<input type="text" class="form-control" id="inputnamel4"
											placeholder="Company Name" name="companyname" value="${company.name }">
									</div>
									<div class="form-group col-md-6">
										<input type="number" class="form-control" id="inputPhone"
											placeholder="Phone-1" name="phone1" value="${company.phone1 }">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<input type="text" class="form-control" id="inputAddress"
											placeholder="Company Address" name="address" value="${company.address }">
									</div>
									<div class="form-group col-md-6">
										<input type="number" class="form-control" id="inputPhone2"
											placeholder="Phone-2" name="phone2" value="${company.phone2 }">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<input type="text" class="form-control" id="inputWebsite"
											placeholder="Website" name="website" value="${company.website }">
									</div>
									<div class="form-group col-md-6">
										<input type="text" class="form-control" id="inputOwner"
											placeholder="Owner_Name" name="ownername" value="${company.ownerName }">
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<input type="email" class="form-control" id="inputEmail"
											placeholder="Email" name="email" value="${company.email }">
									</div>
									<div class="form-group col-md-6">

										<select name="townshipid" id="" class="form-control">
											<c:forEach items="${township }" var="t">
												<option value="${t.id }" ${company.township.id == t.id ? 'selected' : '' }>${t.name }</option>
											</c:forEach>
										</select>

									</div>
								</div>
								<div class="form-group">
									<label for="exampleFormControlTextarea1">Remark</label>
									<input class="form-control" id="exampleFormControlTextarea1"
										 name="remark" value="${company.remark }"></input>
								</div>
								<div class="form-group">
									<div class="form-check">
										<input class="form-check-input" type="checkbox" id="gridCheck" value="${check }" name="gridcheck">
										<label class="form-check-label" for="gridCheck" >
											Is_hot? </label>
									</div>
								</div>
								<button type="submit" class="btn btn-primary">Save</button>
								<button type="reset" class="btn btn-danger">Clear</button>
							</form>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<footer class="sticky-footer bg-white">
				<div class="container my-auto">
					<div class="copyright text-center my-auto">
						<span>Copyright &copy; Your Website 2020</span>
					</div>
				</div>
			</footer>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	 <jsp:include page="/resources/logout.jsp"></jsp:include>


</body>

</html>

