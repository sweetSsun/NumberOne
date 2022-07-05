<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>1인자</title>

    <!-- Google Font -->

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
    <%@ include file="/resources/css/CommonCss.jsp" %>
    
	<!-- 배너 -->    
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
    
    <!-- Bootstrap cdn 설정 -->	
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">	
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">	
	  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">	
	  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	
	  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	  
	<!-- Js Plugins -->
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
	
	
	<!-- 부트스트랩 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<style type="text/css">
		.td, .th{
			font-size: 2.5rem;
		}
		.owl-prev, .owl-next {
			position: absolute;
	        height: 100px;
	        color: inherit;
	        background: none;
	        border: none;
	        z-index: 100;
	
	        i {
	            font-size: 2.5rem;
	            color: #cecece;
	        }
	    }
	
	    .owl-prev {
	    	top: 10%;
	        left: -100px;
	    }
	
	    .owl-next {
	    	top: 10%;
	        right: -100px;
	    }
	    
	    .display_none{
	    	display: none;
	    }
	    
	    .mainbox{
	    	margin-top : 100px;
		    border-radius: 50px;
	   		border: solid;
	    	border-color: #004804;
	    }
	
	</style>
	
	
</head>

<body>

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
	<!-- TopBar -->
        <c:choose>
	       	<c:when test="${sessionScope.loginId != 'admin'}">
                <%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>
			</c:when>
			<c:otherwise>
            	<%@ include file= "/WEB-INF/views/includes/TopBar_Admin.jsp" %>
			</c:otherwise>
        </c:choose>
	<!-- End of TobBar -->

	<main>
    <!-- Header Section Begin -->
    <section>
		<!-- 캐러셀 : 배너 -->
		<!-- 클래스에 carousel과 slide 설정. 특이하게 id 설정필요 -->

			<div class="container">
			
				<div style="width: 100%; min-height: 50px;"> <!-- 사진크기 이상해지면 50vh 반응형넣기 -->
					<div id="carousel-example-generic" class="carousel slide">
					  <!-- Indicators -->
					  <ol class="carousel-indicators"style="min-width: -webkit-fill-available;">
					    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
					    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
					  </ol>
					
					  <!-- Wrapper for slides -->
					  <div class="carousel-inner" role="listbox">
					    <div class="item active">
					      <img src="${pageContext.request.contextPath }/resources/img/banner/slide-1.jpg" style="width:100%">
					      <div class="carousel-caption" style="color:black;">
					      	 <div class="hero__item set-bg" data-setbg="img/hero/banner.jpg">
		                        <div class="hero__text">
		                            <span>1인자</span>
		                            <h2>7월 BEST<br />배너 위에 이미지/글 가능</h2>
		                            <p>클릭시 이동합니다</p>
		                            <a href="#" class="primary-btn">임시 버튼</a>
		                        </div>
	                    	 </div>
					      </div>
					    </div>
					        
					    <div class="item">
					      <img src="${pageContext.request.contextPath }/resources/img/banner/slide-2.jpg" style="width:100%">
					      <div class="carousel-caption" style="color:black;">
					      	 <div>
		                        <div class="hero__text">
		                            <span>1인자</span>
		                            <h2>배너 위에 글만 가능. 그림 하려면 class 이름 수정</h2>
		                            <label for="clickmove">클릭시 이동합니다</label>
		                            <button href="#" id="clickmove" class="primary-btn">임시 버튼</button>
		                        </div>
	                    	 </div>
					      </div>
					    </div>
			
					    <div class="item">
					      <img src="${pageContext.request.contextPath }/resources/img/banner/slide-3.jpg" style="width:100%">
					      <div class="carousel-caption" style="color:black;"> 배너이미지에 글
					      </div>
					    </div>    
					    
					  </div>
					
					  <!-- href는 carousel의 id -->
					  <!-- Controls 왼쪽 화살표버튼 -->
					  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			 		    <span class="sr-only">Previous</span>
					  </a>
			  		  <!-- Controls 오른쪽 화살표버튼 -->
					  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					</div>
				</div>
				
			</div>
	  	<!-- 캐러셀 : 배너 끝 -->
    <!-- Header Section End -->

    <!-- Featured Section Begin -->
    
    <!-- 커뮤니티 -->
        <div class="container mainbox">
            <div class="row section-title" style="margin-top: 50px;">
				<div class="col-lg-6">
					<h1 style="font-size:50px; font-weight: bold; color: #004804;"><a href="loadToBoardMainPage">커뮤니티</a></h1>
                </div>
                <div class="col-lg-6 featured__controls" style="margin-bottom: 0;">
                    <ul style="font-size: 30px; padding-left: 0;">
                        <li data-filter=".all" class="title_color">All</li>
                        <li data-filter=".free">자유</li>
                        <li data-filter=".question">질문</li>
                        <li data-filter=".information">정보</li>
                        <li data-filter=".review">후기</li>
                        <li data-filter=".notice">공지</li>
                    </ul>
                </div>
            </div>
            

            <div class="featured__filter" style="margin-left: 100px; margin-right: 100px; margin-bottom: 100px; min-height: 170px;">
            	<!-- 전체보기 -->
                <div class="row mix all active">
            	<p><a href="loadToBoardMainPage"  style="float: right; margin-bottom: 20px; font-size: 20px;">더보기</a></p>
            	<c:forEach items="${boardList }" end="5" var="boardList">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F5F2;">
                        <div class="row">
                        	<div class="col-lg-8 col-md-8 col-sm-8">
                        		<h1><a href="${pageContext.request.contextPath }/selectBoardView?bdcode=${boardList.bdcode}">${boardList.bdtitle }</a></h1>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">	
                        		<h2>${boardList.bddate }</h2>
                        	</div>
                        </div>
                    </div>
                </c:forEach>
                </div>
                
                <!-- 자유보기 -->
                <div class="row mix free" style="display:none;">
            	<p><a href="#"  style="float: right; margin-bottom: 20px;">더보기</a></p>
            	<c:forEach items="${boardList }" end="5" var="boardList">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F5F2;">
                        <div class="row">
                        	<div class="col-lg-8 col-md-8 col-sm-8">
                        		<h1><a href="${pageContext.request.contextPath }/selectBoardView?bdcode=${boardList.bdcode}">${boardList.bdtitle }</a></h1>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">	
                        		<h2>${boardList.bddate }</h2>
                        	</div>
                        </div>
                    </div>
                </c:forEach>
                </div>
                
                <!-- 질문보기 -->
                <div class="row mix question" style="display:none;">
            	<p><a href="#"  style="float: right; margin-bottom: 20px;">더보기</a></p>
            	<c:forEach items="${boardList }" end="5" var="boardList">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F5F2;">
                        <div class="row">
                        	<div class="col-lg-8 col-md-8 col-sm-8">
                        		<h1><a href="${pageContext.request.contextPath }/selectBoardView?bdcode=${boardList.bdcode}">${boardList.bdtitle }</a></h1>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">	
                        		<h2>${boardList.bddate }</h2>
                        	</div>
                        </div>
                    </div>
                </c:forEach>
                </div>
                
                <!-- 정보보기 -->
                <div class="row mix information" style="display:none;">
				<p><a href="#"  style="float: right; margin-bottom: 20px;">더보기</a></p>
            	<c:forEach items="${boardList }" end="5" var="boardList">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F5F2;">
                        <div class="row">
                        	<div class="col-lg-8 col-md-8 col-sm-8">
                        		<h1><a href="${pageContext.request.contextPath }/selectBoardView?bdcode=${boardList.bdcode}">${boardList.bdtitle }</a></h1>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">	
                        		<h2>${boardList.bddate }</h2>
                        	</div>
                        </div>
                    </div>
                </c:forEach>
                </div>
                
                <!-- 후기보기 -->
                <div class="row mix review" style="display:none;">
            	<p><a href="#"  style="float: right; margin-bottom: 20px;">더보기</a></p>
            	<c:forEach items="${boardList }" end="5" var="boardList">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F5F2;">
                        <div class="row">
                        	<div class="col-lg-8 col-md-8 col-sm-8">
                        		<h1><a href="${pageContext.request.contextPath }/selectBoardView?bdcode=${boardList.bdcode}">${boardList.bdtitle }</a></h1>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">	
                        		<h2>${boardList.bddate }</h2>
                        	</div>
                        </div>
                    </div>
                </c:forEach>
                </div>
                
                <!-- 공지보기 -->
                <div class="row mix notice" style="display:none;">
            	<p><a href="#"  style="float: right; margin-bottom: 20px;">더보기</a></p>
            	<c:forEach items="${noticeList }" end="5" var="noticeList">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F5F2;">
                        <div class="row">
                        	<div class="col-lg-8 col-md-8 col-sm-8">
                        		<h1><a href="${pageContext.request.contextPath }/selectNoticeBoardView?nbcode=${noticeList.nbcode}">${noticeList.nbtitle }</a></h1>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">	
                        		<h2>${noticeList.nbdate }</h2>
                        	</div>
                        </div>
                    </div>
                </c:forEach>
                </div>
            </div>
  		</div>
    <!-- Featured Section End -->
    <!-- Latest Product Section Begin -->
    	
    <!-- 중고거래 -->	
		<div class="container mainbox">
		    <div class="row section-title" style="margin-top: 50px;">
		        <div class="col-lg-6">
		            <div>
		                <h1 style="font-size:50px; font-weight: bold; color: #004804;"><a href="#">중고거래</a></h1>
		            </div>
		        </div>
		        <div class="col-lg-6" style="margin-bottom: 0; font-size: 30px;">
		            <ul class="sellbuylist">
                        <li id="selResell" class="title_color" style="float: left;" onclick="selectResell()">팔구</li>
                        <li style="float: left; width: 50px;"></li>
                        <li id="selRebuy" style="float: right;" onclick="selectRebuy()">사구</li>
                    </ul>
                </div>
		        
		        <!--
		        	<div class="row">
		        	<div class="col-lg-3"></div>
		        	<div class="col-lg-3 col-md-6 col-sm-6 title_color" style="width: 100px;">팔구</div>
		        	<div class="col-lg-3"></div>
		        	<div class="col-lg-3 col-md-6 col-sm-6" style="width: 100px;">사구</div>
		       	-->
             </div>
	            
            
        <!-- 배너화살표 -->
            <div class="owl-nav">
           	</div>       	
	       
   		<!-- 팔구보기 -->
	        <div id="resell" style="margin-left: 100px; margin-right: 100px; margin-bottom: 100px; min-height: 170px; max-width: 1105px;">
           		<div style="text-align: right;"><p><a href="#"  style="margin-bottom: 20px; font-size: 20px;">팔구보기</a></p>
            	</div>
            	
            	<div id="owl-banner_resell" class="owl-carousel" style="margin-top: 50px;">
           		
	                <div class="item">
	            	<%-- <c:forEach items="${resellList }" end="4" var="resellBuy"> --%>
	                        <table>
	                        	<tr>
	                        		<td rowspan="3"> <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-2.jpg" alt="중고판매대표사진">
	                        		</td>
	                        		<td><h1>팔제목1</h1></td>
	                        	</tr>
	                        	<tr>
	                        		<td><h1>팔상품명1</h1></td>
	                       		</tr>
	                       		<tr>
	                        		<th><h1>팔가격1</h1></th>
	                        	</tr>
	                        </table>
	                <%-- </c:forEach> --%>
	                </div>
	                
	                <div class="item">
	            	<%-- <c:forEach items="${resellList }" end="4" var="resellBuy"> --%>
		                 <table>
		                 	<tr>
		                 		<td rowspan="3"> <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-2.jpg" alt="중고판매대표사진">
		                 		</td>
		                 		<td><h1>팔제목2</h1></td>
		                 	</tr>
		                 	<tr>
		                 		<td><h1>팔상품명2</h1></td>
		                		</tr>
		                		<tr>
		                 		<th><h1>팔가격2</h1></th>
		                 	</tr>
		                 </table>
	                <%-- </c:forEach> --%>
	                </div>
		                
	                <div class="item">
	            	<%-- <c:forEach items="${resellList }" end="4" var="resellBuy"> --%>
		                   <table>
		                       	<tr>
		                       		<td rowspan="3"> <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-2.jpg" alt="중고판매대표사진">
		                       		</td>
		                       		<td><h1>팔제목3</h1></td>
		                       	</tr>
		                       	<tr>
		                       		<td><h1>팔상품명3</h1></td>
		                      		</tr>
		                      		<tr>
		                       		<th><h1>팔가격3</h1></th>
		                       	</tr>
		                    </table>
	                <%-- </c:forEach> --%>
	                </div>
		                
	                <div class="item">
	            	<%-- <c:forEach items="${resellList }" end="4" var="resellBuy"> --%>       
		                   <table>
		                       	<tr>
		                       		<td rowspan="3"> <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-2.jpg" alt="중고판매대표사진">
		                       		</td>
		                       		<td><h1>팔제목4</h1></td>
		                       	</tr>
		                       	<tr>
		                       		<td><h1>팔상품명4</h1></td>
		                      		</tr>
		                      		<tr>
		                       		<th><h1>팔가격4</h1></th>
		                       	</tr>
		                    </table>
		                <%-- </c:forEach> --%>
	                </div>
            	</div>
           	</div>
         
       <!-- 사구보기 -->        
	        <div id="rebuy" class="display_none" style="margin-left: 100px; margin-right: 100px; margin-bottom: 100px; min-height: 170px; max-width: 1105px;">
           		<div style="text-align: right;"><p><a href="#"  style="margin-bottom: 20px; font-size: 20px;">사구보기</a></p>
            	</div>
            	
            	<div id="owl-banner_rebuy" class="owl-carousel" style="margin-top: 50px;">
           		
	                <div class="item">
	            	<%-- <c:forEach items="${resellList }" end="4" var="resellBuy"> --%>
	                        <table>
	                        	<tr>
	                        		<td rowspan="3"> <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-2.jpg" alt="중고판매대표사진">
	                        		</td>
	                        		<td><h1>팔제목1</h1></td>
	                        	</tr>
	                        	<tr>
	                        		<td><h1>팔상품명1</h1></td>
	                       		</tr>
	                       		<tr>
	                        		<th><h1>팔가격1</h1></th>
	                        	</tr>
	                        </table>
	                <%-- </c:forEach> --%>
	                </div>
	                
	                <div class="item">
	            	<%-- <c:forEach items="${resellList }" end="4" var="resellBuy"> --%>
		                 <table>
		                 	<tr>
		                 		<td rowspan="3"> <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-2.jpg" alt="중고판매대표사진">
		                 		</td>
		                 		<td><h1>팔제목2</h1></td>
		                 	</tr>
		                 	<tr>
		                 		<td><h1>팔상품명2</h1></td>
		                		</tr>
		                		<tr>
		                 		<th><h1>팔가격2</h1></th>
		                 	</tr>
		                 </table>
	                <%-- </c:forEach> --%>
	                </div>
		                
	                <div class="item">
	            	<%-- <c:forEach items="${resellList }" end="4" var="resellBuy"> --%>
		                   <table>
		                       	<tr>
		                       		<td rowspan="3"> <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-2.jpg" alt="중고판매대표사진">
		                       		</td>
		                       		<td><h1>팔제목3</h1></td>
		                       	</tr>
		                       	<tr>
		                       		<td><h1>팔상품명3</h1></td>
		                      		</tr>
		                      		<tr>
		                       		<th><h1>팔가격3</h1></th>
		                       	</tr>
		                    </table>
	                <%-- </c:forEach> --%>
	                </div>
		                
	                <div class="item">
	            	<%-- <c:forEach items="${resellList }" end="4" var="resellBuy"> --%>       
		                   <table>
		                       	<tr>
		                       		<td rowspan="3"> <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-2.jpg" alt="중고판매대표사진">
		                       		</td>
		                       		<td><h1>팔제목4</h1></td>
		                       	</tr>
		                       	<tr>
		                       		<td><h1>팔상품명4</h1></td>
		                      		</tr>
		                      		<tr>
		                       		<th><h1>팔가격4</h1></th>
		                       	</tr>
		                    </table>
		                <%-- </c:forEach> --%>
	                </div>
            	</div>
			</div>
		</div>
	
	
	
    </section>
</main>
	<!-- BottomBar -->
    <!-- Footer Section Begin -->
    <!-- Footer Section End -->



<%@ include file="/WEB-INF/views/includes/BottomBar.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>

<script type="text/javascript">
     var checkMsg = '${msg}';
     console.log(checkMsg.length);
     if( checkMsg.length > 0 ){
        alert(checkMsg);
     }
</script>

<script type="text/javascript">
	$(function(){
		$('#carousel-example-generic').carousel({
		// 슬라이딩 자동 순환 지연 시간
		// false면 자동 순환하지 않는다.
		interval: 1000,
		// hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
		pause: "hover",
		// 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
		wrap: true,
		// 키보드 이벤트 설정 여부(?)
		keyboard : true
		});
	});
	
	
	$('#owl-banner_resell').owlCarousel({
	    items : 6, //화면에 표시 할 슬라이드 수
	    animateOut : 'fadeOut', // 사라질때의 애니메이션
	    margin : 20, // 슬라이드 간격
	    dots : true, // Pagination 표시 여부
	    autoplay : true, // 자동 슬라이드 여부
	    autoplayTimeout : 30000, // 자동 슬라이드 시간 (1초=1000)
	    loop : true, // 무한 반복 여부
	    nav: true,
        navText: ["<i class='fa fa-angle-left'><i/>", "<i class='fa fa-angle-right'><i/>"],
	    responsive: {

            320: {
                items: 1,
            },

            480: {
                items: 2,
            },

            768: {
                items: 2,
            },

            992: {
                items: 3,
            }
        }
	})
	
	
	$('#owl-banner_rebuy').owlCarousel({
	    items : 6, //화면에 표시 할 슬라이드 수
	    animateOut : 'fadeOut', // 사라질때의 애니메이션
	    margin : 20, // 슬라이드 간격
	    dots : true, // Pagination 표시 여부
	    autoplay : true, // 자동 슬라이드 여부
	    autoplayTimeout : 30000, // 자동 슬라이드 시간 (1초=1000)
	    loop : true, // 무한 반복 여부
	    nav: true,
        navText: ["<i class='fa fa-angle-left'><i/>", "<i class='fa fa-angle-right'><i/>"],
	    responsive: {

            320: {
                items: 1,
            },

            480: {
                items: 2,
            },

            768: {
                items: 2,
            },

            992: {
                items: 3,
            }
        }
	})
</script>

<script type="text/javascript">
function selectResell(){
	console.log("팔구목록on 사구목록off")
	/* 사구목록 display_none */
	$("#resell").removeClass("display_none");
	$("#rebuy").addClass("display_none");
	$("#selRebuy").removeClass('title_color');
	$("#selResell").addClass('title_color');
}

function selectRebuy(){
	console.log("팔구목록off 사구목록on")
	/* 팔구목록 display_none */
	$("#rebuy").removeClass("display_none");
	$("#resell").addClass("display_none");
	$("#selResell").removeClass('title_color');
    $("#selRebuy").addClass('title_color');
}

</script>

</html>