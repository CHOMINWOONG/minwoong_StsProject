<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="게시글 쓰기" />

<%@ include file="../../common/head.jsp" %>
<%@ include file="../../common/toastUiEditorLib.jsp" %>

	<section class="mt-8 text-lg">
		<div class="container mx-auto px-3">
			<form action="doWrite" method="post" onsubmit="submitForm(this); return false;">
				<input type="hidden" name="body"/>
				<div class="w-9/12 mx-auto">
					<table class="table table-lg">
						<tr>
							<th>게시판</th>
							<td>
								<div class="flex">
									<div>
										<label class="flex items-center">
											<input class="radio radio-sm" type="radio" name="boardId" value="1" checked />
											&nbsp;&nbsp;공지사항
										</label>
									</div>
									<div class="w-20"></div>
									<div>
										<label class="flex items-center">
											<input class="radio radio-sm" type="radio" name="boardId" value="2" />
											&nbsp;&nbsp;자유
										</label>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>제목</th>
							<td><input class="input input-bordered w-full" type="text" name="title" /></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<div class="toast-ui-editor">
									<script type="text/x-template"></script>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="btns flex justify-center">
									<button class="btn btn-active btn-wide">작성</button>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</form>
			<div class="mt-3 text-sm">
				<button class="btn btn-active btn-sm" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</section>
<%@ include file="../../common/foot.jsp" %>