
$(function(){

	// 评论提交功能
	$("#commSubBtn").click(function(){
		var username = $(".z_nickName").text();
		var comment = $(".comment").val();
		var subData = {
			"content": $(".comment").val(),
			"username": username
		};

		var url = "/weixuelin/CommentManager?"+$(this).attr("name")+"="+$(this).val()+"&timestamp"+new Date().getTime();

		if( username && $(".comment").val() ) {

			$.post(url, subData, function(data, textStatus){

				var requData = jQuery.parseJSON( data );
				var commHtml = "<div class='commConItem'><img class='commConPic' src='"
				+ requData.comment_path
				+ "'><div class='commConInf'><span class='commConName'>"
				+ username
				+ "</span><p class='commConPara'>"
				+ comment
				+ "</p><span class='commConDate'>时间："
				+ new Date().toLocaleDateString()
				+ "</span></div></div>";

				$(".commConPar").children().eq(0).before(commHtml);
				console.log($(".commConPar").children().eq(0))
			});
			
		} else {
			alert("未输入评论或未登陆");
		}
		$(".comment").focus().val("");
	});

	// 页数生成功能
	(function(){

		// 获取课程元素
		var $commConItem = $(".commConItem");
		// 获取课程数目
		var itemLength = $commConItem.length;
		// 获取当前页数
		var pageNum = Math.ceil(itemLength/5);
		// 缓存当前页数(默认页数为一)
		var page = 1;


		// 根据页数生成代码并渲染
		for(var i = 1; i <= pageNum; i++) {
			(function(i){
				var li = '<li class="commConPageItem">' + i + '</li>';
				$(".commentPage").append(li);

			})(i);
		}


		// 默认情况下显示第一页内容，其它页内容display设置为none
		(function(){
			$(".commConItem").css('display','none'); 
			for(var i = 0; i < 5; i++) {
				(function(i){
					if( $(".commConItem")[i] ) {
						$(".commConItem")[i].style.display = 'block';
					}
				})(i);
			}
		})();


        // 首页跳转
		$(".commConTabFir").click(function(){

			// 判断当前页数状态
			if(page !== 1) {
				// 清除当前页数课程
				$(".commConItem").css('display','none');
				// 渲染首页课程
				for(var i = 0; i < 5; i++) {
					(function(i){
						if( $(".commConItem")[i] ) {
							$(".commConItem")[i].style.display = 'block';
						}
					})(i);
				}
				// 缓存当前页数状态
				page = 1;
			}
		});


        // 尾页跳转
		$(".commConTabLas").click(function(){

			// 判断当前页面状态
			if( page !== pageNum ){

				// 清除当前页数课程
				$(".commConItem").css('display','none');
				// 缓存当前页数状态(后面需要使用)
				page = Math.ceil(itemLength/5);
				// 渲染尾页课程
				for(var i = itemLength - 1; i > (Math.ceil(itemLength/5)-1)*5 -1; i--) {
					(function(i){
						if( $(".commConItem")[i] ) {
							$(".commConItem")[i].style.display = 'block';
						}
					})(i);
				}
			}	
		});


		// 上一页跳转
		$(".commConTabBef").click(function(){

			// 判断当前页面状态
			if(page !== 1) {
				// 清除当前页数课程
				$(".commConItem").css('display','none');
				// 缓存当前页数状态
				page = page - 1;
				// 渲染上一页课程
				for(var i = (page-1)*5; i < page*5; i++) {
					(function(i){
						if( $(".commConItem")[i] ) {
							$(".commConItem")[i].style.display = 'block';
						}
					})(i);
				}
			}
		});

        // 下一页跳转
		$(".commConTabNex").click(function(){

			// 判断当前页面状态
			if(page !== pageNum) {
				// 清除当前页数课程
				$(".commConItem").css('display','none');
				// 缓存当前页数状态
				page = page + 1;
				// 渲染下一页课程
				for(var i = (page-1)*5; i < page*5; i++) {
					(function(i){
						if( $(".commConItem")[i] ) {
							$(".commConItem")[i].style.display = 'block';
						}
					})(i);
				}
			}
		});

		// 分页跳转
		$(".commConPageItem").click(function(){

			// 清除当前页数课程
			$(".commConItem").css('display','none');

			// 判断和缓存当前页面状态
			page = $(".commConPageItem").index(this) + 1;

			// 渲染下一页课程
			for(var i = (page-1)*5; i < page*5; i++) {
				(function(i){
					if( $(".commConItem")[i] ) {
						$(".commConItem")[i].style.display = 'block';
					}
				})(i);
			}
			
		});

		
	})();
});