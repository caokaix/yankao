<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%><%@ taglib
	prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
<script type="text/javascript" src="js/cate.js" charset="utf-8"></script>
<script type="text/javascript" src="js/date.js" charset="utf-8"></script>
<script language="javascript" type="text/javascript"
	src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<link href="css/four.css" rel="stylesheet" type="text/css" />
</head>
<%
	String message = (String) request.getAttribute("message");
	if (message == null) {
		message = "";
	}
	if (!message.trim().equals("")) {
		out.println("<script language='javascript'>");
		out.println("alert('" + message + "');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%><body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr valign="top">
			<td bgcolor="#FFFFFF"><form action="xuanke/insertXuanke.action"
					name="myform" method="post" onsubmit="return check()">
					<table width="80%" border="0" align="center" cellpadding="4"
						cellspacing="1" bgcolor="#aec3de">
						<tr align="center" bgcolor="#F2FDFF">
							<td align="left" colspan="2" class="optiontitle">修改课程表</td>
						</tr>
						
						<tr align="center" bgcolor="#F2FDFF">
							<td width="20%" align="right">课程名称</td>
							<td align="left"><select name="courseid" style="width: 160px"
								id="courseid"><c:forEach items="${courseList}" var="course">
										<option value="${course.courseid}">${course.coursename }</option>
									</c:forEach></select></td>
						</tr>
						<tr align="center" bgcolor="#F2FDFF">
							<td width="20%" align="right">教师</td>
							<td align="left"><select name="teacherid"
								style="width: 160px" id="teacherid">
								    <c:forEach
										items="${teacherList}" var="teacher">
										<option value="${teacher.teacherid}">${teacher.teachername }</option>
									</c:forEach></select></td>
						</tr>
						<tr align="center" bgcolor="#F2FDFF">
							<td width="20%" align="right">教室</td>
							<td align="left"><select name="room_id"
								style="width: 160px" id="room_id">
								    <c:forEach
										items="${roomList}" var="room">
										<option value="${room.room_id}">${room.room_name}</option>
									</c:forEach></select></td>
						</tr>
						    <tr>
                        <tr align="center" bgcolor="#F2FDFF">
							<td width="20%" align="right">排课日期</td>
							<td align="left">
									 <select name="xuanke_yz">
						     		     <option value=1>星期一</option>
						     		     <option value=2>星期二</option>
						     		     <option value=3>星期三</option>
						     		     <option value=4>星期四</option>
						     		     <option value=5>星期五</option>
						     		     <option value=6>星期六</option>
						     		     <option value=7>星期日</option>
						             </select> 
						             <select name="xuanke_xz" >
						     		     <option value=1>第一节</option>
						     		     <option value=2>第二节</option>
						     		     <option value=3>第三节</option>
						     		     <option value=4>第四节</option>
						     		     <option value=5>第五节</option>
						     		     <option value=6>第六节</option>
						     		     <option value=7>第七节</option>
						             </select>  
						</tr>
      
    </tr>				
						<tr align="center" bgcolor="#ebf0f7">
							<td colspan="2"><input type="submit" name="Submit"
								value="提交" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset"
								name="Submit2" value="重置" /></td>
						</tr>
					</table>
				</form></td>
		</tr>
	</table>
</body>
</html>