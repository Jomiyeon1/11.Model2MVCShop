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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
	<script type="text/javascript">
		//page		
		function fncGetList(currentPage) {
			$("#currentPage").val(currentPage);
			
					$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${menu}").submit();

		}
		
			//�˻�
 			$(function() {
				 //<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
				 $( "td.ct_btn01:contains('�˻�')" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('�˻�')" ).html() );
					fncGetList(1);
					
					
			});
				
/*  				<c:if test="${menu eq 'search'}">
				$( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
		               //Debug..
		               //alert(  $( this ).text().trim() );
		               self.location ="/product/getProduct?prodNo="+$(this).attr("prodNo");
		         });
		         </c:if> */
		         
		         <c:if test="${menu eq 'manage'}">
		         $( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
		            //Debug..
		            //alert(  $( this ).text().trim() );
		            self.location ="/product/updateProduct?prodNo="+$(this).attr("prodNo");
		         });
		         </c:if> 
				  // ajax
				 
				 
				 <c:if test="${menu eq 'search'}">
				 $( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
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
										
										var displayValue = "<h3>"
															+"��ǰ��   : "+JSONData.prodName+"<br/>"
															+"������ : "+JSONData.prodDetail+"<br/>"
															+"��  ��   : "+JSONData.price+"<br/>"
															+"�����   : "+JSONData.manuDate+"<br/>"
															+"������   : "+JSONData.regDateString+"<br/>"
															+"</h3>";
										//Debug...									
										//alert(displayValue);
										$("h3").remove();
										$( "#"+prodNo+"" ).html(displayValue);
									}
							});
				 }); </c:if>
						
						$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "lavenderblush");	 
						
						
 		});
	 
		
	</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<!-- toolbar -->
<jsp:include page="/layout/toolbar.jsp" />
<!-- toolbar -->

	<div style="width: 98%; margin-left: 10px;">
		<%-- //${menu} --%>
		<%-- <form name="detailForm" action="/product/listProduct?menu=${menu}" method="post"> --%>
		<form name="detailForm">
		
			<table width="100%" height="37" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"
						width="15" height="37" /></td>
					<td background="/images/ct_ttl_img02.gif" width="100%"
						style="padding-left: 10px;">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="93%" class="ct_ttl01">
								
									<c:if test="${menu == 'manage'}">
									��ǰ ���� 
									</c:if>

									<c:if test="${menu == 'search'}">
									��ǰ �����ȸ 
									</c:if>


								</td>
							</tr>
						</table>
					</td>
					<td width="12" height="37">
					<img src="/images/ct_ttl_img03.gif" width="12" height="37" />
					</td>
				</tr>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
				<tr>
					<td align="right">
						<select name="searchCondition" class="ct_input_g" style="width: 80px">
							<option value="0"${!empty search.searchCondition&&search.searchCondition==0 ? "selected":"" }>��ǰ��ȣ</option>
							<option value="1"${!empty search.searchCondition&&search.searchCondition==1 ? "selected":"" }>��ǰ��</option>
							<option value="2"${!empty search.searchCondition&&search.searchCondition==2 ? "selected":"" }>��ǰ����</option>
						
					</select> 

						<input 	type="text" name="searchKeyword" 
								value="${! empty search.searchKeyword ? search.searchKeyword : "" }" 
						 class="ct_input_g"	style="width:200px; height:20px" > 
						 </td>

					<td align="right" width="70">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="17" height="23"><img
									src="/images/ct_btnbg01.gif" width="17" height="23"></td>
								<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top: 3px;">
									<!-- <a href="javascript:fncGetProductList('1');">�˻�</a> -->
									�˻�
									</td>
								<td width="14" height="23"><img
									src="/images/ct_btnbg03.gif" width="14" height="23"></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>


			<table width="100%" border="0" cellspacing="0" cellpadding="0"
				style="margin-top: 10px;">
				<tr>
					<td colspan="11">��ü ${resultPage.totalCount }  �Ǽ�,	���� ${resultPage.currentPage} ������
					</td>
				</tr>
				<tr>
					<td class="ct_list_b" width="100">No</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">��ǰ��</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b" width="150">����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�����</td>
					<td class="ct_line02"></td>
					<td class="ct_list_b">�������</td>
				</tr>
				
				<tr>
					<td colspan="11" bgcolor="808285" height="1"></td>
				</tr>
				
				<c:set var="i" value="0" />
			  	 <c:forEach var="product" items="${list}">
					<c:set var="i" value="${ i+1 }" />
				<tr class="ct_list_pop">
					<td align="center">${ i }</td>
					<td></td>
					<td align="left" ProdNo=${product.prodNo}>
						${product.prodName}
					<!--  -->
					</td>
					<td></td>
					<td align="left">${product.price} </td>
					<td></td>
					<td align="left">${product.manuDate} </td>
					<td></td>
					<td align="left">${product.proTranCode} </td>	
				 </tr>
				 
				 <tr>
				 <td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
				 </tr> 
				 
				  </c:forEach>
			</table>

			<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
				<tr>
				<td align="center">
		 		  <input type="hidden" id="currentPage" name="currentPage" value=""/>	
			<jsp:include page="../common/pageNavigator.jsp"/>
					</td>
				</tr>
			</table>  
			
		</form>

	</div>
</body>
</html>
