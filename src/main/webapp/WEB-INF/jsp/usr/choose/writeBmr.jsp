<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="CHOOSE WRITEBMR" />
<%@ include file="../../common/head.jsp" %>
	
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>기초대사량 계산기</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="flex justify-center items-start min-h-screen p-6">
        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
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

                document.getElementById('bmrValue').innerText = bmr.toFixed(2);
                document.getElementById('tdeeValue').innerText = tdee.toFixed(2);
                document.getElementById('maintenance').innerText = tdee.toFixed(2);
                document.getElementById('weightLossLow').innerText = (tdee - 500).toFixed(2);
                document.getElementById('weightLossHigh').innerText = (tdee - 300).toFixed(2);
                document.getElementById('weightGainLow').innerText = (tdee + 400).toFixed(2);
                document.getElementById('weightGainHigh').innerText = (tdee + 600).toFixed(2);
                document.getElementById('result').classList.remove('hidden');
            })
            .catch(error => console.error('Error:', error));
        });
    </script>
</body>
</html>




<%@ include file="../../common/foot.jsp" %>