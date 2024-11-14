<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'menu.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path %>/css/base.css" type="text/css" />
	<link rel="stylesheet" href="<%=path %>/css/menu.css" type="text/css" />
	<style type="text/css">
	    div {
			padding:0px;
			margin:0px;
		}
		
		body {
		 scrollbar-base-color:#bae87c;
		 scrollbar-arrow-color:#FFFFFF;
		 scrollbar-shadow-color:#c1ea8b;
		 padding:0px;
		 margin:auto;
		 text-align:center;
		 background-color:#9ad075;
		}
		
		dl.bitem {
			width:148px;
			margin:0px 0px 5px 4px;
		}
		
		dl.bitem dt {
		  background:url(<%=path %>/images/menubg.gif);
		  height:26px;
		  line-height:26px;
		  text-align:center;
		  cursor:pointer;
		}
		
		dl.bitem dd {
		  padding:3px 3px 3px 3px;
		  background-color:#fff;
		}
		
		.fllct
		{
			float:left;
			
			width:90px;
		}
		
		.flrct
		{
			padding-top:3px;
			float:left;
		}
		
		div.items
		{
			line-height:22px;
			background:url(<%=path %>/images/arr4.gif) no-repeat 10px 9px;
		}
		
		span.items
		{
			padding:10px 0px 10px 22px;
			background:url(<%=path %>/images/arr4.gif) no-repeat 10px 12px;
		}
		
		ul {
		  padding-top:3px;
		}
		
		li {
		  height:22px;
		}
		
		.sitemu li {
			padding:0px 0px 0px 22px;
			line-height:24px;
			background:url(<%=path %>/images/arr4.gif) no-repeat 10px 9px;
		}
	</style>
	<script language='javascript'>var curopenItem = '1';</script>
	<script language="javascript" type="text/javascript" src="<%=path %>/js/menu.js"></script>
	<base target="main" />
  </head>
  
  <body target="main">
    <c:if test="${sessionScope.userType==0}">
	<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
	  <tr>
	    <td style='padding-left:3px;padding-top:8px' valign="top">
	      <dl class='bitem'>
	        <dt onClick='showHide("items1_1")'><b>基本操作</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'>
	            <li><a href='<%=path %>/admin/index/userinfo.jsp' target='main'>密码修改</a> </li>
	            <li><a href='<%=path %>/adminManage.action' target='main'>系统管理</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem'>
	        <dt onClick='showHide("items4_1")'><b>图书类别管理</b></dt>
	        <dd style='display:block' class='sitem' id='items4_1'>
	          <ul class='sitemu'>
	            <li><a href='<%=path %>/catelogMana.action' target='main'>类别管理</a> </li>
	            <li><a href='<%=path %>/admin/catelog/catelogAdd.jsp' target='main'>类别添加</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem'>
	        <dt onClick='showHide("items4_1")'><b>图书管理</b></dt>
	        <dd style='display:block' class='sitem' id='items4_1'>
	          <ul class='sitemu'>
	               <li><a href='<%=path %>/bookMana.action' target='main'>图书管理</a> </li>
	               <li><a href='<%=path %>/admin/book/bookAdd.jsp' target='main'>图书添加</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem'>
	        <dt onClick='showHide("items4_1")'><b>读者管理</b></dt>
	        <dd style='display:block' class='sitem' id='items4_1'>
	          <ul class='sitemu'>
	               <li><a href='<%=path %>/userMana_daishenhe.action' target='main'>待审核学生</a> </li>
	               <li><a href='<%=path %>/userMana_yishenhe.action' target='main'>已审核学生</a> </li>
	               <li><a href='<%=path %>/teaMana_daishenhe.action' target='main'>待审核老师</a> </li>
	               <li><a href='<%=path %>/teaMana_yishenhe.action' target='main'>已审核老师</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem'>
	        <dt onClick='showHide("items4_1")'><b>图书借阅管理</b></dt>
	        <dd style='display:block' class='sitem' id='items4_1'>
	          <ul class='sitemu'>
	               <li><a href='<%=path %>/jieyueMana.action' target='main'>借阅管理</a> </li>
	               <li><a href='<%=path %>/admin/jieyue/jieyueAdd.jsp' target='main'>借阅添加</a> </li>
	          </ul>
	        </dd>
	      </dl>
	      <dl class='bitem'>
	        <dt onClick='showHide("items4_1")'><b>安全退出系统</b></dt>
	        <dd style='display:block' class='sitem' id='items4_1'>
	          <ul class='sitemu'>
	               <li><a href='#' onclick='javascript:window.parent.location="<%=path %>/login.jsp";'>安全退出系统</a> </li>
	          </ul>
	        </dd>
	      </dl>
		</td>
	  </tr>
	</table>
	</c:if>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<c:if test="${sessionScope.userType==1}">
	<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
	  <tr>
	    <td style='padding-left:3px;padding-top:8px' valign="top">
	      <dl class='bitem'>
	        <dt onClick='showHide("items1_1")'><b>图书信息</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'>
	            <li><a href='<%=path %>/bookAll.action' target='main'>图书信息</a> </li>
	            <li><a href='<%=path %>/jieyue_mana_tea.action' target='main'>借阅记录</a> </li>
	          </ul>
	        </dd>
	      </dl>
		</td>
	  </tr>
	</table>
	</c:if>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<c:if test="${sessionScope.userType==2}">
	<table width='99%' height="100%" border='0' cellspacing='0' cellpadding='0'>
	  <tr>
	    <td style='padding-left:3px;padding-top:8px' valign="top">
	      <dl class='bitem'>
	        <dt onClick='showHide("items1_1")'><b>图书信息</b></dt>
	        <dd style='display:block' class='sitem' id='items1_1'>
	          <ul class='sitemu'>
	            <li><a href='<%=path %>/bookAll.action' target='main'>图书信息</a> </li>
	            <li><a href='<%=path %>/jieyue_mana_user.action' target='main'>借阅记录</a> </li>
	          </ul>
	        </dd>
	      </dl>
		</td>
	  </tr>
	</table>
	</c:if>
  </body>
</html>
