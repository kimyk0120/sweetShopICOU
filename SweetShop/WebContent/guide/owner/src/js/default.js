	/* 
	$(function(){
		$("a").each(function(){
			var a = $(this);
			var img = a.find('img');
			var src_off = img.attr('src');
			var src_on = src_off.replace('_off', '_on');
			a.hover(function(){
				img.attr('src', src_on);
			},function(){
				img.attr('src', src_off);
			});
		});
	});
*/



$(function() { 
	$("a img").hover(function(){ 
		$(this).attr("src", $(this).attr("src").replace("_off.png", "_on.png")); 
		}, function(){ 
		$(this).attr("src", $(this).attr("src").replace("_on.png", "_off.png")); 
	}); 
});

