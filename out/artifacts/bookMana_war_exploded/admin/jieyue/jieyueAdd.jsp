<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<jsp:directive.page import="java.text.SimpleDateFormat"/>
<%@ taglib prefix="s" uri="/struts-tags"%>
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
        <script type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
		<script type='text/javascript' src='<%=path %>/dwr/interface/catelogService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        
        <script language="javascript">
           var duzheleixing=0;
           
           var i=0;
           function findAllBook()
           {
               if(i==0)
               {
                   document.getElementById("indicator").style.display="block";
                   catelogService.findAllBook(callback);
                   i=1;
               }
               
           }
           function callback(data)
           {
               document.getElementById("indicator").style.display="none";
               DWRUtil.addOptions("bookId",data,"bookId","bookName");
           }
            
            
            function check()
		    {
		       if(document.formAdd.bookId.value==0)
		       {
		          alert("请输入借阅图书");
		          return false;
		       }
		       if(document.formAdd.duzheId.value=="")
		       {
		          alert("请选择读者");
		          return false;
		       }
		      
		       document.formAdd.submit();
		    }
		    
		    
		    function aa(s)
		    {
		        duzheleixing=s;
		        if(duzheleixing=="0")
		        {
		            
		        }
		        if(duzheleixing=="user")//学生
		        {
		            jiatianshu(10);
		            
		        }
		        if(duzheleixing=="tea")//老师
		        {
		            jiatianshu(15);
		        }
		    }
		    
		    function duzhexuanze()
		    {
		    
		        if(duzheleixing=="0")
		        {
		            alert("请选择读者类型");
		        }
		        if(duzheleixing=="user")//学生
		        {
		            userAll();
		        }
		        if(duzheleixing=="tea")//老师
		        {
		            teaAll();
		        }
		    }
		    
		    function userAll()
		    {
		       	var strUrl = "<%=path %>/userAll.action";
				var ret = window.showModalDialog(strUrl,"","dialogWidth:950px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
			    if(ret==undefined)
			    {   ret="";
			    }
			    document.getElementById("duzheId").value=ret;
		    }
		    
		    function teaAll()
		    {
		       	var strUrl = "<%=path %>/teaAll.action";
				var ret = window.showModalDialog(strUrl,"","dialogWidth:950px; dialogHeight:500px; dialogLeft: status:no; directories:yes;scrollbars:yes;Resizable=no;");
			    if(ret==undefined)
			    {   ret="";
			    }
			    document.getElementById("duzheId").value=ret;
		    }
		    
		    function   DateAdd(strInterval,NumDay,dtDate)  
			{   
				var   dtTmp   =   new   Date(dtDate);   
				if   (isNaN(dtTmp))   dtTmp   =   new   Date();   
				switch   (strInterval)   
				{   
					case   "s":
					       dtTmp =   new   Date(Date.parse(dtTmp)   +   (1000   *   NumDay)); 
					    break; 
					case   "n":
					       dtTmp =   new   Date(Date.parse(dtTmp)   +   (60000   *   NumDay)); 
					    break; 
					case   "h":
					       dtTmp =   new   Date(Date.parse(dtTmp)   +   (3600000   *   NumDay));
					    break;
					case   "d":
					       dtTmp =   new   Date(Date.parse(dtTmp)   +   (86400000   *   NumDay));
					    break;
					case   "w":
					       dtTmp =   new   Date(Date.parse(dtTmp)   +   ((86400000   *   7)   *   NumDay)); 
					    break;
					case   "m":
					       dtTmp =   new   Date(dtTmp.getFullYear(),   (dtTmp.getMonth())   +   NumDay,   dtTmp.getDate(),   dtTmp.getHours(),   dtTmp.getMinutes(),   dtTmp.getSeconds());
					    break;   
					case   "y":
					       dtTmp =   new   Date((dtTmp.getFullYear()   +   NumDay),   dtTmp.getMonth(),   dtTmp.getDate(),   dtTmp.getHours(),   dtTmp.getMinutes(),   dtTmp.getSeconds());
					    break;
				}
				var mStr=new String(dtTmp.getMonth()+1);
				var dStr=new String(dtTmp.getDate());
				if (mStr.length==1)
				{
				      mStr="0"+mStr;
				}
				if (dStr.length==1)
				{
				      dStr="0"+dStr;
				}
				return dtTmp.getFullYear()+"-"+mStr+"-"+dStr;
				} 
				
				
				function jiatianshu(tianshu)
				{
					var jieyueShijian=document.formAdd.jieyueShijian.value;
					jieyueShijian=jieyueShijian.replace("-","/").replace("-","/");
				    document.formAdd.daoqiShijian.value = DateAdd("d",tianshu,jieyueShijian);
				}  
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/images/allbg.gif'>
			<form action="<%=path %>/jieyueAdd.action" name="formAdd" method="post">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/images/wbg.gif" class='title'><span>图书借阅管理</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         图书：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <table border="0">
						           <tr> 
						               <td>  
						                  <select name="bookId" id="bookId" onclick="findAllBook()">
								              <option value="0">请选择图书</option>
								          </select>
						               </td>
						               <td><img id="indicator" src="<%=path %>/images/loading.gif" style="display:none"/></td>
						           </tr>
						        </table>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         读者类型：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <select name="duzheleixing" onchange="aa(this.value)">
						              <option value="0">请选择</option>
						              <option value="user">学生</option>
						              <option value="tea">老师</option>
						        </select>
						        (学生最长可借阅10天，老师最长可借阅15天)
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         读者选择：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="duzheId" id="duzheId" value="" readonly="readonly"/>
						        <input type="button" value="选择" onclick="duzhexuanze()"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         借阅时间：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input name="jieyueShijian" type="text" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>" readonly="readonly"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         到期时间：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input name="daoqiShijian" type="text"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						       <input type="hidden" name="userId" value="<%=request.getParameter("userId") %>"/>
						       <input type="button" value="提交" onclick="return check()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
