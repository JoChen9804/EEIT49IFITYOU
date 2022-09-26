<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta charset="UTF-8">
<title>分派優惠券</title>
</head>
<body>

	<%@ include file="../admin/AdminstyleHead.jsp" %>
	
	<!-- JQuery  連結-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<!-- DataTable 連結 -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>
	

	<!-- sweetalert2   連結-->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
	
	<!-- fontawesome 連結 -->
	<script src="https://kit.fontawesome.com/5b36a12f3a.js" crossorigin="anonymous"></script>
	

	<H2 style="display: inline">分發操作</H2>
	&emsp;&emsp;&emsp;
	<form id="add" action="addpromotions.controller" enctype="multipart/form-data" method="post" class="btn btn-info btn-icon-split">
		<span class="icon text-white-50"> <i class="fas fa-flag"></i></span>
		<input type="submit" name="add" value="新增" class="text" style="border: none; background-color: #36b9cc; color: white" />
	</form>
	<form id="add" action="vouchermain.controller" enctype="multipart/form-data" method="get" class="btn btn-info btn-icon-split" style="border: #adb5bd;">
		<span class="icon text-white-50 " style="background-color: #adb5bd;"> <i class="fa-solid fa-rotate-left" ></i></span>
		<input type="submit" name="add" value="返回" class="text" style="border: none; background-color: #adb5bd; color: white" />
	</form>
	
	<h4>優惠:${voucher_name}</h4>
	
    <table class="table table-bordered" id="table_id" class="compact hover stripe" style="border:none">
        <thead>
            <tr>
                <th>持有會員</th>
                <th>負責管理員</th>
                <th>最後修改時間</th>
                <th style="width: 65px">操作</th>
            </tr>
        </thead>
        <c:forEach var="pqa" items="${promotions_queryAll}">
            <tr>
                <td>${pqa.member.id} : ${pqa.member.memberAccount}</td>
                <td>${pqa.a_account}</td>
                <td>${pqa.reviseTime}</td>
                <td>
                    <form ACTION="deletepromotions.controller" method="post">
                        <input type="hidden" name="dataId" value="${pqa.id}" />
                        <input type="hidden" name="voucherTitle" value="${pqa.member.getMemberAccount()}" />
                        <input type="submit" id="delete" name="delete" class="del btn btn-outline-danger" value="刪除" />
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
    
    <script>$('#table_id').dataTable({});</script>
    
    <%@ include file="../admin/AdminstyleFoot.jsp"%>
    
</body>
</html>