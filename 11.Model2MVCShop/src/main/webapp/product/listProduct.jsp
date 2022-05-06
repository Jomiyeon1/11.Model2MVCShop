<%@ page contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>��ǰ �����ȸ</title>

	<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>	
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
	//sorting
	/*  			$(function() {
					 $( "button.btn.btn-info" ).on("click" , function() {
						//Debug..

			
				});		 */		
		

				// ================================================
				 $( function() {
				    var availableTags = [
				      "vaio vgn FS70B",
				      "������",
				      "���弼Ʈ",
				      "�ζ���",
				      "�Ｚ���� 2G",
				      "����",
				      "�Ｚ����",
				      "��ü��",
				      "�׽�Ʈ",
				      "0425�׽�Ʈ",
				      "���鸮",
				      "****���鸮",
				      "111111���鸮",
				      "0425�׽�Ʈ",
				      "0425�׽�Ʈ...",
				      "0427",
				      "1212",
				      "test",
				      "�ǳ�?",
				      "11111",
				      "���̽��Ƹ޸�ī��",
				      "������"
				    ];
				    $( "#searchKeyword" ).autocomplete({
				      source: availableTags,
				    });
				  } );
					

				// ================================================	
				
		//page		
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage);
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${menu}").submit();

		}
		
			//�˻�
 			$(function() {
				 $( "button.btn.btn-default" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
					fncGetList(1);
		
			});
 		
		
				 
  /* 			 $(function() {
				 $( "button.btn.btn-info:contains('Ȯ��')" ).on("click" , function() {
					//Debug..
					 fncGetList(1);
				});	 */  		 
				 

	
	
				
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
										//alert("JSONData.productName : \n"+JSONData.prodName);
										//alert("JSONData.price : \n"+JSONData.price);
										//alert("JSONData.manuDate : \n"+JSONData.manuDate);
										
										var displayValue = "<h6>"
															+"��ǰ��   : "+JSONData.prodName+"<br/>"
															+"������ : "+JSONData.prodDetail+"<br/>"
															+"��  ��   : "+JSONData.price+"<br/>"
															+"�����   : "+JSONData.manuDate+"<br/>"
															+"������   : "+JSONData.regDateString+"<br/>"
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

<body>
<!-- toolbar -->
<jsp:include page="/layout/toolbar.jsp" />
<!-- toolbar -->
<div class="container">
	<div class="page-header text-info">
	      <c:if test="${menu == 'manage'}">
			<h1 class="bg-warning text-center">��ǰ ����</h1> 
		  </c:if>

		<c:if test="${menu == 'search'}">
		<h1 class="bg-warning text-center">��ǰ �����ȸ </h1>
		</c:if>
	    </div>
	    
	<div class="row">
			<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������	    		
		    	</p>
		    		<p>
		    			<c:if test="${menu eq 'manage'}">
		    			�ڻ�ǰ���� Ŭ���ϸ� ��ǰ ������ �����մϴ�.	    			
		    			</c:if>
		    			
		    			<c:if test="${menu eq 'search'}">
		    			�ڻ�ǰ���� Ŭ���ϸ� ������ ��ȸ�� �����մϴ�.
		    			</c:if>
		    		</p>
		    		
		    </div>


		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition" >
							<option value="0"${!empty search.searchCondition&&search.searchCondition==0 ? "selected":"" }>��ǰ��ȣ</option>
							<option value="1"${!empty search.searchCondition&&search.searchCondition==1 ? "selected":"" }>��ǰ��</option>
							<option value="2"${!empty search.searchCondition&&search.searchCondition==2 ? "selected":"" }>��ǰ����</option>
						
					</select> 
				</div>
				  <div class="form-group ui-widget">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				    
   				   <button type="submit" class="btn btn-default">
       			   <span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>		
			   	
			   	  <input type="hidden" id="currentPage" name="currentPage" value=""/>	
				  </div>
				  



			   	  
<!-- 				<div class="form-group" name="sortingCondition">
						<label  for="sortingCondition">	<input type="radio" name = "sorting" value="0"  checked="checked" >�⺻ </label>
						<label  for="sortingCondition">	<input type="radio" name = "sorting" value="1">�������ݼ� </label>
						<label  for="sortingCondition">	<input type="radio" name = "sorting" value="2">�������ݼ� </label>	
				 <button type="submit" class="btn btn-info">
       			   <span class="glyphicon glyphicon-search" aria-hidden="true">Ȯ��</span></button>				 
				</div>	 -->		   	  
			   	  
			</form>
			


			
			
	</div> <!--  row -->

				<table class="table table-hover table-striped" >
			      
			        <thead>
					 <tr>

			            <th align="center">No</th>
			            <th align="left" >��ǰ��</th>
			            <th align="center">����</th>
			            <th align="center">�����</th>
			            <th align="center">��������</th>
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
					<td align="left" ProdNo=${product.prodNo} title="Click : ��ǰ ����">
					${product.prodName} </td>
					</c:if>
					<c:if test="${menu eq 'search'}">
					<td align="left" ProdNo=${product.prodNo} title="Click : �󼼼��� Ȯ��">
						${product.prodName} </td>
					</c:if>
					<!--  -->
					<td align="left">${product.price}�� </td>

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
