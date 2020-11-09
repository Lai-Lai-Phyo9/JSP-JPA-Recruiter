<%@page import="com.recruitment.team.model.entity.Recruiter"%>
<%@page import="java.util.List"%>
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
						<c:url var="add" value="/company-add"></c:url>
						<a href="${add }" class="btn btn-secondary"><i
							class="fas fa-plus mx-2"></i><span>Add Company</span>
						</a>
					</div>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">CompanyList
							</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<thead>
										<tr>
											<th>ID</th>
											<th>Name</th>
											<th>Phone-1</th>
											<th>Phone-2</th>
											<th>Email</th>
											<th>Township Name</th>
											<th>Action</th>
											
										</tr>
									</thead>
									<tbody>
										<!--  item list -->
										<c:forEach items="${companies}" var="c">
											<tr>
												<td>${c.id }</td>
						                		<td>${c.name }</td>
						                		<td>${c.phone1 }</td>
						                		<td>${c.phone2 }</td>
						                		<td>${c.email }</td>
						                		<td>${c.township.name }</td>
												<td>
													<c:url var="edit" value="/company-edit">
														<c:param name="companyid">${c.id }</c:param>
													</c:url>
													<a href="${ edit}" class="btn btn-outline-success">Edit</a>
												
													<c:url var="delete" value="/company-delete">
														<c:param name="companyid">${c.id }</c:param>
													</c:url>
													<a href="${delete }" class="btn btn-outline-danger">Delete</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
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

