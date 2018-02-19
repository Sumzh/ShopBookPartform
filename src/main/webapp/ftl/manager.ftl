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

    .choose{margin: 0 auto;text-align: center}
    #managerBook{margin-left: 20px;}

</style>


<body>




<center>
    <h3>管理员管理界面</h3>
</center>

<!--表格-->
<div class="container">


    <div class="row">

        <#--两个选框-->
        <div class="choose">
            <a href="/UserManager" class="btn btn-success" id="managerUser">人员管理</a>
            <a href="/BookManager?PageNumber=1" class="btn btn-success" id="managerBook">商品管理</a>
        </div>

   </div>

</div>

</body>

<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</html>