<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="renderer" content="webkit">
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="cache-control" content="no-cache"/>
    <meta http-equiv="pragma" content="no-cache">
    <link rel="stylesheet" type="text/css" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


</head>

<style type="text/css">

    .table th, .table td {
        text-align: center;
        vertical-align: middle!important;
    }
   .PagePadding{text-align: center}
</style>


<body>




<center>
    <h3>管理员管理界面</h3>
</center>

<!--表格-->
<div class="container">


    <div class="row">

        <div class="col-lg-4 col-lg-push-4" style="margin-top:3%">


            <table class="table table-bordered" id="mytable">

                <thead>
                <tr>

                    <th>账号</th>
                    <th>姓名</th>
                    <th>密码</th>
                    <th>余额</th>

                    <th>修改</th>
                    <th>删除</th>
                </tr>
                </thead>



                <tbody>



                <#list UserList as list>
                <tr>

                    <td>${list.id}</td>
                    <td>${list.name}</td>
                    <td>${list.password}</td>
                    <td>${list.money}￥</td>



                    <td>
                    <#-- <button id="btn_add" type="button" class="btn btn-info" data-toggle="modal" data-target="#update" >
                         <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                     </button>-->

                        <a href="javascript:void(0)"  role="button" class="btn btn-info"  onclick="UpdateUser(${list.id})">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                        </a>

                    </td>

                    <td>
                        <a href="javascript:void(0)"  role="button" class="btn btn-danger" onclick="DeleteUser(${list.id})">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                        </a>
                    </td>

                </tr>
                </#list>

                <!--第二行数据-->



                </tbody>



            </table>

        </div>
    </div>



</div>

<div class="row">

    <div class="PagePadding">

        <ul class="pagination">

            <li><a href="javascript:void(0)" onclick="GetData(1)">1</a></li>
            <li><a href="javascript:void(0)" onclick="GetData(2)">2</a></li>
            <li><a href="javascript:void(0)" onclick="GetData(3))">3</a></li>
            <li><a href="javascript:void(0)" onclick="GetData(4)">4</a></li>
            <li><a href="javascript:void(0)" onclick="GetData(5)">5</a></li>

        </ul>

    </div>

</div>



<!--修改模态框-->


<div id="update" class="modal fade">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">修改框</h1>
            </div>
            <div class="modal-body">

                <form class="form-group" action="UpdateUser" method="post" id="updateform"/>

                    <div class="form-group" id="IdDiv">

                        <label for="">账号</label>
                        <input class="form-control" type="text" placeholder="账号" name="Id"/>

                    </div>


                    <div class="form-group" id="PasswordDiv">
                        <label for="">密码</label>
                        <input class="form-control" type="text" placeholder="密码" name="Password"/>
                    </div>

                    <div class="form-group" id="NameDiv">
                        <label for="">名字</label>
                        <input class="form-control" type="text" placeholder="名字" name="Name"/>
                    </div>

                    <div class="form-group" id="MoneyDiv">
                        <label for="">余额</label>
                        <input class="form-control" type="text" placeholder="余额" name="Money"/>
                    </div>

                    <div class="text-right">
                        <button class="btn btn-primary" type="submit" >修改</button>

                        <button class="btn btn-danger" data-dismiss="modal">取消</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>

    /* function ShowData2(data){


         //首先清空原来的表格打的数据



         $("#mytable tbody").empty();


         var jsondata=[  {"name":"jenny1","age":18,"sex":"female"},
             {"name":"jenny2","age":18,"sex":"female"},
             {"name":"jenny3","age":18,"sex":"female"},
             {"name":"jenny4","age":18,"sex":"female"},
             {"name":"jenny5","age":18,"sex":"female"}
         ]

         var json={"name":"aa","Age":"18","sex":"female"}

         var array=[1,2,3,4,5]

         if(data==1){

             for(var i in jsondata){




                 $("#mytable tbody").append("<tr>" +
                 "<td>"+jsondata[i].name+"</td>" +
                 "<td>"+jsondata[i].age+"</td>" +
                 "<td>"+jsondata[i].sex+"</td>" +
                 "<td><button id='btn_add' " +
                 "type='button'class='btn btn-info'>" +
                 "<span class='glyphicon glyphicon-pencil' " +
                 "aria-hidden='true' hidden="+jsondata[i].name+"></span>修改</button></td>" +
                 "<td><button id='btn_add' type='button'class='btn btn-danger' onclick='Test("+jsondata[i].age.toString
                 ()+")'><span class='glyphicon glyphicon-remove' aria-hidden='true'></span>删除</button></td>"+
                 "</tr>");

 //            console.log(jsondata[i].name+"=="+jsondata[i].age);

                 if(i==2){

                     break;

                 }
             }


         }

 //第二个选择



         if(data==2){


             $("#mytable tbody").empty();


             for(var i in jsondata){



                 if(i<=2){


                     continue;

                 }

                 $("#mytable tbody").append("<tr>" +
                 "<td>"+jsondata[i].name+"</td>" +
                 "<td>"+jsondata[i].age+"</td>" +
                 "<td>"+jsondata[i].sex+"</td>" +
                 "<td><button id='btn_add' type='button'class='btn btn-info'  onclick='Test(this)' ><span class='glyphicon
                 glyphicon-pencil' aria-hidden='true'></span>修改  </button></td>" +
                 "<td><button id='btn_add' type='button'class='btn btn-danger'><span class='glyphicon glyphicon-remove' aria-
                 hidden='true'></span>删除  </button></td>"+
                 "</tr>");

             }


         }


     }*/

    //测试函数

    /* function Test(obj){




         alert(obj);

     }*/

    //更新User
    function UpdateUser(UserId){



        //初始化模态框的数据

        ModelDate(UserId);



        $("#update").modal('show');

        //Ajax更新用户
   /*     $.post($("#updateform").attr("Action"),$("#updateform").serialize(),function(data){



            if(data!=null){

            if(data>=1){

                alert("更新成功！");
            }else{

                alert("更新失败！");
            }

            }

            window.location.reload();

        })*/


    }

    //翻页显示用户
    function GetData(pageNumber){





        var url="/ManagerGetUser?PageNumber="+pageNumber+"";



        //Ajax获取数据
        $.get(url,function(data){
            //清空原来的数据

            $("#mytable tbody").empty();

            //记录json对象
            console.log(data);


            for(var i in data){



                /*  private Integer Id;
                   private String Name;
                   private String Password;
                   private Integer Money;*/

                $("#mytable tbody").append("<tr>" +
                "<td>"+data[i].id+"</td>" +
                "<td>"+data[i].name+"</td>" +
                "<td>"+data[i].password+"</td>" +
                "<td>"+data[i].money+"</td> <td><a id='btn_add'href='javascript:void(0)' type='button' class='btn btn-info' data-toggle='modal' data-target='#update' >" +
                "<span class='glyphicon glyphicon-pencil' aria-hidden='true' onclick='ModelDate("+data[i].id+")'></span>修改</span></a>"+
                "</td><td><a  href='javascript:void(0)' role='button' class='btn btn-danger' onclick='DeleteUser("+data[i].id+")'><span class='glyphicon glyphicon-remove'></span>删除</a></td>" +
                "</tr>");






            }

        });








    }
    //删除User
     function DeleteUser(UserId){


      var url="/RemoveUser?UserId="+UserId+"";

         if(confirm('确定要执行此操作吗?')){
         $.get(url,function(data){

             if(data!=null&&data>0){

                 alert("删除成功");

                 window.location.reload();

             }else{

                 alert("删除失败！");

                 window.location.reload();
             }
         })

         };

     }



   function ModelDate(UserId){



      var UserIds=UserId;

    //弹出之前执行的函数
    $("#update").on('show.bs.modal',function(UserIds){

        //首先清空之前模态框的数据



        //账号
        $("#IdDiv input").val("");

        //密码
        $("#PasswordDiv input").val("");

        //姓名
        $("#NameDiv input").val("");

        //余额
        $("#MoneyDiv input").val("");

        //填充数据

        //数据填充-1 Ajax请求获取数据

        var url="/GetUserById?UserId="+UserId+"";

        $.get(url,function(data){

          //  alert("用户账号"+UserId);

           //  alert(data);


            //账号
            //   <label for="">账号</label>

            //$("#IdDiv").append("<label for=''>账号</label><input type='text' class='form-control' placeholder='账号' name='Id' value="+data.id+"></input>");

            $("#updateform input[name='Id']").val(data.id);


            //密码
          //

            $("#updateform input[name='Password']").val(data.password);

           // $("#PasswordDiv").append("<lable for=''>密码</lable><input type='text' class='form-control' placeholder='密码' name='Password' value="+data.password+"></input>");

            //姓名
         //

           // $("#NameDiv").append("<lable for=''>名字</lable><input type='text' class='form-control' placeholder='名字' name='Name' value="+data.name+"></input>");


            $("#updateform input[name='Name']").val(data.name);
            //余额
           //
           // $("#PasswordDiv").append("<lable for=''>余额</lable><input type='text' class='form-control' placeholder='密码' name='Money' value="+data.money+"></input>");


            $("#updateform input[name='Money']").val(data.money);
        });





    })




   };

    $(function(){


        $("#updateform").submit(function(){

            //Ajax更新用户
               $.post($("#updateform").attr("Action"),$("#updateform").serialize(),function(data){



                     if(data!=null){

                     if(data>=1){

                         alert("更新成功！");

                         //$("#update").modal('hide');


                     }else{

                         alert("更新失败！");
                     }

                     }

                     window.location.reload();



                 })


            return false;
        });





    })



</script>


</body>

</html>