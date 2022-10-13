let star = document.querySelectorAll('.star');
let ratingValue= document.querySelector('#ratingValue');

for(let i=0; i<star.length;i++){
    star[i].addEventListener('click',function(){
        i= this.value;
        ratingValue.value=i;
        console.log(logId+typeof(logId));
        console.log("${loginMember.id}")
        console.log("lastone on javascript")
        if(logId!=""){
			$.ajax({
				type: "post",
				url: "/group5/user/gym/gymRating/"+logId+"/"+ratingValue.value
			});
		}else{
			let logBean={"memberId":mId, "gym":gymBean, "rating": ratingValue.value};
			console.log(logBean);
			$.ajax({
				type: "post",
				url: "/group5/user/gym/gymRating",
				contentType: "application/json",
				data:JSON.stringify(logBean),
				success: function(data){
					//$("#gymLogIdNow").val(data.logId);
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
			url: "/group5/user/gym/gymFavorite/"+logId
		});
	}else{
		let logBean={"memberId":mId, "gymId":gymBean, "favorite": 1};
		$.ajax({
			type: "post",
			url: "/group5/user/gym/gymFavorite",
			contentType: "application/json",
			data:JSON.stringify(logBean),
			success: function(data){
				$("#gymLogIdNow").val(data.logId);
				logId=data.logId;
			}
		});
	}
})



