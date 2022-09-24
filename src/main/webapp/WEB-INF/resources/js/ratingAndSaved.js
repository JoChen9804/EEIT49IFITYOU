let logFavorite = document.querySelector('#logFavorite').getAttribute("value");
let logRating = document.querySelector('#logRating').getAttribute("value");

$(function(){
	
	if(logFavorite==1){
		$("#saved").prop("checked","true");
	}
	if(logRating!=""){
	console.log("1："+logRating+typeof(logRating));
	//$("#start1").prop("checked","true");
	$("#start"+logRating).prop("checked","true");
	}

});


let star = document.querySelectorAll('.star');
let ratingValue= document.querySelector('#ratingValue');
let logId = document.querySelector('#gymLogIdNow').getAttribute("value");
let gId = document.querySelector('#gymIdFromDetail').getAttribute("value");
let mId = document.querySelector('#memberIdNow').getAttribute("value");


for(let i=0; i<star.length;i++){
    star[i].addEventListener('click',function(){
        i= this.value;
        ratingValue.value=i;
        console.log(logId+typeof(logId));
        if(logId!=""){
			$.ajax({
				type: "post",
				url: "/group5/admin/gym/gymRating/"+logId+"/"+ratingValue.value
			});
		}else{
			let logBean={"memberId":mId, "gymId":gId, "rating": ratingValue.value};
			console.log(logBean);
			$.ajax({
				type: "post",
				url: "/group5/admin/gym/gymRating",
				contentType: "application/json",
				data:JSON.stringify(logBean),
				success: function(data){
					$("#gymLogIdNow").val(data.logId);
					logId=data.logId;
				}
			});
		}
    })
}

let saved=document.querySelector('#saved');

saved.addEventListener('click',function(){
	if(logId!=""){
		$.ajax({
			type: "post",
			url: "/group5/admin/gym/gymFavorite/"+logId
		});
	}else{
		let logBean={"memberId":mId, "gymId":gId, "favorite": 1};
		$.ajax({
			type: "post",
			url: "/group5/admin/gym/gymFavorite",
			contentType: "application/json",
			data:JSON.stringify(logBean),
			success: function(data){
				$("#gymLogIdNow").val(data.logId);
				logId=data.logId;
			}
		});
	}
})



