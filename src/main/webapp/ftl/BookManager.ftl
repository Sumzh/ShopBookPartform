<!DOCTYPE html>
<html lang="en">

<head>
    <meta name="renderer" content="webkit">

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
    .BookPadding{text-align: center}
</style>
<body>



<div class="container">

    <div class="row">
        <center><h4>书本商品后台管理</h4></center>
    </div>

    <div class="row">

        <div class="col-lg-5 col-lg-push-3">

            <table class="table table-bordered" id="MybookTable">
                <thead>
                <tr><th>详情图</th> <th>编号</th> <th>名字</th> <th>数量</th> <th>商品价钱</th>  <th>编辑商品</th> <th>删除商品</th></tr>
                </thead>

                <tbody>

                <#list BookList as list>

                <tr>



                    <td><img src="http://localhost:8080/img/${list.bookName}.png"/></td> <td>${list.bookId}</td> <td>${list.bookName}</td> <td>${list.account}</td> <td>${list.bookPrice}</td>

                    <td>
                        <a href="javascript:void(0)"  role="button" class="btn btn-info"  onclick="UpdateBook(${list.bookId})">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
                        </a>
                    </td>


                    <td>
                        <a href="javascript:void(0)"  role="button" class="btn btn-danger"  onclick="UpdateBook(${list.bookId})">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                        </a>
                    </td>

                </tr>


                </#list>
                </tbody>

            </table>

        </div>

    </div>

</div>



<#--书本管理模态框-->


<div id="update" class="modal fade">
    <div class="modal-dialog" >
        <div class="modal-content">
            <div class="modal-body">
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-title">
                <h1 class="text-center">商品修改框</h1>
            </div>

            <div class="modal-body">
                <div class="row" id="Picture">
                    <img src="">
                </div>



                <form class="form-group"  method="post" id="updateBookForm"/>

                <div class="form-group" id="IdDiv">

                    <label for="">书本编号</label>
                    <input class="form-control" type="text" placeholder="" name="BookId"/>

                </div>


                <div class="form-group" id="NameDiv">
                    <label for="">书名</label>
                    <input class="form-control" type="text" placeholder="" name="BookName"/>
                </div>

                <div class="form-group" id="AcountDiv">
                    <label for="">数量</label>
                    <input class="form-control" type="text" placeholder="" name="Account"/>
                </div>

                <div class="form-group" id="BookPriceDiv">
                    <label for="">金额</label>
                    <input class="form-control" type="text" placeholder="" name="BookPrice"/>
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



<!--结尾分页-->

<div class="row">

    <div class="BookPadding">

        <ul class="pagination">

            <li><a href="javascript:void(0)" onclick="GetBookData(1);">1</a></li>
            <li><a href="javascript:void(0)" onclick="GetBookData(2);">2</a></li>
            <li><a href="javascript:void(0)" onclick="GetBookData(3);">3</a></li>
            <li><a href="javascript:void(0)" onclick="GetBookData(4);">4</a></li>
            <li><a href="javascript:void(0)" onclick="GetBookData(1);">5</a></li>

        </ul>

    </div>

</div>


<script type="text/javascript" src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">


    //翻页获取书本
  /* function  GetBookData(PageNumber){


        var pageNumber=PageNumber;


        var url="/GetDataByPageNumber?PageNumber="+pageNumber+"";



       //加载数据

        //Ajax获取数据书本商品数据

       $.get(url,function(data,status){

           $("#MybookTable tbody").empty();

           for(var i in data){


               $("#MybookTable tbody").append("<tr><td><img src='http://localhost:8080/img/"+data[i].bookName+".png'></td>" +
               "<td>"+data[i].bookId+"</td>" +
               "<td>"+data[i].bookName+"</td>" +
               "<td>"+data[i].account+"</td>" +
               "<td>"+data[i].bookPrice+"</td> <td><a id='btn_add'href='javascript:void(0)' type='button' class='btn btn-info' data-toggle='modal' data-target='#update' >" +
               "<span class='glyphicon glyphicon-pencil' aria-hidden='true' onclick='ModelDate("+data[i].bookId+")'></span>修改</span></a>"+
               "</td><td><a  href='javascript:void(0)' role='button' class='btn btn-danger' onclick='DeleteUser("+data[i].bookId+")'><span class='glyphicon glyphicon-remove'></span>删除</a></td>" +
               "</tr>");




           }

           console.log(data);

       });



    };*/






    //函数结尾

    //删除书本数据
    function DeleteBooks(BookIds){

        $.get("DeleteBook?BookId="+BookIds+"",function(data){


          // console.log(data);

            window.location.reload();


        })


    }

    //更新书本
    function UpdateBook(BookIds){

       // var BookId=BookIds;


       // alert(BookId);
         ModalData(BookIds);

        $("#update").modal('show');

    }

   //填充模态框数据

     function ModalData(BookId){


         var BookIds=BookId;

         $("#update").on('show.bs.modal',function(BookIds){

             //清空之前的数据
             //图片路径
             $("#Picture img").attr("src","");

             //书本编号
             $("#IdDiv input").val("");
             //书本名字
             $("#NameDiv input").val("");
             //书本数量
             $("#AcountDiv input").val("");
             //书本价格
             $("#BookPriceDiv input").val("");



             //Ajax请求获取数据
             var BookIds=BookId;

             $.get("/GetBookById?BookId="+BookIds+"",function(data){



                // console.log(data);

                 $("#Picture img").attr("src","http://localhost:8080/img/"+data.bookName+".png");

                 //书本编号
                 $("#IdDiv input").val(data.bookId);

                 //书本名字
                 $("#NameDiv input").val(data.bookName);

                 //书本数量
                 $("#AcountDiv input").val(data.account);


                 //书本价格
                 $("#BookPriceDiv input").val(data.bookPrice);

             });




         });


     }








    //更新书本的方法

  function UpdateBooks(){



        $.post("/UpdateBook",$("#updateBookForm").serialize(),function(data){


            console.log("更新结果:"+data);

            if(data>0){

                alert("更新成功！");
                window.location.reload();

            }else{


                alert("更新失败！");
                window.location.reload();
            }



        });

    }

    //主函数方法

    $(function(){


        $("#updateBookForm").submit(function(){


            UpdateBooks();
            return false;
        });


    });







</script>

</body>



</html>