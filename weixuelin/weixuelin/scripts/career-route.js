$(function(){

    // 入门初窥轮播部分

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


	// 逐步进阶轮播部分

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


	// 逐鹿巅峰轮播部分
	(function(){
		// 图片个数
		var sLength = $(".seniorLesItem").length;
	    // 初始位置，固定
		var snPosition = $(".seniorLesCon").position().left;
		// 移动位置，随着移动而改变
		var scPosition = $(".seniorLesCon").position().left;

		$(".seniorLesButLef").click(function(){

			if(jLength > 3 && scPosition < snPosition) {
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

});