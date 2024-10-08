<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="초급자 루틴" />
<%@ include file="../../common/head.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>초급자 운동 프로그램 (무분할 루틴)</title>
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
        <h1 class="text-3xl font-bold mb-4">초급자 운동 프로그램 (무분할 루틴)</h1>
        <table class="min-w-full bg-white">
            <thead>
                <tr>
                    <th class="py-2 px-4 border">요일</th>
                    <th class="py-2 px-4 border">운동 목록</th>
                    <th class="py-2 px-4 border">세트 x 횟수</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="py-2 px-4 border">월요일</td>
                    <td class="py-2 px-4 border">
                        <ul class="list-disc ml-4">
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">스쿼트</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">푸쉬업</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">덤벨 로우</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">덤벨 숄더 프레스</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">바벨 컬</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">트라이셉 익스텐션</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">싯업</a></li>
                        </ul>
                    </td>
                    <td class="py-2 px-4 border">
                        <ul class="list-disc ml-4">
                            <li>3세트 x 10회</li>
                            <li>3세트 x 10회</li>
                            <li>3세트 x 10회</li>
                            <li>3세트 x 10회</li>
                            <li>3세트 x 10회</li>
                            <li>3세트 x 10회</li>
                            <li>3세트 x 30초</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td class="py-2 px-4 border">화요일</td>
                    <td class="py-2 px-4 border">휴식 또는 가벼운 유산소 운동</td>
                    <td class="py-2 px-4 border">-</td>
                </tr>
                <tr>
                    <td class="py-2 px-4 border">수요일</td>
                    <td class="py-2 px-4 border">
                        <ul class="list-disc ml-4">
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">스쿼트</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">체스트 프레스 머신</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">덤벨 로우</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">덤벨 숄더 프레스</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">바이셉 컬</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">트라이셉 익스텐션</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">플랭크</a></li>
                        </ul>
                    </td>
                    <td class="py-2 px-4 border">
                        <ul class="list-disc ml-4">
                            <li>3세트 x 10회</li>
                            <li>3세트 x 10회</li>
                            <li>3세트 x 10회</li>
                            <li>3세트 x 10회</li>
                            <li>3세트 x 10회</li>
                            <li>3세트 x 10회</li>
                            <li>3세트 x 30초</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td class="py-2 px-4 border">목요일</td>
                    <td class="py-2 px-4 border">휴식 또는 가벼운 유산소 운동</td>
                    <td class="py-2 px-4 border">-</td>
                </tr>
                <tr>
                    <td class="py-2 px-4 border">금요일</td>
                    <td class="py-2 px-4 border">
                        <ul class="list-disc ml-4">
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">스쿼트</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">덤벨 체스트 프레스</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">덤벨 로우</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">덤벨 숄더 프레스</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">바벨 컬</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">트라이셉 익스텐션</a></li>
                            <li><a href="#" class="exercise-item" data-toggle="modal-custom" data-target="#exerciseModal">싯업</a></li>
                        </ul>
                    </td>
                    <td class="py-2 px-4 border">
                        <ul class="list-disc ml-4">
                            <li>3세트 x 10회</li>
                            <li>3세트 x 10회</li>
                            <li>3세트 x 10회</li>
                            <li>3세트 x 10회</li>
                            <li>3세트 x 10회</li>
                            <li>3세트 x 10회</li>
                            <li>3세트 x 15회</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td class="py-2 px-4 border">토요일</td>
                    <td class="py-2 px-4 border">휴식 또는 가벼운 유산소 운동</td>
                    <td class="py-2 px-4 border">-</td>
                </tr>
                <tr>
                    <td class="py-2 px-4 border">일요일</td>
                    <td class="py-2 px-4 border">휴식 또는 가벼운 유산소 운동</td>
                    <td class="py-2 px-4 border">-</td>
                </tr>
            </tbody>
        </table>
        <p class="mt-4">이 루틴을 일주일에 3회 반복하세요.</p>
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
                var query = $(this).val().toLowerCase();
                $.ajax({
                    url: 'searchExercise.jsp',
                    method: 'GET',
                    data: { query: query },
                    success: function(data) {
                        var exercises = JSON.parse(data);
                        $('#exerciseList').empty();
                        exercises.forEach(function(exercise) {
                            $('#exerciseList').append('<li class="list-group-item">' + exercise + '</li>');
                        });

                        // 검색 결과 항목을 클릭했을 때 활성화 상태를 변경하는 이벤트 핸들러
                        $('.list-group-item').on('click', function() {
                            $('.list-group-item').removeClass('active');
                            $(this).addClass('active');
                        });
                    }
                });
            });
        });
    </script>
</body>
</html>



