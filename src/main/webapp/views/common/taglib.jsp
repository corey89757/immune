<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://com.payegis.serviceplatform/ElTag" prefix="el" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<%--静态资源路径--%>
<c:set var="staticPath" value="${ctx}/public" scope="request"/>
<c:set var="version" value="20170301.1" scope="request"/>