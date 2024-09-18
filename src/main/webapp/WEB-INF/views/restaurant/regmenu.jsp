<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header2.jsp"%>
<div class="row">
	<div class="col-md-12">
		<h1 class="heading">
			<span>Restaurant 메뉴등록</span>
		</h1>
	</div>
	<!-- .col-md-12 close -->
</div>

<div class="row" style="margin-top: 50px;">
	<input type="hidden" id="tables" name="tables" >
	<div class="col-md-8 col-md-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">메뉴등록<div class="pull-right"><a href="#myModal" data-toggle="modal" class="btn btn-success btn-xs">메뉴추가</a></div>
			</div><!-- panel-heading -->
			<div class="panel-body">
			<form id="regiMenuForm" method="post" action="/restaurant/regMenu" >
				<div class="listarea">
				<div class="well" style="display:block"><p align="center">[메뉴추가] 버튼을 클릭하여 메뉴를 등록하세요.</p></div>
				<ul class="chat" style="display:none">
				</ul>
				</div>
			</form>
			</div><!-- panel-body -->
			<div class="panel-footer">
				
			</div>
		</div>
		<!--panel panel-info  -->
	</div>
	<!-- .col-md-12 close -->
</div>
<!-- .row -->

<!-- Modal : 실제 등록화면-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Happy Table</h4>
			</div>
			<div class="modal-body">
				<div class="panel panel-info">
				<div class="panel-heading">메뉴등록</div>
				<!-- .panel-heading -->
				<div class="panel-body">
					<div class="row" style="width: 90%; margin-left: 20px;">
						<div class="form-group">
							<label for="menuName">메뉴명</label><input type="text" class="form-control" id="menuName" name="menuName"/>
						</div>
					</div>
					<!--.row  -->
					<div class="row" style="width: 90%; margin-left: 20px;">
						<div class="form-group">
							<label for="mainIngredient">주재료</label><input type="text" class="form-control" id="mainIngredient" name="mainIngredient"/>
						</div>
					</div>
					<!--.row  -->
					<div class="row" style="width: 90%; margin-left: 20px;">
						<div class="form-group">
							<label for="menuAcoount">메뉴소개</label><textarea rows="2" class="form-control" id="menuAcoount" name="menuAcoount" placeholder="20자 이내의 짧은 소개문구"></textarea>
						</div>
					</div>
					<!--.row  -->
					<div class="row" style="width: 90%; margin-left: 20px;">
						<div class="form-group">
							<label for="unitCost">가격</label> <div class="input-group">
							<input type="number" class="form-control" id="unitCost" name="unitCost"/>
							<span class="input-group-addon">원</span></div>
						</div>
					</div>
					<!--.row  -->
					<div class="row" style="width: 90%; margin-left: 20px;">
						<div class="form-group">
							<label for="serving">판매단위(권장 섭취인원)</label> <div class="input-group">
							<input type="number" class="form-control" id="serving" name="serving"/>
							<span class="input-group-addon">인분</span></div>
						</div>
					</div>
					<!--.row  -->
					<div class="row" style="width: 90%; margin-left: 20px;">
						<div class="form-group">
							<label for="menuImg">이미지파일(선택사항-구현중)</label> <input type="file"  id="menuImg" name="menuImg">
						</div>
					</div>
					<!--.row  -->
					

				</div><!-- .panel-body -->
				<div class="panel-footer"></div>
				<!-- .panel-footer -->
			</div>
			<!--.panel panel-Info  -->
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" id="menuRegBtn">등록</button>
				<button type="reset" class="btn btn-default" >초기화</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- resnum 전송위한 hidden -->
<form role="form" id ="sendresNum" action="/restaurant/regtablesuccess">
	<input type="hidden" id="menu_resNum" name="resNum" value="${resNum}">
</form>	
<script type="text/javascript" src="/resources/js/restregmenu.js"></script>
<%@ include file="../includes/footer2.jsp"%>

