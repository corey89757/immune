<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctx" value="${pageContext.reqest.contextPath}" scope="request"/>
<%--静态资源路径--%>
<c:set var="staticPath" value="${ctx}/public" scope="request"/>
<c:set var="version" value="20170720.1" scope="request"/>