<script>

/**
 * item_cont_area
 * preview_img
 */

	function thumbRefresh(className) {
		var div = $(className);
		var item = "";

		for (var i = 0; i <= img_array.length; i++) {
			var item_id = "#img_thumb" + i;
			$(item_id).remove();
		}

		for (var i = 0; i < img_array.length; i++) {
			var img_data = img_array[i];
			item += '<span id="img_thumb' + i
					+ '" class="thum"><a href="javascript:itemDelete(' + i + ',\''
					+ img_data.img_path+ '\',\''
					+className
					+'\')"><img width="45px" height="45px" src="'
					+ img_data.img_path + '" /></a></span>';
			console.log("img : " + i + " : " + img_data.img_path);
		}

		div.prepend(item);
	}

	var pre_gallery_class_name;

	function galleryRefresh(className) {
		if(className == null){
			className=pre_gallery_class_name;
		}else{
			pre_gallery_class_name=className;
		}
		var img = "";
		var img_div = $(className);

		if (img_array.length <= 0) {
			img_div.html("");
		} else {
			for (var i = 0; i < img_array.length; i++) {
				var img_data = img_array[i];
				img += "<div id='preview_img" + i
						+ "' class='swiper-slide'><img src='" + img_data.img_path
						+ "' /></div>";
				console.log("img : " + i + " : " + img_data.img_path);
			}

			img_div.html(img);
		}

		var swiper = new Swiper('.swiper-container', {
			nextButton : '.swiper-button-next',
			prevButton : '.swiper-button-prev',
			pagination : '.swiper-pagination',
			paginationType : 'fraction'
		});
	}

	function itemDelete(index, url, classname) {
		var item_id = "#img_thumb" + index;
		var item_id2 = "#preview_img" + index;

		/* $(item_id).remove(); */

		console.log("del idx : " + index + "/" + url);
		console.log(img_array.length);

		for (var i = 0; i < img_array.length; i++) {
			var img_data = img_array[i];

			console.log("img : " + i + " : " + img_data.img_path + " == " + url);

			if (img_data.img_path == url) {

				console.log("img : del");
				if (i == 0) {
					img_array.shift();
				} else {
					img_array.splice(i, i);
				}
			}
		}

		console.log(img_array.length);

		thumbRefresh(classname);
		galleryRefresh();

		item_index--;
		if (item_index < 0) {
			item_index = 0;
		}

	}


</script>