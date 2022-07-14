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
		.fontOn{
		    font-family: 'Jal_Onuel';
		    font-size:25px;
		    font-weight: bold;
		    color: #00bcd4;
		}
		.fontOn a:visited {
			color: #00bcd4! important;
			text-decoration: none;
		}
		.fontOn a:hover{
			color: #00bcd4! important;
			text-decoration: none; 
		}
		
		.td, .th{
			font-size: 1.8rem;
		}
		.owl-prev, .owl-next {
			position: absolute;
	        height: 100px;
	        color: inherit;
	        background: none;
	        border: none;
	        z-index: 100;
	
	        i {
	            font-size: 2em;
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
	    	border-color: #00bcd4;
	    }
	    
	    .overflow{
		    overflow: hidden;
			text-overflow: ellipsis;
			display: -webkit-box;
			-webkit-line-clamp: 1;
			-webkit-box-orient: vertical;
	    }
	
		ul li:hover {
			color: #00bcd4;
			text-decoration: none;
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
			
				<div style="width: 75%; margin: auto;">
					<div id="carousel-example-generic" class="carousel slide" style="width: 100%; min-height: 50px;">
					<!-- 사진크기 이상해지면 50vh 반응형넣기 -->
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
		                            <h2>제목</h2>
		                            <p>클릭시 이동합니다</p>
		                            <a href="selectRoomList" class="primary-btn">임시 자랑방이동버튼</a>
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
        <div class="container mainbox" style="width: 66%;">
            <div class="row section-title" style="margin-top: 5%;">
				<div class="col-lg-5">
					<span class="fontOn"><a href="loadToBoardMainPage">커뮤니티</a></span>
                </div>
                <div class="col-lg-7 featured__controls" style="margin-bottom: 0;">
                    <ul style="font-size: 20px; padding-left: 0;">
                        <li data-filter=".all" class="title_color">All</li>
                        <li data-filter=".free">자유</li>
                        <li data-filter=".question">질문</li>
                        <li data-filter=".information">정보</li>
                        <li data-filter=".review">후기</li>
                        <li data-filter=".notice">공지</li>
                    </ul>
                </div>
            </div>
            

            <div class="featured__filter" style="margin-left: 5%; margin-right: 3%; margin-bottom: 5%; min-height: 170px;">
            	<!-- 전체보기 -->
                <div class="row mix all active">
            	<p><a href="loadToBoardMainPage"  style="float: right; margin-bottom: 20px; font-size: 15px;">더보기</a></p>
            	<c:forEach items="${boardList }" end="5" var="boardList">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F2FF;border-right: solid 20px white">
                        <div class="row">
                        	<div class="col-lg-8 col-md-8 col-sm-8 overflow">
                        		<h3><a href="${pageContext.request.contextPath }/selectBoardView?bdcode=${boardList.bdcode}">${boardList.bdtitle }</a></h3>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">	
                        		<h4>${boardList.bddate }</h4>
                        	</div>
                        </div>
                    </div>
                </c:forEach>
                </div>
                
                <!-- 자유보기 -->
                <div class="row mix free" style="display:none;">
            	<p><a href="selectFreeBoardList"  style="float: right; margin-bottom: 15px;">더보기</a></p>
            	<c:forEach items="${boardList_free }" end="5" var="boardList_free">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F2FF;">
                        <div class="row">
                        	<div class="col-lg-8 col-md-8 col-sm-8 overflow">
                        		<h3><a href="${pageContext.request.contextPath }/selectBoardView?bdcode=${boardList_free.bdcode}">${boardList_free.bdtitle }</a></h3>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">	
                        		<h4>${boardList_free.bddate }</h4>
                        	</div>
                        </div>
                    </div>
                </c:forEach>
                </div>
                
                <!-- 질문보기 -->
                <div class="row mix question" style="display:none;">
            	<p><a href="#"  style="float: right; margin-bottom: 15px;">더보기</a></p>
            	<c:forEach items="${boardList_qa }" end="5" var="boardList_qa">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F2FF;">
                        <div class="row">
                        	<div class="col-lg-8 col-md-8 col-sm-8 overflow">
                        		<h3><a href="${pageContext.request.contextPath }/selectBoardView?bdcode=${boardList_qa.bdcode}">${boardList_qa.bdtitle }</a></h3>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">	
                        		<h4>${boardList_qa.bddate }</h4>
                        	</div>
                        </div>
                    </div>
                </c:forEach>
                </div>
                
                <!-- 정보보기 -->
                <div class="row mix information" style="display:none;">
				<p><a href="#"  style="float: right; margin-bottom: 15px;">더보기</a></p>
            	<c:forEach items="${boardList_info }" end="5" var="boardList_info">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F2FF;">
                        <div class="row">
                        	<div class="col-lg-8 col-md-8 col-sm-8 overflow">
                        		<h3><a href="${pageContext.request.contextPath }/selectBoardView?bdcode=${boardList_info.bdcode}">${boardList_info.bdtitle }</a></h3>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">	
                        		<h4>${boardList_info.bddate }</h4>
                        	</div>
                        </div>
                    </div>
                </c:forEach>
                </div>
                
                <!-- 후기보기 -->
                <div class="row mix review" style="display:none;">
            	<p><a href="#"  style="float: right; margin-bottom: 20px;">더보기</a></p>
            	<c:forEach items="${boardList_review }" end="5" var="boardList_review">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F2FF;">
                        <div class="row">
                        	<div class="col-lg-8 col-md-8 col-sm-8 overflow">
                        		<h3><a href="${pageContext.request.contextPath }/selectBoardView?bdcode=${boardList_review.bdcode}">${boardList_review.bdtitle }</a></h3>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">	
                        		<h4>${boardList_review.bddate }</h4>
                        	</div>
                        </div>
                    </div>
                </c:forEach>
                </div>
                
                <!-- 공지보기 -->
                <div class="row mix notice" style="display:none;">
            	<p><a href="selectNoticeBoardList"  style="float: right; margin-bottom: 20px;">더보기</a></p>
            	<c:forEach items="${noticeList }" end="5" var="noticeList">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F2FF;">
                        <div class="row">
                        	<div class="col-lg-8 col-md-8 col-sm-8 overflow">
                        		<h3><a href="${pageContext.request.contextPath }/selectNoticeBoardView?nbcode=${noticeList.nbcode}">${noticeList.nbtitle }</a></h3>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">	
                        		<h4>${noticeList.nbdate }</h4>
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
		<div class="container mainbox" style="width: 66%;">
		    <div class="row section-title" style="margin-top: 5%;">
		        <div class="col-lg-5">
		            <div>
		                <span class="fontOn"><a href="selectResellMainPage">중고거래</a></span>
		            </div>
		        </div>
		        <div class="col-lg-7" style="margin-bottom: 0;">
		            <ul class="sellbuylist" style="font-size: 20px;">
                        <li id="selResell" class="title_color" style="float: left;" onclick="selectResell()">팔구</li>
                        <li style="float: left; width: 100px;"></li>
                        <li id="selRebuy" style="float: right;" onclick="selectRebuy()">사구</li>
                    </ul>
                </div>	            
            
	        <!-- 배너화살표 -->
	            <div class="owl-nav">
	           	</div>       	
		       
	   		<!-- 팔구보기 -->
		        <div id="resell" style="margin-left: 5%; margin-right: 5%; margin-bottom: 5%; min-height: 170px; width: 90%;">
	           		<div style="text-align: right;">
	           			<p><a href="selectResellPageList?sellBuy=S"  style="margin-bottom: 20px; font-size: 15px;">팔구보기</a></p>
	            	</div>
	            	
	            	<div id="owl-banner_resell" class="owl-carousel" style="margin-top: 50px;">           		
	           			<c:forEach items="${SellList }" end="4" var="SellList">
		                	<div class="item">
		                        <table>
		                        	<tr>
		                        		<td>
		                        			<a href="selectResellPageList?sellBuy=S"><img alt="" src="${pageContext.request.contextPath }/resources/img/resell/${SellList.ubmainimg}"></a>
		                        		</td>
		                        	</tr>
		                        	<tr>
		                        		<td><h3>${SellList.ubtitle }</h3></td>
	                        		</tr>
		                        	<tr>
		                        		<td><h3>${SellList.ubnickname }</h3></td>
		                       		</tr>
		                        </table>
		                	</div>
	                	</c:forEach>	                
	            	</div>
	           	</div>
	         
	       <!-- 사구보기 -->        
		        <div id="rebuy" class="display_none" style="margin-left: 5%; margin-right: 5%; margin-bottom: 5%; min-height: 170px; width: 90%;">
	           		<div style="text-align: right;">
	           			<p><a href="selectResellPageList?sellBuy=B"  style="margin-bottom: 20px; font-size: 15px;">사구보기</a></p>
	            	</div>
	            	
	            	<div id="owl-banner_rebuy" class="owl-carousel" style="margin-top: 50px;">
	           		
	            		<c:forEach items="${buyList }" end="4" var="buyList">
		                	<div class="item">
		                        <table>
		                        	<tr>
		                        		<td>
		                        			<a href="selectResellPageList?sellBuy=B"><img alt="" src="${pageContext.request.contextPath }/resources/img/resell/${buyList.ubmainimg}"></a>
		                        		</td>
		                        	</tr>
		                        	<tr>
		                        		<td><h3>${buyList.ubtitle }</h3></td>
		                        	</tr>
		                        	<tr>
		                        		<td><h3>${buyList.ubnickname }</h3></td>
		                       		</tr>
		                        </table>
		                	</div>
	                	</c:forEach>
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