<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="tw.group5.activity.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增確認</title>
<link rel="stylesheet" href="/css/voucherStyle.css">
</head>
<body>
	<!-- JQuery  連結-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<div id="show"></div>

	
	<script type="text/javascript">
		$(function() {
			var page = `${page}`;
			console.log("顯示頁面 : " + page);
			
			if(page=="voucher"){
				$('#show').html(`
						<h2>優惠券詳細資料確認</h2>
						<form action="vouchermain.controller" method="get">
							<fieldset>
								<legend>優惠券資料</legend>
								<div class="st1">
									<label for="voucherNo" class="t1">優惠券編號:</label>
									<c:choose>
											<c:when test="${upd}">${update_voucher.voucherNo}</c:when>
											<c:when test="${query}">${query_voucher.voucherNo}</c:when>
											<c:otherwise>${add_voucher.voucherNo}</c:otherwise>
									</c:choose>
								</div>

								<div class="st1">
									<label for="voucherTitle" class="t1">優惠券標題:</label> <label>
										<c:choose>
											<c:when test="${upd}">${update_voucher.voucherTitle}</c:when>
											<c:when test="${query}">${query_voucher.voucherTitle}</c:when>
											<c:otherwise>${add_voucher.voucherTitle}</c:otherwise>
										</c:choose>
									</label>
								</div>

								<div class="st1">
									<label class="t1">到期日:</label>
									<c:choose>
										<c:when test="${upd}">${update_voucher.expiryTime}</c:when>
										<c:when test="${query}">${query_voucher.expiryTime}</c:when>
										<c:otherwise>${add_voucher.expiryTime}</c:otherwise>
									</c:choose>
								</div>
							</fieldset>

							<fieldset>
								<legend>說明內容</legend>

									<label style="float: left; margin: 3px;">內容:</label>
								<div class="st1">
									<br>
									<c:choose>
										<c:when test="${upd}">${update_voucher.voucherContent}</c:when>
										<c:when test="${query}">${query_voucher.voucherContent}</c:when>
										<c:otherwise>${add_voucher.voucherContent}</c:otherwise>
									</c:choose>
								</div>
								
								<div class="st1">
									<label style="float: left; margin: 3px;">圖片:</label> 
									<br>
									<br>
									<img width="400" src='/Path/<c:choose>
										<c:when test="${upd}">${update_voucher.photoData}</c:when>
										<c:when test="${query}">${query_voucher.photoData}</c:when>
										<c:otherwise>${add_voucher.photoData}</c:otherwise>
									</c:choose>' />
								</div>
								
							</fieldset>
							
							<div class="sub">
								<input type="submit" value="返回查詢">
							</div>
						</form>	
				`);
			}else if(page=="activity"){
				$('#show').html(`
						<h2>活動詳細資料確認</h2>
						<form action="activitymain.controller" method="get">
							<fieldset>
								<legend>活動資料</legend>
								<div class="st1">
									<label class="t1">活動名稱:</label>
									<c:choose>
											<c:when test="${upd}">${update_activity.activityTitle}</c:when>
											<c:when test="${query}">${query_activity.activityTitle}</c:when>
											<c:otherwise>${add_activity.activityTitle}</c:otherwise>
									</c:choose>
								</div>

								<div class="st1">
									<label class="t1">活動類型:</label> <label>
										<c:choose>
											<c:when test="${upd}">${update_activity.typeContent}</c:when>
											<c:when test="${query}">${query_activity.typeContent}</c:when>
											<c:otherwise>${add_activity.typeContent}</c:otherwise>
										</c:choose>
									</label>
								</div>

								<div class="st1">
									<label class="t1">主辦方:</label>
									<c:choose>
										<c:when test="${upd}">${update_activity.holder}</c:when>
										<c:when test="${query}">${query_activity.holder}</c:when>
										<c:otherwise>${add_activity.holder}</c:otherwise>
									</c:choose>
								</div>
								
								<div class="st1">
									<label class="t1">活動地點:</label>
									<c:choose>
										<c:when test="${upd}">${update_activity.location}</c:when>
										<c:when test="${query}">${query_activity.location}</c:when>
										<c:otherwise>${add_activity.location}</c:otherwise>
									</c:choose>
								</div>
								
								<div class="st1">
									<label class="t1">活動開始日:</label>
									<c:choose>
										<c:when test="${upd}">${update_activity.startTime}</c:when>
										<c:when test="${query}">${query_activity.startTime}</c:when>
										<c:otherwise>${add_activity.startTime}</c:otherwise>
									</c:choose>
								</div>
								
								<div class="st1">
									<label class="t1">活動結束日:</label>
									<c:choose>
										<c:when test="${upd}">${update_activity.endTime}</c:when>
										<c:when test="${query}">${query_activity.endTime}</c:when>
										<c:otherwise>${add_activity.endTime}</c:otherwise>
									</c:choose>
								</div>
							</fieldset>

							<fieldset>
								<legend>說明內容</legend>

									<label style="float: left; margin: 3px;">活動內容:</label>
								<div class="st1">
									<br>
									<c:choose>
										<c:when test="${upd}">${update_activity.activityContent}</c:when>
										<c:when test="${query}">${query_activity.activityContent}</c:when>
										<c:otherwise>${add_activity.activityContent}</c:otherwise>
									</c:choose>
								</div>
								
								<div class="st1">
									<label for="memo" style="float: left; margin: 3px;">圖片:</label> 
									<br>
									<br>
									<img width="400" src='/Path/<c:choose>
										<c:when test="${upd}">${update_activity.photoData}</c:when>
										<c:when test="${query}">${query_activity.photoData}</c:when>
										<c:otherwise>${add_activity.photoData}</c:otherwise>
									</c:choose>' />
								</div>
								
							</fieldset>
							
							<div class="sub">
								<input type="submit" value="返回查詢">
							</div>
						</form>
				`);
			}
			
			
		});
	</script>
</body>
</html>