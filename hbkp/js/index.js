$(function(){
	// nav部分二级导航
	// (function(){
	// 	var oNav = $('#nav'),
	// 		oUl1 = $('#nav>ul'),
	// 		oLi1 = $('#nav>ul>li');

	// 	oLi1.mouseover(function(){
	// 		$(this).find('ul').show();
	// 	})
	// 	oLi1.mouseout(function(){
	// 		$(this).find('ul').hide();
	// 	})	
	// })();

	// banner部分图片轮播
	// (function(){
	// 	var oBtn = $('.banner-button'),
	// 		oLi = oBtn.find('ul li');

	// 	oLi.click(function(){
	// 		$(this).addClass('banner-act').siblings()
	// 		.removeClass('banner-act');
	// 	})
	// })();

	// 科普动态鼠标滑过切换显示的内容
	// (function(){
	// 	var oUl = $('.s1-left-con ul'),
	// 		oLi = $('.s1-left-con ul li');

	// 	oLi.mouseover(function(){
	// 		$(this).addClass('s1-act').siblings().removeClass('s1-act');
	// 	})
	// })();

	// 命名空间
	var my = {};

	// nav部分二级导航
	my.nav = function(){
		var oNav = $('#nav'),
			oUl1 = $('#nav>ul'),
			oLi1 = $('#nav>ul>li');

		oLi1.mouseover(function(){
			$(this).find('ul').show();
		})
		oLi1.mouseout(function(){
			$(this).find('ul').hide();
		})
	};
	my.nav();

	// 图片轮播
	my.banner = function(){
		var oBtn = $('.banner-button'),
			bLi = $('.banner-carousel ul li'),
			sLi = $('.banner-s ul li'),
			oInfo = $('.banner-info'),
			oBanner = $('#banner'),
			index = 0,
			timer = null,
			oLi = oBtn.find('ul li');
		var oText = [
			"js学的不熟练",
			"布局要多花功夫",
			"写网页速度太慢",
			"写着写着吧自己写晕了"
		];

		oInfo.html(oText[0]);
		fade();
		// 点击右下角按钮切换
		oLi.click(function(){
			index = oLi.index(this);
			fade();
			// $(this).addClass('banner-act').siblings()
			// .removeClass('banner-act');

			// index = oLi.index(this);
			// bLi.eq(index).show(1000).siblings().hide(1000);
			// sLi.eq(index).addClass('bgc').siblings().removeClass('bgc');
			// oInfo.html(oText[index]);
		});

		// 点击右边小图片切换
		sLi.click(function(){
			index = sLi.index(this);
			fade();
		})

		// 自动播放
		function autoPlay(){
			timer = setInterval(function(){
				// $(oInfo).html(oText[index]);
				// sLi.eq(index).addClass('bgc').siblings()
				// .removeClass('bgc');
				// bLi.eq(index).show(900).siblings().hide(900);
				// oLi.eq(index).addClass('banner-act')
				// .siblings().removeClass('banner-act');
				index++;
				// if(index>3){
				// 	index = 0;
				// };
				index %= oLi.length;
				fade();
			},3000);
		};
		autoPlay();

		// 播放函数
		function fade(){
			bLi.each(function(i){
				if(i!=index){
					bLi.eq(i).hide(900);
					oLi.eq(i).removeClass('banner-act');
					sLi.eq(i).removeClass('bgc');
				} else{
					bLi.eq(i).show(900);
					oLi.eq(i).addClass('banner-act');
					sLi.eq(i).addClass('bgc');
				}
				// oLi.eq(i).addClass('banner-act').siblings()
				// .removeClass('banner-act');
				// bLi.eq(i).show(900).siblings().hide(900);
				// sLi.eq(i).addClass('bgc').siblings().removeClass('bgc');
				// oInfo.html(oText[i]);
			})
			oInfo.html(oText[index]);
		}

		// 鼠标移入停止播放，移出继续播放
		oBanner.hover(function(){
			clearInterval(timer);
		},autoPlay);
	}
	my.banner();

	// 科普场馆的焦点图
	my.carousel1 = function(){
		var oS1Pic = $('.s1-pic'),
			oUl = oS1Pic.find('ul'),
			oUlLi = oS1Pic.find('ul li'),
			aOl = oS1Pic.find('ol li')
			aOlLi = oS1Pic.find('ol li'),
			prev = oS1Pic.find('.prev'),
			next = oS1Pic.find('.next'),
			iNow = 0,
			timer = null;

		function changeBtn(){
			oUlLi.each(function (i){
				if (i != iNow) {
					aOlLi.eq(i).removeClass('s1-pic-act');
				} else {
					aOlLi.eq(i).addClass('s1-pic-act');
				}
				oUlLi.eq(iNow).fadeIn(1000).siblings().fadeOut(1000);
			})
		}

		// 点击控制按钮切换
		aOlLi.click(function(){
			iNow = $(this).index();
			changeBtn();
			oUlLi.eq(iNow).fadeIn(1000).siblings().fadeOut(1000);
		})

		next.click(function(){
			iNow++;
			iNow %= aOlLi.length;
			changeBtn();
		})
		prev.click(function(){
			iNow--;
			if(iNow < 0){
				iNow = 3;
			}
			changeBtn();
		})

		// 自动播放
		function autoPlay(){
			timer = setInterval(function(){
				iNow++;
				iNow %= aOlLi.length;
				changeBtn();
			},3000)
		}
		autoPlay();

		$('.s1-pic').hover(function(){
			clearInterval(timer);
		},autoPlay)
	}
	my.carousel1();

	// tab选项卡
	my.myTab = function(){
		var tab = function(id,tabList,act,ev){
			var oLi = $(id).find('li');
			oLi.bind(ev,function(){
				$(this).addClass(act)
				.siblings().removeClass(act);
				var index = oLi.index(this);
				$(tabList).children().eq(index).show().siblings().hide();
			});
		}
		$('.books-box').children().eq(1).show().siblings().hide();
		tab("#book-tab",".books-box","books-act","click");
		$('.video-box').children().eq(0).show().siblings().hide();
		tab("#video-tab",".video-box","video-act","mouseover");
	}
	my.myTab();

	// 科普动态鼠标滑过切换显示的内容
	my.toggle = function(){
		var oUl = $('.s1-left-con ul'),
			oLi = $('.s1-left-con ul li');

		oLi.mouseover(function(){
			$(this).addClass('s1-act').siblings().removeClass('s1-act');
		})
	};
	my.toggle();
})