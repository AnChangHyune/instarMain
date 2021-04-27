<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ include file="../common/head.jspf"%>

		
<div class="section-article-list">
  <div class="container mx-auto">
    <div class="card bordered shadow-lg item-bt-1-not-last-child">
      <div class="card-title">
        <a href="javascript:history.back();" class="cursor-pointer">
          <i class="fas fa-chevron-left"></i>
        </a>
        <span>게시물 리스트</span>
      </div>
      <div class="search-form-box mt-2 px-4">
			<form action="" class="grid gap-2">
				<input type="hidden" name="boardId" value="${board.id}" />

				<div class="form-control">
					<label class="label">
						<span class="label-text">옵션</span>
					</label>
					<select class="select select-bordered" name="searchKeywordType">
						<option value="titleAndBody">제목+내용</option>
						<option value="title">제목</option>
						<option value="body">내용</option>
					</select>
					<script>
						const param__searchKeywordType = '${param.searchKeywordType}';
						if (param__searchKeywordType.length > 0) {
							$(
									'.search-form-box form [name="searchKeywordType"]')
									.val('${param.searchKeywordType}');
						}
					</script>
				</div>

				<div class="form-control">
					<label class="label">
						<span class="label-text">제목</span>
					</label>
					<input value="${param.searchKeyword}" class="input input-bordered"
						name="searchKeyword" type="text" placeholder="검색어를 입력해주세요."
						maxlength="10" />
				</div>

				<div class="form-control">
					<label class="label">
						<span class="label-text">검색</span>
					</label>
					<input type="submit" class="btn btn-sm btn-primary" value="검색" />
				</div>
			</form>
		</div>
		
		<div class="plain-link-wrap gap-3 mt-4">
            <a href="write?boardId=${board.id}" class="plain-link">
                <span><i class="fas fa-edit"></i></span>
                <span>글 작성</span>
            </a>
            
             <a href="/" class="plain-link">
                <span><i class="fas fa-home"></i></span>
                <span>홈</span>
            </a>
        </div>
		<hr />
		<br />
		<br />
      <c:forEach items="${articles}" var="article">
      
      <div class="item-bt-1-not-last-child">
        <!-- 게시물 아이템, first -->
        <div class="px-4 py-8">
          <a class="hover:underline cursor-pointer">
            <span class="badge badge-outline">제목</span>
            <div class="line-clamp-3">
              ${article.title}
            </div>
          </a>
          <div class="mt-3 grid sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-3">
            <a href="#" class="row-span-7">
              <img class="rounded" src="https://i.pravatar.cc/250?img=37" alt="">
            </a>

            <a href="#" class="hover:underline">
              <span class="badge badge-primary">번호</span>
              <span>${article.id}</span>
            </a>

            <a href="#" class="cursor-pointer hover:underline">
              <span class="badge badge-accent">작성자</span>
              <span>홍길동</span>
            </a>

            <a href="#" class="hover:underline">
              <span class="badge">등록날짜</span>
              <span class="text-gray-600 text-light">${article.regDate}</span>
            </a>

            <a href="#" class="hover:underline">
              <span class="badge">수정날짜</span>
              <span class="text-gray-600 text-light">${article.updateDate}</span>
            </a>
            
            <a class="mt-3 hover:underline cursor-pointer col-span-1 sm:col-span-2 xl:col-span-3">
              <span class="badge badge-outline">본문</span>
              <div class="line-clamp-3">
                ${article.body}
              </div>
            </a>
          </div>

          <div class="plain-link-wrap gap-3 mt-4 mb-4">
            <a href="detail?id=${board.id}" class="plain-link" title="자세히 보기">
              <span><i class="fas fa-info"></i></span>
              <span>자세히 보기</span>
            </a>
            <a href="#" class="plain-link">
              <span><i class="fas fa-edit"></i></span>
              <span>수정</span>
            </a>
            <a onclick="if ( !confirm('삭제하시겠습니까?') ) return false;" href="#" class="plain-link">
              <span>
                <i class="fas fa-trash"></i>
                <span>삭제</span>
              </span>
            </a>
          </div>
          <hr />
        </div>
      </div>
      </c:forEach>
    <div class="pages mt-4 mb-4 text-center">
			<c:set var="pageMenuArmSize" value="4" />
			<c:set var="startPage"
				value="${page - pageMenuArmSize >= 1  ? page - pageMenuArmSize : 1}" />
			<c:set var="endPage"
				value="${page + pageMenuArmSize <= totalPage ? page + pageMenuArmSize : totalPage}" />

			<c:set var="uriBase" value="?boardId=${board.id}" />
			<c:set var="uriBase"
				value="${uriBase}&searchKeywordType=${param.searchKeywordType}" />
			<c:set var="uriBase"
				value="${uriBase}&searchKeyword=${param.searchKeyword}" />
				
			<c:set var="aClassStr"
				value="px-2 inline-block border border-gray-200 rounded text-lg hover:bg-gray-200" />

			<c:if test="${startPage > 1}">
				<a class="${aClassStr}" href="${uriBase}&page=1">◀◀</a>
				<a class="${aClassStr}" href="${uriBase}&page=${startPage - 1}">◀</a>
			</c:if>

			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a class="${aClassStr} ${page == i ? 'text-red-500' : ''}"
					href="${uriBase}&page=${i}">${i}</a>
			</c:forEach>

			<c:if test="${endPage < totalPage}">
				<a class="${aClassStr}" href="${uriBase}&page=${endPage + 1}">▶</a>

				<a class="${aClassStr}" href="${uriBase}&page=${totalPage}">▶▶</a>
			</c:if>
		</div>
    </div>
    
  </div>
</div>

<%@ include file="../common/foot.jspf"%>