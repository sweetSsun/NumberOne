<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>EstateAgency Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">


  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">

  <!-- Vendor CSS Files -->
 <%-- <link href="${pageContext.request.contextPath }/resources/assets/vendor/animate.css/animate.min.css" rel="stylesheet"> --%>
  <%-- <link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> --%>
   <link href="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet"> 
  <%-- <link href="${pageContext.request.contextPath }/resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet"> --%>

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath }/resources/assets/css/style.css" rel="stylesheet">

    <!-- Ogani Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" type="text/css">

<style type="text/css">



  	
  	#header-navigation {
	  position: fixed;
	  background-color: white;
	  top: 0;
	  /* width: 100% */
	  left: 0;
	  right: 0;
	  z-index:100;
}
	
</style>
  <script src="https://kit.fontawesome.com/8f795d5741.js" crossorigin="anonymous"></script>
</head>
<body>
	<!-- Header Section Begin -->
    <!-- TobBar -->
	<%@ include file= "/WEB-INF/views/includes/TopBar.jsp" %>



    <!-- ======= Intro Single ======= -->
    <section class="intro-single">
      <div class="container" style="margin-top: 100px;">
        <div class="row"  >
                  <div class="col-sm-3">
            <div class="grid-option">
              <form>
                <select class="custom-select">
                  <option selected>최신순</option>
                  <option value="1">조회수</option>
                  <option value="2">추천수</option>
                  <option value="3">댓글수</option>
                </select>
              </form>
            </div>
          </div>
                 <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">

                                <input type="text" placeholder="What do yo u need?">
                                <button type="submit" class="site-btn">SEARCH</button>
                            </form>
                        </div>
                    </div>
        </div>
        </div>
      </div>
    </section><!-- End Intro Single-->

    <!-- ======= Property Grid ======= -->
    <section class="property-grid grid">
      <div class="container">
        <div class="row">

                    <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-1.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-3.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-6.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-7.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-8.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-1.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-3.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-6.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-7.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-8.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-1.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-3.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-6.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-7.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-8.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-1.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-3.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-6.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-7.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-box-a card-shadow">
              <div class="img-box-a">
                <img src="${pageContext.request.contextPath }/resources/assets/img/property-8.jpg" alt="" class="img-a img-fluid">
              </div>
              <div class="card-overlay">
                <div class="card-overlay-a-content">
                  <div class="card-header-a">
                    <h2 class="card-title-a">
                      <a href="#">나의 자취방을
                        <br /> 소개합니다!</a>
                    </h2>
                  </div>
                  <div class="card-body-a">
                    <div class="price-box d-flex">
                      <span class="price-a">Writer</span>
                    </div>
                    <a href="property-single.html" class="link-a">상세페이지 이동
                      <span class="bi bi-chevron-right"></span>
                    </a>
                  </div>
                  <div class="card-footer-a">
                    <ul class="card-info d-flex justify-content-around">
                      <li>
                        <h4 class="card-info-title">조회수</h4>
                        <span>300</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">추천수</h4>
                        <span>10</span>
                      </li>
                      <li>
                        <h4 class="card-info-title">댓글수</h4>
                        <span>35</span>
                      </li>
<!--                       <li>
                        <h4 class="card-info-title">Garages</h4>
                        <span>1</span>
                      </li> -->
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>



<!--  -->
        <div class="row">
          <div class="col-sm-12">
            <nav class="pagination-a">
              <ul class="pagination justify-content-end">
                <li class="page-item disabled">
                  <a class="page-link" href="#" tabindex="-1">
                    <span class="bi bi-chevron-left"></span>
                  </a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">1</a>
                </li>
                <li class="page-item active">
                  <a class="page-link" href="#">2</a>
                </li>
                <li class="page-item">
                  <a class="page-link" href="#">3</a>
                </li>
                <li class="page-item next">
                  <a class="page-link" href="#">
                    <span class="bi bi-chevron-right"></span>
                  </a>
                </li>
              </ul>
            </nav>
          </div>
        </div>
      </div>
    </section><!-- End Property Grid Single-->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
		<h3>하단바 입니다.</h3>
          <div class="copyright-footer">
		<h3>하단바를 넣어주세요!</h3>
          </div>
        </div>
      </div>
    </div>
  </footer><!-- End  Footer -->

  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center" ><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <%-- <script src="${pageContext.request.contextPath }/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> --%>
  <%-- <script src="${pageContext.request.contextPath }/resources/assets/vendor/swiper/swiper-bundle.min.js"></script> --%>
  <%-- <script src="${pageContext.request.contextPath }/resources/assets/vendor/php-email-form/validate.js"></script> --%>
  
  <!-- RoomListPage JS -->
  <script src="${pageContext.request.contextPath }/resources/assets/js/main.js"></script>
  
  
  <!--  -->
      <!-- ogani JS -->
    <script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.nice-select.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery-ui.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/jquery.slicknav.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/mixitup.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>

</body>

</html>