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
    <title>1인자 : 1인 자취인들을 위한 커뮤니티 사이트</title>

    <!-- Google Font -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">	

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
	
	<!-- jQuery -->    
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	

    <!-- Bootstrap cdn 설정 -->	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> 
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">	
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	  
	<!-- 배너 -->    
    <script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
    <script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script> 
    <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
    
	
	<style type="text/css">
	
		.display_none{
	    	display: none;
	    }
	    
	    /* 메인배너*/
	    .fixtext h2 {
	    	font-family: 'Jal_Onuel';
    	    font-size: 4rem;
		    color: #fff;
		    line-height: 52px;
		    font-weight: 700;
		    margin: 10px 0;
		    text-align: left;
	    }
	    
	    .fixtext span {
	    	font-family: 'Jal_Onuel';
			font-size: 2rem;
			color: #00bcd4;
			text-transform: uppercase;
			font-weight: 700;
			letter-spacing: 4px;
			float: left;
		}
		
		.fixbtn {
		    border: solid 1px white;
		    border-radius: 5px;
		    font-size: 1.5rem;
		    width: 120px;
		    height: 45px;
		    color: white;
		    background-color: transparent;
			margin-top: 50px;
			margin-right: 50px;
		}
		
	    .fixback {
	    	padding-left: 40px;
	    	background-color: white;
	    	background-color: rgba( 0, 0, 0, 0.3 );
	    	border-radius: 10px;
	    }
	    
	    .carousel-control {
	    	width: 5vw;
	    	border-radius: 30px;
	    }
	    
	    .carousel-control .glyphicon {
	    	top: 10%;
	    }
	    
   		.carousel-caption {
			right: 0;
			left: 8px;
			width: 100%;
		}
		
		.carousel-inner .item img {
		-webkit-transform: scale(1);
		transform: scale(1);
		-webkit-transition: .3s ease-in-out;
		transition: .3s ease-in-out;
		}
		
		.carousel-inner .item:hover img {
		  -webkit-transform: scale(1.3);
		  transform: scale(1.3);
		}
		
		.carousel-inner .item:hover .fixbtn {
			background-color: #00bcd4;
			border: none;
			font-weight: bold;
		}
				
	    
		/* 커뮤니티 */
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
		
		ul li:hover {
			color: #00bcd4;
			text-decoration: none;
		}
		
		.td, .th{
			font-size: 1.8rem;
		}
		
		
		/* 커뮤니티 & 중고거래 */
		.mainbox{
	    	margin-top : 100px;
		    border-radius: 50px;
	   		border: solid;
	    	border-color: #00bcd4;
	    }
   
   	    .overflow_twoline{
		    overflow: hidden;
			text-overflow: ellipsis;
			display: -webkit-box;
			-webkit-line-clamp: 1;
			-webkit-box-orient: vertical;
	    }
		
		.ahover a:hover {
			color: #00bcd4;
			text-decoration: none;
		}
		
		
		/* 중고거래 배너 화살표 */
		.owl-prev, .owl-next {
			position: absolute;
	        height: 100px;
	        color: inherit;
	        background: none;
	        border: none;
	        z-index: 100;
	
	    }
	    .owl-prev i, .owl-next i {
            font-size: 4rem;
            color: #00bcd4;
        }
	
	    .owl-prev {
	    	top: 10%;
	        left: -100px;
	    }
	
	    .owl-next {
	    	top: 10%;
	        right: -100px;
	    }
	    
		.owl-carousel-img {
		    height: 100%;
		    width: auto;
		    margin: auto;
			border-radius: 20px;
		}
		.owl-carousel .owl-dots.disabled, .owl-carousel .owl-nav.disabled {
    		display: block! important;
   		}
		
		/* 두번째 배너 */
		.owl-carousel .owl-item img, .owl-stage-outer {
			border-radius: 30px;
		}
		
		/* 두번째 배너 화살표 */
		#banner_second:hover button {
			opacity: 1! important;
		}
		
		#banner_second .owl-nav .owl-prev, #banner_second .owl-nav .owl-next {
			width: 15px;
		    height: 100px;
		    position: absolute;
		    top: 40%;
		   /*  margin-left: 30%;
		    margin-right: 39%; */
		    display: block !important;
		    border:0px solid black;
		    opacity: 0;
		    transition:0.5s all;
		}
		#banner_second .owl-nav .owl-prev {
			left: -0.9vw;		
		}
		#banner_second .owl-nav .owl-next {
			right: 0.3vw
		}
		#banner_second .owl-nav .owl-prev i, #banner_second .owl-nav .owl-next i{
			font-size: 3rem;
			background-color: white;
			border-radius: 100%;
			width: 40px;
			height: 40px;
			padding-top: 30%;
		}
		
		/* 줌인 */
		.owl-carousel .owl-item img {
		-webkit-transform: scale(1);
		transform: scale(1);
		-webkit-transition: .3s ease-in-out;
		transition: .3s ease-in-out;
		}
		
		.owl-carousel .owl-item:hover img {
		  -webkit-transform: scale(1.1);
		  transform: scale(1.1);
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
			<div class="row">
		
				<!-- 메인배너 -->
				<div class="col-lg-9 col-sm-9" style="margin: auto;">
					<div id="carousel-example-generic" class="carousel slide" style="width: 100%; min-height: 50px;">
					<!-- 사진크기 이상해지면 50vh 반응형넣기 -->
						<!-- Indicators -->
						<ol class="carousel-indicators"style="min-width: -webkit-fill-available;">
					    	<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
							<c:forEach items="${fixList }" var="fixList" begin="1" varStatus="status">
					    	 <li data-target="#carousel-example-generic" data-slide-to="${status.index}"></li>
						    </c:forEach>
						</ol>
					
					<!-- Wrapper for slides -->
						<div class="carousel-inner" role="listbox" style="height:50vh; border-radius: 30px;">
						    
			                <c:forEach items="${fixList }" end="0" var="fixList">
							    <div class="item active" style="height:100%">
			                		<img style="width: 100%; height:100%;" alt="자랑방고정" src="${pageContext.request.contextPath }/resources/img/room/${fixList.bdimg}">
							      	<div class="row carousel-caption fixback">
							      		
				                        <div class="col-lg-9 fixtext">
				                            <h2>${fixList.bdtitle }</h2>
				                            <span>${fixList.bdnickname } 님</span>			                    
			                    		</div>
			                    		<div class="col-lg-3">
			                    			<a href="${pageContext.request.contextPath }/selectRoomList?bdcode=${fixList.bdcode}"><button class="fixbtn">보러가자</button></a>
			                    		</div>
							    	</div>
							    </div>						      
					        </c:forEach>
					        
					        <c:forEach items="${fixList }" begin="1" var="fixList">
							    <div class="item" style="height:100%">
			                		<img style="width: 100%; height:100%;" alt="자랑방고정" src="${pageContext.request.contextPath }/resources/img/room/${fixList.bdimg}">
							      	<div class="row carousel-caption fixback">
				                        <div class="col-lg-9 fixtext">				                            
				                            <h2>${fixList.bdtitle }</h2>
				                            <span>${fixList.bdnickname } 님</span>					                            
				                        </div>
				                        <div class="col-lg-3">
			                    			<a href="${pageContext.request.contextPath }/selectRoomList?bdcode=${fixList.bdcode}"><button class="fixbtn">보러가자</button></a>
			                    		</div>

							    	</div>
							    </div>						      
					        </c:forEach>
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
				
				<!-- 두번째배너 -->
				<div class="col-lg-3 col-sm-3" style="margin: auto;">
					<div id="banner_second" class="owl-carousel" style="width: auto; height: 50vh;">
						<div class="item" style="height:100%">
	                		<a href="selectGonguBoardView?codeIdx=GB00001" title="공동구매">
	                			<img style="height:50vh;" alt="공동구매이동1" src="${pageContext.request.contextPath }/resources/img/banner/numberoneGagu.png">
	               			</a>
					    </div>
					    <div class="item" style="height:100%">
	                		<a href="selectGonguBoardList?gbstate=ing" title="공동구매">
	                			<img style="height:50vh;" alt="공동구매이동2" src="${pageContext.request.contextPath }/resources/img/banner/gongu003.jpg">
	               			</a>
					    </div>		
					    <div class="item" style="height:100%">
	                		<a href="selectCategoryBoardList?searchVal=정보" title="정보방">
	                			<img style="height:50vh;" alt="정보방목록이동" src="${pageContext.request.contextPath }/resources/img/banner/thehouse_sky.jpg">
	               			</a>
					    </div>						      
			        </div>
				        
					
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
                        <li data-filter=".notice">공지</li>
                        <li data-filter=".free">자유</li>
                        <li data-filter=".question">질문</li>
                        <li data-filter=".information">정보</li>
                        <li data-filter=".review">후기</li>
                    </ul>
                </div>
            </div>
            

            <div class="featured__filter" style="margin-left: 5%; margin-right: 3%; margin-bottom: 5%; min-height: 170px;">
            	<!-- 전체보기 -->
                <div class="row mix all active">
            	<p><a href="selectBoardList"  style="float: right; margin-bottom: 20px; font-size: 15px;"><i class="fa-solid fa-square-plus"></i>&nbsp;더보기</a></p>
            	<c:forEach items="${boardList }" end="5" var="boardList">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F2FF;border-right: solid 20px white">
                        <div class="row ahover">
                        <c:choose>
                        	<c:when test="${boardList.bdcategory eq '후기' }">
                        		<!-- 후기글 상세페이지 -->
	                        	<a href="${pageContext.request.contextPath }/selectReviewBoardView${paging.makeQueryPage(boardList.bdcategory, bdtype, boardList.bdcode, paging.page)}">
		                        	<div class="col-lg-8 col-md-8 col-sm-8 overflow_twoline">
		                        		<h3>${boardList.bdtitle }</h3>
		                        	</div>
		                        	<div class="col-lg-4 col-md-4 col-sm-4">	
		                        		<h4>${boardList.bddate }</h4>
		                        	</div>
		                       	</a>
                        	</c:when>
                        	
                        	<c:otherwise>
                        	<c:if test="${boardList.bdcategory != '자랑' }">
		                        <a href="${pageContext.request.contextPath }/selectBoardView${paging.makeQueryPage(boardList.bdcategory, bdtype, boardList.bdcode, paging.page)}">
		                        	<div class="col-lg-8 col-md-8 col-sm-8 overflow_twoline">
		                        		<h3>${boardList.bdtitle }</h3>
		                        	</div>
		                        	<div class="col-lg-4 col-md-4 col-sm-4">
		                        		<h4>${boardList.bddate }</h4>
		                        	</div>
		                       	</a>
                        	</c:if>
                        	</c:otherwise>
                       	</c:choose>
                        </div>
                    </div>
                </c:forEach>
                </div>
                
                <!-- 공지보기 -->
                <div class="row mix notice" style="display:none;">
            	<p><a href="selectNoticeBoardList"  style="float: right; margin-bottom: 20px;"><i class="fa-solid fa-square-plus"></i>&nbsp;더보기</a></p>
            	<c:forEach items="${noticeList }" end="5" var="noticeList">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F2FF;">
                        <div class="row ahover">
                        <a href="${pageContext.request.contextPath }/selectNoticeBoardView${paging.makeQueryPage(noticeList.nbcode, paging.page)}">
                        	<div class="col-lg-8 col-md-8 col-sm-8 overflow_twoline">
                        		<h3>${noticeList.nbtitle }</h3>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">	
                        		<h4>${noticeList.nbdate }</h4>
                        	</div>
                       	</a>
                        </div>
                    </div>
                </c:forEach>
                </div>
                
                <!-- 자유보기 -->
                <div class="row mix free" style="display:none;">
            	<p><a href="selectCategoryBoardList?searchVal=자유"  style="float: right; margin-bottom: 15px;"><i class="fa-solid fa-square-plus"></i>&nbsp;더보기</a></p>
            	<c:forEach items="${boardList_free }" end="5" var="boardList_free">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F2FF;">
                        <div class="row ahover">
                        <a href="${pageContext.request.contextPath }/selectBoardView${paging.makeQueryPage(boardList_free.bdcategory, bdtype, boardList_free.bdcode, paging.page)}">
                        	<div class="col-lg-8 col-md-8 col-sm-8 overflow_twoline">
                        		<h3>${boardList_free.bdtitle }</h3>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">	
                        		<h4>${boardList_free.bddate }</h4>
                        	</div>
                       	</a>
                        </div>
                    </div>
                </c:forEach>
                </div>
                
                <!-- 질문보기 -->
                <div class="row mix question" style="display:none;">
            	<p><a href="selectCategoryBoardList?searchVal=질문"  style="float: right; margin-bottom: 15px;"><i class="fa-solid fa-square-plus"></i>&nbsp;더보기</a></p>
            	<c:forEach items="${boardList_qa }" end="5" var="boardList_qa">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F2FF;">
                        <div class="row ahover">
                        <a href="${pageContext.request.contextPath }/selectBoardView${paging.makeQueryPage(boardList_qa.bdcategory, bdtype, boardList_qa.bdcode, paging.page)}">
                        	<div class="col-lg-8 col-md-8 col-sm-8 overflow_twoline">
                        		<h3>${boardList_qa.bdtitle }</h3>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">
                        		<h4>${boardList_qa.bddate }</h4>
                        	</div>
                       	</a>
                        </div>
                    </div>
                </c:forEach>
                </div>
                
                <!-- 정보보기 -->
                <div class="row mix information" style="display:none;">
				<p><a href="selectCategoryBoardList?searchVal=정보"  style="float: right; margin-bottom: 15px;"><i class="fa-solid fa-square-plus"></i>&nbsp;더보기</a></p>
            	<c:forEach items="${boardList_info }" end="5" var="boardList_info">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F2FF;">
                        <div class="row ahover">
                        <a href="${pageContext.request.contextPath }/selectBoardView${paging.makeQueryPage(boardList_info.bdcategory, bdtype, boardList_info.bdcode, paging.page)}">
                        	<div class="col-lg-8 col-md-8 col-sm-8 overflow_twoline">
                        		<h3>${boardList_info.bdtitle }</h3>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">	
                        		<h4>${boardList_info.bddate }</h4>
                        	</div>
                       	</a>
                        </div>
                    </div>
                </c:forEach>
                </div>
                
                <!-- 후기보기 -->
                <div class="row mix review" style="display:none;">
            	<p><a href="selectCategoryBoardList?searchVal=후기"  style="float: right; margin-bottom: 20px;"><i class="fa-solid fa-square-plus"></i>&nbsp;더보기</a></p>
            	<c:forEach items="${boardList_review }" end="5" var="boardList_review">
                    <div class="col-lg-6 col-md-12 col-sm-12 featured__item" style="margin-bottom: 5px; background-color: #F2F2FF;">
                        <div class="row ahover">
                        <a href="${pageContext.request.contextPath }/selectReviewBoardView${paging.makeQueryPage(boardList_review.bdcategory, bdtype, boardList_review.bdcode, paging.page)}">
                        	<div class="col-lg-8 col-md-8 col-sm-8 overflow_twoline">
                        		<h3>${boardList_review.bdtitle }</h3>
                        	</div>
                        	<div class="col-lg-4 col-md-4 col-sm-4">	
                        		<h4>${boardList_review.bddate }</h4>
                        	</div>
                       	</a>
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
		        <div id="resell" style="margin-left: 5%; margin-right: 5%; margin-bottom: 3%; min-height: 170px; width: 90%;">
	           		<div>
	           			<p style="text-align: right; margin-bottom: 20px;"><a href="selectResellPageList?sellBuy=S&ajaxCheck=LIST"><i class="fa-solid fa-square-plus"></i>&nbsp;팔구보기</a></p>
	            	
		            	<div id="owl-banner_resell" class="owl-carousel">           		
		           			<c:forEach items="${SellList }" end="5" var="SellList">
			                	<div class="item" style="height:25rem; padding-bottom: 10px;">
			                        <div style="height:80%">
			                        	<c:choose>
											<c:when test="${SellList.ubmainimg != null}">
												<a href="selectResellView?ubcode=${SellList.ubcode }&ubsellbuy=${SellList.ubsellbuy }&modifyCheck=LIST"><img class="owl-carousel-img" alt="중고판매상세이동" src="${pageContext.request.contextPath }/resources/img/resell/${SellList.ubmainimg}"></a>
		                                    </c:when>
		                                    <c:otherwise>
		                                    	<a href="selectResellView?ubcode=${SellList.ubcode }&ubsellbuy=${SellList.ubsellbuy }&modifyCheck=LIST"><img class="owl-carousel-img" alt="중고판매상세이동" src="${pageContext.request.contextPath }/resources/img/logo_gray.png"></a>
	                                    	</c:otherwise>
										</c:choose>
			                        </div>
			                        <div style="margin-top: 10px; font-size: 16px; height:20%">
			                        	<div>
				                        	<span class="overflow_twoline">${SellList.ubtitle }</span>
			                        	</div>
				                        <div>
			                        		<span>${SellList.ubnickname }</span>
		                        		</div>
			                        </div>
			                	</div>
		                	</c:forEach>	                
		            	</div>
		            	
	            	</div>
	           	</div>
	         
	       <!-- 사구보기 -->        
		        <div id="rebuy" class="display_none" style="margin-left: 5%; margin-right: 5%; margin-bottom: 3%; min-height: 170px; width: 90%;">
	           		<div>
	           			<p style="text-align: right; margin-bottom: 20px;"><a href="selectResellPageList?sellBuy=B&ajaxCheck=LIST"><i class="fa-solid fa-square-plus"></i>&nbsp;사구보기</a></p>
	           		  	
		            	<div id="owl-banner_rebuy" class="owl-carousel">
		           		
		            		<c:forEach items="${buyList }" end="5" var="buyList">
			                	<div class="item" style="height:25rem; padding-bottom: 10px;">
			                        <div style="height:80%">
	                        			<c:choose>
											<c:when test="${buyList.ubmainimg != null}">
												<a href="selectResellView?ubcode=${buyList.ubcode }&ubsellbuy=${buyList.ubsellbuy }&modifyCheck=LIST"><img class="owl-carousel-img" alt="중고구매상세이동" src="${pageContext.request.contextPath }/resources/img/resell/${buyList.ubmainimg}"></a>
		                                    </c:when>
		                                    <c:otherwise>
		                                    	<a href="selectResellView?ubcode=${buyList.ubcode }&ubsellbuy=${buyList.ubsellbuy }&modifyCheck=LIST"><img class="owl-carousel-img" alt="중고구매상세이동" src="${pageContext.request.contextPath }/resources/img/logo_gray.png"></a>
	                                    	</c:otherwise>
										</c:choose>
			                        </div>
			                        <div style="margin-top: 10px; font-size: 16px; height:20%">
			                        	<div>
				                        	<span class="overflow_twoline">${buyList.ubtitle }</span>
			                        	</div>
				                        <div>
			                        		<span>${buyList.ubnickname }</span>
		                        		</div>
			                        </div>
			                	</div>
		                	</c:forEach>
		            	</div>
		            	
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

<!-- 상단 배너 슬라이딩 -->
<script type="text/javascript">
	$(function(){
		$('#carousel-example-generic').carousel({
		// 슬라이딩 자동 순환 지연 시간
		// false면 자동 순환하지 않는다.
		interval: 30000,
		// hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
		pause: "hover",
		// 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
		wrap: true,
		// 키보드 이벤트 설정 여부(?)
		keyboard : true
		});
	});
	
	
	/* 두번째 배너 슬라이딩 */
	
	$('#banner_second').owlCarousel({
	    items : 1, //화면에 표시 할 슬라이드 수
	    animateOut : 'fadeOut', // 사라질때의 애니메이션
	    margin : 40, // 슬라이드 간격
	    dots : true, // Pagination 표시 여부
	    autoplay : true, // 자동 슬라이드 여부
	    autoplayTimeout : 30000, // 자동 슬라이드 시간 (1초=1000)
	    loop : true, // 무한 반복 여부
	    nav: true,
	    navText : ["<i class='fa fa-angle-left'><i/>", "<i class='fa fa-angle-right'><i/>"]
	 
	})
</script>

	
<!-- 하단 팔구/사구 슬라이딩 -->	
<script type="text/javascript">	
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

<!-- 하단 팔구/사구 d-none -->
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