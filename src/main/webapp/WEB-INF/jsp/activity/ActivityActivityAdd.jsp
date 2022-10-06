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

<style type="text/css">
.ck-editor__editable {
                min-height: 300px;
            }
</style>
</head>
<body>

	<%@ include file="../admin/AdminstyleHead.jsp" %>

	<form:form action="/group5/admin/addactivity.controller" method="post" modelAttribute="activity" enctype="multipart/form-data">

		<form:input type="hidden" path="a_account" value="${loginMember.adminName }"/>

			<H2>活動資料</H2>
			
			
			<!-- Details -->
    <div id="details" class="basic-1" style="padding-top: 2.5rem; padding-bottom: 2.5rem;">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="text-container">
                        <ul class="list-unstyled li-space-lg">
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
									活動名稱: <form:input type="text" path="activityTitle" placeholder="activityTitle" class="need"/>＊請勿超過20個字
								</div>
							</li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
                               		活動類型: <form:input type="text" path="typeContent" placeholder="typeContent" class="need"/>＊
								</div>
                            </li>
                            <li class="media">
                               	<i class="fas fa-square"></i>
                               	<div class="media-body">
									主辦方: <form:input type="text" path="holder" placeholder="holder" class="need"/>＊
								</div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
									活動地點: <form:input type="text" path="location" placeholder="location" class="need"/>＊
								</div>
                            </li>
                            <li class="media">
                                <i class="fas fa-square"></i>
                                <div class="media-body">
									報名截止日: <form:input type="date" path="signUpDeadline" id="deadline" class="need"/>＊
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
                </div> <!-- end of col -->
                <div class="col-lg-6" style="align-items: center; display: flex;">
                    <div class="image-container">
                    	封面: <input type="file" id="ff" name="photo"/>
                    	<img  id="img1" width="200">
					</div> <!-- end of image-container -->
                </div> <!-- end of col -->
            </div> <!-- end of row -->
        </div> <!-- end of container -->
    </div> <!-- end of basic-1 -->
    <!-- end of details -->

			<!-- <form:textarea path="activityContent" id="activityContent" cols="70" rows="15" class="need"></form:textarea> -->
			<div id="editor"></div>
			<input type="hidden" id="activityContent" name="activityContent" >
			
		
		<div class="sub">
			<input type="button" id="add" value="送出">
			<input type="hidden" name="add" value="送出">
			<a href="activitymain.controller"><input type="button" value="返回"></a>
		</div>
	</form:form>
	
<<<<<<< HEAD
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
	    	
	    	ckfinder:{
				uploadUrl: "/group5/admin/uploadimages"
			},
	        // https://ckeditor.com/docs/ckeditor5/latest/features/toolbar/toolbar.html#extended-toolbar-configuration-format
=======
	<script type="text/javascript">
	
	/**
	 * ckeditor5 
	 */
	 
	 CKEDITOR.ClassicEditor.create(document.getElementById("editor"), {
	    	
	    	ckfinder:{
				uploadUrl: "/group5/admin/uploadimages"
			},
>>>>>>> merge1005
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
<<<<<<< HEAD
	        // Changing the language of the interface requires loading the language file using the <script> tag.
	        // language: 'es',
=======
>>>>>>> merge1005
	        list: {
	            properties: {
	                styles: true,
	                startIndex: true,
	                reversed: true
	            }
	        },
<<<<<<< HEAD
	        // https://ckeditor.com/docs/ckeditor5/latest/features/headings.html#configuration
=======
>>>>>>> merge1005
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
<<<<<<< HEAD
	        // https://ckeditor.com/docs/ckeditor5/latest/features/editor-placeholder.html#using-the-editor-configuration
	        placeholder: '請編輯活動內容',
	        // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-family-feature
=======
	        placeholder: '請編輯輸入活動內容...',
>>>>>>> merge1005
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
<<<<<<< HEAD
	        // https://ckeditor.com/docs/ckeditor5/latest/features/font.html#configuring-the-font-size-feature
=======
>>>>>>> merge1005
	        fontSize: {
	            options: [ 10, 12, 14, 'default', 18, 20, 22 ],
	            supportAllValues: true
	        },
<<<<<<< HEAD
	        // Be careful with the setting below. It instructs CKEditor to accept ALL HTML markup.
	        // https://ckeditor.com/docs/ckeditor5/latest/features/general-html-support.html#enabling-all-html-features
=======
>>>>>>> merge1005
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
<<<<<<< HEAD
	        // Be careful with enabling previews
	        // https://ckeditor.com/docs/ckeditor5/latest/features/html-embed.html#content-previews
	        htmlEmbed: {
	            showPreviews: true
	        },
	        // https://ckeditor.com/docs/ckeditor5/latest/features/link.html#custom-link-attributes-decorators
	        link: {
	            decorators: {
	                addTargetToExternalLinks: true,
	                defaultProtocol: 'https://localhost:8080/group5',
=======
	        htmlEmbed: {
	            showPreviews: true
	        },
	        link: {
	            decorators: {
	                addTargetToExternalLinks: true,
	                defaultProtocol: 'https://',
>>>>>>> merge1005
	                toggleDownloadable: {
	                    mode: 'manual',
	                    label: 'Downloadable',
	                    attributes: {
	                        download: 'file'
	                    }
	                }
	            }
	        },
<<<<<<< HEAD
	        // https://ckeditor.com/docs/ckeditor5/latest/features/mentions.html#configuration
=======
>>>>>>> merge1005
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
<<<<<<< HEAD
	        // The "super-build" contains more premium features that require additional configuration, disable them below.
	        // Do not turn them on unless you read the documentation and know how to configure them and setup the editor.
	        removePlugins: [
	            // These two are commercial, but you can try them out without registering to a trial.
	            // 'ExportPdf',
	            // 'ExportWord',
	            'CKBox',
	            'CKFinder',
	            'EasyImage',
	            // This sample uses the Base64UploadAdapter to handle image uploads as it requires no configuration.
	            // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/base64-upload-adapter.html
	            // Storing images as Base64 is usually a very bad idea.
	            // Replace it on production website with other solutions:
	            // https://ckeditor.com/docs/ckeditor5/latest/features/images/image-upload/image-upload.html
	            // 'Base64UploadAdapter',
=======
	        removePlugins: [
	            'CKBox',
	            'CKFinder',
	            'EasyImage',
>>>>>>> merge1005
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
	
	<script type="text/javascript"> 
	
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
	</script>

	<%@ include file="../admin/AdminstyleFoot.jsp"%>
	
</body>
</html>