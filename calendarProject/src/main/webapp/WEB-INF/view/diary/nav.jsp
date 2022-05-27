<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<ul class="nav">
  <li class="nav-item">
  <c:choose>
  <c:when test="${empty userId}">
    <a class="nav-link fw-semibold disabled" href='list?userId=${userId}' title="목록 보기"><i class="bi bi-card-text"></i></a>  
  </c:when>
  <c:otherwise>
    <a class="nav-link fw-semibold" href='list?userId=${userId}' title="목록 보기"><i class="bi bi-card-text"></i></a>  
  </c:otherwise>
  </c:choose>
  </li>
  <li class="nav-item">
  <c:choose>
  <c:when test="${empty list[0].user_id}">
    <a class="nav-link fw-semibold disabled" href='calendar?userId=<c:out value="${list[0].user_id}"></c:out>' title="달력보기"><i class="bi bi-calendar3"></i></a>  
  </c:when>
  <c:otherwise>
    <a class="nav-link fw-semibold" href='calendar?userId=<c:out value="${list[0].user_id}"></c:out>' title="달력보기"><i class="bi bi-calendar3"></i></a>
  </c:otherwise>
  </c:choose>
  </li>
</ul>