/**
 * 평점 카운트
 * Copyright 2016, Noh ki won
 * Released on: 2016.08.06
 */

(function($){
	$.setOptions = {
		initCount : 0,
		useTouch : false
	}
	
	$.fn.starCountWrite = function(options){
		options = $.extend( null, $.setOptions, $.fn.starCountWrite.options, options );
		this.each( function( index ){			
			var starCount = new StarCount( this, options.initCount, options.useTouch, index );					
			$(this).data("starCount", starCount);
		} );			
		
		$(this).find(".btn_minus").on("click", function(e) {
             options.chkCount.call();
        });	
		$(this).find(".btn_plus").on("click", function(e) {
             options.chkCount.call();
        });	
		$(this).find(".icon_star").on("click", function(e) {
             options.chkCount.call();
        });		
		
		return this;
	}
	
	$.fn.returnCount = function(){
		var starCount = $(this).data("starCount");	
		var data = starCount.count;		
		return data;
	}
	/*
	var TOUCHSTART;	
	if( typeof(window.ontouchstart) != 'undefined' ){
		TOUCHSTART = 'touchstart';
	}else{
		TOUCHSTART = 'click';
	}
	*/
	TOUCHSTART = 'click';
	function StarCount( selector, initCount, useTouch, index ){	
		this.selector = selector;	
		this.star_box = $(this.selector).find(".check_star_area");
		this.star_icon = $(this.selector).find(".icon_star");
		this.btnMinus = $(this.selector).find(".btn_minus");
		this.btnPlus = $(this.selector).find(".btn_plus");		
		this.count = initCount;
		this.index = index;
		this.maxCount = 5;		
		this.init();
		this.addEvent( useTouch );
	}
	
	StarCount.prototype.init = function(){
		this.star_box.attr( "data-num", this.count );
		var num = this.count;
		this.star_box.attr( "class", "check_star_area n" + num * 2 );
	}
	
	StarCount.prototype.addEvent = function( useTouch ){
			var thisObj = this;
			this.btnMinus.on(TOUCHSTART, function(e){
			thisObj.count = Math.max( thisObj.count-0.5, 0 ) ;
			thisObj.countAdd();
			
			e.preventDefault(); 
			return false;
		});
		
		this.btnPlus.on(TOUCHSTART, function(e){			
			 thisObj.count = Math.min( thisObj.count+0.5, thisObj.maxCount);			 
			 thisObj.countAdd();	
			 e.preventDefault(); 
			 return false;		 
		});
		
		if( useTouch ){
			this.star_icon.each(function(index){			
				$(this).on(TOUCHSTART, function(e){
					thisObj.count = index + 1;
					thisObj.countAdd();		
					e.preventDefault();	
					return false;		
				});
			});
		}
	}
	
	StarCount.prototype.countAdd = function(){
		this.star_box.attr( "data-num", this.count );
		var num = this.count;
		this.star_box.attr( "class", "check_star_area n" + num * 2 );
	}
	
		
	
})(jQuery);
