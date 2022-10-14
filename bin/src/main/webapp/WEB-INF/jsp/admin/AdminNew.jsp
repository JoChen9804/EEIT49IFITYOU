<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理員資料填寫</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--引用css sweet alert-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<!--引用SweetAlert2.js-->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
<style>
fieldset {
	width: 950px;
	border: 1px solid #D1BBFF;
	border-radius: 15px;
	margin: auto;
}

.happy {
	width: 800px;
	margin: 30px auto;
}

.bdcard {
	width: 300px;
}

.bdcard img {
	display: block;
	width: 100%;
	float: left;
	border: 3px dashed silver;
}

.bdtext {
	width: 450px;
	float: right;
}

.st1 {
	width: 450px;
	border-bottom: 3px dashed silver;
	margin: 10px;
	padding-bottom: 10px;
}

.pic {
	position: absolute;
	left: 30%;
}

.sub {
	position: absolute;
	left: 50%;
}

legend {
	/* text-align: center; */
	color: #5500DD;
	text-align: center;
}
</style>
</head>

<body>
	<%@ include file="AdminstyleHead.jsp"%>
	<FORM ACTION="adminSubmitActionModifyAndNew.controller" method="post"
		enctype="multipart/form-data" id="updateForm">
		<input name="idNumString" value="${account}" type="hidden"> <input
			name="modifyimage" value="false" type="hidden" id="modifyimage">
		<input name="modifyAdminPhoto" value="${modifyAdminPhoto}"
			type="hidden">
		<fieldset>
			<legend>管理員資料填寫</legend>
			<div class="happy">
				<div class="bdcard">
					<div id="result">
						<img src="" height=300 width=300 id="img">
					</div>
				</div>
				<div class="bdtext">
					<div class="st1" style="visibility: hidden;" id="id">
						<label class="t1">編號：</label> <input id="setId" type="text"
							value="${account}" disabled>
					</div>
					<div class="st1">
						<label for="account1" class="t1">帳號：</label> <input id="account1"
							type="text" name="account" autofocus placeholder=""
							autocomplete="off" size="15" required value="">
					</div>
					<div class="st1">
						<label for="pwd1" class="t1">密碼：</label><input id="pwd1"
							type="password" name="pwd" maxlength="15" required
							onblur="validate()"> <span id="tishi"></span>
					</div>
					<div class="st1">
						<label for="pwd2" class="t1">再次輸入密碼：</label><input id="pwd2"
							type="password" name="pwd2" maxlength="15" required
							onblur="validate()"> <span id="tishi"></span> <input
							type="hidden" name="originalRealPassword" value="${pwd}" id="">
					</div>
					<div class="st1">
						<label for="" class="t1">權限：</label> <label> <input
							type="radio" name="authority" value="1" checked id="authority1">管理員
						</label> <label> <input type="radio" name="authority" value="2"
							id="authority2">高級管理員
						</label>
					</div>
					<div style="visibility: hidden">
						<input id="sub" type="text" name="sub">
					</div>

				</div>
			</div>
		</fieldset>
		<br> <input class="pic" type="file" name="filepath"
			accept="image/*" id="file_input"> <br>
		<div class="sub">
			<input type="button" value="送出" id="sub1" class="modifySubmit"> <input
				type="reset" value="清除"> <input type="button" id="goback"
				value="返回">
		</div>
		<br> <br>

		<script>
			$(document)
					.ready(
							function() {
								var account = "${account}";
								if (account) {
									document.getElementById("id").setAttribute(
											"style", "visibility:inline;");
									$('#account1').val("${name}")
									var img = document.getElementById("img");
									img.setAttribute("src", "${modifyAdminPhoto}");
									$('#pwd1').val("******")
									$('#pwd2').val("******")
									if ("${auth}" == 2) {
										document.getElementById("authority1").checked = false;
										document.getElementById("authority2").checked = true;

									}
									document.getElementById("sub")
											.setAttribute("value",
													"modifyAdminSubmitAction");

								} else {
									var img = document.getElementById("img");
									img.setAttribute("src",
											"img/undraw_profile_3.svg");
									document.getElementById("sub")
											.setAttribute("value", "newAdminSubmitAction");
								}

							});

			$("#goback").click(function() {

				$(location).attr("href", "adminAdminAction.controller")
			})
			function formSubmit() {
				var action = "AdminController";
				action += "?otherName=" + document.upload.otherName.value;
				document.upload.action = action;
				document.upload.submit();
			}
			function validate() {
				var pwd1 = document.getElementById("pwd1").value;

				var pwd2 = document.getElementById("pwd2").value;

				if (pwd1 == pwd2) {
					document.getElementById("tishi").innerHTML = "<font color='green'兩次密碼相同</font>";
					document.getElementById("sub1").disabled = false;
				} else {
					document.getElementById("tishi").innerHTML = "<font color='red'>兩次密碼不相同</font>";
					document.getElementById("sub1").disabled = true;
				}
			}
			var result = document.getElementById("result");
			var input = document.getElementById("file_input");

			if (typeof FileReader === 'undefined') {
				result.innerHTML = "Sorry, 瀏覽器不支持 FileReader";
				input.setAttribute('disabled', 'disabled');
			} else {
				input.addEventListener('change', readFile, false);
			}

			function readFile() {
				$('#modifyimage').val("true")
				var file = this.files[0];
				var reader = new FileReader();
				reader.readAsDataURL(file);
				reader.onload = function(e) {
					result.innerHTML = '<img src="' + this.result + '" alt="" height="300" widht="300"/>'
				}
			}
			$(".modifySubmit").on('click', function(event){

				  Swal.fire({
					  title:'送出成功!',
					  icon:'success'
				  }).then((result) => {
			   		  $('#updateForm').submit();
					});

	});
		</script>
	</form>
	<%@ include file="AdminstyleFoot.jsp"%>
</body>
</html>