////// 파일 선택시 이미지 변
//파일 업로드
var img_array = new Array();
var img_name;
var img_org_name;
var img_path;
var form = $('form')[0];
var formData = new FormData(form);

var limitLength=3;
var item_index=0;
var item_id=0;


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

	var formData = new FormData(form);
	console.log("formData : "+formData);
	console.log("formData : "+form.action);

	if(img_array.length >= limitLength){
		alert("이미지는 3개까지만 등록가능합니다");
		return;
	}

	$.ajax({
		url : form.action,
		processData : false,
		contentType : false,
		data : formData,
		type : 'POST',
		success : function(result) {
			console.log("Upload response : " + result);
			var obj = $.parseJSON(result);

			if(obj.result == "success"){
				var img_obj = new Object();
				img_obj.img_path = obj.url;
				img_obj.img_file_name = obj.file_name;
				img_obj.img_org_name = obj.original_name;
				img_obj.event_order = item_index;

				//이미지 array로 관리
				img_array.push(img_obj);

				//각 html의 뷰에 추가해야함
				changeImageData(obj);
			}else{
				alert("업로드를 실패하였습니다");
			}
		}
	});

}

