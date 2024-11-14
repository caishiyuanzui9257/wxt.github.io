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
           function bookDel(bookId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/bookDel.action?bookId="+bookId;
               }
           }
           
           function bookAdd()
           {
                 var url="<%=path %>/admin/book/bookAdd.jsp";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
	
			<form action="<%=path %>/bookMana.action" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/images/wbg.gif" class='title'>
					          图书名称：<input type="text" name="bookName" size="20"/>
					           图书类型:<select name="catelogId">
					         <option value="-1">请选择</option> 
					         <s:iterator value="#request.catelogList">
					         	<option value="<s:property value="catelogId"/>"><s:property value="catelogName"/></option> 
					         </s:iterator> 
					         </select>
					          <input type="submit" value="查询"/>
					        </td>
					    </tr>
					 </table>
			</form>
	
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="10" background="<%=path %>/images/tbg.gif">&nbsp;图书维护&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="10%">图书类别</td>
					<td width="10%">图书名称</td>
					<td width="10%">作者</td>
					<td width="10%">出版社</td>
					<td width="10%">出版日期</td>
					<td width="10%">图书书号</td>
					<td width="10%">图书定价</td>
					<td width="10%">图书页码</td>
					<td width="10%">操作</td>
		        </tr>	
				<s:iterator value="#request.bookList" id="book">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#book.catelogName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#book.bookName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#book.bookZuozhe"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#book.bookChubanshe"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#book.bookChubanriqi"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#book.bookIsbm"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#book.bookPrice"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#book.bookYeshu"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="<%=path %>/book_toUpdate.action?bookId=<s:property value="#book.bookId"/>" class="pn-loperator">修改</a>
						<a href="#" onclick="bookDel(<s:property value="#book.bookId"/>)" class="pn-loperator">删除</a>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			<table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			      <input type="button" value="添加" style="width: 80px;" onclick="bookAdd()" />
			    </td>
			  </tr>
		    </table>
	</body>
</html>
