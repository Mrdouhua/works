$(function(){
	//编写可复用的tab选项卡模板
	(function(){
		/*
		第一个参数为ul标题的id
		第二个为内容块父元素的class
		第三个参数为需要添加的事件
		*/
		var tab = function(id,tabList,ev){
			var oLi = $(id).find('li');
			oLi.bind(ev,function(){
				$(this).addClass('activity')
				.siblings().removeClass('activity');
				var index = oLi.index(this);
				$(tabList).children().eq(index).show().siblings().hide();
			});
		}
		// 调用tab
		tab('#tab-menu','.tab-box','click');
		tab('#subway','.options3-tab-box','click');
		tab('#options4-tab-title','.options4-tab-box','mouseover');	
	})();
	/*update上下滚动展示信息*/
	(function(){
		var oText = [
					"1金钱豹、大江南、湘水之珠、德瑀楼 荷棠鱼坊烤鱼",
					"2轻轻去去去去去去去去去",
					"3问问吾问无为谓",
					"4金钱豹、大江南、湘水之珠、德瑀楼 荷棠鱼坊烤鱼",
					"5轻轻去去去去去去去去去",
					"6问问吾问无为谓",
					"7呃呃呃鹅鹅鹅鹅鹅鹅饿"
					],
		oBtnUp   = $('.infor-up'),
		oBtnDown = $('.infor-down'),
		iNow     = 0,
		oDiv     = $('.search-infor'),
		timer    = null;
		oUl      = $('.infor ul'),
		str      = "";
		for(var i=0;i<oText.length;i++){
			str +='<li>'+oText[i]+'</li>';
		}
		oUl.html(str);
		iH = oUl.find('li').height();
		oBtnUp.click(function(){
			doMove(-1);
		});
		oBtnDown.click(function(){
			doMove(1);
		});
		function autoPlay(){
			timer = setInterval(function(){
				doMove(-1);
			},1500)
		}
		autoPlay();
		oDiv.hover(function(){
			clearInterval(timer);
		},autoPlay);
		function doMove(num){
			iNow += num;
			if(Math.abs(iNow)>oText.length-1){
				iNow =0;
			}
			if(iNow > 0){
				iNow = -(oText.length-1);
			}
			oUl.stop().animate({'margin-top':iH*iNow},1000);
		}	
	})();
	// search部分点击title切换搜索框里面的内容
	(function(){
		var searchArr = [
			"去玩儿童体育",
			"阿斯顿飞哥哥好",
			"自行车复古风格",
			"泉中学生物",
			"湖国家机关沟通机会"
		];
		var oLi = $('.search-nav li');
		var index;
		$('#search-input').val(searchArr[0]);
		$('.search-nav li').click(function(){
			$(this).addClass('search-nav-activity').siblings().removeClass('search-nav-activity');
			index = $('.search-nav li').index(this);
			$('#search-input').val(searchArr[index]);
		});
		oLi.focus(function(){
			if($('#search-input').val() == searchArr[index]){
				$('#search-input').val("");
			}
		});
		oLi.blur(function(){
			if($('#search-input').val() == ""){
				$('#search-input').val(searchArr[index]);
			}
		})
	})();
	//焦点图
	(function(){
		var oArr = [
			"地方地方大幅度发",
			"威尔而二恶",
			"打发打发打发打发"
		]
		var sLi = $('.smallPic-list-wrap li');
		var bLi = $('.pic-list-wrap li');
		var timer;
		var index=0;
		
		sLi.click(function(){
			$(this).addClass('smallPic-activity').siblings()
			.removeClass('smallPic-activity');
			index = sLi.index(this);
			bLi.eq(index).show().siblings().hide();
			$('.pic-detail').html(oArr[index]);
		});
		function autoPlay(){
			timer = setInterval(function(){
				$('.pic-detail').html(oArr[index]);
				sLi.eq(index).addClass('smallPic-activity').siblings()
				.removeClass('smallPic-activity');
				bLi.eq(index).show().siblings().hide();
				index++;
				if(index>2){
					index = 0;
				};
			},2000);
		};
		autoPlay();
		$('.carousel').hover(function(){
			clearInterval(timer);
		},autoPlay);
		$('.pic-detail').html(oArr[index]);
	})();
	//蒙版
	(function(){
		var oLi = $('.section4-hot-show ul li');
		var oP = $("<p></p>");
		var iP = $(".section4-hot-show p");
		oLi.mouseover(function(){
			iP.remove();
			$(this).prepend(oP);
		})
	})();
	// 论坛
	(function (){
		$('.bbs-list li').mouseover(function (){
			$(this).addClass('bbs-activity').siblings().removeClass('bbs-activity');
		});
	})();
	//登录记住我
	(function(){
		var COOKIE_NAME = 'username';
		if($.cookie(COOKIE_NAME)){
			$('.username').val($.cookie(COOKIE_NAME));
		}
		$('#check').click(function(){
			if(this.checked){
				$.cookie(COOKIE_NAME, $('.username').val(), {path: '/', expires: 10});
			}else{
				$.cookie(COOKIE_NAME, null, {path: '/'});
			}
		});
	})();
})