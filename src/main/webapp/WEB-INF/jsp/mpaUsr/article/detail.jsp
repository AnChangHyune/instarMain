<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/head.jspf"%>


<div class="section section-article-detail">
	<div class="container mx-auto mt-12">
		<div class="top">
			<a class="hero" href="/">INSTA</a>
		</div>
		<div class="card bordered shadow-lg item-bt-1-not-last-child">
			<div class="card-title mt-10">
				<a href="list?boardId=${board.id}" class="cursor-pointer"> <i
					class="fas fa-chevron-left"></i>
				</a> <span>게시물 상세페이지</span>
			</div>
			<div>

				<div class="px-4 py-8 mt-10">

					<div
						style="width: 100%; height: 100%; display: flex; align-items: center;">
						<div style="width: 40px; height: 40px;">
							<a href="detail?id=${article.id}"> <img class="rounded-full"
								src="https://i.pravatar.cc/100?img=30"
								alt="${article.extra__writerName}">
							</a>
						</div>
						<div class="ml-4">
							<a href="detail?id=${article.id}"
								style="display: block; font-weight: bolder;">${article.extra__writerName}</a>
							<a href="detail?id=${article.id}"
								style="display: block; font-size: 12px;">${article.regDate}</a>
						</div>
						<div class="flex-grow"></div>
						<span> <i class="fas fa-heart"></i> <span
							class="text-gray-400 text-light">120k</span>
						</span>
					</div>

					<div class="mt-4">
						<div>${article.title}</div>


						<div class="flex mt-8 mb-2">
							<i class="far fa-heart">좋아요</i>
							<div class="flex-grow"></div>
							<span>Number : </span> <span class="text-gray-400 text-light">${article.id}</span>
							<span class="ml-3"> </span> <span class="ml-3"> <span>Views:</span>
								<span class="text-gray-400 text-light">60k</span>
							</span>
						</div>
					</div>
					<hr />

					<div class="mt-6">

						<div class="mt-3">
							<img class="rounded" src="https://i.pravatar.cc/250?img=37"
								alt="">
						</div>
						<div class="mt-3">${article.bodyForPrint}</div>
					</div>
				</div>
			</div>

			<div>
				<h1 class="title-bar-type-2 px-4">댓글</h1>
				<div class="px-4 py-8">
					<!-- 댓글 입력 시작 -->
					<form
						class="relative flex py-4 text-gray-600 focus-within:text-gray-400">
						<img
							class="w-10 h-10 object-cover rounded-full shadow mr-2 cursor-pointer"
							alt="User avatar"
							src="https://images.unsplash.com/photo-1477118476589-bff2c5c4cfbb?ixlib=rb-1.2.1&amp;ixid=eyJhcHBfaWQiOjEyMDd9&amp;auto=format&amp;fit=crop&amp;w=200&amp;q=200">

						<span class="absolute inset-y-0 right-0 flex items-center pr-6">
							<button type="submit"
								class="p-1 focus:outline-none focus:shadow-none hover:text-blue-500">
								<svg
									class="w-6 h-6 transition ease-out duration-300 hover:text-blue-500 text-gray-400"
									xmlns="http://www.w3.org/2000/svg" fill="none"
									viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round"
										stroke-linejoin="round" stroke-width="2"
										d="M14.828 14.828a4 4 0 01-5.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                                </svg>
							</button>
						</span> <input type="search"
							class="w-full py-2 pl-4 pr-10 text-sm bg-gray-100 border border-transparent appearance-none rounded-tg placeholder-gray-400 focus:bg-white focus:outline-none focus:border-blue-500 focus:text-gray-900 focus:shadow-outline-blue"
							style="border-radius: 25px" placeholder="댓글을 입력해주세요."
							autocomplete="off">
					</form>
					<!-- 댓글 입력 끝 -->
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="../common/foot.jspf"%>