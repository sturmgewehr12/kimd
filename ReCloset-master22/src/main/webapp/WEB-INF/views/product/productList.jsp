<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<c:import url="../common/commonUtil.jsp">
		<c:param name="titleName" value="상품 페이지"/>
	</c:import>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

	
<style>
	#loadMoreBtn {
		cursor : pointer;
	}

</style>
	
</head>
<body class="animsition">
	<c:import url="../common/header.jsp"/>
	<c:import url="../common/cart.jsp"/>
	
	<br><br><br>
	
		<!-- Product -->
	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
						All Products
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".Item">
						Fashion Item
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".acc">
						Accessories
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".woman">
						Woman
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".men">
						Men
					</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".etc">
						Etc
					</button>
				</div>

				<div class="flex-w flex-c-m m-tb-10">
					<div class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
						<i class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						 Filter
					</div>

					<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Search
					</div> &nbsp;&nbsp;
					<!-- 상품 등록 -->
					<c:if test="${member.userCodeNo == 2}">
					<div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4">
						
						<a href="${pageContext.request.contextPath }/product/productForm.do">+ Product</a>
						
					</div>
					</c:if>
				</div>
				
				<!-- 상품 검색 -->
				<div class="dis-none panel-search w-full p-t-10 p-b-15">
					<div class="bor8 dis-flex p-l-15">
						<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
							<i class="zmdi zmdi-search"></i>
						</button>

						<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search">
					</div>	
				</div>

				<!-- Filter -->
				<div class="dis-none panel-filter w-full p-t-10">
					<div class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
						<div class="filter-col1 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Sort By
							</div>

							<ul>
								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Default
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Popularity
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Average rating
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04 filter-link-active">
										Newness
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Price: Low to High
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										Price: High to Low
									</a>
								</li>
							</ul>
						</div>

						<div class="filter-col2 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Price
							</div>

							<ul>
								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04 filter-link-active">
										All
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										$0.00 - $50.00
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										$50.00 - $100.00
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										$100.00 - $150.00
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										$150.00 - $200.00
									</a>
								</li>

								<li class="p-b-6">
									<a href="#" class="filter-link stext-106 trans-04">
										$200.00+
									</a>
								</li>
							</ul>
						</div>

						<div class="filter-col3 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Color
							</div>

							<ul>
								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #222;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										Black
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #4272d7;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04 filter-link-active">
										Blue
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #b3b3b3;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										Grey
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #00ad5f;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										Green
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #fa4251;">
										<i class="zmdi zmdi-circle"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										Red
									</a>
								</li>

								<li class="p-b-6">
									<span class="fs-15 lh-12 m-r-6" style="color: #aaa;">
										<i class="zmdi zmdi-circle-o"></i>
									</span>

									<a href="#" class="filter-link stext-106 trans-04">
										White
									</a>
								</li>
							</ul>
						</div>

						<div class="filter-col4 p-b-27">
							<div class="mtext-102 cl2 p-b-15">
								Tags
							</div>

							<div class="flex-w p-t-4 m-r--5">
								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Fashion
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Lifestyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Denim
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle
								</a>

								<a href="#" class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 상품 리스트 -->
		
			<div class="row iso">
			<c:forEach items="${goods}" var="goods">
			
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 ${ goods.categoryCode == 1 ? 'Item' : goods.categoryCode == 2 ? 'acc' : goods.categoryCode == 3 ? 'woman' : goods.categoryCode == 4 ? 'men' : 'etc' }">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="${ pageContext.request.contextPath }/resources/uploadimg/${goods.changeName}">

							<a href="${pageContext.request.contextPath}/product/productView.do?goodsNo=${goods.goodsNo}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04">
								Detail View
							</a>
						</div>

						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="${pageContext.request.contextPath}/product/productView.do?goodsNo=${goods.goodsNo}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
									${goods.gName}
								</a>

								<span class="stext-105 cl3">
									￦<fmt:formatNumber value="${goods.gPrice}" pattern="#,###" />
								</span>
							</div>

							<c:if test="${!empty member}">
							<div class="block2-txt-child2 flex-r p-t-3">
								<a href="${pageContext.request.contextPath}/product/productView.do" class="btn-addwish-b2 dis-block pos-relative">
									<img class="icon-heart1 dis-block trans-04" src="${pageContext.request.contextPath}/resources/images/icons/icon-heart-01.png" alt="ICON">
									<img class="icon-heart2 dis-block trans-04 ab-t-l" src="${pageContext.request.contextPath}/resources/images/icons/icon-heart-02.png" alt="ICON">
								</a>
							</div>
							</c:if>
							
						</div>
					</div>
				</div>
				
</c:forEach>
				</div>
	
			</div>

			<!-- 더 보기 버튼  -->
			<div class="flex-c-m flex-w w-full p-t-45">
				<p id="loadMoreBtn" class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
					Load More
				</p>
			
				
			</div>
		<!-- productList 끝 -->
		</div>
	
	
		
	<c:import url="../common/footer.jsp"/>
	<script>
	$(function(){
		$('.filter-tope-group').children('button').on('click', function(){
			var filter = $(this).attr('data-filter');
			console.log('test');
			console.log(filter);
			
			if(filter != '*') {
				$('.iso').children().fadeOut("fast");
				$('.iso').children(filter).fadeIn(500);								
			} else {
				$('.iso').children().fadeIn(500);																
			}
		});
	});
	
	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
	var memberChk = '${!empty member}';
	var currentPage = 2;
	$('#loadMoreBtn').click(function(){
		$.ajax({
			url : "${pageContext.request.contextPath}/product/productLoadMore.do",
			data : {currentPage : currentPage++},
			dataType : "json",
			success : function(data){
				console.log(data);
				
				if(data == '' || data == undefined){
					alert("더이상 불러올 상품이 없습니다.");
				} else {
					var $productListDiv = $('.iso');
					//var $iso = $('.isotope-grid').isotope();
				    
					for(var i in data){
						var $div1 = $('<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item ' + 
								(data[i].categoryCode == 2 ? 'acc' : data[i].categoryCode == 3 ? 'woman' : data[i].categoryCode == 4 ? 'men' : 'etc') + '">');
						var $div2 = $('<div class="block2">');
						var $div2_1 = $('<div class="block2-pic hov-img0">');
						var $div2_1_1 = $('<img src="${pageContext.request.contextPath}/resources/uploadimg/' + data[i].changeName + '" alt="IMG-PRODUCT">');
						var $div2_1_2 = $('<a href="${pageContext.request.contextPath}/product/productView.do?goodsNo='+data[i].goodsNo+'" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">').text('Quick View');
						
						var $div3 = $('<div class="block2-txt flex-w flex-t p-t-14">');
						var $div3_1 = $('<div class="block2-txt-child1 flex-col-l ">');
						var $div3_1_1 = $('<a href="${pageContext.request.contextPath}/product/productView.do?goodsNo='+data[i].goodsNo+'" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">').text(data[i].gName);
						var $div3_1_2 = $('<span class="stext-105 cl3">').text('￦' + numberWithCommas(data[i].gPrice));
						
						var $div3_2 = $('<div class="block2-txt-child2 flex-r p-t-3">');
						var $div3_2_1 = $('<a href="${pageContext.request.contextPath}/product/productView.do" class="btn-addwish-b2 dis-block pos-relative">');
						var $div3_2_1_1 = $('<img class="icon-heart1 dis-block trans-04" src="${pageContext.request.contextPath}/resources/images/icons/icon-heart-01.png" alt="ICON">');
						var $div3_2_1_2 = $('<img class="icon-heart2 dis-block trans-04 ab-t-l" src="${pageContext.request.contextPath}/resources/images/icons/icon-heart-02.png" alt="ICON">');
						
						$div3_2_1.append($div3_2_1_1).append($div3_2_1_2);
						$div3_2.append($div3_2_1);
						
						$div3_1.append($div3_1_1).append($div3_1_2);
						
						$div3.append($div3_1);
						
						if( memberChk == 'true') {
							$div3.append($div3_2);
						}
						
						$div2_1.append($div2_1_1).append($div2_1_2);
						$div2.append($div2_1).append($div3);
						
						$div1.append($div2);
						
						$productListDiv.append($div1);
					}

					$('.filter-tope-group').children('button').on('click', function(){
							var filter = $(this).attr('data-filter');
						
							if(filter != '*') {
								$('.iso').children().fadeOut("fast");
								$('.iso').children(filter).fadeIn("fast");								
							} else {
								$('.iso').children().fadeOut("fast");
								$('.iso').children().fadeIn("fast");
							}
					});
					
					$('.iso').css('height','fit-content');
				}
			},
			error : function(errorCode){
				console.log(errorCode);
			}
		});
	});
	
	</script>
</body>
</html>