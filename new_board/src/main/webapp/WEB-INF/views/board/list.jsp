<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>


<!-- Page Heading -->
<h1 class="h3 mb-2 text-gray-800">Tables</h1>
<p class="mb-4">
	DataTables is a third party plugin that is used to generate the demo
	table below. For more information about DataTables, please visit the <a
		target="_blank" href="https://datatables.net">official DataTables
		documentation</a>.
</p>

<!-- DataTales Example -->
<div class="card shadow mb-4">

	<div class="card-header py-3" align="right">
		<button id="regBtn" style="color: green;">글쓰기</button>
	</div>

	<div class="card-body">

		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead>
					<tr>
						<th>#번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>수정일</th>
					</tr>
				</thead>

				<tbody>
					<c:forEach var="board" items="${list }">
						<tr>
							<td><c:out value="${board.bno }" /></a></td>
							<td><a href="${board.bno}" class="move"> <c:out value="${board.title }" />
									<c:if test="${board.replyCnt ne 0 }">
										<span style="color:red;">
											[<c:out value="${board.replyCnt }"/>]</span>
									</c:if>
								</a></td>
							<td><c:out value="${board.writer }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.regdate }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${board.updateDate }" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<br>
			
			<!-- 쪽번호 -->
			<div>
				<ul class="pagination justify-content-center">
					<c:if test="${pageMaker.prev }">
						<li class="page-item previous"><a
							href="${pageMaker.startPage-1 }" class="page-link">Prev</a></li>
					</c:if>
					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<li class='page-item ${pageMaker.cri.pageNum==num?"active":"" }'>
							<a href="${num }" class="page-link">${num }</a>
						</li>
					</c:forEach>
					<c:if test="${pageMaker.next }">
						<li class="page-item next"><a href="${pageMaker.endPage+1 }"
							class="page-link"> Next</a></li>
					</c:if>
				</ul>
			</div>
			
			<!-- 검색창 -->
			<br><br>
			<div>
				<div class="col-lg-12">
					<form id ="searchForm" action="/board/list" method="get">
						&nbsp;&nbsp;&nbsp;<select name="type">
						 <option value="" ${pageMaker.cri.type==null?"selected":""}>
						 --</option>
						 <option value="T" ${pageMaker.cri.type eq "T"?"selected":"" }>
						 제목</option>
						 <option value="C" ${pageMaker.cri.type eq "C"?"selected":"" }>
						 내용</option>
						 <option value="W" ${pageMaker.cri.type eq "W"?"selected":"" }>
						 작성자</option>
						 <option value="TC" ${pageMaker.cri.type eq "TC"?"selected":"" }>
						 제목+내용</option>
						 <option value="TW" ${pageMaker.cri.type eq "TW"?"selected":"" }>
						 제목+작성자</option>
						 <option value="WC" ${pageMaker.cri.type eq "WC"?"selected":"" }>
						 내용+작성자</option>
						 <option value="TCW" ${pageMaker.cri.type eq "TWC"?"selected":"" }>
						 제목+내용+작성자</option>
						</select>
						<input type="text" name="keyword" value="${pageMaker.cri.keyword }"/>
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<button id="searchBtn" class="btn btn-warning">Search</button>
					</form>
				</div>
			</div>
			<br />


		</div>
	</div>
</div>




<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLable" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header"></div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button class="btn btn-primary" type="button" data-dismiss="modal">close</button>
			</div>
		</div>
	</div>
</div>


<form id="actionForm" action="/board/list" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<input type="hidden" name="type" value="${pageMaker.cri.type }">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
</form>

<script>
	$(document).ready(
			function() {
				$('#dataTable').DataTable({
					"order" : [ [ 0, "desc" ] ],
					"paging" : false,
					"bFilter" : false,
					"info" : false
				});

				$("#regBtn").on("click", function() {
					self.location = "/board/register";
				})

				var result = '<c:out value="${result}"/>';
				checkModal(result);

				function checkModal(result) {
					if (result === '') {
						return;
					}
					if ($.isNumeric(result)) {
						if (parseInt(result) > 0) {
							$(".modal-body").html(
									"게시글 " + parseInt(result) + "번이 등록");
						}
					} else {
						$(".modal-body").html(result);
					}
					$("#myModal").modal("show");

				}

				var actionForm = $("#actionForm");

				$(".page-item a").on(
						"click",
						function(e) {
							e.preventDefault();
							
							console.log("click");
							actionForm.find("input[name='pageNum']").val(
									$(this).attr("href"));
							actionForm.submit();
						});

				$(".move").on(
						"click",
						function(e) {
							e.preventDefault();
							var bno=actionForm.find("input[name='bno']").val();
							if(bno!=''){
								actionForm.find("input[name='bno']").remove();
							}
							actionForm
									.append("<input type='hidden' name='bno' "
											+ "value= '" + $(this).attr("href")
											+ "'>");
							actionForm.attr("action", "/board/get");
							actionForm.submit();
						});
				
				var searchForm = $("#searchForm");
				$("#searchForm button").on("click", function(e){
					if(!searchForm.find("option:selected").val()){
						alert("검색 종류를 선택하세요.");
						return false;
					}
					if(!searchForm.find("input[name='keyword']").val()){
						alert("키워드를 입력하세요.");
						return false;
					}
					searchForm.find("input[name='pageNum']").val(1);
					e.preventDefault();
					searchForm.submit();
				});
				

				
				$('#searchBtn').on("click", function(e){
					e.preventDefault();
					
					var searchForm = $("#searchForm");
					var searchKeyword = $("input[name='keyword']").val();
					var skey = '<c:out value="${pageMaker.cri.keyword}"/>';
					
					console.log("이전 검색어 : " + skey);
					console.log("현재 검색어 : " + searchKeyword);
					
					if(skey != searchKeyword) {
						searchForm.find("input[name='pageNum']").val(1);
					}
					searchForm.submit();
				});
				
				
				
				
				
				
			});
</script>


<%@ include file="../includes/footer.jsp"%>