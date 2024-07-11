<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="CHOOSE WRITEBMR" />
<%@ include file="../../common/head.jsp" %>
	
<!DOCTYPE html>
<html lang="ko">
	
	<!DOCTYPE html>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <title>기초대사량 계산기</title>
	</head>
	<body>
	    <!-- 전체 컨테이너를 가운데 정렬 -->
	    <div class="center-container">
	        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
	            <!-- 제목을 가운데 정렬하고 스타일을 적용 -->
	            <h1 class="text-2xl font-bold mb-6 text-center">기초대사량 계산기</h1>
	            
	            <!-- 폼 시작 -->
	            <form id="bmrForm">
	                <!-- 성별 입력 필드 -->
	                <div class="mb-4 flex justify-between items-center">
	                    <label for="gender" class="block text-gray-700">성별 (남/여):</label>
	                    <input type="text" id="gender" name="gender" class="w-1/2 px-3 py-2 border rounded-lg" required>
	                </div>
	                <!-- 나이 입력 필드 -->
	                <div class="mb-4 flex justify-between items-center">
	                    <label for="age" class="block text-gray-700">나이:</label>
	                    <input type="number" id="age" name="age" class="w-1/2 px-3 py-2 border rounded-lg" required>
	                </div>
	                <!-- 체중 입력 필드 -->
	                <div class="mb-4 flex justify-between items-center">
	                    <label for="weight" class="block text-gray-700">체중 (kg):</label>
	                    <input type="number" id="weight" name="weight" step="0.1" class="w-1/2 px-3 py-2 border rounded-lg" required>
	                </div>
	                <!-- 키 입력 필드 -->
	                <div class="mb-4 flex justify-between items-center">
	                    <label for="height" class="block text-gray-700">키 (cm):</label>
	                    <input type="number" id="height" name="height" step="0.1" class="w-1/2 px-3 py-2 border rounded-lg" required>
	                </div>
	                <!-- 제출 버튼 -->
	                <div>
	                    <input type="submit" value="계산하기" class="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600">
	                </div>
	            </form>
	            <!-- BMR 결과 표시 -->
	            <div id="result" class="mt-6 p-4 bg-green-100 rounded-lg text-center hidden">
	                <h2 class="text-xl font-bold mb-2">기초대사량 결과</h2>
	                <p>기초대사량은 <strong id="bmrValue"></strong> kcal입니다.</p>
	            </div>
	        </div>
	    </div>
	    <script>
	        document.getElementById('bmrForm').addEventListener('submit', function(event) {
	            event.preventDefault();
	
	            const gender = document.getElementById('gender').value;
	            const age = document.getElementById('age').value;
	            const weight = document.getElementById('weight').value;
	            const height = document.getElementById('height').value;
	
	            const data = {
	                gender: gender,
	                age: age,
	                weight: weight,
	                height: height
	            };
	
	            fetch('/api/calculateBmr', {
	                method: 'POST',
	                headers: {
	                    'Content-Type': 'application/json'
	                },
	                body: JSON.stringify(data)
	            })
	            .then(response => response.json())
	            .then(data => {
	                document.getElementById('bmrValue').innerText = data.bmr;
	                document.getElementById('result').classList.remove('hidden');
	            })
	            .catch(error => console.error('Error:', error));
	        });
	    </script>
	</body>
</html>

<%@ include file="../../common/foot.jsp" %>