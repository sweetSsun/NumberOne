<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>1인자 메인</title>

    <!-- Google Font -->

    <!-- Css Styles -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">
    <%@ include file="/resources/css/BarCss.jsp" %>
    
	<!-- 배너 -->    
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    
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
	
</head>

<body>

    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
	<!-- TopBar -->
		<%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>

	<main>
    <!-- Header Section Begin -->
    <section>
		<!-- 캐러셀 : 배너 -->
		<!-- 클래스에 carousel과 slide 설정. 특이하게 id 설정필요 -->

			<div class="container">
			
				<div style="width: 100%; height: 80vh;">
					<div id="carousel-example-generic" class="carousel slide">
					  <!-- Indicators -->
					  <ol class="carousel-indicators">
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

    <!-- Hero Section Begin -->
    <!-- Hero Section End -->

    <!-- Featured Section Begin -->
        <div class="container">
            <div class="row section-title">
				<div class="col-lg-5">
					<h2>커뮤니티</h2>
                </div>
                <div class="col-lg-6 featured__controls">
                    <ul>
                        <li class="active" data-filter="*">All</li>
                        <li data-filter=".free">자유</li>
                        <li data-filter=".question">질문</li>
                        <li data-filter=".information">정보</li>
                        <li data-filter=".review">후기</li>
                        <li data-filter=".notice">공지</li>
                    </ul>
                </div>
                <div class="col-lg-1" style="margin-top: 50px;">
                	<a href="#"><h5>더보기</h5></a>
                </div>
            </div>
            
            <div class="row featured__filter">
                <div class="col-lg-3 col-md-4 col-sm-6 mix free">
                    <div class="featured__item">
                        <table>
                        	<tr>
                        		<td>자유글제목</td>
                        		<th>자유글날짜</th>
                        	</tr>
                        	
                        </table>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix question">
                    <div class="featured__item">
                        <table>
                        	<tr>
                        		<td>질문글제목</td>
                        		<th>질문글날짜</th>
                        	</tr>                        	
                        </table>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix information">
                    <div class="featured__item">
                        <table>
                        	<tr>
                        		<td>정보글제목</td>
                        		<th>정보글날짜</th>
                        	</tr>                        	
                        </table>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix review">
                    <div class="featured__item">
                        <table>
                        	<tr>
                        		<td>후기글제목</td>
                        		<th>후기글날짜</th>
                        	</tr>                        	
                        </table>
                    </div>
                </div>
                <div class="col-lg-3 col-md-4 col-sm-6 mix notice">
                    <div class="featured__item">
                        <table>
                        	<tr>
                        		<td>공지글제목</td>
                        		<th>공지글날짜</th>
                        	</tr>                        	
                        </table>
                    </div>
                </div>
                
            </div>
        </div>
    
    <!-- Featured Section End -->

    <!-- Banner Begin -->
    
    <!-- Banner End -->

    <!-- Latest Product Section Begin -->
   
        <div class="container">
            <div class="row section-title">
                <div class="col-lg-5">
                    <div>
                        <h2>중고거래</h2>
                    </div>
                </div>
                <div class="col-lg-6">
                </div>
                <div class="col-lg-1" style="margin-top: 50px;">
                <a href="#"><h5>더보기</h5></a>
                </div>
               
                
                <div class="latest-product__slider owl-carousel">
                    <div class="row latest-prdouct__slider__item">
	                    <div class="col-lg-4">
	                        <a href="#" class="latest-product__item">
	                            <div class="latest-product__item__pic">
	                                <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-1.jpg" alt="">
	                            </div>
	                            <div class="latest-product__item__text">
	                                <h6>2022.06.27</h6>
	                                <span>갤럭시노트10</span>
	                                <span>50만원</span>
	                            </div>
	                        </a>
	                    </div>
	                        
	                    <div class="col-lg-4">
	                        <a href="#" class="latest-product__item">
	                            <div class="latest-product__item__pic">
	                                <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-2.jpg" alt="">
	                            </div>
	                            <div class="latest-product__item__text">
	                                <h6>222</h6>
	                                <span>가격 2원</span>
	                            </div>
	                        </a>
	                    </div>
	                        
	                  	<div class="col-lg-4">
	                        <a href="#" class="latest-product__item">
	                            <div class="latest-product__item__pic">
	                                <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-3.jpg" alt="">
	                            </div>
	                            <div class="latest-product__item__text">
	                                <h6>333</h6>
	                                <span>가격 3원</span>
	                            </div>
	                        </a>
	                    </div>
                	</div>
                        
                <div class="row latest-prdouct__slider__item">
	                <div class="col-lg-4">
	                    <a href="#" class="latest-product__item">
	                        <div class="latest-product__item__pic">
	                            <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-1.jpg" alt="">
	                        </div>
	                        <div class="latest-product__item__text">
	                            <h6>444</h6>
	                            <span>가격 4원</span>
	                        </div>
	                    </a>
	                </div>
	                        
	                <div class="col-lg-4">
	                    <a href="#" class="latest-product__item">
	                        <div class="latest-product__item__pic">
	                            <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-2.jpg" alt="">
	                        </div>
	                        <div class="latest-product__item__text">
	                            <h6>555</h6>
	                            <span>가격 5원</span>
	                        </div>
	                    </a>
	                 </div>
	                         
	                 <div class="col-lg-4">
	                    <a href="#" class="latest-product__item">
	                        <div class="latest-product__item__pic">
	                            <img src="${pageContext.request.contextPath }/resources/img/latest-product/lp-3.jpg" alt="">
	                        </div>
	                        <div class="latest-product__item__text">
	                            <h6>666</h6>
	                            <span>가격 6원</span>
	                        </div>
	                    </a>
	                 </div>
                 
                  </div>
                  
                  </div>
                  </div>
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
	
</script>

</html>