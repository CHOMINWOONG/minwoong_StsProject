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
	    <title>���ʴ�緮 ����</title>
	</head>
	<body>
	    <!-- ��ü �����̳ʸ� ��� ���� -->
	    <div class="center-container">
	        <div class="bg-white p-8 rounded-lg shadow-md w-full max-w-md">
	            <!-- ������ ��� �����ϰ� ��Ÿ���� ���� -->
	            <h1 class="text-2xl font-bold mb-6 text-center">���ʴ�緮 ����</h1>
	            
	            <!-- �� ���� -->
	            <form id="bmrForm">
	                <!-- ���� �Է� �ʵ� -->
	                <div class="mb-4 flex justify-between items-center">
	                    <label for="gender" class="block text-gray-700">���� (��/��):</label>
	                    <input type="text" id="gender" name="gender" class="w-1/2 px-3 py-2 border rounded-lg" required>
	                </div>
	                <!-- ���� �Է� �ʵ� -->
	                <div class="mb-4 flex justify-between items-center">
	                    <label for="age" class="block text-gray-700">����:</label>
	                    <input type="number" id="age" name="age" class="w-1/2 px-3 py-2 border rounded-lg" required>
	                </div>
	                <!-- ü�� �Է� �ʵ� -->
	                <div class="mb-4 flex justify-between items-center">
	                    <label for="weight" class="block text-gray-700">ü�� (kg):</label>
	                    <input type="number" id="weight" name="weight" step="0.1" class="w-1/2 px-3 py-2 border rounded-lg" required>
	                </div>
	                <!-- Ű �Է� �ʵ� -->
	                <div class="mb-4 flex justify-between items-center">
	                    <label for="height" class="block text-gray-700">Ű (cm):</label>
	                    <input type="number" id="height" name="height" step="0.1" class="w-1/2 px-3 py-2 border rounded-lg" required>
	                </div>
	                <!-- ���� ��ư -->
	                <div>
	                    <input type="submit" value="����ϱ�" class="w-full bg-blue-500 text-white py-2 rounded-lg hover:bg-blue-600">
	                </div>
	            </form>
	            <!-- BMR ��� ǥ�� -->
	            <div id="result" class="mt-6 p-4 bg-green-100 rounded-lg text-center hidden">
	                <h2 class="text-xl font-bold mb-2">���ʴ�緮 ���</h2>
	                <p>���ʴ�緮�� <strong id="bmrValue"></strong> kcal�Դϴ�.</p>
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