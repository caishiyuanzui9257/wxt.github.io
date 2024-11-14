<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		
        <script language="javascript">
            function StringBuffer()
            { 
			   this._strs = new Array; 
			} 
			StringBuffer.prototype.append = function (str) 
			{ 
			   this._strs.push(str); //添加
			} 
			StringBuffer.prototype.pop = function (str) 
			{ 
			   this._strs.pop(str); //删除最后一个
			} 
			StringBuffer.prototype.toString = function()
		    { 
			   return this._strs.join(","); 
			}
            
            function queding()
            {
                 var sb = new StringBuffer(); 
                 
                 var object=document.getElementsByName("duzheId");//返回的obeject是数组
				 for(i=0;i<object.length;i++)
				 {
				      if(object[i].checked==true)
					  {
					      sb.append(object[i].value); 
					  }
				 }
				 window.returnValue = sb.toString();
		         window.close();
            }
        </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="100" background="<%=path %>/images/tbg.gif">&nbsp;学生选择&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
				    <td width="10%">用户名</td>
					<td width="10%">密码</td>
					<td width="7%">学号</td>
					<td width="10%">姓名</td>
					
					<td width="10%">学院</td>
					<td width="10%">专业</td>
					<td width="10%">联系方式</td>
					<td width="15%">E-mail</td>
					
					<td width="7%">状态</td>
					<td width="10%">操作</td>
		        </tr>	
				<s:iterator value="#request.userList" id="user">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#user.loginname"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#user.loginpw"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#user.xuehao"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#user.xingming"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#user.xueyuan"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#user.zhuanye"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#user.tel"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#user.email"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:if test='#user.zhuangtai=="a"'>
						     待审核
						    &nbsp;&nbsp;&nbsp;
						    <a style="color: red" href="#" onclick="userShenhe(<s:property value="#user.id"/>)">审核</a>
						</s:if>
						<s:if test='#user.zhuangtai=="b"'>
						    审核通过
						</s:if>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<input type="radio" name="duzheId" value="<s:property value="#user.id"/>"/>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
				  <tr>
				    <td>
				      <input type="button" value="确定" style="width: 80px;" onclick="queding()" />
				    </td>
				  </tr>
			</table>
	</body>
</html>
