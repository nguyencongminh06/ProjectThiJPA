<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>javaguides.net</title>
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<%@ page isELIgnored="false"%>
<script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>
	<div class="container">
		<div class="col-md-offset-1 col-md-10">
			<h3 class="text-center">Danh sách khách hàng</h3>
			<hr />

			<input type="button" value="Thêm Mới"
				onclick="window.location.href='showForm'; return false;"
				class="btn btn-primary" /> <br />
			<br />
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="panel-title">Danh Sách khách hàng</div>
				</div>
				<div class="panel-body">
					<table class="table table-striped table-bordered">
						<tr>
							<th>Loại khách</th>
							<th>Họ</th>
							<th>Tên</th>
							<th>Ngày sinh</th>
							<th>Email</th>
							<th>Giới tính</th>
							<th>Số điện thoại</th>
							<th>Sửa</th>
						</tr>

						<!-- loop over and print our customers -->
						<c:forEach var="tempCustomer" items="${customers}">

							<!-- construct an "update" link with customer id -->
							<c:url var="updateLink" value="/customer/updateForm">
								<c:param name="customerId" value="${tempCustomer.id}" />
							</c:url>

							<!-- construct an "delete" link with customer id -->
							<c:url var="deleteLink" value="/customer/delete">
								<c:param name="customerId" value="${tempCustomer.id}" />
							</c:url>

							<tr>
								<td>${tempCustomer.category}</td>
								<td>${tempCustomer.firstName}</td>
								<td>${tempCustomer.lastName}</td>
								<td>${tempCustomer.datetime}</td>
								<td>${tempCustomer.sex}</td>
								<td>${tempCustomer.phone}</td>
								<td>${tempCustomer.email}</td>
								<td>${tempCustomer.province.name}</td>
								<td>
									<c:forEach var="hobby" items="${tempCustomer.hobbies}">
									<span class="btn-sm">${hobby.name}</span>
									</c:forEach>
								</td>
								
								<td>
									<!-- display the update link --> <a href="${updateLink}">Sửa</a>
									| <a href="${deleteLink}"
									onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Xóa</a>
								</td>

							</tr>

						</c:forEach>

					</table>

				</div>
			</div>
		</div>

	</div>
	<div class="footer">
		<p></p>
	</div>
</body>

</html>