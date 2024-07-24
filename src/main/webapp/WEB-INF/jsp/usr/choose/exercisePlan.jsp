<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="운동계획 페이지" />
<%@ include file="../../common/head.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <section class="mt-8">
		<div class="container mx-auto">
			<div class="flex justify-center flex-col items-center">
				<div class="text-4xl font-bold mb-12">자신의 레벨을 선택해주세요</div>
				<div class="flex space-x-4">
				    <a class="flex justify-center items-center w-52 h-20 bg-gray-200 rounded text-black text-xl no-underline hover:bg-gray-300 rounded-2xl" href="/usr/exerciseByLevel/beginner"><span>초급자</span></a>
				    <a class="flex justify-center items-center w-52 h-20 bg-gray-200 rounded text-black text-xl no-underline hover:bg-gray-300 rounded-2xl" href="/usr/exerciseByLevel/intermediate"><span>중급자</span></a>
				    <a class="flex justify-center items-center w-52 h-20 bg-gray-200 rounded text-black text-xl no-underline hover:bg-gray-300 rounded-2xl" href="/usr/exerciseByLevel/advanced"><span>상급자</span></a>
				</div>
			</div>	
			<button class="btn btn-active btn-sm" onclick="history.back();">뒤로가기</button>
		</div>
	</section>
    <script>
		
    </script>
</body>
</html>
