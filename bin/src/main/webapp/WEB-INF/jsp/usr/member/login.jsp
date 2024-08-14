<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="로그인" />

<%@ include file="../../common/head.jsp" %>

	<script>
		const loginForm_onSubmit = function(form) {
			form.loginId.value = form.loginId.value.trim();
			form.loginPw.value = form.loginPw.value.trim();
			
			if (form.loginId.value.length == 0) {
				alert('아이디를 입력해주세요');
				form.loginId.focus();
				return;
			}
			
			if (form.loginPw.value.length == 0) {
				alert('비밀번호를 입력해주세요');
				form.loginPw.focus();
				return;
			}
			
			form.submit();
		}
	</script>

	<section class="mt-8 text-lg">
		<div class="container mx-auto px-3">
			<form action="doLogin" method="post" onsubmit="loginForm_onSubmit(this); return false;">
				<div class="form-control">
		          	<label class="label">
		            	<span class="label-text">아이디</span>
		          	</label>
		          	<input type="text" name="loginId" placeholder="아이디를 입력해주세요" class="input input-bordered" required />
		        </div>
		        
		        <div class="form-control">
		         	 <label class="label">
		            	<span class="label-text">비밀번호</span>
		          	</label>
		          	
		          	<input type="password" name="loginPw" placeholder="비밀번호를 입력해주세요" class="input input-bordered" required />
		          	
		          	<label class="label">
		            	<a href="#" class="label-text-alt link link-hover">Forgot password?</a>
		          	</label>		 
		        </div>
		        
		        <div class="form-control mt-6">
		          	<button class="btn btn-primary">Login</button>
		        </div>
			</form>
			<div class="btns mt-3 text-sm">
				<button onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
<%@ include file="../../common/foot.jsp" %>

