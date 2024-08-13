<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="상급자 루틴" />
<%@ include file="../../common/head.jsp" %>
	
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
	    <title>상급자 운동 프로그램 (4분할 루틴)</title>
	    <!-- Bootstrap CSS -->
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	    <!-- jQuery -->
	    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	    <!-- Popper.js -->
	    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2/dist/umd/popper.min.js"></script>
	    <!-- Bootstrap JS -->
	    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	</head>
	<body>
	    <div class="container mx-auto mt-8">
	        <h1 class="text-3xl font-bold mb-4">상급자 운동 프로그램 (4분할 루틴)</h1>
	        <table class="min-w-full bg-white">
	            <thead>
	                <tr>
	                    <th class="py-2 px-4 border">요일</th>
	                    <th class="py-2 px-4 border">운동 부위</th>
	                    <th class="py-2 px-4 border">운동 목록</th>
	                    <th class="py-2 px-4 border">세트 x 횟수</th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td class="py-2 px-4 border">월요일</td>
	                    <td class="py-2 px-4 border">가슴 & 삼두</td>
	                    <td class="py-2 px-4 border">
	                        <ul class="list-disc ml-4">
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">벤치프레스</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">인클라인 벤치프레스</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">덤벨 플라이</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">덤벨 숄더 프레스</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">케이블 크로스오버</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">트라이셉 딥스</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">트라이셉 푸쉬다운</a></li>
	                        </ul>
	                    </td>
	                    <td class="py-2 px-4 border">
	                        <ul class="list-disc ml-4">
	                            <li>5세트 x 6회</li>
	                            <li>5세트 x 8회</li>
	                            <li>5세트 x 10회</li>
	                            <li>5세트 x 12회</li>
	                            <li>5세트 x 8회</li>
	                            <li>5세트 x 10회</li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="py-2 px-4 border">화요일</td>
	                    <td class="py-2 px-4 border">등 & 이두</td>
	                    <td class="py-2 px-4 border">
	                        <ul class="list-disc ml-4">
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">풀업</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">바벨 로우</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">덤벨 로우</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">덤벨 숄더 프레스</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">시티드 로우</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">바이셉 컬</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">해머 컬</a></li>
	                        </ul>
	                    </td>
	                    <td class="py-2 px-4 border">
	                        <ul class="list-disc ml-4">
	                            <li>5세트 x 6회</li>
	                            <li>5세트 x 8회</li>
	                            <li>5세트 x 10회</li>
	                            <li>5세트 x 12회</li>
	                            <li>5세트 x 8회</li>
	                            <li>5세트 x 10회</li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="py-2 px-4 border">수요일</td>
	                    <td class="py-2 px-4 border">휴식 또는 가벼운 유산소 운동</td>
	                    <td class="py-2 px-4 border">-</td>
	                    <td class="py-2 px-4 border">-</td>
	                </tr>
	                <tr>
	                    <td class="py-2 px-4 border">목요일</td>
	                    <td class="py-2 px-4 border">하체</td>
	                    <td class="py-2 px-4 border">
	                        <ul class="list-disc ml-4">
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">스쿼트</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">데드리프트</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">레그 프레스</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">핵 스쿼트</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">레그 익스텐션</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">레그 컬</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">카프 레이즈</a></li>
	                        </ul>
	                    </td>
	                    <td class="py-2 px-4 border">
	                        <ul class="list-disc ml-4">
	                            <li>5세트 x 6회</li>
	                            <li>3세트 x 6회</li>
	                            <li>5세트 x 8회</li>
	                            <li>4세트 x 8회</li>
	                            <li>5세트 x 10회</li>
	                            <li>5세트 x 12회</li>
	                            <li>5세트 x 20회</li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="py-2 px-4 border">금요일</td>
	                    <td class="py-2 px-4 border">어깨 & 복근</td>
	                    <td class="py-2 px-4 border">
	                        <ul class="list-disc ml-4">
	                            <li></li>
	                            <li></li>
	                            <li></li>
	                            <li></li>
	                            <li></li>
	                            <li></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">덤벨 숄더 프레스</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">사이드 레터럴 레이즈</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">프론트 레이즈</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">벤트 오버 레이즈</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">싯업</a></li>
	                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">헹잉 레그레이즈</a></li>
	                        </ul>
	                    </td>
	                    <td class="py-2 px-4 border">
	                        <ul class="list-disc ml-4">
	                            <li>5세트 x 6회</li>
	                            <li>5세트 x 10회</li>
	                            <li>5세트 x 10회</li>
	                            <li>5세트 x 12회</li>
	                            <li>5세트 x 20회</li>
	                            <li>5세트 x 30회</li>
	                        </ul>
	                    </td>
	                </tr>
	                <tr>
	                    <td class="py-2 px-4 border">토요일</td>
	                    <td class="py-2 px-4 border">휴식 또는 가벼운 유산소 운동</td>
	                    <td class="py-2 px-4 border">-</td>
	                    <td class="py-2 px-4 border">-</td>
	                </tr>
	                <tr>
	                    <td class="py-2 px-4 border">일요일</td>
	                    <td class="py-2 px-4 border">휴식 또는 가벼운 유산소 운동</td>
	                    <td class="py-2 px-4 border">-</td>
	                    <td class="py-2 px-4 border">-</td>
	                </tr>
	            </tbody>
	        </table>
	        <p class="mt-4">이 루틴을 일주일에 4회 반복하세요. 수요일과 주말은 휴식 또는 가벼운 유산소 운동을 추천합니다.</p>
	        <button class="btn btn-active btn-sm" onclick="history.back();">뒤로가기</button>
	    </div>
	    
	    <!-- 모달 백드롭 -->
	    <div class="modal-backdrop-custom"></div>
	    <!-- 모달 창 -->
	    <div class="modal-custom" id="exerciseModal" tabindex="-1" role="dialog" aria-labelledby="exerciseModalLabel" aria-hidden="true">
	        <div class="modal-dialog" role="document">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exerciseModalLabel">운동 종목 선택</h5>
	                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">&times;</span>
	                    </button>
	                </div>
	                <div class="modal-body">
	                    <input type="text" id="searchExercise" class="form-control" placeholder="운동 종목 검색">
	                    <ul id="exerciseList" class="list-group mt-2">
	                        <!-- 검색 결과를 여기에 표시 -->
	                    </ul>
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	                    <button type="button" class="btn btn-primary" id="saveExercise">저장</button>
	                </div>
	            </div>
	        </div>
	    </div>
	
	    
	    <script>
	    
	    $(document).ready(function() {
	        var selectedExerciseItem;
	
	        // 운동 종목을 클릭했을 때 모달 창을 띄우는 이벤트 핸들러
	        $('.exercise-item').on('click', function() {
	            selectedExerciseItem = $(this);
	            $('#exerciseModal').modal('show');
	        });
	
	        // 모달 창에서 저장 버튼을 클릭했을 때 선택된 운동 종목을 업데이트하는 이벤트 핸들러
	        $('#saveExercise').on('click', function() {
	            var selectedExercise = $('#exerciseList .list-group-item.active').text();
	            if (selectedExercise) {
	                selectedExerciseItem.text(selectedExercise);
	                $('#exerciseModal').modal('hide');
	            }
	        });
	
	        // 검색 입력 필드에서 키가 눌렸을 때 운동 종목을 검색하는 이벤트 핸들러
	        $('#searchExercise').on('keyup', function() {
	            var query = $(this).val().toLowerCase(); // 입력된 검색어를 소문자로 변환
	            $.ajax({
	                url: '/usr/exerciseByLevel/searchExercise', // 서버의 엔드포인트로 AJAX 요청
	                method: 'POST', // POST 요청 사용
	                data: { query: query }, // 요청 데이터로 검색어 전달
	                success: function(data) {
	                    var exercises = JSON.parse(data).results.map(item => item.name); // 응답 데이터에서 운동 종목 이름 추출
	                    $('#exerciseList').empty(); // 기존 검색 결과 지우기
	                    exercises.forEach(function(exercise) { // 각 운동 종목을 리스트에 추가
	                        $('#exerciseList').append('<li class="list-group-item">' + exercise + '</li>');
	                    });
	
	                    // 검색 결과 항목을 클릭했을 때 활성화 상태를 변경하는 이벤트 핸들러
	                    $('.list-group-item').on('click', function() {
	                        $('.list-group-item').removeClass('active');
	                        $(this).addClass('active');
	                    });
	                },
	                error: function(xhr, status, error) {
	                    console.error('Error:', error); // 오류 발생 시 콘솔에 출력
	                    $('#exerciseList').append('<li class="list-group-item text-danger">검색 중 오류가 발생했습니다.</li>'); // 오류 메시지 표시
	                }
	            });
	        });
	    });
	    </script>   
	</body>
</html>




<%@ include file="../../common/foot.jsp" %>