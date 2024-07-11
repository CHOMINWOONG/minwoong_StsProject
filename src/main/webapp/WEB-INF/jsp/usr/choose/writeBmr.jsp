<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="CHOOSE WRITEBMR" />
<%@ include file="../../common/head.jsp" %>
	
<!DOCTYPE html>
<html lang="ko">
	
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
	            <form action="/usr/choose/calculateBmr" method="post">
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
	            <c:if test="${not empty bmr}">
	                <div class="mt-6 p-4 bg-green-100 rounded-lg text-center">
	                    <h2 class="text-xl font-bold mb-2">���ʴ�緮 ���</h2>
	                    <p>���ʴ�緮�� <strong>${bmr}</strong> kcal�Դϴ�.</p>
	                </div>
	            </c:if>
	        </div>
	    </div>
	</body>
</html>

</html>



<%@ include file="../../common/foot.jsp" %>