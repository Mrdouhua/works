
$(function(){

	// 账号合法性验证
	$("#z_user_id").blur(function(){
		if ( !/^\d{6,10}$/.test($(this).val()) ){
			$("#z_user_id_after").css("display","inline-block").empty().append("输入格式错误，请输入6-10位的数字");
		} else {
			var valTest = {
				"user_id": $(this).val()
			};
			var url = "/weixuelin/Check_id?"+$(this).attr("name")+"="+$(this).val()+"&timestamp"+new Date().getTime();
			$.post(url, valTest, function(data, textStatus){
				$("#z_user_id_after").css("display","inline-block").empty().append(data);
			});
		}
	});

    // 密码格式验证
	$("#z_password").blur(function(){
		if ( !/^[A-Za-z0-9]{6,12}$/.test($(this).val()) ){
			$("#z_password_after").css("display","inline-block").empty().append("输入格式错误，请输入6-12位数字或字母");

		} else {
			$("#z_password_after").css("display","inline-block").empty().append("输入格式正确！");
		}
	});

	// 密码一致验证
	$("#z_aPassword").blur(function(){
		if ( $(this).val() === "" || $(this).val() !== $("#z_password").val() ){
			$("#z_aPassword_after").css("display","inline-block").empty().append("两次输入不一致！");

		} else {
			$("#z_aPassword_after").css("display","inline-block").empty().append("两次输入一致！");
		}
	});

	// 昵称格式验证
	$("#z_nickName").blur(function(){
		if ( $(this).val() === "" || !/^[\u4e00-\u9fa5]{0,}$/.test($(this).val()) ){
			$("#z_nickName_after").css("display","inline-block").empty().append("输入格式错误，请输入中文");

		} else {
			$("#z_nickName_after").css("display","inline-block").empty().append("输入格式正确！");
		}
	});

    // 学校格式验证
	$("#z_school").blur(function(){
		if ( $(this).val() === "" || !/^[\u4e00-\u9fa5]{0,}$/.test($(this).val()) ){
			$("#z_school_after").css("display","inline-block").empty().append("输入格式错误，请输入中文");

		} else {
			$("#z_school_after").css("display","inline-block").empty().append("输入格式正确！");
		}
	});

    // 表单信息提交
	$("#z_submit").click(function(){
		if( /^\d{6,10}$/.test($("#z_user_id").val())
			&& /^[A-Za-z0-9]{6,12}$/.test($("#z_aPassword").val())
			&& $("#z_aPassword").val() === $("#z_password").val()
			&& ( $("#z_nickName").val() !== "" || /^[\u4e00-\u9fa5]{0,}$/.test($("#z_nickName").val()) )
			&& ( $("#z_school").val() !== "" || /^[\u4e00-\u9fa5]{0,}$/.test($("#z_school").val()) ) ){
			// 填写信息验证正确
			var formData = {
				"user_id": $("#z_user_id").val(),
				"sex": $('.z_formItem input[name="sex"]:checked').val(),
				"password": $("#z_aPassword").val(),
				"nickName": $("#z_nickName").val(),
				"province": $("#z_province").val(),
				"school": $("#z_school").val()
			};
			var url = "/weixuelin/User_Register?"+$(this).attr("name")+"="+$(this).val()+"&timestamp"+new Date().getTime();
			$.post(url, formData, function(data, textStatus){
				// 将传过来的JSON字符串转化成对象
				var testData = jQuery.parseJSON( data );
				// 当传过来的名为bool的属性的值为true时，注册成功
				if ( testData == "true"){ 
					// 注册成功，跳转到个人中心,可设置target值自动跳转
					window.location = "personal-center.jsp";

				} else {
					// 注册失败
					alert("注册失败");
					return false;
				}
			}
			);
			alert("注册成功！");
//			return true;

		} else {
			// 填写信息验证错误
			alert("表单信息填写错误，请重新填写");
			return false;
		}
	});

})


