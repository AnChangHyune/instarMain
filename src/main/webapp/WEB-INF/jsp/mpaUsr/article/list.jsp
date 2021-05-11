<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%@ include file="../common/head.jspf"%>

<form action="../article/list?boardId=${board.id}">
	<input type="hidden" name="boardId" value="${board.id}" />
	<div class="search form-control">
		<input value="${param.searchKeyword}" name="searchKeyword" type="text"
			placeholder="Search or type URL" maxlength="10" />
		<button type="submit" class="searchButton">
			<i class="fa fa-search"></i>
		</button>
	</div>
</form>

<div class="top">
	<a class="hero" href="/">INSTA</a>
</div>
<div class="section-article-list">
	<div class="container mx-auto">
		<div class="card bordered shadow-lg item-bt-1-not-last-child">
			<div class="card-title">
				<a href="javascript:history.back();" class="cursor-pointer"> <i
					class="fas fa-chevron-left"></i>
				</a> <span>게시물 리스트</span>
			</div>

			<div class="total-items mt-4 mb-2">
				<span class="badge badge-primary">TOTAL ITEMS : ${totalItemsCount}</span>
			</div>

			<div class="total-pages mt-2 mb-2">
				<span class="badge badge-primary">TOTAL PAGES : ${totalPage}</span>
			</div>

			<div class="page mt-2 mb-4">
				<span class="badge badge-primary">CURRENT PAGE : ${page}</span>
			</div>

			<hr />



			<div class="item-bt-1-not-last-child">
				<c:if test="${articles == null || articles.size() == 0}">
                        검색결과가 존재하지 않습니다.
                    </c:if>
				<c:forEach items="${articles}" var="article">
					<!-- 게시물 아이템, first -->
					<div class="px-4 py-8">
						<div
							style="width: 100%; height: 100%; display: flex; align-items: center;">
							<div style="width: 40px; height: 40px;">
								<a href="detail?id=${article.id}"> <img class="rounded-full"
									src="https://i.pravatar.cc/100?img=30"
									alt="${article.extra.writerRealName}">
								</a>
							</div>
							<div class="ml-4">
								<a href="detail?id=${article.id}"
									style="display: block; font-weight: bolder;">${article.extra.writerRealName}</a>
								<a href="detail?id=${article.id}"
									style="display: block; font-size: 12px;">${article.regDate}</a>
							</div>
						</div>
						<div class="mt-3 mb-3">
							<a href="detail?id=${article.id}">${article.title}</a>
						</div>
						<hr />
						<div
							class="mt-3 grid sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-3">
							<a href="detail?id=${article.id}" class="row-span-7"> <img
								class="rounded" src="https://i.pravatar.cc/250?img=37" alt="">
							</a> <a
								class="mt-3 hover:underline cursor-pointer col-span-1 sm:col-span-2 xl:col-span-3"
								href="detail?id=${article.id}">
								<div class="line-clamp-3">${article.body}</div>
							</a>
						</div>

						<div class="plain-link-wrap gap-3 mt-4 mb-4">
							<a href="detail?id=${board.id}" class="plain-link" title="자세히 보기">
								<span><i class="fas fa-info"></i></span> <span>자세히 보기</span>
							</a>
							<c:choose>
								<c:when
									test="${article.extra__writerName != rq.loginedMember.nickname}">
								</c:when>
								<c:otherwise>
									<a href="#" class="plain-link"> <span><i
											class="fas fa-edit"></i></span> <span>수정</span>
									</a>
									<a onclick="if ( !confirm('삭제하시겠습니까?') ) return false;"
										href="#" class="plain-link"> <span> <i
											class="fas fa-trash"></i> <span>삭제</span>
									</span>
									</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div style="width: 100%; height: 5px; background: #5555;"
							class="mt-5"></div>
					</div>
				</c:forEach>
			</div>
			<div class="plain-link-wrap gap-3 mt-4 ml-4">
				<a href="write?boardId=${board.id}" class="plain-link"> <span><i
						class="fas fa-edit"></i></span> <span>글 작성</span>
				</a> <a href="/" class="plain-link"> <span><i
						class="fas fa-home"></i></span> <span>홈</span>
				</a>
			</div>
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