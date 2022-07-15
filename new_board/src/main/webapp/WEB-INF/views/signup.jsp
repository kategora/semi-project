<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<form action="/signup" method="post">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
아이디<input name="userid" />
비밀번호<input name="userpw" />
이름<input name="userName" />

<button type="submit">가입하기</button>

</form>

