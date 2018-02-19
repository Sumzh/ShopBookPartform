<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="renderer" content="webkit">
  <#--  <meta name="viewport" content="width=device-width, initial-scale=1">-->
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="pragma" content="no-cache">
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
</head>



<style type="text/css">



    .modal-backdrop{ background:none; }

    *{padding: 0; margin: 0;}


</style>





<body>

<div class="container">

    <div class="row">








        <!-- Button trigger modal -->






        <nav class="navbar navbar-default navbar-fixed-top" >
            <div class="container-fluid">

                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#"><#if users!=null>欢迎${users.name}
                    <#else >请登录</#if></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">

                        <li><a href="/FirstPage">首页</a></li>
                        <li><a href="#"></a></li>
                        <li><a href="#" data-toggle="modal" data-target="#login" >登录</a></li>
                        <li><a href="#"></a></li>
                        <li><a href="#" data-toggle="modal" data-target="#register">注册</a></li>
                        <li><a href="#"></a></li>
                        <li><a href="#">我的关注商品</a></li>
                        <li><a href="#"></a></li>
                        <li><a href="/shopCar?UserId=${users.id}">我的购物车</a></li>
                        <li><a href="#"></a></li>
                        <li><a href="/pay?UserId=${user.id}"  id="pay">付款</a></li>
                        <li><a href="#"></a></li>
                        <li><a href="#"></a></li>
                        <li><a href="#"></a></li>




                    </ul>




                    <form class="navbar-form navbar-left">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="输入搜索内容">
                        </div>
                        <button type="submit" class="btn btn-info">搜索</button>
                    </form>
                    <ul class="nav navbar-nav navbar-right">


                        <li><a href="/Logout.dao" >注销<span class="glyphicon glyphicon-log-in"></span></a></li>


                        <li><a href="#" data-toggle="modal" data-target="#Managerlogin"  >管理员<span class="glyphicon glyphicon-user"></a></li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>



        <!-- 注册窗口 -->

        <div id="register" class="modal fade" >
            <div class="modal-dialog" id="regists" aria-hidden="true" >
                <div class="modal-content">
                    <div class="modal-body">
                        <button class="close" data-dismiss="modal">
                            <span>&times;</span>
                        </button>
                    </div>
                    <div class="modal-title">
                        <h1 class="text-center">注册</h1>
                    </div>
                    <div class="modal-body">
                        <form class="form-group" id="Register" action="/Register?pageCount=${pagecount}" method="post">
                            <div class="form-group">
                                <label for="">账号</label>
                                <input name="Id" class="form-control" type="text" placeholder="6-15位字母或数字">
                            </div>
                            <div class="form-group">
                                <label for="">名称</label>
                                <input name="Name" class="form-control" type="text" placeholder="至少6位字母或数字">
                            </div>
                            <div class="form-group">
                                <label for="">密码</label>
                                <input name="Password" class="form-control" type="password" placeholder="至少6位字母或数字">
                            </div>
                            <div class="form-group">
                                <label for="">邮箱</label>
                                <input class="form-control" type="email" placeholder="例如:123@123.com">
                            </div>
                            <div class="text-right">
                                <button class="btn btn-primary" type="submit">注册</button>
                                <button class="btn btn-danger" data-dismiss="modal">取消</button>
                            </div>
                            <a href="" data-toggle="modal" data-dismiss="modal" data-target="#login">已有账号？点我登录</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <!-- 登录窗口 -->
        <div id="login" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <button class="close" data-dismiss="modal">
                            <span>&times;</span>
                        </button>
                    </div>
                    <div class="modal-title">
                        <h1 class="text-center">登录</h1>
                    </div>
                    <div class="modal-body">
                        <form class="form-group" action="/LoginAction?pageCount=${pageCount}" method="post">
                            <div class="form-group">
                                <label for="">账号</label>
                                <input class="form-control" type="text" placeholder="账号" name="Id">
                            </div>
                            <div class="form-group">
                                <label for="">密码</label>
                                <input class="form-control" type="password" placeholder="密码" name="Password">
                            </div>
                            <div class="text-right">
                                <button class="btn btn-primary" type="submit">登录</button>

                                <button class="btn btn-danger" data-dismiss="modal">取消</button>
                            </div>
                            <a href="" data-toggle="modal" data-dismiss="modal" data-target="#register">还没有账号？点我注册</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div id="Managerlogin" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body">
                        <button class="close" data-dismiss="modal">
                            <span>&times;</span>
                        </button>
                    </div>
                    <div class="modal-title">
                        <h1 class="text-center">管理员登录</h1>
                    </div>
                    <div class="modal-body">
                        <form class="form-group" action="/ManagerLoginAction" method="post">
                            <div class="form-group">
                                <label for="">用户名</label>
                                <input class="form-control" type="text" placeholder="用户名" name="Name">
                            </div>
                            <div class="form-group">
                                <label for="">密码</label>
                                <input class="form-control" type="password" placeholder="密码" name="Password">
                            </div>
                            <div class="text-right">
                                <button class="btn btn-primary" type="submit">登录</button>
                                <button class="btn btn-danger" data-dismiss="modal">取消</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>



    </div>






    <#--商品展示-->


















    <!-- 分割线第一排,条件 如果小于4，就输出前面4张图片 -->





        <div class="row" style="margin-top:2%">
<#list BookList as l>
         <#if l_index lte 2>
            <div class="col-sm-4">
                <div class="container">
                    <div class="row">
                        <img class="thumbnail" src="http://localhost:8080/img/${l.bookName}.png"></div>
                    </div>
                <div class="col-lg-2 col-lg-push-1  text-danger">${l.bookPrice}￥</div>
                <div class="col-lg-5 col-lg-push-1 text-info"><a href="Buy/${l.bookId}" style="text-decoration: none">加入购物车</a></div>
            </div>
         <#else>

        </#if>
</#list>

        </div>

    <div class="row" style="margin-top:2%">
    <#list BookList as l>
        <#if l_index gt 2 && l_index lte 5>
            <div class="col-sm-4">
                <div class="container">
                    <div class="row">
                        <img class="thumbnail" src="http://localhost:8080/img/${l.bookName}.png"></div>
                </div>
                <div class="col-lg-2 col-lg-push-1  text-danger">${l.bookPrice}￥</div>
                <div class="col-lg-5 col-lg-push-1 text-info"><a href="Buy/${l.bookId}" style="text-decoration: none">加入购物车</a></div>
            </div>
        <#else>

        </#if>
    </#list>

    </div>

    <div class="row" style="margin-top:2%">
    <#list BookList as l>
        <#if l_index gt 5 && l_index lte 8>
            <div class="col-sm-4">
                <div class="container">
                    <div class="row">
                        <img class="thumbnail" src="http://localhost:8080/img/${l.bookName}.png"></div>
                </div>
                <div class="col-lg-2 col-lg-push-1  text-danger">${l.bookPrice}￥</div>
                <div class="col-lg-5 col-lg-push-1 text-info"><a href="Buy/${l.bookId}" style="text-decoration: none">加入购物车</a></div>
            </div>
        <#else>

        </#if>
    </#list>

    </div>









<#--第一排尾部结束线-->








    <#--商品展示-->


    <#--分页结尾-->

    <div class="row">

        <div class="col-lg-4 col-lg-push-4">

            <ul class="pagination">
                <li class="previous">
                    <a href="/previous?pageCount=${pageCount-1}" >
                        <span aria-hidden="true">上一页</span>
                    </a>
                </li>
                <li><a href="/PageRequest?pageCount=1">1</a></li>
                <li><a href="/PageRequest?pageCount=2">2</a></li>
                <li><a href="/PageRequest?pageCount=3">3</a></li>
                <li><a href="/PageRequest?pageCount=1">4</a></li>
                <li><a href="/PageRequest?pageCount=1">5</a></li>

                <li class="next">
                    <a href="/next?pageCount=${pageCount+1}" >
                        <span aria-hidden="true">下一页</span>
                    </a>
                </li>
            </ul>

        </div>

    </div>

    <#--分页结尾-->

</div>


<div>
    <ul>
        <li><a href="/TestRequest">request</a></li>
        <li><a href="/TestRespones">Respones</a></li>

    </ul>

</div>








<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>



<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>


    function Pay(){


        alert("1230");


    }


    function Register(){


       var url= $("form[id='Register']").attr("Action");

        $.post(url,$("form[id='Register']").serialize(),function(data){

            alert(data.toString());



        })
    }



    function Register2(){

        var url= $("form[id='Register']").attr("Action");
        $.ajax({url:url,
            type:"post",
            data:$("form[id='Register']").serialize(),
            contentType:"application/x-www-form-urlencoded; charset=utf-8",
            success:function(data){

                if(data==1){

                    console.log(data);

                    alert("注册成功");

                    window.location.href="/";



                }else{


                    alert("注册成功");

                    window.location.href;


                }


            }
        })

   $("#regists").modal("hide");

    }

  $(function(){


      $("a[id='pay']").click(function(){

          Pay();

          return false;
      });



      $("form[id='Register']").submit(function(){



           Register2();

          $("#regists").modal("hide");
          window.location.href;
          return false;
      });



  });




</script>




</body>




</html>

