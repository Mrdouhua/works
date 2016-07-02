(function(){
	(function(){
		// 图片个数
		var mLength = $(".middleLesItem").length;
	    // 初始位置，固定
		var mnPosition = $(".middleLesCon").position().left;
		// 移动位置，随着移动而改变
		var mcPosition = $(".middleLesCon").position().left;

		$(".middleLesButLef").click(function(){

			if(mLength > 3 && mcPosition < mnPosition) {
				var change = mcPosition + 300 + "px"; 
				$(".middleLesCon").css("left",change);
				mcPosition = mcPosition + 300;
			}

		});

		$(".middleLesButRig").click(function(){

			if(mLength > 3 && mcPosition < (mLength * 300 - 900) && mcPosition >= mnPosition) {
				var change = mcPosition - 300 + "px"; 
				$(".middleLesCon").css("left",change);
				mcPosition = mcPosition - 300; 
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