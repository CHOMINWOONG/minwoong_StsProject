<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<link rel="shortcut icon" href="/resource/imges/favicon.ico" />
<!-- 데이지 UI, 테일윈드 -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.8/dist/full.min.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- 공통 css -->
<link rel="stylesheet" href="/resource/common.css" />
<!-- <script src="/resource/common.js" defer="defer"></script> -->
</head>
<body>
	<div class="h-20 flex container mx-auto text-3xl">
		<div><a class="h-full px-3 flex items-center w-32 h-32" href="/"><img src="https://media.istockphoto.com/id/1340648234/ko/%EB%B2%A1%ED%84%B0/%EC%86%90-%EA%B0%95%ED%95%9C-%ED%85%9C%ED%94%8C%EB%A6%BF-%EB%B2%A1%ED%84%B0-%EC%95%84%EC%9D%B4%EC%BD%98.jpg?s=612x612&w=0&k=20&c=k7ZFwdWkSHfnM0eaKZlFgy9CrRfF2A8_dwLv9cs3yA4=" alt="" /></a></div>
		<div class="grow"></div>
		<ul class="flex">
			<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        class="h-5 w-5"
        fill="none"
        viewBox="0 0 24 24"
        stroke="currentColor">
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          stroke-width="2"
          d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6" />
      </svg>
    </a></li>
			<li class="hover:underline"><a class="h-full px-3 flex items-center text-sm" href="/usr/article/list?boardId=1"><span>공지사항</span></a></li>
			<li class="hover:underline"><a class="h-full px-3 flex items-center text-sm" href="/usr/article/list?boardId=2"><span>자유 게시판</span></a></li>
			<c:if test="${rq.getLoginedMemberId() == 0 }">
				<li class="hover:underline"><a class="h-full px-3 flex items-center text-sm" href="/usr/member/join"><span>회원가입</span></a></li>
				<li class="hover:underline"><a class="h-full px-3 flex items-center text-sm" href="/usr/member/login"><span>로그인</span></a></li>
			</c:if>
			<c:if test="${rq.getLoginedMemberId() != 0 }">
				<li class="hover:underline"><a class="h-full px-3 flex items-center text-sm" href="/usr/member/myPage"><span>마이페이지</span></a></li>
				<li class="hover:underline"><a class="h-full px-3 flex items-center text-sm" href="/usr/choose/exercisePlan"><span>운동 프로그램 세우기</span></a></li>
				<li class="hover:underline"><a class="h-full px-3 flex items-center text-sm" href="/usr/member/doLogout"><span>로그아웃</span></a></li>
			</c:if>
		</ul>
		<label class="flex cursor-pointer gap-2">
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width="20"
    height="20"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    stroke-width="2"
    stroke-linecap="round"
    stroke-linejoin="round">
    <circle cx="12" cy="12" r="5" />
    <path
      d="M12 1v2M12 21v2M4.2 4.2l1.4 1.4M18.4 18.4l1.4 1.4M1 12h2M21 12h2M4.2 19.8l1.4-1.4M18.4 5.6l1.4-1.4" />
  </svg>
  <input type="checkbox" value="synthwave" class="toggle theme-controller" />
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width="20"
    height="20"
    viewBox="0 0 24 24"
    fill="none"
    stroke="currentColor"
    stroke-width="2"
    stroke-linecap="round"
    stroke-linejoin="round">
    <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path>
  </svg>
</label>
	</div>
	
	<section class="my-3 text-2xl">
		<div class="container mx-auto px-3">
			<div>${pageTitle }</div>
		</div>
	</section>