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
<script type="text/javascript" src="js/course.js" charset="utf-8"></script>
<script language="javascript" type="text/javascript"
	src="<%=basePath%>My97DatePicker/WdatePicker.js" charset="utf-8"></script>
<link href="css/four.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function selimage(){
window.open("<%=basePath%>saveimage.jsp","","toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=yes,copyhistory=no,scrollbars=yes,width=400,height=240,top="+(screen.availHeight-240)/2+",left="+(screen.availWidth-400)/2+"");}
</script>
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
			<td bgcolor="#FFFFFF"><form action="course/updateCourse.action"
					name="myform" method="post" onsubmit="return check()">
					<table width="80%" border="0" align="center" cellpadding="4"
						cellspacing="1" bgcolor="#aec3de">
						<tr align="center" bgcolor="#F2FDFF">
							<td align="left" colspan="2" class="optiontitle">修改课程<input
								type="hidden" name="courseid" value="${course.courseid}" /></td>
						</tr>
						<tr align="center" bgcolor="#F2FDFF">
							<td width="20%" align="right">课程名称</td>
							<td align="left"><input type="text" name="coursename"
								style="width: 160px" id="coursename"
								value="${course.coursename}" /></td>
						</tr>
						<tr align="center" bgcolor="#F2FDFF">
							<td width="20%" align="right">课程封面</td>
							<td align="left"><input type="text" name="image"
								style="width: 160px" id="image" value="${course.image}"
								onclick="selimage();" readonly="readonly" /></td>
						</tr>
						<tr align="center" bgcolor="#F2FDFF">
							<td width="20%" align="right">课程类型</td>
							<td align="left"><select name="cateid" style="width: 160px"
								id="cateid"><c:forEach items="${cateList}" var="cate">
										<option value="${cate.cateid}">${cate.catename }</option>
									</c:forEach></select></td>
						</tr>
						<tr align="center" bgcolor="#F2FDFF">
							<td width="20%" align="right">教师</td>
							<td align="left"><select name="teacherid"
								style="width: 160px" id="teacherid"><c:forEach
										items="${teacherList}" var="teacher">
										<option value="${teacher.teacherid}">${teacher.teachername }</option>
									</c:forEach></select></td>
						</tr>
						<tr align="center" bgcolor="#F2FDFF">
							<td width="20%" align="right">课程介绍</td>
							<td align="left"><script type="text/javascript"
									src="ckeditor/ckeditor.js"></script>
								<textarea cols="80" name="contents" id="contents" rows="10">${course.contents}</textarea>
								<script type="text/javascript">
									CKEDITOR.replace('contents', {
										language : 'zh-cn'
									});
								</script></td>
						</tr>
						<input type="hidden" name="addtime" id="addtime"
							value="${course.addtime}" />
						<input type="hidden" name="hits" id="hits" value="${course.hits}" />
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