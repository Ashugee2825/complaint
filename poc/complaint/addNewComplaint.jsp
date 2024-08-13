<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="poc.complaint.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<!DOCTYPE html>
<html>
<head>
<style>
.form-submit-button {
background: #0066A2;
color: white;
border-style: outset;
border-color: #0066A2;
height: 30px;
width: 70px;
font: bold17px arial,sans-serif;
text-shadow: none;
}
</style>
<!--  Begin: Date Picker -->
<link href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script>
<script>
    $(document).ready(function () {
    	$('input[id$=updateBy]').datepicker({
    	    dateFormat: 'dd-mm-yy'
    	});
    });
    $(document).ready(function () {
    	$('input[id$=updateTime]').datepicker({
    	    dateFormat: 'dd-mm-yy'
    	});
    });
    $(document).ready(function () {
    	$('input[id$=updatedt]').datepicker({
    	    dateFormat: 'dd-mm-yy'
    	});
    });
</script>
<!-- End: Date Picker -->
<style>
div#banner {
background-color: white;
height: 120px;
}
div#main {
border: solid 2px blue;
margin-left: 100px;
min-height: 300px;
background-color: yellow;
}
div#leftMenu {
background-color: green;
width: 80px;
position: relative;
top: 0px;
min-height: 300px;
}
div#topMenu {
border: 0px solid red;
background-color: orange;
}
div#main {
border: 2px solid red;
background-color: red;
}
div#content {
border: 2px solid red;
background-color: red;
}
.mycontainer {
    background-color:white;
    display:flex;
}
.fixed-left-menu {
    background-color:white;
    width: 200px;
}
.flex-item {
    background-color:white;
    flex-grow: 1;
}
</style>
</head>
<meta charset="ISO-8859-1">
<title>ADD Template</title>
</head>
<body>
<div id="outer">
<!-- begin: banner -->
<div id="banner" align="center">
<img alt="nitttr-bpl" src="banner.jpg" width="70%" height="100%" >
</div>
<!-- begin: banner -->
<br/>
<!--  begin: top menu -->
<div id="topMenu" class="topMenu">
<%@include file="topMenu.jsp" %>
</div>
<!--  end: top menu -->
<!--  begin: container -->
<div class="mycontainer">
    
    <!-- begin: side navigatio`n -->
    <%@include file="leftMenu.jsp" %>
    <!-- end: side navigation -->
    
    <!--  begin: main content -->
    <div class="flex-item" align="center">
    
    <h1>Main Content</h1>
    
    <!--  Begin: Dynamic Codes -->

<%
DropDownDBService dropDownDBService =new DropDownDBService();
Complaint complaint = (Complaint)request.getAttribute("complaint");
String homeURL=(String)request.getSession().getAttribute("homeURL");
String pageNo=(null==(String)request.getParameter("pageNo")?"":(String)request.getParameter("pageNo"));
String limit=(null==request.getParameter("limit")?"":(String)request.getParameter("limit"));
ArrayList<DropDownDTO> list = new ArrayList<DropDownDTO>();
DropDownDTO ddDto=new DropDownDTO();
Iterator<DropDownDTO> it = list.iterator();
%>
<form action="complaintCntrl"  id="myform" name="myform" accept-charset="UTF-8" >
<table cellspacing="10px">
<tr>
<td>
COMPLAINT TYPE<font color="red">*</font>:
</td>

<td>

<%list = dropDownDBService.getList("dd_complaint_type");
it = list.iterator();%>
<select required name="complaintType">
<%while(it.hasNext())
{
ddDto= (DropDownDTO)it.next();
if(complaint.getComplaintType().equals(ddDto.getCode())){
%>
<option selected value="<%=ddDto.getCode()%>"><%=ddDto.getValue()%></option>
<% } else { %>
<option value="<%=ddDto.getCode()%>"><%=ddDto.getValue()%></option>
<% } %>
<%}%>
</select>
</td>

</tr>
<tr>
<td>
DETAIL<font color="red">*</font>:
</td>

<td>
<textarea required col="50" row="10" name="detail" id="detail"></textarea>
</td>

</tr>
<tr>
<td>
COMPLAINT DT<font color="red">*</font>:
</td>

<td>
<input required type="text" name="complaintDt" value="<%=complaint.getComplaintDt()%>" size="30">
</td>

</tr>
<tr>
<td>
UPDATE BY<font color="red">*</font>:
</td>

<td>
<input type="text" id="updateBy" name="updateBy" value="<%=DateService.getDTSDDMMYYYY(complaint.getUpdateBy()).equals("11-11-1111")?"":DateService.getDTSDDMMYYYY(complaint.getUpdateBy())%>">
</td>

</tr>
<tr>
<td>
UPDATE TIME<font color="red">*</font>:
</td>

<td>
<input type="text" id="updateTime" name="updateTime" value="<%=DateService.getDTSDDMMYYYY(complaint.getUpdateTime()).equals("11-11-1111")?"":DateService.getDTSDDMMYYYY(complaint.getUpdateTime())%>">
</td>

</tr>
<tr>
<td>
COMPLAINT STATUS<font color="red">*</font>:
</td>

<td>

<%list = dropDownDBService.getList("dd_open");
it = list.iterator();%>
<select required name="complaintStatus">
<%while(it.hasNext())
{
ddDto= (DropDownDTO)it.next();
if(complaint.getComplaintStatus().equals(ddDto.getCode())){
%>
<option selected value="<%=ddDto.getCode()%>"><%=ddDto.getValue()%></option>
<% } else { %>
<option value="<%=ddDto.getCode()%>"><%=ddDto.getValue()%></option>
<% } %>
<%}%>
</select>
</td>

</tr>
<tr>
<td>
UPDATE DT<font color="red">*</font>:
</td>

<td>
<input type="text" id="updatedt" name="updatedt" value="<%=DateService.getDTSDDMMYYYY(complaint.getUpdatedt()).equals("11-11-1111")?"":DateService.getDTSDDMMYYYY(complaint.getUpdatedt())%>">
</td>

</tr>

</table>

<input type="hidden" name="page" value= "addNewComplaint">
<input type="hidden" name="pageNo" value= "<%=pageNo%>">
<input type="hidden" name="limit" value= "<%=limit%>">
</form>

<button type="submit" form="myform"  name="opr" value= "save" class="form-submit-button">Save</button>
<a href="<%=homeURL%>"><button type="button" class="form-submit-button">Close</button></a>
<% dropDownDBService.closeConnection(); %>
    <!--  End: Dynamic Codes -->
    </div>
    <!--  end: main content -->
</div>
<!--  end: container -->
</div>
</body>
</html>
