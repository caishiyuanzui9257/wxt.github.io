<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <base target="_self"/>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<script language="javascript">
            function closeOpen()
		    {
		       window.returnValue=false;
		       window.close();
		    }
		    
		    function check1()
		    {
		        if(document.form1.type.value=="user")
		        {
		            document.form1.action="<%=path %>/reg/reg_user.jsp";
		            document.form1.submit();
		        }
		        if(document.form1.type.value=="tea")
		        {
		            document.form1.action="<%=path %>/reg/reg_tea.jsp";
		            document.form1.submit();
		        }
		    }
        </script>
	</head>
	<body>
			<form action="" name="form1" method="post">
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
					<tr>
						<th height="40" colspan="2" bgcolor="#FFFFFF" class="f12b-red" style="font-size: 11px;">
							用户注册
						</th>
					</tr>
					<tr>
						<td height="20" width="20%" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							注册身份：
						</td>
						<td bgcolor="#FFFFFF" width="80%">
							&nbsp;
							<select name="type">
							    <option value="user">学生注册</option>
							    <option value="tea">老师注册</option>
							</select>
							<input type="button" value="确定" onclick="check1();"/>
							<input type="button" value="取消" onclick="closeOpen()"/>
						</td>
					</tr>
				</table>
			</form>
	</body>
</html>
