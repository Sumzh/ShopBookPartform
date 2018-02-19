<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"  />
    <title>我的购物车</title>
    <link rel="stylesheet" type="text/css" href="http://localhost:8080/css/pay.css"/>
</head>
<script type="text/javascript" src="http://localhost:8080/js/jquery-1.7.2.js"></script>
<script type="text/javascript" src="http://localhost:8080/js/Pay2.js">
</script>
<body>

<div class="Biggest">

    <div class="top">

        <div class="top-1">

            <span style="color:#999999;margin-right: 20px">尊敬的用户: ${usernames}</span>

            <a href="#?usernames=${usernames}" class="top-href">| 我的订单</a>

            <a href="#?usernames=${usernames}" class="top-href">| 我的关注</a>

            <a href="#?usernames=${usernames}" class="top-href">| 关注书店</a>

            <a href="#?usernames=${usernames}" class="top-href">| 客服服务</a>

        </div>


    </div>


    <!-- 分割线  搜索设计-->



    <div style="display: inline-block;float: right;margin-right: 20px">
        <img  src="http://localhost:8080/img/ShopCar.png">

        <h2 style="display:inline-block;color:#333333;margin:38px 0 0 25px;">购物车</h2>

    </div>

    <!--清除浮动-->

    <div style="clear: both;"></div>


    <!--加载用户的订单-->
    <div class="OrderContainer">

        <!--头部设计-->
        <div class="DataHead">
            <ul>
                <li style="margin-left: 15px;">编号</li>
                <li style="margin-left: 110px;">商品</li>
                <li style="margin-left: 110px;">单价</li>
                <li style="margin-left: 110px;">小计</li>
                <li style="margin-left: 110px;">操作</li>
            </ul>
        </div>

        <!--黑色分割线-->
        <div style="height: 3px;background-color: #999999;width: 100%;margin-top: 40px"></div>




 <ul class="OrderData">

<#list orderlist as l>

<li id="books">
    <ul id="BookDetails">
        <li>${l.bookId}</li>
        <li style="margin-left: 80px;"><img src="http://localhost:8080/img/${l.bookName}.png"/></li>
        <li style="margin-right: 20px;color: rgba(0, 10, 30, 0.84)">${l.bookPrice}</li>
        <li style="margin-left: 100px">x1</li>
        <li style="margin-left: 100px"><input type="checkbox" id="${l.bookId}" price="${l.bookPrice}" onclick="CheckChoose(this);"></li>
    </ul>
</li>
    <div style="height: 1px;background-color: #999999;width: 100%;margin-top: 40px"></div>


</#list>





        </ul>


       <#--显示选择了的商品-->
        <div id="displayChoose">
        已选择<input value="0" id="ChooseNumber" readonly="readonly">件
        共<input value="0" id="TotalPrice" readonly="readonly">元
        </div>

        <!--结账按钮-->
        <div class="PayHref">
            <a href="javascript:void(0);" onclick="UserPay();" >去结账</a></div>
        </div>

    <div class="foots">




<span>

    <a href="#">关于我们</a>
    <a href="#">帮助中心</a>
    <a href="#">开放平台</a>
    <a href="#">诚聘英才</a>
    <a href="#">联系我们</a>
    <a href="#">网站合作</a>
    <a href="#">法律声明及隐私权政策</a>
    <a href="#">知识产权</a>
    <a href="#">廉正举报</a><br>
增值电信业务经营许可证： 鲁B2-CB15A45F 网络文化经营许可证：浙网文[2015]0295-065号 12318举报<br>
互联网药品信息服务资质证书编号：浙-（经营性）-2015-0005   浙公网安备 xxxxxxxx号<br>
© 2003-2014 MyshopWebApp.COM 版权所有
 </span>



    </div>






</div>
</div>



</body>
</html>