<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
           function teaDel(id)
           {
               if(confirm('您确定删除吗？'))
               {
                   var strUrl = "<%=path %>/teaDel.action?id="+id;
				   var ret = window.showModalDialog(strUrl,"","dialogWidth:300px; dialogHeight:130px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
                   window.location.reload();
               }
           }
           
           function teaShenhe(id)
           {
                   var strUrl = "<%=path %>/teaShenhe.action?id="+id;
				   var ret = window.showModalDialog(strUrl,"","dialogWidth:300px; dialogHeight:130px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
                   window.location.reload();
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="83" background="<%=path %>/images/tbg.gif">&nbsp;老师管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">用户名</td>
					<td width="10%">密码</td>
					<td width="10%">教师号</td>
					<td width="10%">姓名</td>
					
					<td width="10%">性别</td>
					<td width="10%">年龄</td>
					<td width="10%">状态</td>
					<td width="10%">操作</td>
		        </tr>	
				<s:iterator value="#request.teaList" id="tea">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#tea.loginname"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#tea.loginpw"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#tea.bianhao"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#tea.xingming"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#tea.sex"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#tea.age"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:if test='#tea.zhuangtai=="a"'>
						     待审核
						    &nbsp;&nbsp;&nbsp;
						    <a style="color: red" href="#" onclick="teaShenhe(<s:property value="#tea.id"/>)">审核</a>
						</s:if>
						<s:if test='#tea.zhuangtai=="b"'>
						    审核通过
						</s:if>
					</td>
					<td  bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="teaDel(<s:property value="#tea.id"/>)" class="pn-loperator">删除</a>
					</td>
				</tr>
				</s:iterator>
			</table>
	</body>
</html>
