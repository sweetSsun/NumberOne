<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
       <title>Tables - SB Admin</title>
        
        <!-- tableCss -->
        <link href="${pageContext.request.contextPath }/tableCss/css/styles.css" rel="stylesheet" />
        

    <!-- ogani Css -->
    <!-- <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"> -->
    <!-- <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css"> -->
    <!-- <link rel="stylesheet" href="css/elegant-icons.css" type="text/css"> -->
    <!-- <link rel="stylesheet" href="css/nice-select.css" type="text/css"> -->
    <!-- <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css"> -->
    <!-- <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css"> -->
   <!--  <link rel="stylesheet" href="css/slicknav.min.css" type="text/css"> -->
    <link rel="stylesheet" href="css/style.css" type="text/css">
    
  
  <style type="text/css">
  	.select_type {
  		 width: 150px; 
  		 height: 50px;
  		 border-radius: 5px;
  		 border-color: #DFE3E7;
  	
  	}
  
  
  </style>  
        
    </head>
    <body class="sb-nav-fixed">

<!-- topbar 입력 필요 -->
<div style="background-color: gray; height: 100px;">topBar 입력 필요</div>
<!-- topbar 끝 -->

<!-- sidebar 입력 필요 -->
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
					side bar
                </nav>
            </div>
<!-- sidebar 입력 끝 -->  

            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                   

    <!-- ======= Intro Single ======= -->
    <section class="intro-single">
      <div class="container" style="margin-top:10px; padding: 0px;">
        <div class="row"  >
          <div class="col-sm-2">
            <div class="grid-option">
              <form>
                <select class="select_type">
                  <option value="1">제목</option>
                  <option value="2">내용</option>
                  <option value="3">글쓴이</option>
                </select>
              </form>
            </div>
          </div>
           <div class="col-lg-7">
             <div class="hero__search" style="">
                <div class="hero__search__form">
                   <form action="#">
						<input type="text" placeholder="What do yo u need?">
                         <button type="submit" class="site-btn" >SEARCH</button>
                   </form>
                </div>
              </div>
        </div>
           <div class="col-lg-3">
             <div class="hero__search" style="height: 70px;">
                         <button type="submit" class="site-btn" style="height: 50px;">글작성</button>
              </div>
        	</div>        
        </div>
        
         <div class="row" style="margin-top: 0px;" >
          <div class="col-sm-2">
            <div class="grid-option">
              <form>
                <select class="custom-select">
                  <option selected>지역</option>
                  <option value="1">전체</option>
                  <option value="2">서울</option>
                  <option value="3">인천</option>
                  <option value="1">경기</option>
                  <option value="2">강원</option>
                  <option value="3">경상</option>
                  <option value="1">충청</option>
                  <option value="2">전라</option>
                  <option value="3">제주</option>                                    
                  
                </select>
              </form>
            </div>
          </div>
           <div class="col-lg-10">
 
        </div>
      
        
        
        </div>
        
        
      </div>
    </section><!-- End Intro Single-->  



                        <div class="card mb-4"  style="margin-top: 50px;" >

                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>글번호</th>
                                            <th>말머리</th>
                                            <th>제목</th>
                                            <th>글쓴이</th>
                                            <th>날짜</th>
                                            <th>조회수</th>
                                            <th>추천수</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>글번호</th>
                                            <th>말머리</th>
                                            <th>제목</th>
                                            <th>글쓴이</th>
                                            <th>날짜</th>
                                            <th>조회수</th>
                                            <th>추천수</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>인천</td>
                                            <td>안녕하세요!</td>
                                            <td>HJH</td>
                                            <td>2022-06-27</td>
                                            <td>6</td>
                                            <td>3</td>                                            
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>인천</td>
                                            <td>hi!</td>
                                            <td>HJH</td>
                                            <td>2022-06-27</td>
                                            <td>6</td>
                                            <td>3</td>                                            
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>인천</td>
                                            <td>안녕하세요!</td>
                                            <td>HJH</td>
                                            <td>2022-06-27</td>
                                            <td>6</td>
                                            <td>3</td>                                            
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>서울</td>
                                            <td>안녕하세요!</td>
                                            <td>HJH</td>
                                            <td>2022-06-27</td>
                                            <td>6</td>
                                            <td>3</td>                                            
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>인천</td>
                                            <td>안녕하세요!</td>
                                            <td>HJH</td>
                                            <td>2022-06-27</td>
                                            <td>6</td>
                                            <td>3</td>                                            
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>인천</td>
                                            <td>안녕하세요!</td>
                                            <td>HJH</td>
                                            <td>2022-06-27</td>
                                            <td>6</td>
                                            <td>3</td>                                            
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>서울</td>
                                            <td>안녕하세요!</td>
                                            <td>HJH</td>
                                            <td>2022-06-27</td>
                                            <td>6</td>
                                            <td>3</td>                                            
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>인천</td>
                                            <td>안녕하세요!</td>
                                            <td>HJH</td>
                                            <td>2022-06-27</td>
                                            <td>6</td>
                                            <td>3</td>                                            
                                        </tr>                                    
                                        <tr>
                                            <td>1</td>
                                            <td>인천</td>
                                            <td>안녕하세요!</td>
                                            <td>HJH</td>
                                            <td>2022-06-27</td>
                                            <td>6</td>
                                            <td>3</td>                                            
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>서울</td>
                                            <td>안녕하세요!</td>
                                            <td>HJH</td>
                                            <td>2022-06-27</td>
                                            <td>6</td>
                                            <td>3</td>                                            
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>인천</td>
                                            <td>안녕하세요!</td>
                                            <td>HJH</td>
                                            <td>2022-06-27</td>
                                            <td>6</td>
                                            <td>3</td>                                            
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>인천</td>
                                            <td>안녕하세요!</td>
                                            <td>HJH</td>
                                            <td>2022-06-27</td>
                                            <td>6</td>
                                            <td>3</td>                                            
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>인천</td>
                                            <td>안녕하세요!</td>
                                            <td>HJH</td>
                                            <td>2022-06-27</td>
                                            <td>6</td>
                                            <td>3</td>                                            
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>인천</td>
                                            <td>안녕하세요!</td>
                                            <td>HJH</td>
                                            <td>2022-06-27</td>
                                            <td>6</td>
                                            <td>3</td>                                            
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>인천</td>
                                            <td>안녕하세요!</td>
                                            <td>HJH</td>
                                            <td>2022-06-27</td>
                                            <td>6</td>
                                            <td>3</td>                                            
                                        </tr>
                                        <tr>
                                            <td>1</td>
                                            <td>인천</td>
                                            <td>안녕하세요!</td>
                                            <td>HJH</td>
                                            <td>2022-06-27</td>
                                            <td>6</td>
                                            <td>3</td>                                            
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
     	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
       <script src="${pageContext.request.contextPath }/tableCss/js/datatables-simple-demo.js"></script>
        
          <!--  -->
     
    </body>
</html>
