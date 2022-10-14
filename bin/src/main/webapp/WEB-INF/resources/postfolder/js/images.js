
//驗證 上傳圖片
function checkip() {
    if (window.File && window.FileList) {

        var fileCount = document.getElementById("file1").files.length;
        if (fileCount > 5) {
            alert("最多僅支援5張相片，你選擇了" + fileCount + "張，請重新選擇！");
            return false;
        } else {
            return true;
        }

    } else {
        window.alert('抱歉，你的瀏覽器不支持FileAPI(複數檔案上傳)，請升級瀏覽器！');
        return false;
    }
}


//多張預覽
$("#file1").change(function() {
    $("#imgs").html(""); // 清除預覽
    readURL(this);
});

function readURL(input) {
    if (input.files && input.files.length >= 0) {
        if (input.files.length < 6) {
            for (var i = 0; i < input.files.length; i++) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    var img = $("<img width='300' height='200'>").attr('src', e.target.result);
                    $("#imgs").append(img);
                }
                reader.readAsDataURL(input.files[i]);
            }
        } else {
            var noPictures = $("<p>選擇圖片超過五張，請重新選擇</p>");
            $("#imgs").append(noPictures);
        }

    } else {
        var noPictures = $("<p>目前沒有圖片</p>");
        $("#imgs").append(noPictures);
    }
}