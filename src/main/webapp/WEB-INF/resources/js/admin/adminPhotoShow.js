/**
 實現預覽圖片功能
 */
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
		result.innerHTML = '<img src="' + this.result + '"  height="300px" width="300px"/>'
	}
}