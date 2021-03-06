<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--   jQuery , Bootstrap CDN  -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  CSS 추가 : 툴바에 화면 가리는 현상 해결 :  주석처리 전, 후 확인-->
	<style>
	
		@font-face {
		    font-family: 'Uiyeun';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105@1.1/Uiyeun.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}	
	
        body {
            padding-top : 70px;
            font-family: 'Uiyeun';
            font-size : 20px;
        }
   	</style>
   	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
   	<script type="text/javascript">
   	function history(){
   		popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
   	}
   	</script>
	
</head>
	
<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  아래의 내용은 http://getbootstrap.com/getting-started/  참조 -->	
   	<div class="container ">
      <!-- Main jumbotron for a primary marketing message or call to action -->
      <div class="jumbotron">
        <h1>Model2 MVC Shop </h1>
        	<c:if test="${user.role eq 'admin'}">	
        		<p> <strong class="text-danger">관리자</strong> 계정으로 로그인하셨습니다.</p>
        	</c:if>
        
        	<c:if test="${user.role eq 'user'}">	
        		<p> <strong class="text-primary">${user.userName}</strong>님 방문을 환영합니다. </p>
        	</c:if>
     </div>
    </div>
    
    
    	<div class="container">
 			<!-- 추가  ===================================================-->
			
			
		<h1 align="center">Site Map</h1>	
		<div class="row col-md-3">
		
				<div class="panel panel-primary ">
					<div class="panel-heading">
						<i class="glyphicon glyphicon-heart"></i> 회원관리
         			</div>
         			<!--  회원관리 아이템 -->
					<ul class="list-group">
						 <li class="list-group-item">
						 	<a href="/user/getUser?userId=${sessionScope.user.userId}">개인정보조회</a>
						 </li>
					 <c:if test="${sessionScope.user.role == 'admin'}">	 
						 <li class="list-group-item">
						 	<a href="#">회원정보조회</a>
					</c:if>
						 </li>
					</ul>
		        </div>
			</div>
             
              <div class="row col-md-1"></div>
            
            <c:if test="${sessionScope.user.role == 'admin'}"> 
			<div class="row col-md-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-briefcase"></i> 판매상품관리
         			</div>
					<ul class="list-group">
						
						 <li class="list-group-item">
						 	<a href="/product/addProduct">판매상품등록</a>
						 </li>
					
						 <li class="list-group-item">
						 	<a href="/product/listProduct?menu=manage">등록상품관리</a>
						 </li>
					</ul>
		        </div>
 			</div>
 			</c:if>
             
             <div class="row col-md-1"></div>
			
			<div class="row col-md-3">
				<div class="panel panel-primary">
					<div class="panel-heading">
							<i class="glyphicon glyphicon-shopping-cart"></i> 상품구매
	    			</div>
					<ul class="list-group">
						 <li class="list-group-item"><a href="/product/listProduct?menu=search">상품검색</a></li>
						  <li class="list-group-item">
						  	<a href="#">구매이력조회</a>
						  </li>
						 <li class="list-group-item">
						 	<a href="javascript:history()">최근본상품</a>
						 </li>
					</ul>
				</div>
			</div>
				
		</div>	
			<!-- 추가  ===================================================-->   

	<!-- 참조 : http://getbootstrap.com/css/   : container part..... -->
<!-- 		<p>
        <h3>나폴레옹은 이렇게 말했다.</h3>
        <p>"오늘 나의 불행은 언젠가 내가 잘못 보낸 시간의 보복이다."</p>
  	 	<h3>"... 장벽은 절실하게 원하지 않는 사람들을 걸러내려고 존재합니다. 장벽은. 당신이 아니라 '다른' 사람들을 멈추게 하려고 거기 있는 것이지요."</h3>
         <h3>혜광스님</h3>
         <p>행복한 삶의 비결은.</p>
         <p>좋아하는 일을 하는 것이 아리라,</p>
         <p>지금 하는 일을 좋아하는 것입니다.</p>
  	 </div> -->

</body>

</html>