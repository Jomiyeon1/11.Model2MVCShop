<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<title>상품상세조회/getProduct.jsp</title>

<!--    -->
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	@font-face {
		    font-family: 'Uiyeun';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105@1.1/Uiyeun.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
	  body {
	  		font-family: 'Uiyeun';
            padding-top : 50px;
			font-size : 20px;
        }
     </style>
	
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">		
	 $(function() {
		
		 $( "button:contains('리스트 보기')" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('이전')" ).html() );
			history.go(-1);
		});
		
		 $( "td.ct_btn01:contains('제품 구매')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('제품 구매')" ).html() );
				self.location = "/addPurchaseView.do/prod_no=10004"
			});
	});
	</script>




</head>

<body>
<!-- toolbar -->
<jsp:include page="/layout/toolbar.jsp" />
<!-- toolbar -->
<!-- <form name="detailForm" method="post"> -->

<div class="container"> <!-- root tag -->

		<div class="page-header">
	       <h3 class=" text-info"> 제품 상세 조회</h3>
	       <c:if test="${menu eq 'search'}">
	       <h5 class="text-muted"> <strong class="text-danger"> 상품 수정은 상단의 등록 상품 관리 메뉴를 이용해주세요. </strong></h5>
	       </c:if>
	    </div>
	    
	    <!-- prodNo -->
	    <!-- admin만 조회되도록  -->
   		<c:if test="${user.role eq 'admin'}">	
		    <div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
				<div class="col-xs-8 col-md-4">${product.prodNo}</div>
			</div>
		</c:if>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품이미지</strong></div>
	  		<c:if test="${!empty product.fileName}">
				<div class="col-xs-8 col-md-4"><img src = "/images/uploadFiles/${product.fileName }"/></div>
			</c:if> 
			
	  		<c:if test="${empty product.fileName}">
				<div class="col-xs-8 col-md-4"><img src = "/images/uploadFiles/ready.jpg"/></div>
			</c:if> 

		</div> 
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}원</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>


		<!-- admin 계정만 보이도록  -->
		<c:if test="${user.role eq 'admin'}">		
			<div class="row">
		  		<div class="col-xs-4 col-md-2"><strong>등록일자</strong></div>
				<div class="col-xs-8 col-md-4">${product.manuDate}</div>
			</div>
		</c:if>


		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-info">제품 구매</button>
	  			<button type="button" class="btn btn-info">리스트 보기</button>
	  		</div>
		</div>

	
			
		
</div><!-- root tag end.. -->

</body>
</html>