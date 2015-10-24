<%@ page import="org.apache.commons.lang.StringEscapeUtils"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%String ccp = "http://" + request.getHeader("HOST") + request.getContextPath() + "";
    String mssg = StringEscapeUtils.escapeHtml(request.getParameter("mssg") != null ? request.getParameter("mssg") : "");
%>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>E generic Payment</title>
        <link rel="stylesheet" href="Bootstrap2.2/css/bootstrap.css" />
        <link rel="stylesheet" href="Bootstrap2.2/css/bootstrap-responsive.css" />
        <link rel="stylesheet" href="Bootstrap2.2/css/sticky.css" />  
        <script type="text/javascript" src="jquery/jQuery1.8.3.js"></script>
        <script type="text/javascript" src="Bootstrap2.2/js/bootstrap.js"></script>
        <script type="text/javascript" src="jquery/jquery.validate.min.js"></script>
        <script type="text/javascript" src="jquery/validate.js"></script>
        <script type="text/javascript" src="jquery/Chart.js"></script>

        <!-- <script type="text/javascript" src="Bootstrap2.2/js/bootstrap.min.js"></script>-->
        <style>
            #signupForm label.error {
                color:red;
            }
            #LoginForm label.error {
                color:red;
            }
            #ForgotForm label.error {
                color:red;
            }
        </style>

        <script>
            $(function() {

                $('li a').tooltip({
                    delay: {
                        show: 750,
                        hide: 100
                    }
                });
            });

        </script>

        <script type="text/javascript">
            function securityQuestion() {
                $.ajax({
                    type: "POST",
                    url: "<%=ccp%>/genericpayment/getSecurityQuestion.jsp",
                    data: {lemail: $("#lemail").val()}
                }).done(function(msg) {
                    $("#myscript").html(msg);
                });
            }
        </script>   

        <script type="text/javascript" >
            function demoDisplay() {
                var a = document.getElementById('eanswer').value;
                var b = document.getElementById('lemail').value;
                var c = document.getElementById('question').value;
                if (b == "") {
                    document.getElementById('lemail').focus();
                } else if (a == "") {
                    document.getElementById('eanswer').focus();
                } else if (c == "") {
                    document.getElementById('question').focus();
                    alert("This email id is not registered");
                }
                else {
                    document.ForgotForm.submit();
                }
            }
        </script>
    </head>
    <body>
        <div class="container">
            <div class="content">
                <div class="wrapper">
                    <div class="row">
                        <div class="span12">
                            <div class="row-fluid">
                                <div class="well" style="min-height:990px; min-width:280px; margin-bottom:0px;">
                                    <div class="span12">
                                        <div class="row-fluid">
                                            <div class="span6">
                                                <div class="leftheader"> </div>
                                            </div>
                                            <div class="span6">
                                                <div class="rightheader"> </div>
                                            </div>     
                                        </div>
                                    </div>   <!--apn12 div closed-->

                                    <div class="span12" style="margin-bottom:-8px;">
                                        <div id="navbarid">
                                            <div class="navbar">
                                                <div class="navbar-inner" >
                                                    <ul class="nav">
                                                        <li class="active"><a href="Home.jsp"><i class="icon-home "></i>&nbsp;Home</a></li>
                                                        <!-- <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-eye-open icon-white"></i>&nbsp; About Us</a></li>-->
                                                        <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-align-justify icon-white"></i>&nbsp;&nbsp;Transaction View</a></li>
                                                        <li><a href="<%=ccp%>/GenericLogin?step=logout">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-camera icon-white"></i>&nbsp;Log Out</a></li>
                                                     <!--  <li><a href="<%=ccp%>/genericpayment/unregistered.jsp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-camera icon-white"></i>&nbsp;Instant Payment</a></li>-->

                                                    </ul>
                                                    <form id="custom-search-form" class="form-search form-horizontal pull-right">
                                                        <div class="input-append ">
                                                            <input type="text" class="search-query" placeholder="Search">
                                                                <button type="submit" class="btn"><i class="icon-search"></i></button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div> <!-- navbarid closed -->
                                    </div><!-- span12 closed -->

                                    <div class="span12">
                                        <div class="slider">
                                            <div id="myCarousel" class="carousel slide">
                                                <!-- Carousel items -->
                                                <div class="carousel-inner">
                                                    <div class="active item"><img src="Bootstrap2.2/img/headers.png" alt="Pay All Taxes" style="font-weight:bold; text-align:center;"></div>
                                                    <div class="item"><img src="Bootstrap2.2/img/slider2.png" alt="Pay All Taxes in Easy way" style="font-weight:bold; text-align:center;"></div>
                                                    <div class="item"><img src="Bootstrap2.2/img/imageslider.png" alt="Pay All Taxes in Time" style="font-weight:bold; text-align:center;"></div>
                                                </div>
                                                <!-- Carousel nav -->
                                                <a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                                                <a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
                                            </div>
                                        </div><!-- slider closed -->
                                    </div><!-- span12 closed -->

                                    <div class="span12" style="margin-top: -15px;">
                                        <div class="row-fluid">
                                            <div class="span3">

                                                <div id="RegisterName" style="padding:5px;"> <p>You Are XXX</p></div><br/>
                                                <div id="listofbank">
                                                    <p  style="font:Arial, Helvetica, sans-serif; font-size:18px; font-weight:bold; color:#ffa200;" > List of other sites</p>
                                                    Department of transport<br/>
                                                    Department of Commercial Tax<br/>

                                                </div>
                                            </div>
                                            <div class="span9">
                                                <fieldset>
                                                    <legend style="font:Arial, Helvetica, sans-serif; font-size:18px; font-weight:bold; color:#ffa200;">Pay Your Taxes</legend>
                                                    <div class="span12">
                                                        <div class="row-fluid">
                                                            <div class="span6">
                                                                <div id="netbanking"> </div>
                                                            </div>
                                                            <div class="span6">
                                                                <div id="cardpayment"> </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </fieldset> <br/>
                                                <div id="thumbnail" style=" word-wrap: break-word;">
                                                    <ul class="thumbnails">
                                                        <li class="span4">
                                                            <div class="thumbnail">

                                                                <!-- <img src="Bootstrap2.2/img/Graph.png" alt="Bar Graph" style="width: 260px; height: 180px; " >-->
                                                                <a> <canvas id="Lcanvas" height="160" width="260" > </canvas> <a>
                                                                        <script>

                                                                            var lineChartData = {
                                                                                labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
                                                                                datasets: [
                                                                                    {
                                                                                        fillColor: "rgba(51,187,705,0.9)",
                                                                                        strokeColor: "rgba(951,987,905,1)",
                                                                                        pointColor: "rgba(951,987,905,1)",
                                                                                        pointStrokeColor: "#fff",
                                                                                        data: [8, 38, 90, 60, 76, 47, 44]
                                                                                    },
                                                                                    {
                                                                                        fillColor: "rgba(220,220,220,0.5)",
                                                                                        strokeColor: "rgba(220,220,220,1)",
                                                                                        pointColor: "rgba(220,220,220,1)",
                                                                                        pointStrokeColor: "#fff",
                                                                                        data: [65, 59, 90, 81, 56, 55, 40]
                                                                                    },
                                                                                    {
                                                                                        fillColor: "rgba(151,187,205,0.5)",
                                                                                        strokeColor: "rgba(151,187,205,1)",
                                                                                        pointColor: "rgba(151,187,205,1)",
                                                                                        pointStrokeColor: "#fff",
                                                                                        data: [28, 48, 40, 19, 96, 27, 100]
                                                                                    },
                                                                                    {
                                                                                        fillColor: "rgba(351,387,305,0.5)",
                                                                                        strokeColor: "rgba(351,387,305,1)",
                                                                                        pointColor: "rgba(351,387,605,1)",
                                                                                        pointStrokeColor: "#fff",
                                                                                        data: [18, 28, 20, 10, 76, 27, 70]
                                                                                    }
                                                                                ]

                                                                            }

                                                                            var myLine = new Chart(document.getElementById("Lcanvas").getContext("2d")).Line(lineChartData);

                                                                        </script>

                                                                        <div class="caption">
                                                                            <h6 align="center">Lorem Ipsum is simply dummy text of the printing and typesetting     industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, </h6> 
                                                                        </div>
                                                                        </div>
                                                                        </li>
                                                                        <li class="span4">
                                                                            <div class="thumbnail">
                                                                                <a>   <!-- <img src="Bootstrap2.2/img/piegrapg.png" alt="Pie Graph" style="width: 250px; height: 150px; " >-->
                                                                                    <canvas id="PPcanvas" height="160" width="260"> </canvas> </a>

                                                                                <script>


                                                                                    var chartData = [
                                                                                        {
                                                                                            value: Math.random(),
                                                                                            color: "#D97041"
                                                                                        },
                                                                                        {
                                                                                            value: Math.random(),
                                                                                            color: "#C7604C"
                                                                                        },
                                                                                        {
                                                                                            value: Math.random(),
                                                                                            color: "#21323D"
                                                                                        },
                                                                                        {
                                                                                            value: Math.random(),
                                                                                            color: "#9D9B7F"
                                                                                        },
                                                                                        {
                                                                                            value: Math.random(),
                                                                                            color: "#7D4F6D"
                                                                                        },
                                                                                        {
                                                                                            value: Math.random(),
                                                                                            color: "#584A5E"
                                                                                        }
                                                                                    ];

                                                                                    var myPie = new Chart(document.getElementById("PPcanvas").getContext("2d")).PolarArea(chartData);

                                                                                </script>


                                                                                <div class="caption">
                                                                                    <h6 align="center">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, </h6>

                                                                                </div>
                                                                            </div>
                                                                        </li>
                                                                        <li class="span4">
                                                                            <div class="thumbnail">
                                                                                <a >   <img src="Bootstrap2.2/img/Instant-payment.png" alt="Instant Payment" style="width: 260px; height: 160px;">
                                                                                        <div class="caption">
                                                                                            <h6 align="center">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,  </h6></a>

                                                                                        </div>
                                                                                        </div>
                                                                                        </li>
                                                                                        </ul>
                                                                                        </div> <!--thumbnail div closed-->
                                                                                        </div>
                                                                                        </div> </div>

                                                                                        <div id="footer" class="span12">
                                                                                            <div class="row-fluid">
                                                                                                <div class="span12">
                                                                                                    <div class="span2">
                                                                                                        <div class="lfootertext">
                                                                                                            <!--<p>Name Of Bank</p>-->
                                                                                                            <img src="Bootstrap2.2/img/bank logo/sbi.png">State bank Of India<br/>
                                                                                                                <img src="Bootstrap2.2/img/bank logo/boi1.png">Bank Of India<br/>
                                                                                                                    <img src="Bootstrap2.2/img/bank logo/pnb.gif">Punjab National Bank<br/>
                                                                                                                        <img src="Bootstrap2.2/img/bank logo/IOB.gif">Indian Overseas bank

                                                                                                                            </div>
                                                                                                                            </div>

                                                                                                                            <div class="span2">
                                                                                                                                <div class="lfootertext">
                                                                                                                                    <!--<p>Name Of Bank</p>-->
                                                                                                                                    <img src="Bootstrap2.2/img/bank logo/central.gif">Central Bank<br/>
                                                                                                                                        <img src="Bootstrap2.2/img/bank logo/united.gif">United Bank<br/>
                                                                                                                                            <img src="Bootstrap2.2/img/bank logo/allahabad.gif">Allahabad Bank<br/>
                                                                                                                                                <img src="Bootstrap2.2/img/bank logo/union.gif">Union Bank<br/>
                                                                                                                                                    </div>
                                                                                                                                                    </div>
                                                                                                                                                    <div class="span2">
                                                                                                                                                        <div class="lfootertext">
                                                                                                                                                            <!--<p>Name Of Bank</p>-->
                                                                                                                                                            <img src="Bootstrap2.2/img/bank logo/axis.jpg">Axis Bank<br/>

                                                                                                                                                                <img src="Bootstrap2.2/img/bank logo/idbi.gif">IDBI Bank<br/>
                                                                                                                                                                    <img src="Bootstrap2.2/img/bank logo/coporation.gif">Corporation Bank<br/>
                                                                                                                                                                        <img src="Bootstrap2.2/img/bank logo/SB.jpg">Syndicate Bank<br/>


                                                                                                                                                                            </div>
                                                                                                                                                                            </div>
                                                                                                                                                                            <div class="span2">
                                                                                                                                                                                <div class="lfootertext">
                                                                                                                                                                                    <!--<p>Name Of Bank</p>-->
                                                                                                                                                                                    <img src="Bootstrap2.2/img/bank logo/icici .png">ICICI Bank<br/>
                                                                                                                                                                                        <img src="Bootstrap2.2/img/bank logo/hdfc.png">HDFC Bank<br/>
                                                                                                                                                                                            <img src="Bootstrap2.2/img/bank logo/hsbc.png">HSBC Bank<br/>
                                                                                                                                                                                                <img src="Bootstrap2.2/img/bank logo/kotak.png">Kotak Mahindra Bank<br/>
                                                                                                                                                                                                    </div>
                                                                                                                                                                                                    </div>
                                                                                                                                                                                                    <div class="span2">
                                                                                                                                                                                                        <div class="lfootertext">
                                                                                                                                                                                                        <!--<p>Name Of Bank</p>-->
                                                                                                                                                                                                        <img src="Bootstrap2.2/img/bank logo/central.gif">Central Bank<br/>
                                                                                                                                                                                                        <img src="Bootstrap2.2/img/bank logo/united.gif">United Bank<br/>
                                                                                                                                                                                                        <img src="Bootstrap2.2/img/bank logo/allahabad.gif">Allahabad Bank<br/>
                                                                                                                                                                                                        <img src="Bootstrap2.2/img/bank logo/union.gif">Union Bank<br/>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        <div class="span2">
                                                                                                                                                                                                        <div class="lfootertext">
                                                                                                                                                                                                        <!--<p>Name Of Bank</p>-->
                                                                                                                                                                                                        <img src="Bootstrap2.2/img/bank logo/icici .png">ICICI Bank<br/>
                                                                                                                                                                                                        <img src="Bootstrap2.2/img/bank logo/hdfc.png">HDFC Bank<br/>
                                                                                                                                                                                                        <img src="Bootstrap2.2/img/bank logo/hsbc.png">HSBC Bank<br/>
                                                                                                                                                                                                        <img src="Bootstrap2.2/img/bank logo/kotak.png">Kotak Mahindra Bank<br/>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>

                                                                                                                                                                                                        </div> <!--well div closed-->
                                                                                                                                                                                                        </div>  <!--row-fluid div closed-->
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>  <!--Wrapper div closed-->
                                                                                                                                                                                                        </div>
                                                                                                                                                                                                        </div>  <!--container div closed-->




                                                                                                                                                                                                        </body>
                                                                                                                                                                                                        </html>