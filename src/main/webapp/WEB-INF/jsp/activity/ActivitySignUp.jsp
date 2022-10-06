<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I FIT YOU</title>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<%@ include file="../admin/FrontStageHead.jsp"%>

<!-- JQuery  連結-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- sweetalert2   連結-->
	<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>


	<!-- Details -->
    <div id="details" class="basic-1">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="image-container">
                    <br><br>
                        <img class="img-fluid" src="/Path/${signUpActivity.photoData}" alt="alternative">
                    </div> <!-- end of image-container -->
                </div> <!-- end of col -->
                <div class="col-lg-6">
                    <div class="text-container">
                        <h2>活動報名表</h2>
                        <p>
                        報名活動: ${signUpActivity.activityTitle}<br>
                        活動時間: ${signUpActivity.startTime} ~ ${signUpActivity.endTime}<br>
                        </p>
                        <form action="/group5/user/signupadd.controller" method="post">
                        <ul class="list-unstyled li-space-lg">
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
                                <!-- 帳號: <input type="text" style="margin-bottom: 0.5em; " value="${loginM.memberAccount}" disabled="disabled"> -->
                                <p>帳號: ${loginM.memberAccount}</p>
                                <input type="hidden" name="memberAccount" value="${loginM.memberAccount}"/>
								</div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
                                <!-- 姓名: <input type="text" style="margin-bottom: 0.5em;" name="memberName" value="${loginM.memberName}" disabled="disabled"> -->
                                <p>姓名: ${loginM.memberName}</p>
                                <input type="hidden" name="memberName" value="${loginM.memberName}"/>
								</div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
                                email: <input type="text" style="margin-bottom: 0.5em;" name="memberEmail" id="signUpMail" value="${loginM.email}">
								</div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
                                連絡電話: <input type="text" style="margin-bottom: 0.5em;" name="memberPhone" id="signUpPhone" value="${loginM.memberDetail.cellphone}"/>
								</div>
                            </li>
                        </ul>
                        <input type="hidden" name="memberId" value="${loginM.id}"/>
                        <input type="hidden" name="activityId" value="${signUpActivity.activityId}"/>
                        <input type="button" id="confirmSignUp" value="確定報名" class="btn-solid-reg page-scroll"/>
                         &emsp;
                        <a class="btn-solid-reg page-scroll" href="/group5/toactivity/${signUpActivity.activityId}">返回</a>
                        </form>
                       
                    </div> <!-- end of text-container -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of basic-1 -->
    <!-- end of details -->
    
    <script type="text/javascript">
    	$('#confirmSignUp').click(function(){
    		if($('#signUpMail').val()=='' || $('#signUpPhone').val()==''){
				Swal.fire({
					title:'資料不完整',
					text:'聯絡資料不可空白',
					icon:'warning'
				});
			}else{
			Swal.fire({
				  title:'聯絡資料確認無誤?',
				  text: 'Email、連絡電話',
				  icon: 'question',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '確認',
				  cancelButtonText: '取消'
				}).then((result) => {
				  if (result.isConfirmed) {
					  Swal.fire(
						      '報名成功!',
						      '已幫您登入資料',
						      'success'
						    ).then((result) => {
				   				 $(this).parent().submit();
						    });
				  }
				});
			}
    	});
    </script>
    
<%@ include file="../admin/FrontStageFoot.jsp"%>
</body>
</html>