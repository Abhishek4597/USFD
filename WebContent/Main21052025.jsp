<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.*, com.mvc.dao.*, com.mvc.beans.*, java.util.*"  %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Category and Head Wise Selection</title>
</head>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script src="js/app-ajax.js" type="text/javascript"></script>
<%
    // Load head list and set as request attribute
    List<USFD_head_beans> HList = DDL.getUSFDHeads();
    request.setAttribute("uheads", HList);
%>

<body>
    <div style="text-align:center;">    
        <h2>Category and Head wise Selection Search</h2>		 
        <select name="courseid" onchange="getUsfdMenus(this.value);">
            <option value="Select" selected="Selected">Select</option>
            <c:forEach items="${uheads}" var="element">
                <option value="${element.headid}">${element.headname}</option> 
            </c:forEach>
        </select>  
    </div>
</body>
<script>
function getUsfdMenus(headid) {
    //alert(headid);

    $.ajax({
        url: 'MainServlet',
        type: 'POST',
        dataType: 'json',
        data: {
            headid: headid,
            action: 'getUSFDHeadMenu'
        },
        success: function(responseJson) {
            if (responseJson != null) {
                var $dropdown = $('#menuDropdown');
                $dropdown.empty(); // Clear existing options
                $dropdown.append('<option value="">-- Select Module --</option>');

                $.each(responseJson, function(index, value) {
                    const moduleName = value['module_name'];
                    $dropdown.append(
                        $('<option></option>').val(moduleName).text(moduleName)
                    );
                });
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX error:", status, error);
            console.log("Response:", xhr.responseText);
            alert("An error occurred: " + xhr.responseText);
        }
    });
}
function getUsfdSubMenus(menuid) {
    //alert(headid);

    $.ajax({
        url: 'MainServlet',
        type: 'POST',
        dataType: 'json',
        data: {
            menuid: menuid,
            action: 'getUSFDSubMenu'
        },
        success: function(responseJson) {
            if (responseJson != null) {
                var $dropdown = $('#menuDropdown');
                $dropdown.empty(); // Clear existing options
                $dropdown.append('<option value="">-- Select Module --</option>');

                $.each(responseJson, function(index, value) {
                    const moduleName = value['module_name'];
                    $dropdown.append(
                        $('<option></option>').val(moduleName).text(moduleName)
                    );
                });
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX error:", status, error);
            console.log("Response:", xhr.responseText);
            alert("An error occurred: " + xhr.responseText);
        }
    });
}

</script>
<select id="menuDropdown">
    <option value="">-- Select Module --</option>
</select>
</html>
