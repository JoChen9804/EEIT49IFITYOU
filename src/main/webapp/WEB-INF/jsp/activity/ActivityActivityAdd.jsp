<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
<title>新增活動</title>
<link rel="stylesheet" href="/group5/css/voucherStyle.css">

<link href="/group5/css/bootstrap.css" rel="stylesheet">
<link href="/group5/css/fontawesome-all.css" rel="stylesheet">
<link href="/group5/css/swiper.css" rel="stylesheet">
<link href="/group5/css/magnific-popup.css" rel="stylesheet">
<link href="/group5/css/styles.css" rel="stylesheet">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>

<!-- sweet alert2 -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- ckeditor5 -->
<script src="https://cdn.ckeditor.com/ckeditor5/35.2.0/super-build/ckeditor.js"></script>

 <style>
            #container {
                width: 1100px;
                margin: 20px auto;
            }
            .ck-editor__editable[role="textbox"] {
                /* editing area */
                min-height: 750px;
            }
            .ck-content .image {
                /* block images */
                max-width: 80%;
                margin: 20px auto;
            }
        </style>
</head>
<body>

	<%@ include file="../admin/AdminstyleHead.jsp" %>

	<form:form action="/group5/admin/addactivity.controller" method="post" modelAttribute="activity" enctype="multipart/form-data">

		<form:input type="hidden" path="a_account" value="${loginMember.adminName }"/>

			<H2 style="text-align: center;">活動資料</H2>
			
			
			<!-- Details -->
			<div class="card shadow mb-4" style="margin: 2rem 4.7rem;">
    <div id="details" class="basic-1" style="padding-top: 0; padding-bottom: 2.5rem;">
        <div class="container">
            <div class="row">
                <div class="col-lg-6" style="margin-bottom: -3rem;">
	           <!-- <div class="card shadow mb-4" > left shadow card -->
                    <div class="text-container">
                        <ul class="list-unstyled li-space-lg">
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
									活動名稱: <form:input type="text" id="activityTitle" path="activityTitle" placeholder="activityTitle" class="need"/>＊請勿超過20個字
								</div>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
                               		活動類型: <form:input type="text" id="typeContent" path="typeContent" placeholder="typeContent" class="need"/>＊
								</div>
                            </li>
                            <li class="media">
                               	<i class="fas fa-square"></i>
                               	<div class="media-body">
									主辦方: <form:input type="text" id="holder" path="holder" placeholder="holder" class="need"/>＊
								</div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
									活動地點: <form:input type="text" id="location" path="location" placeholder="location" class="need"/>＊
								</div>
                            </li>
                            <li class="media">
	                            <i class="fas fa-square"></i>
	                            <div class="media-body">
									活動開始日: <form:input type="date" path="startTime" id="startTime" class="need"/>＊
								</div>
	                        </li>
	                        <li class="media">
	                            <i class="fas fa-square"></i>
	                            <div class="media-body">
									活動結束日: <form:input type="date" path="endTime" id="endTime" class="need"/>＊
								</div>
							</li>
                        </ul>
                    </div> <!-- end of text-container -->
               <!--	</div> end of left shadow car -->
                </div> <!-- end of col -->
                <div class="col-lg-6" style="align-items: center; display: flex;">
               <!--	<div class="card shadow mb-4">right shadow card -->
					<ul class="list-unstyled li-space-lg">
						<li class="media">
                        	<i class="fas fa-square"></i>
                            <div class="media-body">
								報名截止日: <form:input type="date" path="signUpDeadline" id="deadline" class="need"/>＊
							</div>
                        </li>	
						<li class="image-container" style="margin:0px">
							<i class="fas fa-square"></i>
	                    	封面: <input type="file" id="ff" name="photo"/>
	                    	<img  id="img1" width="200">
						</li> <!-- end of image-container -->
                    </ul>
               <!-- </div> end of right shadow car -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of basic-1 -->
    </div>
    <!-- end of details -->

			<!-- <form:textarea path="activityContent" id="activityContent" cols="70" rows="15" class="need"></form:textarea> -->
			<div id="container" class="card shadow mb-4" style="margin-top: 3rem;">
				<div id="editor"></div>
			</div>
			<input type="hidden" id="activityContent" name="activityContent" >
			
		
		<div class="sub">
			<input type="button" id="add" class="btn-solid-reg page-scroll" value="送出">
			<input type="hidden" name="add" value="送出">
			<a href="activitymain.controller"><input type="button" class="btn-solid-reg page-scroll" value="返回"></a>
			&emsp;&emsp;
			<input type="button" class="btn-solid-reg page-scroll" id="lazyinput" value="一鍵輸入">
		</div>
	</form:form>
	
	<!-- ckeditor5 -->
	<script>
	/*
    ClassicEditor
        .create( document.querySelector( '#editor' )
        		, {
			ckfinder:{
				uploadUrl: "/group5/admin/uploadimages"
			}
        })
        .then(editor => {
            myEditor = editor;
            // 设置初始值
        })
        .catch( error => {
            console.error( error );
        });
	*/
	
	 CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
	    	/*
	    	ckfinder:{
				uploadUrl: "/group5/admin/uploadimages"
			},*/
	        // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
	        toolbar: {
	            items: [
	                'exportPDF','exportWord', '|',
	                'findAndReplace', 'selectAll', '|',
	                'heading', '|',
	                'bold', 'italic', 'strikethrough', 'underline', 'code', 'subscript', 'superscript', 'removeFormat', '|',
	                'bulletedList', 'numberedList', 'todoList', '|',
	                'outdent', 'indent', '|',
	                'undo', 'redo',
	                '-',
	                'fontSize', 'fontFamily', 'fontColor', 'fontBackgroundColor', 'highlight', '|',
	                'alignment', '|',
	                'link', 'insertImage', 'blockQuote', 'insertTable', 'mediaEmbed', 'codeBlock', 'htmlEmbed', '|',
	                'specialCharacters', 'horizontalLine', 'pageBreak', '|',
	                'textPartLanguage', '|',
	                'sourceEditing'
	            ],
	            shouldNotGroupWhenFull: true
	        },
	        list: {
	            properties: {
	                styles: true,
	                startIndex: true,
	                reversed: true
	            }
	        },
	        heading: {
	            options: [
	                { model: 'paragraph', title: 'Paragraph', class: 'ck-heading_paragraph' },
	                { model: 'heading1', view: 'h1', title: 'Heading 1', class: 'ck-heading_heading1' },
	                { model: 'heading2', view: 'h2', title: 'Heading 2', class: 'ck-heading_heading2' },
	                { model: 'heading3', view: 'h3', title: 'Heading 3', class: 'ck-heading_heading3' },
	                { model: 'heading4', view: 'h4', title: 'Heading 4', class: 'ck-heading_heading4' },
	                { model: 'heading5', view: 'h5', title: 'Heading 5', class: 'ck-heading_heading5' },
	                { model: 'heading6', view: 'h6', title: 'Heading 6', class: 'ck-heading_heading6' }
	            ]
	        },
	        placeholder: '請編輯輸入活動內容...',
	        fontFamily: {
	            options: [
	                'default',
	                'Arial, Helvetica, sans-serif',
	                'Courier New, Courier, monospace',
	                'Georgia, serif',
	                'Lucida Sans Unicode, Lucida Grande, sans-serif',
	                'Tahoma, Geneva, sans-serif',
	                'Times New Roman, Times, serif',
	                'Trebuchet MS, Helvetica, sans-serif',
	                'Verdana, Geneva, sans-serif'
	            ],
	            supportAllValues: true
	        },
	        fontSize: {
	            options: [ 10, 12, 14, 'default', 18, 20, 22 ],
	            supportAllValues: true
	        },
	        htmlSupport: {
	            allow: [
	                {
	                    name: /.*/,
	                    attributes: true,
	                    classes: true,
	                    styles: true
	                }
	            ]
	        },
	        htmlEmbed: {
	            showPreviews: true
	        },
	        link: {
	            decorators: {
	                addTargetToExternalLinks: true,
	                defaultProtocol: 'https://',
	                toggleDownloadable: {
	                    mode: 'manual',
	                    label: 'Downloadable',
	                    attributes: {
	                        download: 'file'
	                    }
	                }
	            }
	        },
	        mention: {
	            feeds: [
	                {
	                    marker: '@',
	                    feed: [
	                        '@apple', '@bears', '@brownie', '@cake', '@cake', '@candy', '@canes', '@chocolate', '@cookie', '@cotton', '@cream',
	                        '@cupcake', '@danish', '@donut', '@dragée', '@fruitcake', '@gingerbread', '@gummi', '@ice', '@jelly-o',
	                        '@liquorice', '@macaroon', '@marzipan', '@oat', '@pie', '@plum', '@pudding', '@sesame', '@snaps', '@soufflé',
	                        '@sugar', '@sweet', '@topping', '@wafer'
	                    ],
	                    minimumCharacters: 1
	                }
	            ]
	        },
	        removePlugins: [
	            'CKBox',
	            'CKFinder',
	            'EasyImage',
	            'RealTimeCollaborativeComments',
	            'RealTimeCollaborativeTrackChanges',
	            'RealTimeCollaborativeRevisionHistory',
	            'PresenceList',
	            'Comments',
	            'TrackChanges',
	            'TrackChangesData',
	            'RevisionHistory',
	            'Pagination',
	            'WProofreader',
	            // Careful, with the Mathtype plugin CKEditor will not load when loading this sample
	            // from a local file system (file://) - load this site via HTTP server if you enable MathType
	            'MathType'
	        ]
	    }).then(editor => {
	        myEditor = editor;
	        // 设置初始值
	    })
	    .catch( error => {
	        console.error( error );
	    });
	
	</script>
	
<script> 
	
	$(function(){
		$('#forColor').attr('style', 'background-color:white' );
		
	});
	
	$('#ff').on('change', function(e){      
		
		console.log("圖片預覽");
		
  		const file = this.files[0];
  		const objectURL = URL.createObjectURL(file);
  		
  		$('#img1').attr('src', objectURL);
		});
	
	
    $("#add").on('click', function(event){
    		
    	$("#activityContent").val(myEditor.getData());
    		
		var rs = false;
    	$(".need").each(function(){
    		if($(this).val()==""){
    	    	console.log('檢查到欄位有空值!');
        		Swal.fire({
    				title:'資料不完整',
   					text:'請檢查＊號欄位是否都有填入',
   					icon:'warning'
   				});
   		   		rs = true;
       		}
   		});
   		if(rs)return;
   		
   		let date = new Date();
		if(date.toISOString().split('T')[0] >= $('#endTime').val() || date.toISOString().split('T')[0] >= $('#deadline').val()){
			Swal.fire({
				title:'日期錯誤',
				text:'結束日期已過請重新選擇',
				icon:'warning'
			})
	   		return;
	    }
		if($('#startTime').val() > $('#endTime').val()){
			Swal.fire({
				title:'日期錯誤',
				text:'開始日期大於結束日期',
				icon:'warning'
			})
	   		return;
	    }
		$(this).parent().parent().submit();
   	});
    
    //一鍵輸入
    $('#lazyinput').on('click', function(){
    	$('#activityTitle').val('測試活動');
    	$('#typeContent').val('測試');
    	$('#holder').val('EEIT49_Group5');
    	$('#location').val('聖德基督學院');
    	$('#deadline').val('2022-11-01');
    	$('#startTime').val('2022-12-15');
    	$('#endTime').val('2022-12-30');
    	myEditor.setData('<p style="text-align:center;"><span style="font-size:22px;">活動內容</span></p><p style="text-align:center;"><strong>台北市建築世代會為專業建築開發之新世代領導者組成，擁有共同理念。</strong><br><s>將『家』的溫度、『城市的文明』一磚一瓦建造成型，取之於社會用之於社會。</s><br>常年以行動散播愛分享愛，舉辦慈善耶誕路跑<br>今年即將邁入10週年，讓我們一同藉由運動一同響應公益，為愛而跑，讓更多孩童獲得實質的支持與幫助。<br>路跑報名費所得將全數捐贈。</p><p><img class="image_resized" style="width:27.55%;" src="/Path/upload1665202075808.jpg"></p><p style="text-align:center;">這次一隻可愛的鳥</p>');
    })
    
</script>

	<%@ include file="../admin/AdminstyleFoot.jsp"%>
	
</body>
</html>