<%@ page language="java" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html locale="true">
  <head>
    <title>湖南涉外经济学院图书馆管理系统后台</title>
	<style type="text/css">
		body{background-color:#EEE;  background-image:url("images/main1.jpg");}
          #Layer1 {
           margin:360px auto;
           width:500px;height:329px;
           color:#000066;
           font-family:"微软雅黑";
           border-radius:10px;
           background-image:url("images/main.jpg");
          }
          #Layer1 h2{text-align:center;line-height:80px;background-color:rgba(126,198,86,0.3); border-bottom:1px dashed #eee;border-radius:10px 10px 0px 0px;}
          #Layer1 p{margin-left:120px;}
          #Layer1 .ipt{color:#990000;border-radius:2px;font-size:1.2em;border:0;background-color:rgba(255,255,255,0.7);}
          #Layer1 .sub{font-size:1.2em;width:100px;height:40px;font-family:"微软雅黑";font-weight:600;color:#FFF;background-color:rgba(99,99,99,0.4);border-radius:2px;border:1px solid rgba(99,99,99,0.6);}
	</style>
	
 <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
 <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
 <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
 
 <script type="text/javascript" src="<%=path %>/js/public.js"></script>     
 <script language="javascript">
 function check1()
 {                                                                                         
     if(document.ThisForm.userName.value=="")
	 {
	 	alert("请输入用户名");
		document.ThisForm.userName.focus();
		return false;
	 }
	 if(document.ThisForm.userPw.value=="")
	 {
	 	alert("请输入密码");
		document.ThisForm.userPw.focus();
		return false;
	 }
	 if(document.ThisForm.userType.value=="-1")
	 {
	 	alert("请选择登陆身份");
		document.ThisForm.userType.focus();
		return false;
	 }
	 //document.getElementById("indicator").style.display="block";
	 loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,document.ThisForm.userType.value,callback);
 }

 function callback(data)
 {
    //document.getElementById("indicator").style.display="none";
    if(data=="no")
    {
        alert("用户名或密码错误");
    }
    if(data=="yes")
    {
        alert("通过验证,系统登录成功");
        window.location.href="<%=path %>/loginSuccess.jsp";
    }
 }
 
 
 function reg()
  {
          var url="<%=path %>/reg/reg.jsp";
          var n="";
          var w="480px";
          var h="500px";
          var s="resizable:no;help:no;status:no;scroll:yes";
          openWin(url,n,w,h,s);
  }
 </script>
  </head>
  <body>

<div id="Layer1">
			<form name="ThisForm" method="post">
				<h2>湖南涉外经济学院图书馆管理系统后台</h2>
			
				<p><span style="font-size:1.2em;">用户：</span>
				<input name="userName" type="text" class="ipt">
				</p>
				<p><span style="font-size:1.2em;">密码：</span>
				<input name="userPw" type="password" class="ipt">
				</p>
				<p>
				<span style="font-size:1.2em;">身份：</span>
		         <select class="ipt" name="userType">
				    <option value="-1" selected="selected">请选择登陆身份</option>
					<option value="0">管理员</option>
					<option value="1">老师</option>
					<option value="2">学生</option>
				 </select>
				</p>
				<p style="margin-left:150px;">
					<input name="button" type="button" class="sub" value="登录" onclick="check1()"> &nbsp;
					<input name="Submit2" type="button" class="sub" value="注册" onclick="reg()">
				</p>
			</form>
		</div>
</body>
</html>
