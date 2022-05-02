<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<html>
<head>
<title>상품정보수정</title>

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
 		body {
            padding-top : 50px;
            font-family: 'Uiyeun';
			font-size : 20px;
        }
        
         tr > * {
        	font-size : 20px;
        } 
        

	@font-face {
	    font-family: 'Uiyeun';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105@1.1/Uiyeun.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
     </style>

<script type="text/javascript">
	function funUpdateProduct() {
		//유효성 검증 구현
		
		var name = $("input[name='prodName']").val(); 
		var detail = $("input[name='prodDetail']").val(); 
		var manuDate = $("input[name='manuDate']").val(); 
		var price = $("input[name='price']").val(); 
		
		if(name == null || name.length < 1){
			alert("상품명은 필수 입력 항목입니다.");
			return;
		}
		
		if(detail == null || detail.length < 1){
			alert("상품 상세설명은 필수 입력 항목입니다.");
			return;
		}
		
		if(manuDate == null || manuDate.length < 1){
			alert("제조일은 필수 입력 항목입니다.");
			return;
		}
		
		if(price == null || price.length < 1){
			alert("가격은 필수 입력 항목입니다.");
			return;
		}
		
		$("form").attr("method" , "POST").attr("action" , "/product/updateProduct").submit();
		
	}
	
	
	
	// 수정 클릭 event
	 $(function() {
			
			 $( "button:contains('수정하기')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('수정')" ).html() );
				funUpdateProduct();
			});
		});
	//취소 클릭 event
	$(function() {	
			 $( "button:contains('취소')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
				history.go(-1);
			});
		});


</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<!-- toolbar -->
<jsp:include page="/layout/toolbar.jsp" />
<!-- root tag -->
<div class="container">
<input type="hidden" name="prodNo" value="${product.prodNo}"/>

	<div class="page-header">
	       <h3 class=" text-info" align="center"> 상품 수정 </h3>
	</div>
	

<form class="form-horizontal">

		 <div class="form-group">
		 	<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label" >상품명</label>
			 	<div class="col-sm-4">
			 	<input type="text" class="form-control" id="ProdName" name="prodName" value="${product.prodName}">
			 	</div>
		 </div>
		 <div class="form-group">
		 	<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
			 	<div class="col-sm-4">
			 	<input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}">
			 	</div>
		 </div>


		 <div class="form-group">
			<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자 </label>
			<div class="col-sm-3">
			<input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.regDate}"/>
				
			</div>
			<div class="col-sm-1">
			<img src="../images/ct_icon_date.gif" width="15" height="15" 
										onclick="show_calendar('document.detailForm.manuDate', document.detailForm.manuDate.value)"/>
			</div>
			
		</div>

		 <div class="form-group">
	 		<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		 	<div class="col-sm-4">
		 	<input type="text" class="form-control" id="price" name="price" value="${product.price}">
		 	</div>
	 	</div>

		 <div class="form-group">
	 		<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		 	<div class="col-sm-4">
		 	<input type="text" class="form-control" id="fileName" name="fileName" value="${product.fileName}">
		 	</div>
 		</div>

		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-info">수정하기</button>
	  			<button type="button" class="btn btn-info">취소</button>
	  		</div>
		</div>		 

</form>

	
</div>




</body>
</html>