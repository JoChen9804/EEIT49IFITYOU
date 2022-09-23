  	//模擬單擊事件
  	function openFileWindow()
  	{
  		document.getElementsByClassName("fileSelect")[0].click();
  	}
  	//選擇圖片時觸發
  	var file;
  	function fileSelected()
  	{
  		//獲取dom元素
  		var fileButton = document.getElementsByClassName("fileSelect")[0];
  		//讀取圖片
  		var fileReader = new FileReader();
  		//註冊載入完整後的事件
  		fileReader.onload = function(e){
  			//獲得img的dom元素
  			var img = document.getElementById("pic");
  			//獲取圖片的base64的編碼
  			var imgUrl = e.target.result;
  			//將轉碼後的圖片放到頁面
//			var html = "<img src='" + imgUrl + "'/>";
//			document.getElementById("img").innerHTML = html;
  			var pic = document.createElement("img");
  			pic.src = imgUrl; 	
  			//獲取父元素
  			var pran = document.getElementById("img");
  			pran.appendChild(pic);
  		}
  		//獲取圖片
  	    file = fileButton.files[0];
  		fileReader.readAsDataURL(file);
  	}
  	function startUpload()
  	{
  		//上傳的url
  		//var url = "Textimage";
  		//var url = "Textimage";
  		var url = "MainPostServlet";
  		//手工構造一個form表單
  		var formData = new FormData();
  		//向表單新增資料，用這個表單傳送資料
  		formData.append("file" , file);
  		//設定progress，onload，error，abort
  		var request = new XMLHttpRequest();
  		request.upload.addEventListener("progress" , window.evt_upload_progress , false);
  		request.addEventListener("load" , window.evt_upload_complete , false);
  		request.addEventListener("error" , window.evt_upload_failed , false)
  		request.addEventListener("abort" , window.evt_upload_cancel , false);
  		request.open("POST" , url);
  		request.send(formData);
  	}
  	 window.evt_upload_progress = function(evt)
	    {
	    	if(evt.lengthComputable)
	    	{
	    		
	    		var progress = Math.round(evt.loaded * 100 / evt.total);
	    		console.log("上傳進度" + progress);
	    	}
	    };
		window.evt_upload_complete = function (evt)
		{
			if(evt.loaded == 0)
			{
				console.log ("上傳失敗!");
			}
			else
			{
				console.log ("上傳完成!");
		    	//var response = JSON.parse(evt.target.responseText);
		    	console.log (evt.target.responseText);
			}			
		};		 
		window.evt_upload_failed = function (evt) 
		{			
			console.log  ("上傳出錯"); 
		};
		window.evt_upload_cancel = function (evt) 
		{
			console.log( "上傳中止!");	
		};
        function getImg()
        {
            var e = document.getElementById("showImg");
            e.src = "GetImgServlet";//servlet的路徑
        }

        
        