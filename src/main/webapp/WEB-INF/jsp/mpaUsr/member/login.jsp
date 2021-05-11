<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
	let MemberLogin__submitFormDone = false;
	function MemberLogin__submitForm(form) {

		if (MemberLogin__submitFormDone) {
			return;
		}

		form.loginId.value = form.loginId.value.trim();

		if (form.loginId.value.length == 0) {
			alert('아이디를 입력해주세요.');
			form.loginId.focus();

			return;
		}

		form.loginPwInput.value = form.loginPwInput.value.trim();

		if (form.loginPwInput.value.length == 0) {
			alert('비밀번호를 입력해주세요.');
			form.loginPwInput.focus();

			return;
		}
		
		form.loginPw.value = sha256(form.loginPwInput.value);
		form.loginPwInput.value = ''; 

		form.submit();
		MemberLogin__submitFormDone = true;
	}
</script>
<div class="top">
	<a class="hero" href="/">INSTA</a>
</div>
<div class="section section-login">
	<div class="container mx-auto">
		<div class="card bordered shadow-lg item-bt-1-not-last-child">
			<div class="card-title">
				<a href="javascript:history.back();" class="cursor-pointer"> <i
					class="fas fa-chevron-left"></i>
				</a> <span>로그인</span>

			</div>
			<div class="px-4 py-8">
				<form action="doLogin" class="grid form-type-1"
					onsubmit="MemberLogin__submitForm(this); return false;"
					method="POST">
					<input type="hidden" name="redirectUri"
						value="${param.afterLoginUri}" />
					<input type="hidden" name="loginPw" />
					<div class="form-control">
						<label class="label cursor-pointer"> 아이디 </label> <input
							type="text" name="loginId" placeholder="아이디"
							class="input input-bordered w-full" maxlength="20" /> <label
							class="cursor-pointer label"> 비밀번호 </label> <input
							type="password" class="input input-bordered w-full"
							name="loginPwInput" placeholder="비밀번호" maxlength="30" />



						<div class="mt-4 btn-wrap gap-1">
							<button type="submit" class="btn btn-sm btn-primary mb-1">
								<span><i class="fas fa-sign-in-alt"></i></span> &nbsp; <span>로그인</span>
							</button>

							<a href="join" class="btn btn-sm mb-1" title="자세히 보기"> <span><i
									class="fas fa-user-plus"></i></span> &nbsp; <span>회원가입</span>
							</a> <a href="../member/findLoginId" type="submit"
								class="btn btn-link btn-sm mb-1" style="font-size: 10px;"> <span>아이디 찾기</span>
							</a> <a href="../member/findLoginPw" type="submit"
								class="btn btn-link btn-sm mb-1" style="font-size: 10px;"> <span>비밀번호 찾기</span>
							</a>
						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
</div>

<%@ include file="../common/foot.jspf"%>