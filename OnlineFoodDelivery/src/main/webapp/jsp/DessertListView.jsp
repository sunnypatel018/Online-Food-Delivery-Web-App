
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.online.food.delivery.bean.DessertBean"%>
<%@page import="in.co.online.food.delivery.controller.DessertListCtl"%>
<%@page import="in.co.online.food.delivery.util.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dessert List</title>
</head>
<body>
<%@ include file="Header.jsp" %>

<section class="ftco-section">
<form action="<%=OFDView.DESSERT_LIST_CTL%>" method="post">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
            <h2 class="mb-4">Dessert List</h2>
            <b><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></b>
			<b><font color="green"><%=ServletUtility.getSuccessMessage(request)%></font></b>
	          </div>
        </div>
    	</div>
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
            <div class="row">
						<div class="col-md-6">
						<div class="form-group">
								<input type="text" name="name" class="form-control"
									value="<%=ServletUtility.getParameter("name", request)%>"
									placeholder="Enter Dessert Name"> 
							</div>
						</div>
						
						<div class="col-md-6">
						<div class="form-group">
						<input type="submit" name="operation"
							class="btn btn-primary py-3 px-5"
							value="<%=DessertListCtl.OP_SEARCH%>"> 
							</div>
							
						</div>
					</div>
					</div>		
          </div>
        </div>
    	
    	
    	<div class="container-wrap">
    		<div class="row no-gutters d-flex">
    		<%
					int pageNo = ServletUtility.getPageNo(request);
					int pageSize = ServletUtility.getPageSize(request);
					int index = ((pageNo - 1) * pageSize) + 1;
					
					
					DessertBean bean = null;
					
					List list = ServletUtility.getList(request);
					
					Iterator<DessertBean> it = list.iterator();
					
					while (it.hasNext()) {
						bean = it.next();
				%>
    		
    			<div class="col-lg-4 d-flex ftco-animate">
    				<div class="services-wrap d-flex">
    					<a href="#" class="img" style="background-image: url(../images/<%=bean.getImage()%>);"></a>
    					<div class="text p-4">
    						<h3><%=bean.getDessertName()%></h3>
    						<p><%=bean.getDessertDescription()%></p>
    						<p>MRP:&nbsp;$<%=bean.getFoodPrice()%>&nbsp;Rs&nbsp;Discount:&nbsp;<%=bean.getDisscount()%>%</p>
    						<p class="price"><span><%=bean.getFinalPrice()%>&nbsp;Rs</span></p>
    						<p class="price">
    						
    						<%UserBean uBean=(UserBean)session.getAttribute("user");%>
    						
    						<%if(uBean.getRoleId()==2){%>
    							<a href="DessertListCtl?dsD=<%=bean.getId()%>" class="ml-2 btn btn-white btn-outline-white">Delete</a>
    						<a href="DessertCtl?id=<%=bean.getId()%>" class="ml-2 btn btn-white btn-outline-white">Edit</a>
    						<%}else if(uBean.getRoleId()==3){%>
    						<a href="DessertChartCtl?dsD=<%=bean.getId()%>" class="ml-2 btn btn-white btn-outline-white">AddCart</a>
    						<a href="DessertOrderCtl?onfdDDI=<%=bean.getId()%>" class="ml-2 btn btn-white btn-outline-white">Order</a>
    						<%} %>
    						</p>
    					</div>
    				</div>
    			</div>
    			
    			<%} %>
    		</div>
    	</div>
    	<input type="hidden" name="pageNo" value="<%=pageNo%>"> <input
				type="hidden" name="pageSize" value="<%=pageSize%>">
    	</form>
    	</section>
    	<%@ include file="Footer.jsp" %>
</body>
</html>