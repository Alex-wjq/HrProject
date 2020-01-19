<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
</head>
<body>
<div class="easyui-panel" title="文件列表">
<table id="tt" style="width:500px;height:auto;">

    <tbody>
    <c:forEach items="${list}" var="i">
        <tr>
            <form action="${pageContext.request.contextPath}/get" method="post">
            <td><input type="hidden" name="filepath" value="${i.filepath}"/>
                <input type="hidden" name="filename" value="${i.filename}"/>${i.filename}</td>
                <td><input type="submit" value="文件下载"/></td>
            </form>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>
