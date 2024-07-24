<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="중급자 루틴" />
<%@ include file="../../common/head.jsp" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>중급자 운동 프로그램 (2분할 루틴)</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
</head>
<body>
    <div class="container mx-auto mt-8">
        <h1 class="text-3xl font-bold mb-4">중급자 운동 프로그램 (2분할 루틴)</h1>
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
                    <td class="py-2 px-4 border">상체 운동</td>
                    <td class="py-2 px-4 border">
                        <ul class="list-disc ml-4">
                            <li>벤치프레스</li>
                            <li>덤벨 플라이</li>
                            <li>바벨 로우</li>
                            <li>풀업</li>
                            <li>덤벨 숄더 프레스</li>
                            <li>사이드 레터럴 레이즈</li>
                            <li>바이셉 컬</li>
                            <li>트라이셉 익스텐션</li>
                        </ul>
                    </td>
                    <td class="py-2 px-4 border">
                        <ul class="list-disc ml-4">
                            <li>4세트 x 8회</li>
                            <li>4세트 x 12회</li>
                            <li>4세트 x 8회</li>
                            <li>4세트 x 8회</li>
                            <li>4세트 x 10회</li>
                            <li>4세트 x 15회</li>
                            <li>4세트 x 12회</li>
                            <li>4세트 x 12회</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td class="py-2 px-4 border">화요일</td>
                    <td class="py-2 px-4 border">하체 운동</td>
                    <td class="py-2 px-4 border">
                        <ul class="list-disc ml-4">
                            <li>스쿼트</li>
                            <li>데드리프트</li>
                            <li>레그 프레스</li>
                            <li>레그 컬</li>
                            <li>레그 익스텐션</li>
                            <li>카프 레이즈</li>
                        </ul>
                    </td>
                    <td class="py-2 px-4 border">
                        <ul class="list-disc ml-4">
                            <li>4세트 x 8회</li>
                            <li>4세트 x 8회</li>
                            <li>4세트 x 12회</li>
                            <li>4세트 x 12회</li>
                            <li>4세트 x 15회</li>
                            <li>4세트 x 20회</li>
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
                    <td class="py-2 px-4 border">상체 운동</td>
                    <td class="py-2 px-4 border">
                        <ul class="list-disc ml-4">
                            <li>벤치프레스</li>
                            <li>덤벨 플라이</li>
                            <li>바벨 로우</li>
                            <li>풀업</li>
                            <li>덤벨 숄더 프레스</li>
                            <li>사이드 레터럴 레이즈</li>
                            <li>바이셉 컬</li>
                            <li>트라이셉 익스텐션</li>
                        </ul>
                    </td>
                    <td class="py-2 px-4 border">
                        <ul class="list-disc ml-4">
                            <li>4세트 x 8회</li>
                            <li>4세트 x 12회</li>
                            <li>4세트 x 8회</li>
                            <li>4세트 x 8회</li>
                            <li>4세트 x 10회</li>
                            <li>4세트 x 15회</li>
                            <li>4세트 x 12회</li>
                            <li>4세트 x 12회</li>
                        </ul>
                    </td>
                </tr>
                <tr>
                    <td class="py-2 px-4 border">금요일</td>
                    <td class="py-2 px-4 border">하체 운동</td>
                    <td class="py-2 px-4 border">
                        <ul class="list-disc ml-4">
                            <li>스쿼트</li>
                            <li>데드리프트</li>
                            <li>레그 프레스</li>
                            <li>레그 컬</li>
                            <li>레그 익스텐션</li>
                            <li>카프 레이즈</li>
                        </ul>
                    </td>
                    <td class="py-2 px-4 border">
                        <ul class="list-disc ml-4">
                            <li>4세트 x 8회</li>
                            <li>4세트 x 8회</li>
                            <li>4세트 x 12회</li>
                            <li>4세트 x 12회</li>
                            <li>4세트 x 15회</li>
                            <li>4세트 x 20회</li>
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
</body>
</html>


