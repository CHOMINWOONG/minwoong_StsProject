<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="CHOOSE WRITEBMR" />
<%@ include file="../../common/head.jsp" %>
	
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>���ʴ�緮 ����</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
    <div class="flex justify-center items-start min-h-screen p-6">
        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
            <h1 class="text-2xl font-bold mb-10 text-center">���ʴ�緮 ����</h1>
            <form id="bmrForm" class="space-y-4">
                <div class="flex justify-between items-center">
                    <label for="gender" class="text-gray-700">����:</label>
                    <select id="gender" name="gender" class="border border-green-500 rounded w-9/12 p-2" required>
                        <option disabled selected>������ �������ּ���</option>
                        <option value="��">��</option>
                        <option value="��">��</option>
                    </select>
                </div>
                <div class="flex justify-between items-center">
                    <label for="age" class="text-gray-700">����:</label>
                    <input type="number" id="age" name="age" placeholder="���̸� �Է����ּ���" class="border border-green-500 rounded w-9/12 p-2" required/>
                </div>
                <div class="flex justify-between items-center">
                    <label for="weight" class="text-gray-700">ü�� (kg):</label>
                    <input type="number" id="weight" name="weight" step="0.1" placeholder="ü���� �Է����ּ���" class="border border-green-500 rounded w-9/12 p-2" required/>
                </div>
                <div class="flex justify-between items-center">
                    <label for="height" class="text-gray-700">Ű (cm):</label>
                    <input type="number" id="height" name="height" step="0.1" placeholder="Ű�� �Է����ּ���" class="border border-green-500 rounded w-9/12 p-2" required/>
                </div>
                <div class="flex justify-between items-center">
                    <label for="activity" class="text-gray-700">Ȱ�� ����:</label>
                    <select id="activity" name="activity" class="border border-green-500 rounded w-9/12 p-2" required>
                        <option disabled selected>Ȱ�� ������ �������ּ���</option>
                        <option value="1.2">���� ����� ����</option>
                        <option value="1.375">������ � (�� 1-3ȸ)</option>
                        <option value="1.55">������ � (�� 3-5ȸ)</option>
                        <option value="1.725">���� � (�� 6-7ȸ)</option>
                        <option value="1.9">�ſ� ���� � (�Ϸ� 2ȸ �̻�)</option>
                    </select>
                </div>
                <div>
                    <input type="submit" value="����ϱ�" class="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600">
                </div>
            </form>
            <div id="result" class="mt-6 p-4 bg-green-100 rounded-lg text-center hidden">
                <h2 class="text-xl font-bold mb-2">���</h2>
                <p>���ʴ�緮: <strong id="bmrValue"></strong> kcal</p>
                <p>Ȱ����緮: <strong id="tdeeValue"></strong> kcal</p>
                <p>ü�� ����: <strong id="maintenance"></strong> kcal</p>
                <p>ü�� ���� ��ǥ Į�θ� : <strong id="weightLossLow"></strong> kcal ~ <strong id="weightLossHigh"></strong> kcal</p>
                <p>(300~500 kcal ����)</p>
                <p>ü�� ���� ��ǥ Į�θ� : <strong id="weightGainLow"></strong> kcal ~ <strong id="weightGainHigh"></strong> kcal</p>
                <p>(400~600 kcal ����)</p>
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