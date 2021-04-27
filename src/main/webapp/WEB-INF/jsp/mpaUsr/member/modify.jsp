<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../common/head.jspf"%>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<script>
	let MemberModify__submitFormDone = false;
	function MemberModify__submitForm(form) {

		if (MemberModify__submitFormDone) {
			return;
		}

		form.loginPwInput.value = form.loginPwInput.value.trim();

		if (form.loginPwInput.value.length == 0) {
			alert('비밀번호를 입력해주세요.');
			form.loginPwInput.focus();

			return;
		}

		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();

		if (form.loginPwConfirm.value.length == 0) {
			alert('비밀번호를 다시 한번 입력해주세요.');
			form.loginPwConfirm.focus();

			return;
		}

		if (form.loginPwInput.value != form.loginPwConfirm.value) {
			alert('비밀번호가 일치하지 않습니다.');
			form.loginPwConfirm.focus();

			return;
		}

		form.name.value = form.name.value.trim();

		if (form.name.value.length == 0) {
			alert('이름을 입력해주세요.');
			form.name.focus();

			return;
		}

		form.nickname.value = form.nickname.value.trim();

		if (form.nickname.value.length == 0) {
			alert('닉네임을 입력해주세요.');
			form.nickname.focus();

			return;
		}

		form.cellphoneNo.value = form.cellphoneNo.value.trim();

		if (form.cellphoneNo.value.length == 0) {
			alert('전화번호를 입력해주세요.');
			form.cellphoneNo.focus();

			return;
		}

		form.email.value = form.email.value.trim();

		if (form.email.value.length == 0) {
			alert('이메일을 입력해주세요.');
			form.email.focus();

			return;
		}

		form.loginPw.value = sha256(form.loginPwInput.value);
		form.loginPwInput.value = '';
		form.loginPwConfirm.value = '';

		form.submit();
		MemberModify__submitFormDone = true;
	}
</script>
<div class="section section-join">
	<div class="container mx-auto">
		<div class="card bordered shadow-lg item-bt-1-not-last-child">
			<div class="card-title">
				<a href="javascript:history.back();" class="cursor-pointer"> <i
					class="fas fa-chevron-left"></i>
				</a> <span>회원가입</span>

			</div>
			<div class="px-4 py-8">
				<form action="doModify" class="grid form-type-1"
					onsubmit=" MemberModify__submitForm(this); return false;"
					method="POST">
					<input type="hidden" name="loginPw" />

					<div class="form-control">
						<label class="label cursor-pointer"> 아이디 </label>
						<div class="plain-text">${rq.loginedMember.loginId}</div>

						<label class="cursor-pointer label"> 비밀번호 </label> 
						<input type="password" class="input input-bordered w-full" name="loginPwInput" placeholder="비밀번호" maxlength="30" />
						
						<label class="cursor-pointer label"> 비밀번호 확인 </label> 
						<input type="password" class="input input-bordered w-full" name="loginPwConfirm" placeholder="비밀번호 확인" maxlength="20" /> 
						
						<label class="label cursor-pointer"> 이름 </label> 
						<input type="text" name="name" value="${rq.loginedMember.name}" class="input input-bordered w-full" maxlength="20" /> 
						
						<label class="label cursor-pointer">닉네임 </label> 
						<input type="text" name="nickname" value="${rq.loginedMember.nickname}" class="input input-bordered w-full" maxlength="30" /> 
						
						<label class="label cursor-pointer"> 전화번호 </label> 
						<input type="text" name="cellphoneNo" value="${rq.loginedMember.cellphoneNo}" class="input input-bordered w-full" maxlength="30" /> 
						
						<label class="label cursor-pointer"> 이메일 </label> 
						<input type="text"name="email" value="${rq.loginedMember.email}" class="input input-bordered w-full" maxlength="30" />

						<div class="mt-4 btn-wrap gap-1">
							<button type="submit" class="btn btn-sm btn-primary mb-1">
								<span><i class="fas fa-user-plus"></i></span> &nbsp; <span>수정</span>
							</button>
							
							<a href="/" class="btn btn-sm mb-1" title="자세히 보기"> <span><i
									class="fas fa-home"></i></span> &nbsp; <span>홈</span>
							</a>
							
							<a href="../member/mypage" class="btn btn-sm btn-sm mb-1">
	                  			   <span><i class="fas fa-home"></i></span>
	                  			   &nbsp;
	                   			   <span>마이페이지</span>
                			</a>

						</div>
					</div>
				</form>
			</div>
		</div>

	</div>
</div>

<%@ include file="../common/foot.jspf"%>