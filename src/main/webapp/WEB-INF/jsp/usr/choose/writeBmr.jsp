<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="식단 매크로 설정" />
<%@ include file="../../common/head.jsp" %>
	
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>기초대사량 계산기</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-white">
    <div class="flex justify-center items-start min-h-screen p-6">
        <div class="con bg-white p-8 rounded-lg shadow-md w-full max-w-md">
            <h1 class="text-2xl font-bold mb-10 text-center">기초대사량 계산기</h1>
            <form id="bmrForm" class="space-y-4">
                <div class="flex justify-between items-center">
                    <label for="gender" class="text-gray-700">성별:</label>
                    <select id="gender" name="gender" class="border border-green-500 rounded w-9/12 p-2" required>
                        <option disabled selected>성별을 선택해주세요</option>
                        <option value="남">남</option>
                        <option value="여">여</option>
                    </select>
                </div>
                <div class="flex justify-between items-center">
                    <label for="age" class="text-gray-700">나이:</label>
                    <input type="number" id="age" name="age" placeholder="나이를 입력해주세요" class="border border-green-500 rounded w-9/12 p-2" required/>
                </div>
                <div class="flex justify-between items-center">
                    <label for="weight" class="text-gray-700">체중 (kg):</label>
                    <input type="number" id="weight" name="weight" step="0.1" placeholder="체중을 입력해주세요" class="border border-green-500 rounded w-9/12 p-2" required/>
                </div>
                <div class="flex justify-between items-center">
                    <label for="height" class="text-gray-700">키 (cm):</label>
                    <input type="number" id="height" name="height" step="0.1" placeholder="키를 입력해주세요" class="border border-green-500 rounded w-9/12 p-2" required/>
                </div>
                <div class="flex justify-between items-center">
                    <label for="activity" class="text-gray-700">활동 수준:</label>
                    <select id="activity" name="activity" class="border border-green-500 rounded w-9/12 p-2" required>
                        <option disabled selected>활동 수준을 선택해주세요</option>
                        <option value="1.2">거의 운동하지 않음</option>
                        <option value="1.375">가벼운 운동 (주 1-3회)</option>
                        <option value="1.55">적당한 운동 (주 3-5회)</option>
                        <option value="1.725">고강도 운동 (주 6-7회)</option>
                        <option value="1.9">매우 고강도 운동 (하루 2회 이상)</option>
                    </select>
                </div>
                <div>
                    <input type="submit" value="계산하기" class="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600">
                </div>
            </form>
            
            <div id="result" class="mt-6 p-4 bg-green-100 rounded-lg text-center hidden">
                <h2 class="text-xl font-bold mb-2">결과</h2>
                <p>기초대사량: <strong id="bmrValue"></strong> kcal</p>
                <p>활동대사량: <strong id="tdeeValue"></strong> kcal</p>
                <p>체중 유지: <strong id="maintenance"></strong> kcal</p>
                <p>체중 감량 목표 칼로리 : <strong id="weightLossLow"></strong> kcal ~ <strong id="weightLossHigh"></strong> kcal</p>
                <p>(300~500 kcal 감소)</p>
                <p>체중 증량 목표 칼로리 : <strong id="weightGainLow"></strong> kcal ~ <strong id="weightGainHigh"></strong> kcal</p>
                <p>(400~600 kcal 증가)</p>
            </div>
             <div class="flex justify-center mb-8">
	        	<button class="w-full max-w-md bg-gray-300 text-black py-2 rounded-lg hover:bg-gray-400 mt-8" onclick="history.back();">뒤로가기</button>
	        </div>
         </div>
         <!-- 탄수화물, 단백질, 지방 표 추가 -->
			<div class="macro-table ml-32 flex justify-center">
				<div class="w-11/12 max-w-md"> <!-- 너비 제한 및 중앙 정렬 -->
					<input type="number" id="finalCalories" placeholder="최종 칼로리를 입력해주세요" class="border border-green-500 rounded w-full p-2" required/>
					<h3 class="mt-8 text-lg font-semibold text-center">영양소 분포</h3>
					<table class="table-auto w-full mt-2">
						<thead>
							<tr class="bg-gray-200">
								<th class="px-4 py-2">영양소</th>
								<th class="px-4 py-2">g(그램)</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="border px-4 py-2">탄수화물</td>
								<td class="border px-4 py-2" id="carbsValue"></td>
							</tr>
							<tr>
								<td class="border px-4 py-2">단백질</td>
								<td class="border px-4 py-2" id="proteinValue"></td>
							</tr>
							<tr>
								<td class="border px-4 py-2">지방</td>
								<td class="border px-4 py-2" id="fatValue"></td>
							</tr>
						</tbody>
					</table>
				<button id="calculateMacros" class="mt-2 w-full bg-green-500 text-white py-2 rounded-lg hover:bg-green-600">영양소 계산하기</button>
				<!-- 주변 식단가게 찾아보기 버튼 추가 -->
	            <div class="mt-6">
	                <button id="findStoreButton" class="w-full bg-green-500 text-white py-2 rounded-lg hover:bg-green-600">주변 식단가게 찾아보기</button>
	            </div>
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
            const activity = document.getElementById('activity').value;

            const data = {
                gender: gender,
                age: age,
                weight: weight,
                height: height,
                activity: activity
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
                const bmr = data.bmr;
                const tdee = bmr * parseFloat(activity);
                
                document.getElementById('bmrValue').innerText = bmr.toFixed(0);
                document.getElementById('tdeeValue').innerText = tdee.toFixed(0);
                document.getElementById('maintenance').innerText = tdee.toFixed(0);
                document.getElementById('weightLossLow').innerText = (tdee - 500).toFixed(0);
                document.getElementById('weightLossHigh').innerText = (tdee - 300).toFixed(0);
                document.getElementById('weightGainLow').innerText = (tdee + 400).toFixed(0);
                document.getElementById('weightGainHigh').innerText = (tdee + 600).toFixed(0);
                document.getElementById('result').classList.remove('hidden');
            })
            .catch(error => console.error('Error:', error));
        });
        
        document.getElementById('calculateMacros').addEventListener('click', function() {
            const finalCalories = parseFloat(document.getElementById('finalCalories').value);
            
            if (isNaN(finalCalories) || finalCalories <= 0) {
                alert('유효한 칼로리를 입력해주세요.');
                return;
            }

            // 영양소 비율
            const carbsRatio = 0.5; // 탄수화물 50%
            const proteinRatio = 0.3; // 단백질 30%
            const fatRatio = 0.2; // 지방 20%

            const carbs = (finalCalories * carbsRatio / 4).toFixed(2);  // 1g 당 4kcal
            const protein = (finalCalories * proteinRatio / 4).toFixed(2); // 1g 당 4kcal
            const fat = (finalCalories * fatRatio / 9).toFixed(2); // 1g 당 9kcal

            document.getElementById('carbsValue').innerText = carbs;
            document.getElementById('proteinValue').innerText = protein;
            document.getElementById('fatValue').innerText = fat;

            // 결과 영역 표시
            document.getElementById('result').classList.remove('hidden');
        });
	     // 주변 식단가게 찾아보기 버튼 클릭 이벤트 추가
	        document.getElementById('findStoreButton').addEventListener('click', function() {
	            window.location.href = '/usr/choose/findStore';
        });
    </script>
</body>
</html>


<%@ include file="../../common/foot.jsp" %>