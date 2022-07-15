<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="includes/header.jsp"%>
    
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<h1>로그인 처리</h1>
			<h2>${error }</h2>
			<h2>${logout }</h2>
			
			<form method="post" action="/login">
				<div class="form-group">
					<input type="text" name="username" placeholder="userid" class="form-control">
				</div>
				<div class="form-group">
					<input type="password" name="password" placeholder="password" class="form-control">
				</div>
				<div class="form-group">
					<input type="checkbox" name="remember-me">
				</div>
				
				<div class="form-group">
					<input type="submit" value="login">
				</div>
				
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			</form>	
		</div>
	</div>
</div>
    
    
    
    
<%@ include file="includes/footer.jsp"%>