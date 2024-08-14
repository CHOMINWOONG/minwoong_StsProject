<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="마이페이지" />

<%@ include file="../../common/head.jsp" %>

	<section class="mt-8 text-lg">
	    <div class="container mx-auto px-3 pb-8">
	        <div class="flex flex-col md:flex-row">
	            <div class="w-full md:w-1/2">
	                <div class="table-box-type">
	                    <table class="table table-lg border border-green-500">
	                        <tr>
	                            <th>번호</th>
	                            <td>${member.id }</td>
	                        </tr>
	                        <tr>
	                            <th>가입일</th>
	                            <td>${member.regDate.substring(2, 16) }</td>
	                        </tr>
	                        <tr>
	                            <th>정보 수정일</th>
	                            <td>${member.updateDate.substring(2, 16) }</td>
	                        </tr>
	                        <tr>
	                            <th>아이디</th>
	                            <td>${member.loginId }</td>
	                        </tr>
	                        <tr>
	                            <th>이름</th>
	                            <td>${member.name }</td>
	                        </tr>
	                        <tr>
	                            <th>닉네임</th>
	                            <td>${member.nickname }</td>
	                        </tr>
	                        <tr>
	                            <th>전화번호</th>
	                            <td>${member.cellphoneNum }</td>
	                        </tr>
	                        <tr>
	                            <th>이메일</th>
	                            <td>${member.email }</td>
	                        </tr>
	                    </table>
	                </div>
	            </div>
	            <div class="w-full md:w-1/2 mt-4 md:mt-0 md:ml-4">
	                <div id="calendar" class="border border-green-500 p-4 rounded-lg grid grid-cols-7 gap-2"></div>
	            </div>
	        </div>
	        
	        <div id="dietModal" class="hidden fixed z-10 inset-0 overflow-y-auto flex items-center justify-center">
	            <div class="bg-white p-5 rounded-lg shadow-lg w-1/3">
	                <div class="modal-header flex justify-between items-center mb-4">
	                    <h2 class="text-xl">식단 기록</h2>
	                    <button class="modal-close text-red-500">&times;</button>
	                </div>
	                <div class="modal-body mb-4">
	                    <input type="hidden" id="dietDate" />
	                    <label for="breakfastContent">아침:</label>
	                    <textarea id="breakfastContent" class="w-full mt-2 border rounded p-2"></textarea>
	                    <label for="lunchContent">점심:</label>
	                    <textarea id="lunchContent" class="w-full mt-2 border rounded p-2"></textarea>
	                    <label for="dinnerContent">저녁:</label>
	                    <textarea id="dinnerContent" class="w-full mt-2 border rounded p-2"></textarea>
	                </div>
	                <div class="flex justify-end">
		                <div class="modal-footer text-right mr-4">
		                    <button class="btn btn-primary" onclick="deleteDiet()">모두 지우기</button>
		                </div>
		                <div class="modal-footer text-right">
		                    <button class="btn btn-primary" onclick="saveDiet()">저장</button>
		                </div>
	                </div>
	            </div>
	        </div>
	
	        <div class="mt-3 flex justify-between">
	            <button class="btn btn-active btn-sm" onclick="history.back();">뒤로가기</button>
	            <a class="btn btn-active btn-sm" href="checkPassword?loginId=${member.loginId }">회원정보수정</a>
	        </div>
	    </div>
	</section>

<%@ include file="../../common/foot.jsp" %>

	<script>
    document.addEventListener('DOMContentLoaded', function() {
        const calendar = document.getElementById('calendar');
        const modal = document.getElementById('dietModal');
        const modalClose = document.querySelector('.modal-close');
        const dietDate = document.getElementById('dietDate');
        const breakfastContent = document.getElementById('breakfastContent');
        const lunchContent = document.getElementById('lunchContent');
        const dinnerContent = document.getElementById('dinnerContent');
        const deleteButton = document.querySelector('button[onclick="deleteDiet()"]'); // 삭제 버튼 선택
        const dietEntries = {};

        for (let i = 1; i <= 30; i++) {
            const dayCell = document.createElement('div');
            dayCell.className = 'day-cell border p-2 text-center cursor-pointer';
            dayCell.textContent = i;
            dayCell.dataset.date = i;
            dayCell.addEventListener('click', function() {
                const date = this.dataset.date;
                dietDate.value = date;
                const diet = dietEntries[date] || {};
                breakfastContent.value = diet.breakfast || '';
                lunchContent.value = diet.lunch || '';
                dinnerContent.value = diet.dinner || '';
                modal.classList.remove('hidden');
            });
            calendar.appendChild(dayCell);
        }

        modalClose.addEventListener('click', function() {
            modal.classList.add('hidden');
        });

        window.saveDiet = function() {
            const date = dietDate.value;
            const breakfast = breakfastContent.value.trim();
            const lunch = lunchContent.value.trim();
            const dinner = dinnerContent.value.trim();
            dietEntries[date] = { breakfast, lunch, dinner };
            alert(`${date}일의 식단이 저장되었습니다.`);
            modal.classList.add('hidden');
            fetch('/usr/diet/saveDiet', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    date: date,
                    breakfast: breakfast,
                    lunch: lunch,
                    dinner: dinner
                }),
            }).then(response => response.json())
              .then(data => {
                  if (data.success) {
                      alert('식단이 성공적으로 저장되었습니다.');
                      const dayCell = calendar.querySelector(`.day-cell[data-date='${date}']`);
                      if (dayCell) {
                          dayCell.classList.add('has-diet');
                          dayCell.title = `아침: ${breakfast}, 점심: ${lunch}, 저녁: ${dinner}`;
                      }
                  } else {
                      alert('식단 저장에 실패했습니다.');
                  }
              });
        };

        window.deleteDiet = function() {  // 삭제 기능 수정
            const date = dietDate.value;
            if (!date) {
                alert('삭제할 날짜를 선택해 주세요.');
                return;
            }
            if (!confirm(`${date}일의 식단을 삭제하시겠습니까?`)) {
                return;
            }
            fetch('/usr/diet/deleteDiet', {  // 삭제 요청
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    date: date,
                    breakfast: '', // 빈 값으로 삭제 요청
                    lunch: '',
                    dinner: ''
                }),
            }).then(response => response.json())
              .then(data => {
                  if (data.success) {
                      alert('식단이 성공적으로 삭제되었습니다.');
                      delete dietEntries[date];
                      const dayCell = calendar.querySelector(`.day-cell[data-date='${date}']`);
                      if (dayCell) {
                          dayCell.classList.remove('has-diet');
                          dayCell.title = '';
                      }
                      modal.classList.add('hidden');
                  } else {
                      alert('식단 삭제에 실패했습니다.');
                  }
              });
        };

        deleteButton.addEventListener('click', function() {  // 삭제 버튼 클릭 시 deleteDiet 함수 호출
            deleteDiet();
        });

        fetch('/usr/diet/loadDiet')
            .then(response => response.json())
            .then(data => {
                data.forEach(entry => {
                    const date = entry.date;
                    dietEntries[date] = {
                        breakfast: entry.breakfast,
                        lunch: entry.lunch,
                        dinner: entry.dinner
                    };
                    const dayCell = calendar.querySelector(`.day-cell[data-date='${date}']`);
                    if (dayCell) {
                        dayCell.classList.add('has-diet');
                        dayCell.title = `아침: ${entry.breakfast}, 점심: ${entry.lunch}, 저녁: ${entry.dinner}`;
                    }
                });
            });
    });
</script>
		
		<style>
		    .day-cell {
		        display: flex;
		        align-items: center;
		        justify-content: center;
		        height: 100px;
		        width: 100%;
		        cursor: pointer;
		    }
		
		    .modal {
		        display: none;
		    }
		
		    .modal:not(.hidden) {
		        display: flex;
		    }
		    
		    /* 달력 셀 css */
		    .day-cell {
			    transition: background-color 0.3s;
			}
			
			.day-cell:hover {
			    background-color: #f0f0f0;
			}
			
			.has-diet {
			    background-color: #e0f7fa;
			}
			
			.has-diet:hover {
			    background-color: #b2ebf2;
			}
		</style>