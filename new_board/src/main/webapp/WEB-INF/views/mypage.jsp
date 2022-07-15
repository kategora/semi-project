<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="includes/header.jsp"%>
<div>asdas</div>
<div id="user">aaa</div>
<div id="pw"></div>
<div id="name"></div>




<script>
	$(document).ready(function() {
		var userid = '125521';
		$.ajax({
			type : 'get',
			url : '/mypage/get',
			data : {
				'userid' : userid
			},
			dataType : 'json',
			success : function(data) {
				console.log("asd" + data);
				$("#user").text(data.userid);
				$("#pw").text(data.userpw);
				$("#name").text(data.userName);
			}
		});
		
			

	});
</script>



<%@ include file="includes/footer.jsp"%>