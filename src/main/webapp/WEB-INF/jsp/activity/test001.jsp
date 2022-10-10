<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- JQuery  連結-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

	<button id="qqq">測試</button>
	
	<script type="text/javascript">
	
	$('#qqq').click(function(){
			let x = {"testId":"測試id","testName":"測試name"}
		$.ajax({
			type: "post",
			url: "/group5/test001",
			data:x,
			contentType: "application/x-www-form-urlencoded",
			success: function(){
				console.log('成功');
			},
			error: function(){
				console.log('失敗');
			}
		});
	});
	
	
	</script>

</body>
</html>