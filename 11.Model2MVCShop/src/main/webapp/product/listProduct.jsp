<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>상품 목록조회</title>

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
		//page		
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage);
			
					$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${menu}").submit();

		}
		
			//검색
 			$(function() {
				 //<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
				 $( "button.btn.btn-default" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('검색')" ).html() );
					fncGetList(1);
		
			});
				
 				<c:if test="${menu eq 'search'}">
				$( "td:nth-child(2)" ).on("click" , function() {
		               //Debug..
		               //alert(  $( this ).text().trim() );
		               self.location ="/product/getProduct?prodNo="+$(this).attr("prodNo");
		         });
		         </c:if> 
		         
		         <c:if test="${menu eq 'manage'}">
		         $( "td:nth-child(2)" ).on("click" , function() {
		            //Debug..
		            //alert(  $( this ).text().trim() );
		            self.location ="/product/updateProduct?prodNo="+$(this).attr("prodNo");
		         });
		         </c:if> 
				  // ajax
				 
				 
				 
				 $("td:nth-child(5) > i").on("click" , function() {
					 var prodNo = $(this).attr("prodNo");
					 //alert("prodNo : \n"+prodNo);
						$.ajax( 
								{
									url : "/product/json/getProduct/"+prodNo ,
									method : "GET" ,
									dataType : "json" ,
									headers : {
										"Accept" : "application/json",
										"Content-Type" : "application/json"
									},
									success : function(JSONData , status) {

										//Debug...
										//alert(status);
										//Debug...
										//alert("JSONData : \n"+JSONData);
										alert("JSONData.productName : \n"+JSONData.prodName);
										//alert("JSONData.price : \n"+JSONData.price);
										//alert("JSONData.manuDate : \n"+JSONData.manuDate);
										
										var displayValue = "<h6>"
															+"상품명   : "+JSONData.prodName+"<br/>"
															+"상세정보 : "+JSONData.prodDetail+"<br/>"
															+"가  격   : "+JSONData.price+"<br/>"
															+"등록일   : "+JSONData.manuDate+"<br/>"
															+"제조일   : "+JSONData.regDateString+"<br/>"
															+"</h3>";
										//Debug...									
										//alert(displayValue);
										$("h6").remove();
										$( "#"+prodNo+"" ).html(displayValue);
									}
							});
				 }); 
						
						$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "lavenderblush");	 
						
						
 		});
	 
		
	</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<!-- toolbar -->
<jsp:include page="/layout/toolbar.jsp" />
<!-- toolbar -->
<div class="container">
	<div class="page-header text-info">
	      <c:if test="${menu == 'manage'}">
			<h1 class="bg-warning text-center">상품 관리</h1> 
		  </c:if>

		<c:if test="${menu == 'search'}">
		<h1 class="bg-warning text-center">상품 목록조회 </h1>
		</c:if>
	    </div>
	    
	<div class="row">
			<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지	    		
		    	</p>
		    		<p>
		    			<c:if test="${menu eq 'manage'}">
		    			★상품명을 클릭하면 제품 수정이 가능합니다.	    			
		    			</c:if>
		    			
		    			<c:if test="${menu eq 'search'}">
		    			★상품명을 클릭하면 상세정보 조회가 가능합니다.
		    			</c:if>
		    		</p>
		    		
		    </div>


		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
							<option value="0"${!empty search.searchCondition&&search.searchCondition==0 ? "selected":"" }>상품번호</option>
							<option value="1"${!empty search.searchCondition&&search.searchCondition==1 ? "selected":"" }>상품명</option>
							<option value="2"${!empty search.searchCondition&&search.searchCondition==2 ? "selected":"" }>상품가격</option>
						
					</select> 
				</div>
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				   <button type="submit" class="btn btn-default">
       			   <span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
			   
			   	  <input type="hidden" id="currentPage" name="currentPage" value=""/>	
			</form>
	</div> <!--  row -->

				<table class="table table-hover table-striped" >
			      
			        <thead>
					 <tr>

			            <th align="center">No</th>
			            <th align="left" >상품명</th>
			            <th align="center">가격</th>
			            <th align="center">등록일</th>
			            <th align="center">간략정보</th>
			          </tr>
			        </thead>
				

			<tbody>
				<c:set var="i" value="0" />
			  	 <c:forEach var="product" items="${list}">
					<c:set var="i" value="${ i+1 }" />
				<tr>

					<td align="center">${ i }</td>
					<!--  -->
					<c:if test="${menu eq 'manage'}">
					<td align="left" ProdNo=${product.prodNo} title="Click : 상품 수정">
					${product.prodName} </td>
					</c:if>
					<c:if test="${menu eq 'search'}">
					<td align="left" ProdNo=${product.prodNo} title="Click : 상세설명 확인">
						${product.prodName} </td>
					</c:if>
					<!--  -->
					<td align="left">${product.price}원 </td>

					<td align="left">${product.manuDate} </td>

					<%-- <td align="left">${product.proTranCode} </td>	 --%>
					
					<td align="left">
					<i class="glyphicon glyphicon-ok" prodNo= "${product.prodNo}" id ="${product.prodNo}"></i>
			  		<input type="hidden" value="${product.prodNo}">
			  		 </td>
				 </tr>
				 
<%-- 				 <tr>
				 <td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
				 </tr>  --%>
				 
				  </c:forEach>
			</tbody>
		</table>

		</div>
	</div><!--  root tag -->
	
	 <!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
</body>
</html>
