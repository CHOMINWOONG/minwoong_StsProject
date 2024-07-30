<%@ page language="java" contentType="application/json; charset=EUC-KR" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.google.gson.Gson" %>
<%
    String query = request.getParameter("query").toLowerCase();
    List<String> exercises = Arrays.asList("벤치프레스", "덤벨 플라이", "바벨 로우", "풀업", "덤벨 숄더 프레스", "사이드 레터럴 레이즈", "바이셉 컬", "트라이셉 익스텐션", "스쿼트", "데드리프트", "레그 프레스", "레그 컬", "레그 익스텐션", "카프 레이즈");
    List<String> result = new ArrayList<>();

    for (String exercise : exercises) {
        if (exercise.toLowerCase().contains(query)) {
            result.add(exercise);
        }
    }

    String jsonResponse = new Gson().toJson(result);
    response.getWriter().write(jsonResponse);
%>

