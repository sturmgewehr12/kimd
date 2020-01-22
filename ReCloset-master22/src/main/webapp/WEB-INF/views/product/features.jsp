<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../common/commonUtil.jsp">
		<c:param name="titleName" value="장바구니 페이지"/>
	</c:import>
	<style>
		#like {
		background: white;
    	border: 1px solid white;
	  	font-size: 30px;
	}
	#likeheart {
		width: 80px;
	  	height: 100px;
	  	color: #ff666f;
	  	cursor: pointer;
	  	font-size: 40px; 	  
	}
	
	</style>
</head>
<body class="animsition">
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/cart.jsp"/>
	
	<br><br><br>
	
	<!-- 상세 메뉴 -->
<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.html" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				Shoping Cart
			</span>
		</div>
	</div>
	

	<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85" action="${pageContext.request.contextPath}/order/orderForm.do">
		<input type="hidden" name="userNo" value="${member.userNo }"/>
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart cart-list-content">
								<tr class="table_head">
									<th class="column-1">Product</th>
									<th class="column-2">Detail</th>
									<th class="column-3"></th>
									<th class="column-4">Total</th>
									<th class="column-5"></th>
								</tr>
								
							</table>
						</div>

						<div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<input class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5" type="text" name="coupon" placeholder="Coupon Code">
									
								<div class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
									Apply coupon
								</div>
							</div>

							<div class="flex-c-m stext-101 cl2 size-119 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-10">
								Update Cart
							</div>
						</div>
					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">
							Cart Totals
						</h4>

						<div class="flex-w flex-t bor12 p-b-13">
							<div class="size-208">
								<span class="stext-110 cl2">
									Subtotal:
								</span>
							</div>

							<div class="size-209">
								<span class="mtext-110 cl2 subtotalPrice">
									0 원
								</span>
							</div>
						</div>

						<div class="flex-w flex-t bor12 p-t-15 p-b-30">
							<div class="size-208 w-full-ssm">
								<span class="stext-110 cl2">
									Shipping:
								</span>
							</div>

							<div class="size-209">
								<span class="mtext-110 cl2">
									2500 원
								</span>
								
							</div>
						</div>

						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2">
									Total:
								</span>
							</div>

							<div class="size-209 p-t-1">
								<span class="mtext-110 cl2 totalPrice">
									0 원
								</span>
							</div>
						</div>

						<button type="submit" id="submitBtn" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
							Proceed to Checkout
						</button>
					</div>
				</div>
			</div>
		</div>
	</form>	
	<c:import url="../common/footer.jsp"/>
	
	<script>
		
		$(function(){
			if($('.subtotalPrice').text() == "0 원"){
				$('#submitBtn').attr('disabled', true);
			}
		});
	
	
		$(function(){
			var userNo = '${member.userNo}'
			$.ajax({
				url: "${pageContext.request.contextPath}/cart/cartList.do",
	    		dataType: "json",
	    		data: { userNo : userNo },
	    		success : function(data){
	    			console.log(data);
	    			if(data.length == 0) {
	    			
	    			} else {
	    				// $('.cart-list-content').empty();
		    			for(var i in data){
		    				var innerDiv1 = '<tr class="table_row">'
		    							+ '<input type="hidden" name="goodsNo" value="' + data[i].goodsNo + '">'
		    							+ '<td class="column-1">'
		    							+ '<div class="how-itemcart1">'
		    							+ '<img src="${pageContext.request.contextPath}/resources/images/item-cart-04.jpg" alt="IMG">'
		    							+ '</div>'
		    							+ '</td>'
		    							+ '<td class="column-2">' + data[i].gname + '</td>'
		    							+ '<td class="column-3"> x &nbsp; 1 </td>'
		    							+ '<td class="column-4">' + data[i].gprice + '&nbsp;원</td>'
		    							+ '<td class="column-5">'
		    							+ '<button type="button" onclick="deleteCartOne(this);"><i class="zmdi zmdi-delete zmdi-hc-2x"></i></button>'
										+ '</td>'
										+ '</tr>';
							$('.cart-list-content').append(innerDiv1);
		    			}
		    			var totalAmount = 0;
	    				for(var i in data){
		    				totalAmount += data[i].gprice;
		    			}
	    				$('.subtotalPrice').html(totalAmount + "&nbsp;원");
	    				
	    				var totalPrice = totalAmount + 2500;
	    				$('.totalPrice').html(totalPrice + "&nbsp;원");
	    			}
   				}
			});
 	    });
		
		
		function deleteCartOne(obj){
			var userNo = '${member.userNo}';
			var sel = confirm("장바구니에서 해당 상품을 삭제하시겠습니까?");
			if(sel == true){
				var goodsNo = $(obj).parent().siblings('input').val();
				$.ajax({
					url: "${pageContext.request.contextPath}/cart/deleteCart.do",
		    		dataType: "json",
		    		data: { userNo : userNo,
		    				goodsNo : goodsNo },
		    		success : function(data){
		    			console.log(data);
		    			if(data == 1){
		    				var origin = $('.subtotalPrice').text();
							var minus = $(obj).parent().siblings().eq(4).text();
								    			
							origin = origin.replace(/[^0-9]/g,"");
							minus = minus.replace(/[^0-9]/g,"");
							var subtotal = origin-minus
		    				
		    				$('.subtotalPrice').html(subtotal + "&nbsp;원");
		    				$('.totalPrice').html(subtotal + 2500 + "&nbsp;원");
		    				
		    				$(obj).parent().parent().remove();
		    			}
		    		}
		    	});
			}
		}
		
	</script>
	
</body>
</html>