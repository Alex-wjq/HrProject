<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/icon.css">
    <script rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/easyui/demo/demo.css"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>

</head>
<body>
<table id="tt" class="easyui-datagrid" style="width:400px;height:auto;">
    <thead>
    <tr>
        <th field="name1" width="100">Col 1</th>
        <th field="name2" width="100">Col 2</th>
        <th field="name3" width="200">Col 2</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="i">
        <tr>

            <td><a href="${pageContext.request.contextPath}/notice/show?id=+${i.id}">${i.id}</a></td>
            <td>${i.name}</td>
            <td>${i.title}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
