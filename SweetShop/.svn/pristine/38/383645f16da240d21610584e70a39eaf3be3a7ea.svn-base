////// 파일 선택시 이미지 변
//파일 업로드
var img_name;
var img_org_name;
var img_path;
var form = $('form')[0];
var formData = new FormData(form);

$(document).ready(function() {
	$("#file").change(function() {
		var upload = document.getElementById('file');
		console.log("load change");

		var file = upload.files[0], reader = new FileReader();
		reader.onload = function(event) {
			uploadFile();
		};
		reader.readAsDataURL(file);
		return false;
	});

});
function uploadFile(url) {
	var form = $('form')[0];

	console.log($('form')[0]);
	var formData = new FormData(form);
	$.ajax({
		url : '/shop_img_upload.do',
		processData : false,
		contentType : false,
		data : formData,
		type : 'POST',
		success : function(result) {
			console.log("업로드 성공 : " + result);
			var obj = $.parseJSON(result);
			img_name = obj.file_name;
			img_org_name = obj.original_name;
			img_path = obj.url;
		}
	});
}