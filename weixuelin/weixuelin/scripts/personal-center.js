window.onload = function(){
    nav();
}

/*滑动的导航栏菜单开始*/
function nav(){
    var oNav = document.getElementById('nav');
        var oLi = oNav.getElementsByTagName('li');
        var oCur = oLi[oLi.length-1];
        var i = 0;

         for(i=0;i<oLi.length-1;i++){
            oLi[i].onmouseover = function(){
                startMove(oCur,this.offsetLeft);
            };
            oLi[i].onmouseout = function(){
                startMove(oCur,520);
            };
        }
    var iSpeed = 0;
    var left = 0;
    function startMove(obj,iTarget){
        clearInterval(obj.timer);
        obj.timer = setInterval(function(){
            iSpeed = (iTarget - obj.offsetLeft)/5;
            iSpeed *= 0.5;
            left += iSpeed;

            if(Math.abs(iSpeed)<1 && Math.abs(left-iTarget)<1){
                clearInterval(obj.timer);
                obj.style.left = iTarget + 'px';
            } else
            {
                obj.style.left = left + 'px';
            }
        },30)
    }
}
//tab切换 头像部分
$(function(){
    // 头像点击显示
    $('#navbar-user').click(function(){
        $('#avatar').css('display','block');
    });
    // 头像点击内容部分隐藏
    $('#content').click(function(){
        $('#avatar').css('display','none');
     })
    // tab选项卡点击显示
    var $oli = $('ul.tab-titles li');
    $oli.click(function(){
        $(this).addClass('selected')
        .siblings().removeClass('selected');
        var index = $oli.index(this);
        $('div.tab_box>div')
            .eq(index).show()
            .siblings().hide();
    });
})

$(function(){
    //昵称的验证
    $("#nickName").blur(function(){
       //判断是否为空或者全为空格
        if($('#nickName').val().length == 0 || /^\s+$/g.test($(this).val())){
            $(".nickAfter").css("visibility","visible").empty().append("昵称不能为空或者全为空格！");
        } else {
            $(".nickAfter").css("visibility","visible").empty().append("昵称输入正确！");
        }
    });
    $("#password").blur(function(){
       //判断是否为空或者全为空格
        if(!/^[A-Za-z0-9]{6,12}$/.test($(this).val())){
            $(".passwordAfter").css("visibility","visible").empty().append("请输入6-12位数字或字母！");
        } else {
            $(".passwordAfter").css("visibility","visible").empty().append("输入正确！");
        }
    });
    $("#school").blur(function(){
       //判断学校是否为中文
        if($(this).val() === "" || !/^[\u4e00-\u9fa5]{0,}$/.test($(this).val())){
            $(".schoolAfter").css("visibility","visible").empty().append("请输入中文！");
        } else {
            $(".schoolAfter").css("visibility","visible").empty().append("输入正确！");
        }
    });
})
$('#inforSend').click(function(){
    var inforData = {
        nickName: $('#nickName').val(),
        password: $('#password').val(),
        sex: $("input[name='gender']:checked").val(),
        school: $('school').val(),
        area: $('area').val(),
        introduction: $('introduction').val()
    };
    var sendData = $.param(inforData,true);
    var url = "servlet/User_Upgrade?"+$(this).attr("name")+"="+$(this).val()+"&timestamp"+new Date().getTime();
    ajax.post(url,sendData,function(data,textStatus){
        var testData = jquery.parseJSON(data);
        if (testData=='true') {
            alert('修改成功！');
            window.location="personal-center.jsp";
        } else {
            alert('修改失败');
            return false;
        }
    })
})
//学习计划分页功能
$(function(){
    (function(){
        var $myPlan = $(".myPlan");
        var itemLength = $myPlan.length;
        var pageNum = Math.ceil(itemLength/3);
        var page = 1;

        for(var i=1;i <= pageNum;i++){
            (function(i){
                var li = "<li class='myPlanPageItem'>"+i+"</li>";
                $(".myPlanPage").append(li);

            })(i);
        }
        (function(){
            $(".myPlan").css('display','none');
            for(var i=0;i<3;i++){
                (function(i){
                    if($(".myPlan")[i]){
                        $(".myPlan")[i].style.display='block';
                    }
                })(i);
            }
        })();

        $(".myPlanTabBef").click(function(){

            // 判断当前页面状态
            if(page !== 1) {
                // 清除当前页数课程
                $(".myPlan").css('display','none');
                // 缓存当前页数状态
                page = page - 1;
                // 渲染上一页课程
                for(var i = (page-1)*3; i < page*3; i++) {
                    (function(i){
                        if( $(".myPlan")[i] ) {
                            $(".myPlan")[i].style.display = 'block';
                        }
                    })(i);
                }
            }
        });
        // 下一页跳转
        $(".myPlanTabNex").click(function(){

            // 判断当前页面状态
            if(page !== pageNum) {
                // 清除当前页数课程
                $(".myPlan").css('display','none');
                // 缓存当前页数状态
                page = page + 1;
                // 渲染下一页课程
                for(var i = (page-1)*3; i < page*3; i++) {
                    (function(i){
                        if( $(".myPlan")[i] ) {
                            $(".myPlan")[i].style.display = 'block';
                        }
                    })(i);
                }
            }
        });
        // 分页跳转
        $(".myPlanPageItem").click(function(){

            // 清除当前页数课程
            $(".myPlan").css('display','none');

            // 判断和缓存当前页面状态
            page = $(".myPlanPageItem").index(this) + 1;

            // 渲染下一页课程
            for(var i = (page-1)*3; i < page*3; i++) {
                (function(i){
                    if( $(".myPlan")[i] ) {
                        $(".myPlan")[i].style.display = 'block';
                    }
                })(i);
            }
            
        });
    })();
});