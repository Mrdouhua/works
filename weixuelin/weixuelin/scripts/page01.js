(function(){
	(function(){
    	// 图片个数
		var jLength = $(".juniorLesItem").length;
	    // 初始位置，固定
		var jnPosition = $(".juniorLesCon").position().left;
		// 移动位置，随着移动而改变
		var jcPosition = $(".juniorLesCon").position().left;

		$(".juniorLesButLef").click(function(){

			if(jLength > 3 && jcPosition < jnPosition) {
				var change = jcPosition + 300 + "px"; 
				$(".juniorLesCon").css("left",change);
				jcPosition = jcPosition + 300;
			}

		});

		$(".juniorLesButRig").click(function(){

			if(jLength > 3 && jcPosition < (jLength * 300 - 900) && jcPosition >= jnPosition) {
				var change = jcPosition - 300 + "px"; 
				$(".juniorLesCon").css("left",change);
				jcPosition = jcPosition - 300; 
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