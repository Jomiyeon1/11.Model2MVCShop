<%@ page language="java" contentType="text/html; charset=EUC-KR" %>
<html>
<head>
<title>��ǰ���</title>

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
            font-family : 'Uiyeun';
            font-size : 20px;
        }
        
       body > div.container{
        	border : 2px solid #e6e6fa;
            margin-top : 10px;
            font-family : 'Uiyeun';
        }
        
	
     </style>
<script type="text/javascript">
function funAddProduct() {
	//��ȿ�� ���� ����
	
	var name = $("input[name='prodName']").val(); 
	var detail = $("input[name='prodDetail']").val(); 
	var manuDate = $("input[name='manuDate']").val(); 
	var price = $("input[name='price']").val(); 
	
	if(name == null || name.length < 1){
		alert("��ǰ���� �ʼ� �Է� �׸��Դϴ�.");
		return;
	}
	
	if(detail == null || detail.length < 1){
		alert("��ǰ �󼼼����� �ʼ� �Է� �׸��Դϴ�.");
		return;
	}
	
	if(manuDate == null || manuDate.length < 1){
		alert("�������� �ʼ� �Է� �׸��Դϴ�.");
		return;
	}
	
	if(price == null || price.length < 1){
		alert("������ �ʼ� �Է� �׸��Դϴ�.");
		return;
	}
	
	$("form").attr("method" , "POST").attr("action" , "/product/addProduct").submit();
	
}
// Ŭ�� event
	 $(function() {
			
			 $( "button.btn.btn-info:contains('���')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('���')" ).html() );
				funAddProduct();
			});
		});
	//��� Ŭ�� event
	$(function() {	
			 $( "button.btn.btn-info:contains('���')" ).on("click" , function() {
				//Debug..
				//alert(  $( "td.ct_btn01:contains('���')" ).html() );
				self.location = "/product/listProduct?menu=manage";
		});
	});
</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<!-- toolbar -->
<jsp:include page="/layout/toolbar.jsp" />
<!-- root tag -->
<div class="container">

	<h1 class="bg-info text-center">��ǰ���</h1>
	
<form class="form-horizontal">
<%-- <input type="hidden" name="prodNo" value="${product.prodNo}"/> --%>

		 <div class="form-group">
		 	<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
			 	<div class="col-sm-4">
			 	<input type="text" class="form-control" id="ProdName" name="prodName">
			 	</div>
		 </div>
		
		 <div class="form-group">
		 	<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
			 	<div class="col-sm-4">
			 	<input type="text" class="form-control" id="prodDetail" name="prodDetail">
			 	</div>
		 </div>


		 <div class="form-group">
			<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">�������� </label>
			<div class="col-sm-3">
			<input type="date" class="form-control" id="manuDate" name="manuDate"/>
				
			</div>

		</div>

		 <div class="form-group">
	 		<label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		 	<div class="col-sm-4">
		 	<input type="text" class="form-control" id="price" name="price">
		 	</div>
	 	</div>

		 <div class="form-group">
	 		<label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		 	<div class="col-sm-4">
		 	<input type="text" class="form-control" id="fileName" name="fileName">
		 	</div>
 		</div>

		<div class="form-group">
		<div class="col-sm-offset-4  col-sm-4 text-center">
			<button type="button" class="btn btn-info"> ��� </button>
			<button type="button" class="btn btn-info"> ���</button>
		</div>

</form>
</div> <!-- root tag end -->
</body>
</html>