(function($){
	$.fn.bubbleup = function(options) {
		
		//Extend the default options of plugin
		var opts = $.extend({}, $.fn.bubbleup.defaults, options);
        var tip = null;


    	return this.each(function() {   
    	
    		//Set the option value passed here
            var $tooltip = opts.tooltips; 



  			$(this).mouseover(
  	  
    			function () {
            		
            		if($tooltip) {
            		
                		tip = $('<div>' + $(this).attr('alt') + '</div>');
                		tip.css({
							fontFamily: 'Helvetica, Arial, sans-serif',
                			color: '#333333', 
                			fontSize: 12, 
                			fontWeight: 'bold', 
                			position: 'absolute', 
                			zIndex: 100000
                		});
            			
            			tip.remove().css({
            				top: 0, left: 0, 
            				visibility: 'hidden', 
            				display: 'block'
            			}).appendTo(document.body);
            
            
            			//Get the width and height of current image item
            			var position = $.extend({}, $(this).offset(), {
            				width: this.offsetWidth, 
            				height: this.offsetHeight
            			});
            			
            			
            			//Get the width and height of the tip element 
            			var tipWidth = tip[0].offsetWidth, tipHeight = tip[0].offsetHeight;
            			
            			
            			
                		//Set position for the tip to display correctly
    					//Postion: top and center of image     
            			tip.stop().css({
            				top: position.top - tipHeight, 
            				left: position.left + position.width / 2 - tipWidth / 2, 
            				visibility: 'visible'
            			});
            			
            			tip.animate({
        					top: "-=24",
        				}, 'fast'); 
        			}     			
        
        			$(this).stop();
        			$(this).css({'z-index' : 100, 'top' : 0, 'left' : 0, 'width' : 48}).animate({
        				left: "-=24",
        				top: "-=24",
                		width: 96
        			}, 'fast');
        			
    			}

  			).mouseout(
  	  
    			function () {
  			
           			if($tooltip) {
                    	tip.remove();
                    }			
    			
    				$(this).stop();
        			$(this).animate({
        				left: 0,
        				top: 0,
                		width: 48
        			}, 'fast', function() {
        					$(this).css({'z-index' : 0});
        				}
        			);
    			}

  			);

    	});
    	
 	};
 	
 	$.fn.bubbleup.defaults = {
		tooltips: false
	}


})(jQuery);