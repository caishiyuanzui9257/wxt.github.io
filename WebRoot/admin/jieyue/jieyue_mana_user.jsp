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
		<script type="text/javascript" src="<%=path %>/js/public.js"></script>
		
        <script language="javascript">
           function duzhexinxi(duzheleixing,duzheId)
           {
               var url="";
               if(duzheleixing=="user")
               {
                   url="<%=path %>/userDetail.action?id="+duzheId;
               }
               if(duzheleixing=="tea")
               {
                   url="<%=path %>/teaDetail.action?id="+duzheId;
               }
               window.showModalDialog(url,"","dialogWidth:900px; dialogHeight:200px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
		
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="26" background="<%=path %>/images/tbg.gif">&nbsp;借阅记录&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="15%">图书</td>
					<td width="15%">读者类型</td>
					<td width="15%">读者信息</td>
					<td width="15%">借阅时间</td>
					
					<td width="15%">到期时间</td>
					<td width="15%">归还时间</td>
		        </tr>	
				<s:iterator value="#request.jieyueList" id="jieyue">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#jieyue.book.bookName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:if test="#jieyue.duzheleixing=='user'">
						    学生
						</s:if>
						<s:if test="#jieyue.duzheleixing=='tea'">
						    老师
						</s:if>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <a style="font-size: 11px;color: red" href="#" onclick="duzhexinxi('<s:property value="#jieyue.duzheleixing"/>',<s:property value="#jieyue.duzheId"/>)">读者信息</a>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#jieyue.jieyueShijian"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#jieyue.daoqiShijian"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:if test="#jieyue.guihuanshijian==''">
					         未归还
						</s:if>
						<s:if test="#jieyue.guihuanshijian!=''">
						    <s:property value="#jieyue.guihuanshijian"/>
						</s:if>
					</td>
				</tr>
				</s:iterator>
			</table>
	</body>
</html>
