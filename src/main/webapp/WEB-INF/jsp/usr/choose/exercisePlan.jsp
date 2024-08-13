<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="운동계획 페이지" />
<%@ include file="../../common/head.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <section class="mt-8 h-screen text-black">
		<div class="container mx-auto">
			<div class="flex justify-center flex-col items-center">
				<div class="text-4xl font-bold mb-12">자신의 레벨을 선택해주세요</div>
				<div class="flex space-x-4">
				    <a class="level-menu flex justify-center items-center w-52 h-20 bg-gray-200 rounded text-black text-xl no-underline hover:bg-gray-300 rounded-2xl" href="/usr/exerciseByLevel/beginner">
				        <div class="image-container">
				            <img src="https://www.shutterstock.com/image-illustration/cartoon-beard-character-man-yellow-600nw-2078832850.jpg" alt="" />
				        </div>
				        <span>초급자</span>
				    </a>
				    <a class="level-menu flex justify-center items-center w-52 h-20 bg-gray-200 rounded text-black text-xl no-underline hover:bg-gray-300 rounded-2xl" href="/usr/exerciseByLevel/intermediate">
				        <div class="image-container">
				            <img src="https://img.freepik.com/premium-vector/man-doing-exercises-with-dumbbells-illustration_108231-487.jpg" alt="" />
				        </div>
				        <span>중급자</span>
				    </a>
				    <a class="level-menu flex justify-center items-center w-52 h-20 bg-gray-200 rounded text-black text-xl no-underline hover:bg-gray-300 rounded-2xl" href="/usr/exerciseByLevel/advanced">
				        <div class="image-container">
				            <img src="https://img.freepik.com/premium-photo/3d-character-men-with-bodybuilding-cartoon-beard-character-man-does-exercises-with-dumbbells-ai-generated_43969-15363.jpg" alt="" />
				        </div>
				        <span>상급자</span>
				    </a>
				</div>
			</div>	
			<button class="btn btn-active btn-sm fixed bottom-16 left-16" onclick="history.back();">뒤로가기</button>
		</div>
	</section>
</body>
</html>
