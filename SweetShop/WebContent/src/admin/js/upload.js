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
		var holder = document.getElementById('holder');

		console.log("load change");

		var file = upload.files[0], reader = new FileReader();
		reader.onload = function(event) {

			console.log("load onload");
			var img = new Image();
			img.src = event.target.result;
			// note: no onload required since we've got the dataurl...I think! :)
			if (img.width > upload.width) { // holder width
				img.width = upload.width;
			}
			holder.innerHTML = '';
			holder.appendChild(img);
			console.log("load image");

			uploadFile();
		};
		reader.readAsDataURL(file);

		return false;
	});

});
function uploadFile() {
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