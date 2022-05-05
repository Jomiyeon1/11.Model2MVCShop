<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <% 

Product product = (Product)request.getAttribute("product"); 

System.out.println("addView productVO => " + product);

%> --%>
<html>
<head>
<title>상품등록</title>
<link rel="stylesheet" href="/css/admin.css" type="text/css">
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
	  		
            padding-top : 50px;
			font-size : 20px;
        }
        
     * {
     	font-family: 'Uiyeun';
     	font-size : 20px;
     }
     </style>
	<script type="text/javascript">
	
			$(function() {
				 $( "td.ct_btn01:contains('확인')" ).on("click" , function() {
					//Debug..
					alert(  $( "td.ct_btn01:contains('확인')" ).html() );
					self.location = "/product/listProduct?menu=manage";
					
						
				});
		});
				 
			 $(function() {
					 $( "td.ct_btn01:contains('추가등록')" ).on("click" , function() {
						
						 self.location = "/product/addProduct";
	
					});
			 });

</script>


</head>
<body >
<!-- toolbar -->
<jsp:include page="/layout/toolbar.jsp" />
<!-- toolbar -->
<div class="container"> <!-- root tag -->
	<h3 class=" text-info"> 등록 상품 정보</h3>
	
<form class="form-horizontal">
<input type="hidden" name="prodNo" value="${product.prodNo}"/>
	<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>

		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}원</div>
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
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-info">확인</button>
	  			<button type="button" class="btn btn-info">추가등록</button>
	  		</div>
		</div>			

</form>
</div> <!--  root tag end -->
</body>
</html>