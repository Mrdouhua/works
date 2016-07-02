(function(){
		(function(){
		// 图片个数
		var sLength = $(".seniorLesItem").length;
	    // 初始位置，固定
		var snPosition = $(".seniorLesCon").position().left;
		// 移动位置，随着移动而改变
		var scPosition = $(".seniorLesCon").position().left;

		$(".seniorLesButLef").click(function(){

			if(sLength > 3 && scPosition < snPosition) {
				var change = scPosition + 300 + "px"; 
				$(".seniorLesCon").css("left",change);
				scPosition = scPosition + 300;
			}

		});

		$(".seniorLesButRig").click(function(){

			if(sLength > 3 && scPosition < (sLength * 300 - 900) && scPosition >= snPosition) {
				var change = scPosition - 300 + "px"; 
				$(".seniorLesCon").css("left",change);
				scPosition = scPosition - 300; 
			}

		});
	})();

	    (function(){
    	$(".studyBut").click(function(){
    		var $index = $(this).parent().parent().index() + 1;
    		var subData = {
    			"url": "." + window.location.toString().substring(31),
    			"div_no": "1_" + $index
    		};
    		var url = "/weixuelin/GetResourceLearningPath?"+"user_id=111111111"+"&timestamp"+new Date().getTime();
    		$.post(url, subData, function(data, textStatus){
    			
    		});
    	});
    })();

})();