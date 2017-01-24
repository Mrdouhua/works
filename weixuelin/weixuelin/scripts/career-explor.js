$(function(){

	// 课程导航功能
	(function(){

		// 专业部分ajax请求
		$(".proNavItem").click(function(){

			var requData = $(this).text();
			var sumbData = {
				"subject_name": requData
			};
			var that = this;

			// 请求返回地址
			var url = "/weixuelin/AjaxManager?"+"user_id=111111111"+"&timestamp"+new Date().getTime();
			
			$.post(url, sumbData, function(data, textStatus){

				// 数组保存的专业数据
				var mjData = jQuery.parseJSON( data ).major_name;

				if( $(".proCon") ) {
					$(".proCon").hide();
				}

				// 生成专业目录html结构
				var mjStru = "<div class='proCon proConShow'><ul class='majorNav'></ul></div>";
				
				// 隐藏其它兄弟元素
				$(".carExplorNavCon").append(mjStru);

				// 保存生成专业数据的html代码
				var mjHtml = "";
				for(var i = 0; i < mjData.length; i++) {
					mjHtml = mjHtml + "<li class='majorNavItem'><a href='#'>" + mjData[i] + "</a></li>";
				}

				// 选中功能
				$(that).addClass("selected").siblings().removeClass("selected");

				$(".majorNav").append( "<li class='majorNavItemTit'>专业:</li>" + mjHtml );
				$(".proNav").show();

				$(".majorNavItem").click(function(){

				var requData = $(this).text();
				var sumbData = {
					"major_name": requData
				};

				var that = this;

				// 请求返回地址
				var url = "/weixuelin/AjaxManager?"+"user_id=1111111110"+"&timestamp"+new Date().getTime();

				$.post(url, sumbData, function(data, textStatus){

					// 数组保存的专业数据
					var pfData = jQuery.parseJSON( data ).profession_name;

					if( $(".majorCon") ) {
						$(".majorCon").hide();
					}

					// 生成职业目录html结构
					var pfStru = "<div class='majorCon'><ul class='careerNav'></ul></div>";
					$(".proCon").append(pfStru);

					// 保存生成专业数据的html代码
					var pfHtml = "";
					for(var i = 0; i < pfData.length; i++) {
						pfHtml = pfHtml + "<li class='careerNavItem'><a href='#'>" + pfData[i] + "</a></li>";
					}

					// 选中功能
					$(that).addClass("selected").siblings().removeClass("selected");

					$(".careerNav").append( "<li class='careerNavItemTit'>职业:</li>" + pfHtml );

					$(".careerNavItem").click(function(){

						var requData = $(this).text();
						var submData = {
							"profession_name": requData
						};

						// 请求返回地址
						var url = "/weixuelin/ResourceFormManager?"+"user_id=1111111110"+"&timestamp"+new Date().getTime();

						$.post(url, submData, function(data, textStatus){
							window.location = "./a_result.jsp";
						});
				    });

				});

			});

			});
		});




		
	})();


	// 课程分页功能
	// 注意：
	// 1 页面状态判断
	// 2 页面状态缓存
	// 3 相关页面渲染
	// 4 采用清空再添加的思路
	// 5 具体思路：先默认页数，交互时，先判断当前页数状态，之后清除之前页面元素，渲染当前页面元素，最后要注意缓存修改后的页数状态
	(function(){


		// 获取课程元素
		var $hotLessonItem = $(".hotLessonItem");
		// 获取课程数目
		var itemLength = $hotLessonItem.length;
		// 获取当前页数
		var pageNum = Math.ceil(itemLength/6);
		// 缓存当前页数(默认页数为一)
		var page = 1;


		// 根据页数生成代码并渲染
		for(var i = 1; i <= pageNum; i++) {
			(function(i){
				var li = '<li class="hotLessonPageItem">' + i + '</li>';
				$(".hotLessonPage").append(li);

			})(i);
		}


		// 默认情况下显示第一页内容，其它页内容display设置为none
		(function(){
			$(".hotLessonItem").css('display','none'); 
			for(var i = 0; i < 6; i++) {
				(function(i){
					if( $(".hotLessonItem")[i] ) {
						$(".hotLessonItem")[i].style.display = 'block';
					}
				})(i);
			}
		})();


        // 首页跳转
		$(".hotLessonTabFir").click(function(){

			// 判断当前页数状态
			if(page !== 1) {
				// 清除当前页数课程
				$(".hotLessonItem").css('display','none');
				// 渲染首页课程
				for(var i = 0; i < 6; i++) {
					(function(i){
						if( $(".hotLessonItem")[i] ) {
							$(".hotLessonItem")[i].style.display = 'block';
						}
					})(i);
				}
				// 缓存当前页数状态
				page = 1;
			}
		});


        // 尾页跳转
		$(".hotLessonTabLas").click(function(){

			// 判断当前页面状态
			if( page !== pageNum ){

				// 清除当前页数课程
				$(".hotLessonItem").css('display','none');
				// 缓存当前页数状态(后面需要使用)
				page = Math.ceil(itemLength/6);
				// 渲染尾页课程
				for(var i = itemLength - 1; i > (Math.ceil(itemLength/6)-1)*6 -1; i--) {
					(function(i){
						if( $(".hotLessonItem")[i] ) {
							$(".hotLessonItem")[i].style.display = 'block';
						}
					})(i);
				}
			}	
		});


		// 上一页跳转
		$(".hotLessonTabBef").click(function(){

			// 判断当前页面状态
			if(page !== 1) {
				// 清除当前页数课程
				$(".hotLessonItem").css('display','none');
				// 缓存当前页数状态
				page = page - 1;
				// 渲染上一页课程
				for(var i = (page-1)*6; i < page*6; i++) {
					(function(i){
						if( $(".hotLessonItem")[i] ) {
							$(".hotLessonItem")[i].style.display = 'block';
						}
					})(i);
				}
			}
		});

        // 下一页跳转
		$(".hotLessonTabNex").click(function(){

			// 判断当前页面状态
			if(page !== pageNum) {
				// 清除当前页数课程
				$(".hotLessonItem").css('display','none');
				// 缓存当前页数状态
				page = page + 1;
				// 渲染下一页课程
				for(var i = (page-1)*6; i < page*6; i++) {
					(function(i){
						if( $(".hotLessonItem")[i] ) {
							$(".hotLessonItem")[i].style.display = 'block';
						}
					})(i);
				}
			}
		});

		// 分页跳转
		$(".hotLessonPageItem").click(function(){

			// 清除当前页数课程
			$(".hotLessonItem").css('display','none');

			// 判断和缓存当前页面状态
			page = $(".hotLessonPageItem").index(this) + 1;

			// 渲染下一页课程
			for(var i = (page-1)*6; i < page*6; i++) {
				(function(i){
					if( $(".hotLessonItem")[i] ) {
						$(".hotLessonItem")[i].style.display = 'block';
					}
				})(i);
			}
			
		});
	})();
});