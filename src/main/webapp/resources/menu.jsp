<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	<!-- Sidebar - Brand -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
	  <div class="sidebar-brand-icon ">
	    <i class="fas fa-search-dollar"></i>
	  </div>
	  <div class="sidebar-brand-text mx-3 text-italic">Recruiter</div>
	</a>
	
	<!-- Divider -->
	<hr class="sidebar-divider my-0">
	
	<!-- Nav Item - Dashboard -->
	<li class="nav-item">
	  <a class="nav-link" href="dashboard.jsp">
	    <i class="fas fa-fw fa-tachometer-alt"></i>
	    <span>Dashboard</span></a>
	</li>
	
	<!-- Divider -->
	<hr class="sidebar-divider">
	
	<!-- Heading -->
	<div class="sidebar-heading">
	  Interface
	</div>
	
	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseTwo"
		aria-expanded="true" aria-controls="collapseTwo"> <i
			class="fas fa-briefcase"></i> <span>Job Order</span></a>
	</li>
	
	<!-- Nav Item - Utilities Collapse Menu -->
	<c:url value="/company" var="company"></c:url>
	<li class="nav-item"><a class="nav-link collapsed" href="${company }"> 
		<i class="fas fa-users"></i> <span>Candidates</span></a> 
	</li>	
	
	<!-- Nav Item - Utilities Collapse Menu -->
	<c:url value="/company" var="company"></c:url>
	<li class="nav-item">
	<a class="nav-link collapsed" href="${company }"> 
		<i class="far fa-building"></i> <span>Company</span></a> 
	</li>	
	<!-- Divider -->
	<hr class="sidebar-divider"> 
	<!-- Heading -->
	<div class="sidebar-heading">Addons</div> 
	
	<!-- Nav Item - Utilities Collapse Menu -->
	<c:url value="/company" var="company"></c:url>
	<li class="nav-item"><a class="nav-link collapsed" href="${company }"> 
		<i class="fas fa-users"></i> <span>Recruiter</span></a> 
	</li>
	 <!-- Divider -->
	 <hr class="sidebar-divider">
	
	 <!-- Heading -->
	 <div class="sidebar-heading">
	   Addons
	 </div>
	
	 <!-- Nav Item - Tables -->
	 <li class="nav-item active">
	   <a class="nav-link" href="tables.html">
	     <i class="fas fa-fw fa-table"></i>
	     <span>Tables</span></a>
	 </li>
	
	 <!-- Divider -->
	 <hr class="sidebar-divider d-none d-md-block">
	
	 <!-- Sidebar Toggler (Sidebar) -->
	 <div class="text-center d-none d-md-inline">
	   <button class="rounded-circle border-0" id="sidebarToggle"></button>
	 </div>
</ul>
<!-- End of Sidebar -->
    
    
    